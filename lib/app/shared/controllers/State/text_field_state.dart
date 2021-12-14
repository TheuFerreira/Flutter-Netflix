import 'package:flutter/material.dart';

abstract class TextFieldState {}

class TextFieldError implements TextFieldState {
  final Color color = const Color(0xfff42c1d);
  final String message;

  TextFieldError(this.message);
}

class TextFieldNormal extends TextFieldState {
  final Color color = const Color(0xFF757575);
}

class TextFieldFocused extends TextFieldState {
  final Color color = const Color(0xFF0055FF);
}

class TextFieldValid extends TextFieldState {
  final Color color = const Color(0xFF009405);
}
