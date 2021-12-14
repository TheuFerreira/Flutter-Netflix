import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String error;
  final bool isInvalid;
  final bool isPassword;
  final Color color;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String value)? onGainFocus;
  final Function(String value)? onChanged;
  final Function(String value)? onLostFocus;
  const TextFieldWidget({
    Key? key,
    this.label = '',
    this.error = '',
    this.isInvalid = false,
    this.isPassword = false,
    this.color = Colors.black,
    this.inputFormatters,
    this.keyboardType,
    this.controller,
    this.onGainFocus,
    this.onChanged,
    this.onLostFocus,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        if (widget.onGainFocus != null) {
          widget.onGainFocus!(widget.controller!.text);
        }
      } else {
        widget.onLostFocus!(widget.controller!.text);
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.color,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: widget.controller,
                focusNode: focusNode,
                cursorColor: const Color(0xFF757575),
                cursorWidth: 2,
                obscureText: widget.isPassword,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters == null
                    ? []
                    : widget.inputFormatters!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: widget.label,
                  labelStyle: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                  ),
                ),
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ),
        Visibility(
          child: Text(
            widget.error,
            style: TextStyle(
              color: widget.color,
              fontSize: 10,
            ),
          ),
          visible: widget.isInvalid,
        ),
      ],
    );
  }
}
