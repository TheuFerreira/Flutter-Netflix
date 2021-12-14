import 'package:flutter_netflix/app/shared/API/routes/account_route.dart';
import 'package:flutter_netflix/app/shared/controllers/State/text_field_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:flutter_netflix/app/shared/exceptions/http_not_found.dart';
import 'package:flutter_netflix/app/shared/models/account_model.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  TextFieldState passwordState = TextFieldNormal();

  @observable
  bool isLoading = false;

  @observable
  bool isValidFields = false;

  @action
  void validEmail(String email, String password) {
    isValidFields = true;
    if (email.isEmpty) {
      isValidFields = false;
    } else if (password.length < 4 || password.length > 60) {
      isValidFields = false;
    }
  }

  @action
  bool validPassword(String email, String password) {
    validEmail(email, password);

    if (password.length < 4 || password.length > 60) {
      passwordState =
          TextFieldError('A senha deve ter entre 4 e 60 caracteres.');
    } else {
      passwordState = TextFieldValid();
    }

    return passwordState is TextFieldValid;
  }

  @action
  Future<bool> validLogin(
    String email,
    String password,
    CurrentAccountController accountController,
  ) async {
    isLoading = true;

    AccountModel? account = AccountModel(email, password);
    try {
      account = await AccountRoute().get(account);
    } on HttpNotFound {
      account = null;
    }
    isLoading = false;

    await accountController.update(account);

    return account != null;
  }
}
