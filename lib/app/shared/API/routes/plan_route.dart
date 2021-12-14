import 'package:dio/dio.dart';
import 'package:flutter_netflix/app/shared/API/db.dart';
import 'package:flutter_netflix/app/shared/models/plan_model.dart';

class PlanRoute {
  Future<List<PlanModel>> getAll() async {
    final response = await Dio().get(serverURL + 'plan');
    final json = response.data;

    List<PlanModel> plans = [];
    for (Map<String, dynamic> map in json) {
      final plan = PlanModel.fromJson(map);
      plans.add(plan);
    }

    return plans;
  }
}
