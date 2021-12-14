import 'package:flutter_netflix/app/shared/controllers/State/button_state.dart';
import 'package:flutter_netflix/app/shared/controllers/State/text_field_state.dart';
import 'package:flutter_netflix/app/shared/API/routes/account_route.dart';
import 'package:flutter_netflix/app/shared/API/routes/payment_route.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:flutter_netflix/app/shared/models/account_model.dart';
import 'package:flutter_netflix/app/shared/models/payment_model.dart';
import 'package:flutter_netflix/app/shared/services/date_time_service.dart';
import 'package:mobx/mobx.dart';

part 'credit_card_controller.g.dart';

class CreditCardController = CreditCardControllerBase
    with _$CreditCardController;

abstract class CreditCardControllerBase with Store {
  @observable
  TextFieldState nameState = TextFieldNormal();

  @observable
  TextFieldState lastNameState = TextFieldNormal();

  @observable
  TextFieldState numberState = TextFieldNormal();

  @observable
  TextFieldState dateValidState = TextFieldNormal();

  @observable
  TextFieldState cvvState = TextFieldNormal();

  @observable
  ButtonState buttonState = ButtonNormal();

  @action
  bool validateName(String value) {
    if (value.isEmpty) {
      nameState = TextFieldError('O nome é obrigatório');
    } else {
      nameState = TextFieldValid();
    }

    return nameState is TextFieldValid;
  }

  @action
  bool validateLastName(String value) {
    lastNameState = TextFieldValid();
    return lastNameState is TextFieldValid;
  }

  @action
  bool validateNumber(String value) {
    if (value.isEmpty) {
      numberState =
          TextFieldError('O número do cartão de crédito é obrigatório.');
    } else if (value.length < 12 || value.length > 19) {
      numberState =
          TextFieldError('O cartão de crédito deve ter entre 12 e 19 números.');
    } else {
      numberState = TextFieldValid();
    }

    return numberState is TextFieldValid;
  }

  @action
  bool validateDateValid(String value) {
    if (value.isEmpty) {
      dateValidState = TextFieldError('O mês de validade é obrigatório.');
      return false;
    }

    Iterable<int> values = value.split('/').map((e) => int.parse(e));
    int month = values.elementAt(0);

    if (month < 1 || month > 12) {
      dateValidState =
          TextFieldError('O mês de validade deve estar entre 1 e 12.');
      return false;
    }

    if (values.length == 1) {
      dateValidState = TextFieldError('O ano de validade é obrigatório.');
      return false;
    }

    DateTime currentDate = DateTime.now();
    Iterable<int> currentSmallDate = DateTimeService()
        .getSmallDate(currentDate)
        .split('-')
        .map((e) => int.parse(e));

    int currentYear = currentSmallDate.elementAt(0);
    int currentMonth = currentSmallDate.elementAt(1);
    int maxYear = currentDate.year + 25;

    int year = values.elementAt(1);
    if (year < currentYear || year > currentYear + 25) {
      dateValidState = TextFieldError(
          'A data de validade deve estar entre ${currentDate.year} e $maxYear');
    } else if (month < currentMonth && year <= currentYear) {
      dateValidState =
          TextFieldError('A data de validade informada já passou.');
    } else {
      dateValidState = TextFieldValid();
    }

    return dateValidState is TextFieldValid;
  }

  @action
  bool validateCVV(String value) {
    if (value.isEmpty) {
      cvvState = TextFieldError('O código de verificação (CVV) é obrigatório.');
    } else if (value.length <= 2 || value.length > 4) {
      cvvState =
          TextFieldError('Digite um código de verificação (CVV) válido.');
    } else {
      cvvState = TextFieldValid();
    }

    return cvvState is TextFieldValid;
  }

  @action
  Future<bool> startSignature(
    String name,
    String lastName,
    String sNumberCard,
    String dateValid,
    String sCVV,
    int typePayment,
    CurrentAccountController currentAccount,
  ) async {
    if (!validateName(name) ||
        !validateLastName(lastName) ||
        !validateNumber(sNumberCard) ||
        !validateDateValid(dateValid) ||
        !validateCVV(sCVV)) {
      return false;
    }

    buttonState = ButtonLoading();

    Iterable<int> smallDate = dateValid.split('/').map((e) => int.parse(e));
    int monthDate = smallDate.elementAt(0);
    int yearDate = smallDate.elementAt(1);

    int numberCard = int.parse(sNumberCard);
    int cvv = int.parse(sCVV);

    PaymentModel payment = PaymentModel(
      name,
      lastName,
      monthDate,
      yearDate,
      numberCard,
      cvv,
      typePayment + 1,
    );

    payment = await PaymentRoute().insert(payment);

    AccountModel account = currentAccount.currentAccount!;
    account.payment = payment;

    await AccountRoute().update(account);
    currentAccount.update(account);

    buttonState = ButtonNormal();

    return true;
  }
}
