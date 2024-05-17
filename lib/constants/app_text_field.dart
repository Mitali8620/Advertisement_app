import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/tabView_text_widget.dart';
import 'app_spacer_constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.controller,
      this.hint,
      this.keyboardType,
      this.obscureText = false,
      this.prefix,
      required this.labelText,
      this.minLine,
      this.maxLine,
      this.suffix,
      this.textInputAction,
      this.isTitleHeader,
      this.onTap,
      this.maxLength,
      this.enabled,
      this.readOnly,
      this.validator,
      this.onChanged,
      this.inputFormatters,
      this.textStyle});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final bool obscureText;
  final bool? enabled;
  final bool? readOnly;
  final bool? isTitleHeader;
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;
  final String labelText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? minLine;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitleHeader ?? true
            ? TabViewTextWidget(
                color: Theme.of(context).colorScheme.shadow,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                text: labelText)
            : const SizedBox.shrink(),
        AppSpacer.p4(),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: onTap,
                child: TextFormField(
                  enabled: enabled,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  inputFormatters: inputFormatters,
                  cursorColor:
                      Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                  controller: controller,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  obscureText: obscureText,
                  style: textStyle,
                  onChanged: onChanged,
                  maxLength: maxLength,
                  minLines: minLine,
                  maxLines: maxLine,
                  readOnly: readOnly ?? false,
                  validator: validator,
                  decoration: InputDecoration(
                    focusColor:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.2),
                          width: 1),
                    ),
                    suffixIcon: suffix,
                    prefixIcon: prefix,
                    hintText: labelText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.4)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
