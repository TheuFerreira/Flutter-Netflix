import 'package:dio/dio.dart';
import 'package:flutter_netflix/app/shared/API/db.dart';
import 'package:flutter_netflix/app/shared/exceptions/http_not_found.dart';
import 'package:flutter_netflix/app/shared/models/account_model.dart';

class AccountRoute {
  Future<AccountModel?> get(AccountModel account) async {
    try {
      final response = await Dio().get(
        serverURL + 'account',
        queryParameters: {
          "email": account.email,
          "password": account.password,
        },
      );

      return AccountModel.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response!.statusCode == 404) {
        throw HttpNotFound();
      }
    }
  }

  Future<AccountModel?> getById(int id) async {
    try {
      final response = await Dio().get(
        serverURL + 'account/id',
        queryParameters: {
          "id": id,
        },
      );

      return AccountModel.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response!.statusCode == 404) {
        throw HttpNotFound();
      }
    }
  }

  Future<AccountModel?> register(AccountModel account) async {
    try {
      final response = await Dio().post(
        serverURL + 'account',
        data: {
          'email': account.email,
          'password': account.password,
        },
      );

      final json = response.data;
      return AccountModel.fromJson(json);
    } on DioError catch (ex) {
      if (ex.response!.statusCode == 404) {
        throw HttpNotFound();
      }
    }
  }

  Future update(AccountModel account) async {
    await Dio().put(
      serverURL + 'account/${account.id}',
      data: account.toJson(),
    );
  }
}
