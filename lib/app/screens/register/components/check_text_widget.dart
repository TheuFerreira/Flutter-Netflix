import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/shared/const/colors.dart';

class CheckTextWidget extends StatelessWidget {
  final String data;
  const CheckTextWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          color: backgroundElevatedButton,
          size: 30,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
