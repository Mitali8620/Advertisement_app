import 'package:advertisement_app/utils/app_utils/assets/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../../common/tabView_text_widget.dart';
import '../../../../../common_components/app_elevated_button.dart';
import '../../../../../constants/app_spacer_constants.dart';
import '../../../../../utils/app_utils/string/validation_string.dart';

Widget categoryDataNotFound(
    {required BuildContext context, required Function()? reLoadOnTap}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(Assets.imagesNoActivityFoundIcon,
          height: MediaQuery.of(context).size.height * 0.3),
      AppSpacer.p24(),
      TabViewTextWidget(
          color: Theme.of(context).colorScheme.shadow,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: ValidationString.dataNotFoundInCategory),
      AppSpacer.p18(),
      /*Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: AppElevatedButton(
          title: ValidationString.reload,
          onPressed: reLoadOnTap,
        ),
      ),*/
    ],
  );
}

Widget categoryDataNotFoundWeb(
    {required BuildContext context, required Function()? reLoadOnTap}) {
  return ResponsiveBuilder(builder: (context, sizingInformation) {
    double size = MediaQuery.of(context).size.width * 0.5;
    if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
      size = 700;
    } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
      size = MediaQuery.of(context).size.width * 0.7;
    } else if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
      size = MediaQuery.of(context).size.width;
    }
    return SizedBox(
      width: size,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesNoActivityFoundIcon,
                height: MediaQuery.of(context).size.height * 0.3),
            AppSpacer.p24(),
            TabViewTextWidget(
                color: Theme.of(context).colorScheme.shadow,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                text: ValidationString.dataNotFoundInCategory),
            AppSpacer.p18(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: AppElevatedButton(
                title: ValidationString.reload,
                onPressed: reLoadOnTap,
              ),
            ),
          ],
        ),
      ),
    );
  });
}
