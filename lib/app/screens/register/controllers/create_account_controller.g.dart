// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountController on CreateAccountControllerBase, Store {
  final _$accountExistsAtom =
      Atom(name: 'CreateAccountControllerBase.accountExists');

  @override
  bool get accountExists {
    _$accountExistsAtom.reportRead();
    return super.accountExists;
  }

  @override
  set accountExists(bool value) {
    _$accountExistsAtom.reportWrite(value, super.accountExists, () {
      super.accountExists = value;
    });
  }

  final _$emailStateAtom = Atom(name: 'CreateAccountControllerBase.emailState');

  @override
  TextFieldState get emailState {
    _$emailStateAtom.reportRead();
    return super.emailState;
  }

  @override
  set emailState(TextFieldState value) {
    _$emailStateAtom.reportWrite(value, super.emailState, () {
      super.emailState = value;
    });
  }

  final _$passwordStateAtom =
      Atom(name: 'CreateAccountControllerBase.passwordState');

  @override
  TextFieldState get passwordState {
    _$passwordStateAtom.reportRead();
    return super.passwordState;
  }

  @override
  set passwordState(TextFieldState value) {
    _$passwordStateAtom.reportWrite(value, super.passwordState, () {
      super.passwordState = value;
    });
  }

  final _$buttonRegisterAtom =
      Atom(name: 'CreateAccountControllerBase.buttonRegister');

  @override
  ButtonState get buttonRegister {
    _$buttonRegisterAtom.reportRead();
    return super.buttonRegister;
  }

  @override
  set buttonRegister(ButtonState value) {
    _$buttonRegisterAtom.reportWrite(value, super.buttonRegister, () {
      super.buttonRegister = value;
    });
  }

  final _$registerAsyncAction =
      AsyncAction('CreateAccountControllerBase.register');

  @override
  Future<bool> register(
      String email, String password, CurrentAccountController currentAccount) {
    return _$registerAsyncAction
        .run(() => super.register(email, password, currentAccount));
  }

  final _$CreateAccountControllerBaseActionController =
      ActionController(name: 'CreateAccountControllerBase');

  @override
  void emailFocusField(String value) {
    final _$actionInfo = _$CreateAccountControllerBaseActionController
        .startAction(name: 'CreateAccountControllerBase.emailFocusField');
    try {
      return super.emailFocusField(value);
    } finally {
      _$CreateAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordFocusField(String value) {
    final _$actionInfo = _$CreateAccountControllerBaseActionController
        .startAction(name: 'CreateAccountControllerBase.passwordFocusField');
    try {
      return super.passwordFocusField(value);
    } finally {
      _$CreateAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateEmail(String value) {
    final _$actionInfo = _$CreateAccountControllerBaseActionController
        .startAction(name: 'CreateAccountControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$CreateAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validatePassword(String value) {
    final _$actionInfo = _$CreateAccountControllerBaseActionController
        .startAction(name: 'CreateAccountControllerBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$CreateAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountExists: ${accountExists},
emailState: ${emailState},
passwordState: ${passwordState},
buttonRegister: ${buttonRegister}
    ''';
  }
}
