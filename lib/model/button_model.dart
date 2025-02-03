import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback func;

  ButtonModel({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.func,
  });
}
