import 'package:flutter_netflix/app/shared/API/routes/account_route.dart';
import 'package:flutter_netflix/app/shared/API/routes/plan_route.dart';
import 'package:flutter_netflix/app/shared/controllers/State/button_state.dart';
import 'package:flutter_netflix/app/shared/controllers/State/page_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:flutter_netflix/app/shared/models/account_model.dart';
import 'package:flutter_netflix/app/shared/models/plan_model.dart';
import 'package:mobx/mobx.dart';

part 'plan_controller.g.dart';

class PlanController = PlanControllerBase with _$PlanController;

abstract class PlanControllerBase with Store {
  @observable
  PageState pageState = PageState.loading;

  @observable
  List<PlanModel> plans = [];

  @observable
  PlanModel? selected;

  @observable
  ButtonState buttonState = ButtonNormal();

  @action
  Future getPlans() async {
    pageState = PageState.loading;

    plans = await PlanRoute().getAll();
    selected = plans[plans.length - 1];

    pageState = PageState.none;
  }

  @action
  void changePlan(int index) {
    selected = plans[index];
  }

  @action
  Future<bool> updateUserPlan(
      CurrentAccountController currentAccountController) async {
    buttonState = ButtonLoading();

    AccountModel account = currentAccountController.currentAccount!;
    account.plan = selected;

    await AccountRoute().update(account);
    currentAccountController.update(account);

    buttonState = ButtonNormal();
    return true;
  }
}
