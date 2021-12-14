import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/login/controllers/text_field_controller.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final bool isError;
  final String message;
  final bool isPassword;
  final Function(String)? onChanged;
  const TextFieldWidget(
    this.controller, {
    Key? key,
    this.label = '',
    this.keyboardType,
    this.isError = false,
    this.message = '',
    this.isPassword = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final controller = TextFieldController();
  final FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();

    focus.addListener(controller.onChangeFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) {
              bool isFocused = controller.isFocused;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: isFocused ? Colors.grey[800] : Colors.grey[900],
                ),
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 8.0,
                ),
                child: TextField(
                  focusNode: focus,
                  obscureText: widget.isPassword,
                  controller: widget.controller,
                  cursorWidth: 2,
                  cursorColor: Colors.white70,
                  keyboardType: widget.keyboardType,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: widget.label,
                    labelStyle: TextStyle(
                      color: isFocused ? Colors.white70 : Colors.white54,
                    ),
                    enabledBorder: widget.isError
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange[800]!,
                              width: 1.5,
                            ),
                          )
                        : InputBorder.none,
                  ),
                  onChanged: widget.onChanged,
                ),
              );
            },
          ),
          Visibility(
            child: Text(
              widget.message,
              style: TextStyle(
                color: Colors.orange[800]!,
              ),
            ),
            visible: widget.isError,
          ),
        ],
      ),
    );
  }
}
