import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_utils/colors/app_colors.dart';

class KCommonTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? errorMsg;
  final bool? obscureText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixOnPressed;
  final bool? enabled;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final Color? fieldBackgroundColor;
  final bool iconOff;
  final double? fontSize;
  final ValueChanged<String>? onChanged;
  final double? height;
  final TextStyle? hintStyle;
  final double? radius;
  final EdgeInsetsGeometry? paddingValue;
  final EdgeInsetsGeometry? marginValue;

  const KCommonTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixOnPressed,
    this.enabled,
    this.onTap,
    this.readOnly,
    this.maxLines,
    this.validator,
    this.errorMsg,
    this.keyboardType,
    this.inputFormatters,
    this.padding,
    this.iconOff = false,
    this.fontSize,
    this.fieldBackgroundColor,
    this.onChanged,
    this.height,
    this.hintStyle,
    this.radius,
    this.paddingValue,
    this.marginValue,
  }) : super(key: key);

  @override
  State<KCommonTextField> createState() => _KCommonTextFieldState();
}

class _KCommonTextFieldState extends State<KCommonTextField> {
  @override
  void initState() {
    // TODO: implement initState

    errorString = "";
    super.initState();
  }

  bool isError = false;
  String errorString = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: widget.height ?? (widget.maxLines != null ? 110 : 55),
              alignment: Alignment.center,
              margin: widget.marginValue ??
                  const EdgeInsets.only(left: 0, top: 8, bottom: 8, right: 0),
              padding: widget.paddingValue ??
                  EdgeInsets.symmetric(
                      horizontal: (widget.iconOff) ? 15 : 10, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius ?? 15),
                color: widget.fieldBackgroundColor ?? AppTheme.lightBlue,
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: widget.controller,
                enabled: widget.enabled,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                readOnly: widget.readOnly ?? false,
                maxLines: widget.maxLines ?? 1,
                onChanged: widget.onChanged,
                style: TextStyle(
                  color: AppTheme.black,
                  fontSize: widget.fontSize ?? 15,
                  fontWeight: FontWeight.w400,
                ),
                validator: (value) {
                  if (widget.validator != null) {
                    final validationResult = widget.validator!(value);
                    isError = validationResult != null;
                    errorString = validationResult ?? '';
                    return "";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    labelText: widget.labelText,
                    errorMaxLines: 1,
                    errorText: null,
                    errorStyle: const TextStyle(height: 0),
                    labelStyle: TextStyle(
                      color: AppTheme.hintTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: widget.hintStyle ??
                        TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppTheme.hintTextColor),
                    suffixIcon: (widget.iconOff)
                        ? null
                        : IconButton(
                            onPressed: widget.suffixOnPressed,
                            color: AppTheme.black,
                            icon: Icon(widget.suffixIcon),
                          ),
                    prefixIcon: (widget.iconOff)
                        ? null
                        : widget.prefixIcon == null
                            ? const SizedBox()
                            : Align(
                                heightFactor: 1.0,
                                widthFactor: 1.0,
                                child: widget.prefixIcon,
                              )),
                obscureText: widget.obscureText ?? false,
              ),
            ),
            Visibility(
                visible: widget.errorMsg != "",
                child: Container(
                    padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                    child: Text(
                      widget.errorMsg ?? "",
                      style: getErrorTextFieldStyle(),
                    ))),
          ],
        ),
      ),
    );
  }

  getErrorTextFieldStyle() {
    return TextStyle(
      fontSize: 10.0,
      color: AppTheme.errorTextColor,
    );
  }
}
