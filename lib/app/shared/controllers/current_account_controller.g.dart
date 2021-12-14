// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurrentAccountController on CurrentAccountControllerBase, Store {
  final _$currentAccountAtom =
      Atom(name: 'CurrentAccountControllerBase.currentAccount');

  @override
  AccountModel? get currentAccount {
    _$currentAccountAtom.reportRead();
    return super.currentAccount;
  }

  @override
  set currentAccount(AccountModel? value) {
    _$currentAccountAtom.reportWrite(value, super.currentAccount, () {
      super.currentAccount = value;
    });
  }

  final _$stateAtom = Atom(name: 'CurrentAccountControllerBase.state');

  @override
  PageState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PageState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$updateAsyncAction =
      AsyncAction('CurrentAccountControllerBase.update');

  @override
  Future<dynamic> update(AccountModel? account) {
    return _$updateAsyncAction.run(() => super.update(account));
  }

  final _$exitAsyncAction = AsyncAction('CurrentAccountControllerBase.exit');

  @override
  Future<dynamic> exit() {
    return _$exitAsyncAction.run(() => super.exit());
  }

  @override
  String toString() {
    return '''
currentAccount: ${currentAccount},
state: ${state}
    ''';
  }
}
