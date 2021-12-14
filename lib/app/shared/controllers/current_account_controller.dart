import 'package:flutter_netflix/app/shared/API/routes/account_route.dart';
import 'package:flutter_netflix/app/shared/controllers/State/page_state.dart';
import 'package:flutter_netflix/app/shared/models/account_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'current_account_controller.g.dart';

class CurrentAccountController = CurrentAccountControllerBase
    with _$CurrentAccountController;

abstract class CurrentAccountControllerBase with Store {
  @observable
  AccountModel? currentAccount;

  @observable
  PageState state = PageState.none;

  CurrentAccountControllerBase() {
    SharedPreferences.getInstance().then((prefs) async {
      bool containsId = prefs.containsKey('id_account');
      if (containsId == false) {
        return;
      }

      state = PageState.loading;

      int id = prefs.getInt('id_account')!;
      currentAccount = await AccountRoute().getById(id);

      state = PageState.none;
    });
  }

  @action
  Future update(AccountModel? account) async {
    currentAccount = account;

    final prefs = await SharedPreferences.getInstance();
    if (account != null) {
      await prefs.setInt('id_account', account.id!);
    } else {
      await prefs.remove('id_account');
    }
  }

  @action
  Future exit() async {
    currentAccount = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id_account');
  }
}
