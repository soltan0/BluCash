// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SmsTextfiled extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final FontWeight? fontWeight;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final FocusNode? prevFocus;
  final FontStyle? fontStyle;
  final InputBorder? border;
  final double? fontSize;
  final String? hintText;
  final int? maxLength;
  final Color? color;
  final bool? isLast;

   const SmsTextfiled({
    super.key,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.enabledBorder,
    this.focusedBorder,
    this.fontWeight,
    this.focusNode,
    this.nextFocus,
    this.prevFocus,
    this.fontStyle,
    this.fontSize,
    this.hintText,
    this.maxLength,
    this.border,
    this.color,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      keyboardType: keyboardType,
      maxLength: maxLength,
      focusNode: focusNode,
      controller: controller,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color:color , 
        fontSize: fontSize  , fontWeight: fontWeight , fontStyle: fontStyle),
        contentPadding: contentPadding,
        counterText: '',
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        border: border
      ),
    );
  }
}
