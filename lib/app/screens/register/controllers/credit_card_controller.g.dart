// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardController on CreditCardControllerBase, Store {
  final _$nameStateAtom = Atom(name: 'CreditCardControllerBase.nameState');

  @override
  TextFieldState get nameState {
    _$nameStateAtom.reportRead();
    return super.nameState;
  }

  @override
  set nameState(TextFieldState value) {
    _$nameStateAtom.reportWrite(value, super.nameState, () {
      super.nameState = value;
    });
  }

  final _$lastNameStateAtom =
      Atom(name: 'CreditCardControllerBase.lastNameState');

  @override
  TextFieldState get lastNameState {
    _$lastNameStateAtom.reportRead();
    return super.lastNameState;
  }

  @override
  set lastNameState(TextFieldState value) {
    _$lastNameStateAtom.reportWrite(value, super.lastNameState, () {
      super.lastNameState = value;
    });
  }

  final _$numberStateAtom = Atom(name: 'CreditCardControllerBase.numberState');

  @override
  TextFieldState get numberState {
    _$numberStateAtom.reportRead();
    return super.numberState;
  }

  @override
  set numberState(TextFieldState value) {
    _$numberStateAtom.reportWrite(value, super.numberState, () {
      super.numberState = value;
    });
  }

  final _$dateValidStateAtom =
      Atom(name: 'CreditCardControllerBase.dateValidState');

  @override
  TextFieldState get dateValidState {
    _$dateValidStateAtom.reportRead();
    return super.dateValidState;
  }

  @override
  set dateValidState(TextFieldState value) {
    _$dateValidStateAtom.reportWrite(value, super.dateValidState, () {
      super.dateValidState = value;
    });
  }

  final _$cvvStateAtom = Atom(name: 'CreditCardControllerBase.cvvState');

  @override
  TextFieldState get cvvState {
    _$cvvStateAtom.reportRead();
    return super.cvvState;
  }

  @override
  set cvvState(TextFieldState value) {
    _$cvvStateAtom.reportWrite(value, super.cvvState, () {
      super.cvvState = value;
    });
  }

  final _$buttonStateAtom = Atom(name: 'CreditCardControllerBase.buttonState');

  @override
  ButtonState get buttonState {
    _$buttonStateAtom.reportRead();
    return super.buttonState;
  }

  @override
  set buttonState(ButtonState value) {
    _$buttonStateAtom.reportWrite(value, super.buttonState, () {
      super.buttonState = value;
    });
  }

  final _$startSignatureAsyncAction =
      AsyncAction('CreditCardControllerBase.startSignature');

  @override
  Future<bool> startSignature(
      String name,
      String lastName,
      String sNumberCard,
      String dateValid,
      String sCVV,
      int typePayment,
      CurrentAccountController currentAccount) {
    return _$startSignatureAsyncAction.run(() => super.startSignature(name,
        lastName, sNumberCard, dateValid, sCVV, typePayment, currentAccount));
  }

  final _$CreditCardControllerBaseActionController =
      ActionController(name: 'CreditCardControllerBase');

  @override
  bool validateName(String value) {
    final _$actionInfo = _$CreditCardControllerBaseActionController.startAction(
        name: 'CreditCardControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateLastName(String value) {
    final _$actionInfo = _$CreditCardControllerBaseActionController.startAction(
        name: 'CreditCardControllerBase.validateLastName');
    try {
      return super.validateLastName(value);
    } finally {
      _$CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateNumber(String value) {
    final _$actionInfo = _$CreditCardControllerBaseActionController.startAction(
        name: 'CreditCardControllerBase.validateNumber');
    try {
      return super.validateNumber(value);
    } finally {
      _$CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateDateValid(String value) {
    final _$actionInfo = _$CreditCardControllerBaseActionController.startAction(
        name: 'CreditCardControllerBase.validateDateValid');
    try {
      return super.validateDateValid(value);
    } finally {
      _$CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateCVV(String value) {
    final _$actionInfo = _$CreditCardControllerBaseActionController.startAction(
        name: 'CreditCardControllerBase.validateCVV');
    try {
      return super.validateCVV(value);
    } finally {
      _$CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameState: ${nameState},
lastNameState: ${lastNameState},
numberState: ${numberState},
dateValidState: ${dateValidState},
cvvState: ${cvvState},
buttonState: ${buttonState}
    ''';
  }
}
