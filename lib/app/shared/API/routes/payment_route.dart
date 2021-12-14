import 'package:dio/dio.dart';
import 'package:flutter_netflix/app/shared/API/db.dart';
import 'package:flutter_netflix/app/shared/models/payment_model.dart';

class PaymentRoute {
  Future<PaymentModel> insert(PaymentModel payment) async {
    final response = await Dio().post(
      serverURL + 'payment',
      data: payment.toJson(),
    );
    final json = response.data;
    return PaymentModel.fromJson(json);
  }
}
