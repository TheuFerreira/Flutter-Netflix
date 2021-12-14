// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlanController on PlanControllerBase, Store {
  final _$pageStateAtom = Atom(name: 'PlanControllerBase.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$plansAtom = Atom(name: 'PlanControllerBase.plans');

  @override
  List<PlanModel> get plans {
    _$plansAtom.reportRead();
    return super.plans;
  }

  @override
  set plans(List<PlanModel> value) {
    _$plansAtom.reportWrite(value, super.plans, () {
      super.plans = value;
    });
  }

  final _$selectedAtom = Atom(name: 'PlanControllerBase.selected');

  @override
  PlanModel? get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(PlanModel? value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$buttonStateAtom = Atom(name: 'PlanControllerBase.buttonState');

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

  final _$getPlansAsyncAction = AsyncAction('PlanControllerBase.getPlans');

  @override
  Future<dynamic> getPlans() {
    return _$getPlansAsyncAction.run(() => super.getPlans());
  }

  final _$updateUserPlanAsyncAction =
      AsyncAction('PlanControllerBase.updateUserPlan');

  @override
  Future<bool> updateUserPlan(
      CurrentAccountController currentAccountController) {
    return _$updateUserPlanAsyncAction
        .run(() => super.updateUserPlan(currentAccountController));
  }

  final _$PlanControllerBaseActionController =
      ActionController(name: 'PlanControllerBase');

  @override
  void changePlan(int index) {
    final _$actionInfo = _$PlanControllerBaseActionController.startAction(
        name: 'PlanControllerBase.changePlan');
    try {
      return super.changePlan(index);
    } finally {
      _$PlanControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageState: ${pageState},
plans: ${plans},
selected: ${selected},
buttonState: ${buttonState}
    ''';
  }
}
