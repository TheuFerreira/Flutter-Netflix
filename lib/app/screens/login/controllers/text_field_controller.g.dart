// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TextFieldController on TextFieldControllerBase, Store {
  final _$isFocusedAtom = Atom(name: 'TextFieldControllerBase.isFocused');

  @override
  bool get isFocused {
    _$isFocusedAtom.reportRead();
    return super.isFocused;
  }

  @override
  set isFocused(bool value) {
    _$isFocusedAtom.reportWrite(value, super.isFocused, () {
      super.isFocused = value;
    });
  }

  final _$TextFieldControllerBaseActionController =
      ActionController(name: 'TextFieldControllerBase');

  @override
  void onChangeFocus() {
    final _$actionInfo = _$TextFieldControllerBaseActionController.startAction(
        name: 'TextFieldControllerBase.onChangeFocus');
    try {
      return super.onChangeFocus();
    } finally {
      _$TextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFocused: ${isFocused}
    ''';
  }
}
