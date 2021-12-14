import 'package:flutter_netflix/app/shared/models/payment_model.dart';
import 'package:flutter_netflix/app/shared/models/plan_model.dart';

class AccountModel {
  int? id;
  PlanModel? plan;
  String email;
  String password;
  PaymentModel? payment;

  AccountModel(this.email, this.password);

  AccountModel.fromJson(Map<String, dynamic> map)
      : id = map['accountId'],
        plan = map['plan'] == null ? null : PlanModel.fromJson(map['plan']),
        email = map['email'],
        password = map['password'];

  Map<String, dynamic> toJson() => {
        'accountId': id,
        'planId': plan == null ? null : plan!.id,
        'email': email,
        'password': password,
        'paymentId': payment == null ? null : payment!.id,
      };

  bool isCompletedAccount() {
    return plan != null && payment != null;
  }
}
