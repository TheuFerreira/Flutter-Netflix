// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionController on QuestionControllerBase, Store {
  final _$isOpenAtom = Atom(name: 'QuestionControllerBase.isOpen');

  @override
  bool get isOpen {
    _$isOpenAtom.reportRead();
    return super.isOpen;
  }

  @override
  set isOpen(bool value) {
    _$isOpenAtom.reportWrite(value, super.isOpen, () {
      super.isOpen = value;
    });
  }

  final _$QuestionControllerBaseActionController =
      ActionController(name: 'QuestionControllerBase');

  @override
  void changeOpen() {
    final _$actionInfo = _$QuestionControllerBaseActionController.startAction(
        name: 'QuestionControllerBase.changeOpen');
    try {
      return super.changeOpen();
    } finally {
      _$QuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOpen: ${isOpen}
    ''';
  }
}
