class PaymentModel {
  int? id;
  String name;
  String? lastName;
  int monthDate;
  int yearDate;
  int numberCard;
  int cvv;
  int typePayment;

  PaymentModel(
    this.name,
    this.lastName,
    this.monthDate,
    this.yearDate,
    this.numberCard,
    this.cvv,
    this.typePayment,
  );

  PaymentModel.fromJson(Map<String, dynamic> json)
      : id = json['paymentId'],
        name = json['name'],
        lastName = json['lastName'],
        monthDate = json['monthDate'],
        yearDate = json['yearDate'],
        numberCard = json['numberCard'],
        cvv = json['cvv'],
        typePayment = json['typePaymentId'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "monthDate": monthDate,
        "yearDate": yearDate,
        "numberCard": 212151516,
        "cvv": cvv,
        "typePaymentId": typePayment
      };
}
