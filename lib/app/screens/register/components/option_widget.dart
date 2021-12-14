import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final String title;
  final List<Widget>? options;
  const OptionWidget({
    Key? key,
    this.title = '',
    @required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: Row(
            children: options!.map((e) {
              return Expanded(
                child: Center(
                  child: e,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
