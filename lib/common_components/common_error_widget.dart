import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_utils/colors/app_colors.dart';

class CommonErrorWidget extends StatelessWidget {
  final String message;

  const CommonErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message == ""
        ? const SizedBox()
        : Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(15, 0, 20, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme.errorTextColor),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppTheme.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
  }
}
