import 'package:flutter/material.dart';

Widget bottomMiddleFloatingActionButton(
    {required BuildContext context, required VoidCallback onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary),
      child: Icon(Icons.add,
          size: 30, color: Theme.of(context).colorScheme.onTertiary),
    ),
  );
}
