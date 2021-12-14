import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final String confirm;
  final String cancel;
  final Function()? onConfirm;
  final Function()? onCancel;
  const AlertDialogWidget({
    Key? key,
    this.title = 'Title',
    this.description = 'Description',
    this.confirm = 'Confirm',
    this.cancel = 'Cancel',
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  Widget _textButton(String content, Function()? onTap) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            child: Text(
              content,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            onPressed: onTap,
            style: TextButton.styleFrom(
              alignment: Alignment.centerRight,
              primary: Colors.greenAccent,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
          _textButton(confirm, onConfirm),
          _textButton(cancel, onCancel),
        ],
      ),
    );
  }
}
