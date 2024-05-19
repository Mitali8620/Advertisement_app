import 'package:flutter/material.dart';
import '../common/tabView_text_widget.dart';
import '../utils/core/helpers/global_helper.dart';
import 'app_spacer_constants.dart';

class AuthHeader extends StatefulWidget {
  final String? headerText;
  final bool hasBackButton;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final Widget? suffix;
  final bool isProfile;
  final bool isCenter;
  final double? paddingValue;
  final GestureTapCallback? arrowOnTap;
  final MainAxisAlignment? mainAxisAlignment;

  const AuthHeader({
    super.key,
    this.headerText,
    this.hasBackButton = true,
    this.textColor,
    this.suffix ,
    this.isProfile = false,
    this.isCenter = false,
    this.iconColor,
    this.borderColor,
    this.paddingValue = 0,
    this.arrowOnTap,
    this.mainAxisAlignment,
  });

  @override
  State<AuthHeader> createState() => _AuthHeaderState();
}

class _AuthHeaderState extends State<AuthHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (widget.mainAxisAlignment !=null) ?(widget.mainAxisAlignment ?? MainAxisAlignment.spaceBetween) :MainAxisAlignment.spaceBetween,
      children: [
        widget.hasBackButton
            ? InkWell(
                onTap: widget.arrowOnTap ??
                    () {
                      GlobalInit.navKey.currentState?.pop();
                    },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 50,
                  width: 39,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: widget.borderColor ??
                              (widget.isProfile
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onError
                                      .withOpacity(0.5)
                                  : Theme.of(context)
                                      .colorScheme
                                      .shadow
                                      .withOpacity(0.2))),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: widget.iconColor ??
                          (widget.isProfile
                              ? Theme.of(context).colorScheme.onError
                              : Colors.black),
                    ),
                  )),
                ),
              )
            : AppSpacer.p32(),
        widget.headerText != null
            ? (widget.isCenter ?? false)
                ? Center(
                    child: Padding(
                    padding: widget.paddingValue != null
                        ? const EdgeInsets.all(0)
                        : EdgeInsets.only(
                            left: widget.suffix != null ? 38.0 : 0.0),
                    child: TabViewTextWidget(
                        color: widget.textColor ??
                            Theme.of(context).colorScheme.shadow,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        text: widget.headerText ?? ""),
                  ))
                : Padding(
                    padding: widget.paddingValue != null
                        ? const EdgeInsets.all(0)
                        : EdgeInsets.only(
                            left: widget.suffix != null ? 0 : 0.0),
                    child: TabViewTextWidget(
                        color: widget.textColor ??
                            Theme.of(context).colorScheme.shadow,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        text: widget.headerText ?? ""),
                  )
            : const SizedBox.shrink(),
        widget.suffix ?? AppSpacer.p32(),
      ],
    );
  }
}
