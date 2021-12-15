import 'package:flutter_netflix/app/shared/API/routes/account_route.dart';
import 'package:flutter_netflix/app/shared/controllers/State/page_state.dart';
import 'package:flutter_netflix/app/shared/models/account_model.dart';
import 'package:flutter_netflix/app/shared/singletons/preferences.dart';
import 'package:mobx/mobx.dart';

part 'current_account_controller.g.dart';

class CurrentAccountController = CurrentAccountControllerBase
    with _$CurrentAccountController;

abstract class CurrentAccountControllerBase with Store {
  @observable
  AccountModel? currentAccount;

  @observable
  PageState state = PageState.none;

  late Preferences _prefs;

  CurrentAccountControllerBase() {
    _getCurrentAccount();
  }

  void _getCurrentAccount() async {
    _prefs = await Preferences.getInstance();

    bool containsId = _prefs.idAccountExists();
    if (containsId == false) {
      return;
    }

    state = PageState.loading;

    int? id = _prefs.getIdAccount();
    currentAccount = await AccountRoute().getById(id!);

    state = PageState.none;
  }

  @action
  Future update(AccountModel? account) async {
    currentAccount = account;

    if (account != null) {
      await _prefs.setIdAccount(account.id!);
    } else {
      await _prefs.deleteIdAccount();
    }
  }

  @action
  Future exit() async {
    currentAccount = null;

    await _prefs.deleteIdAccount();
  }
}
