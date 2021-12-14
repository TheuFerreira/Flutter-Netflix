import 'package:flutter_netflix/app/shared/controllers/State/button_state.dart';
import 'package:flutter_netflix/app/shared/controllers/State/text_field_state.dart';
import 'package:flutter_netflix/app/shared/API/routes/account_route.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:flutter_netflix/app/shared/exceptions/http_not_found.dart';
import 'package:flutter_netflix/app/shared/models/account_model.dart';
import 'package:flutter_netflix/app/shared/services/email_service.dart';
import 'package:mobx/mobx.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountControllerBase
    with _$CreateAccountController;

abstract class CreateAccountControllerBase with Store {
  @observable
  bool accountExists = false;

  @observable
  TextFieldState emailState = TextFieldNormal();

  @observable
  TextFieldState passwordState = TextFieldNormal();

  @observable
  ButtonState buttonRegister = ButtonNormal();

  @action
  void emailFocusField(String value) {
    if (emailState is TextFieldNormal) {
      emailState = TextFieldFocused();
    }
  }

  @action
  void passwordFocusField(String value) {
    if (passwordState is TextFieldNormal) {
      passwordState = TextFieldFocused();
    }
  }

  @action
  bool validateEmail(String value) {
    if (value.isEmpty) {
      emailState = TextFieldError('O email é obrigatório');
    } else if (value.length < 5 || value.length > 50) {
      emailState = TextFieldError(
          'O endereço de email deve ter entre 5 e 50 caracteres');
    } else if (!EmailService().isValid(value)) {
      emailState = TextFieldError('Insira um email válido.');
    } else {
      emailState = TextFieldValid();
    }

    return emailState is TextFieldValid;
  }

  @action
  bool validatePassword(String value) {
    if (value.isEmpty) {
      passwordState = TextFieldError('A senha é obrigatória');
    } else if (value.length < 6 || value.length > 60) {
      passwordState =
          TextFieldError('A senha deve ter entre 6 e 60 caracteres');
    } else {
      passwordState = TextFieldValid();
    }

    return passwordState is TextFieldValid;
  }

  @action
  Future<bool> register(
    String email,
    String password,
    CurrentAccountController currentAccount,
  ) async {
    if (!validateEmail(email) || !validatePassword(password)) {
      return false;
    }

    buttonRegister = ButtonLoading();
    AccountModel? account = AccountModel(email, password);

    try {
      account = await AccountRoute().register(account);
      if (account == null) {
        return false;
      }

      accountExists = false;
      currentAccount.update(account);
    } on HttpNotFound {
      accountExists = true;
      return false;
    } finally {
      buttonRegister = ButtonNormal();
    }

    return true;
  }
}
