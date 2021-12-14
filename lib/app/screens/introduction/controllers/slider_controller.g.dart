// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SliderController on SliderControllerBase, Store {
  final _$currentPageAtom = Atom(name: 'SliderControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$SliderControllerBaseActionController =
      ActionController(name: 'SliderControllerBase');

  @override
  void setPage(int page) {
    final _$actionInfo = _$SliderControllerBaseActionController.startAction(
        name: 'SliderControllerBase.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$SliderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
