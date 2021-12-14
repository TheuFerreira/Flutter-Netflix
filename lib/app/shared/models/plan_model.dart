import 'package:intl/intl.dart';

class PlanModel {
  int id;
  String title;
  double price;
  String quality;
  String resolution;

  PlanModel.fromJson(Map<String, dynamic> map)
      : id = map['planId'],
        title = map['title'],
        price = map['price'],
        quality = map['quality'],
        resolution = map['resolution'];

  String getPrice() {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt-BR');
    return formatter.format(price);
  }
}
