
import 'package:flutter/material.dart' show BorderSide, BuildContext, Color, Colors, EdgeInsets, EdgeInsetsGeometry, FocusNode, FontWeight, FormFieldValidator, InputDecoration, Key, OutlineInputBorder, SizedBox, StatelessWidget, TextEditingController, TextFormField, TextInputType, TextStyle, UnderlineInputBorder, ValueChanged, Widget;
import 'package:flutter/services.dart';

class KTextField extends StatelessWidget {
  String? labelText;
  String? hintText;
  bool? obSecureText;
  bool? readOnly;
  TextInputType? keyboardType;
  Color? bgColor;
  Color? fontColor;
  Color? borderColor;
  List<TextInputFormatter>? inputFormatters;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  FocusNode? focusNode;
  Widget? suffixIcon;
  double? fontSize;
  int? maxLength;
  int? minLines;
  int? maxLines;
  FormFieldValidator<String>? validator;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onFieldSubmit;

  KTextField(
      {this.labelText,
      this.obSecureText,
      this.keyboardType,
      this.bgColor,
      this.inputFormatters,
      this.fontColor,
      this.controller,
      this.onChanged,
      this.focusNode,
      this.suffixIcon,
      this.readOnly,
      this.fontSize,
      this.validator,
      this.borderColor,
      this.contentPadding,
      this.minLines,
      this.maxLength,
      this.maxLines,
      this.hintText,
      this.onFieldSubmit,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 70,
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        cursorColor: fontColor,
        obscureText: obSecureText ?? false,
        focusNode: focusNode,
        keyboardType: keyboardType ?? TextInputType.text,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        onFieldSubmitted: onFieldSubmit ?? (v){},
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize ?? 16,

          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          errorMaxLines: 2,
          contentPadding: contentPadding ??
              const EdgeInsets.only(left: 10, bottom: 0, top: 10, right: 10),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: bgColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.black),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: borderColor ?? Colors.grey,
            fontSize: 14,
          ),
          hintText: hintText ?? '',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onTap: () {},
        validator: validator,
      ),
    );
  }
}
