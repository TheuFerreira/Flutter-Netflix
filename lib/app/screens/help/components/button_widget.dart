import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onPressed;
  const ButtonWidget({
    Key? key,
    this.icon = Icons.ac_unit,
    this.title = 'Title',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
