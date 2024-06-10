import 'package:flutter/material.dart';
import '../common/tabView_text_widget.dart';

Future showConfirmDialog({
  required BuildContext context,
  required String contentText,
  required String headerText,
  required VoidCallback? positiveOnTapBtnEvent,
  String? nText,
  bool? isHide,
  String? positiveBtnText,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide.none),
        title: TabViewTextWidget(
            color: Theme.of(context).colorScheme.shadow,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            text: headerText),
        content: TabViewTextWidget(
            color: Theme.of(context).colorScheme.shadow,
            fontSize: 14,
            maxLines: 5,
            fontWeight: FontWeight.w400,
            text: contentText),
        actions: <Widget>[
          (isHide ?? false)
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    nText ?? "No Thanks",
                  )),
          TextButton(
            onPressed: positiveOnTapBtnEvent,
            child: Text(positiveBtnText ?? "Yes"),
          ),
        ],
      );
    },
  );
}
