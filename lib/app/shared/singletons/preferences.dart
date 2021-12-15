import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<Preferences> getInstance() async {
    _prefs = await SharedPreferences.getInstance();
    return Preferences._privateConstructor();
  }

  static late SharedPreferences _prefs;

  Preferences._privateConstructor();

  int? getIdAccount() {
    if (idAccountExists() == false) {
      return null;
    }

    return _prefs.getInt('id_account');
  }

  bool idAccountExists() {
    return _prefs.containsKey('id_account');
  }

  Future<bool> setIdAccount(int idAccount) async {
    return await _prefs.setInt('id_account', idAccount);
  }

  Future<bool> deleteIdAccount() async {
    return await _prefs.remove('id_account');
  }
}
