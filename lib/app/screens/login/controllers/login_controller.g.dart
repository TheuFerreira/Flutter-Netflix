// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on LoginControllerBase, Store {
  final _$passwordStateAtom = Atom(name: 'LoginControllerBase.passwordState');

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

  final _$isLoadingAtom = Atom(name: 'LoginControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isValidFieldsAtom = Atom(name: 'LoginControllerBase.isValidFields');

  @override
  bool get isValidFields {
    _$isValidFieldsAtom.reportRead();
    return super.isValidFields;
  }

  @override
  set isValidFields(bool value) {
    _$isValidFieldsAtom.reportWrite(value, super.isValidFields, () {
      super.isValidFields = value;
    });
  }

  final _$validLoginAsyncAction = AsyncAction('LoginControllerBase.validLogin');

  @override
  Future<bool> validLogin(String email, String password,
      CurrentAccountController accountController) {
    return _$validLoginAsyncAction
        .run(() => super.validLogin(email, password, accountController));
  }

  final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase');

  @override
  void validEmail(String email, String password) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.validEmail');
    try {
      return super.validEmail(email, password);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validPassword(String email, String password) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.validPassword');
    try {
      return super.validPassword(email, password);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordState: ${passwordState},
isLoading: ${isLoading},
isValidFields: ${isValidFields}
    ''';
  }
}
