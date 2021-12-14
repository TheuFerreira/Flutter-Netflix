import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  final bool? isSelected;
  const DotsWidget({
    Key? key,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected == true ? Colors.grey[700] : Colors.grey[900],
        ),
      ),
    );
  }
}
