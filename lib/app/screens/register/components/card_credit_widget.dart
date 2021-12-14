import 'package:flutter/material.dart';

class CardCreditWidget extends StatelessWidget {
  final String assetImage;
  const CardCreditWidget(
    this.assetImage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Image.asset(assetImage),
    );
  }
}
