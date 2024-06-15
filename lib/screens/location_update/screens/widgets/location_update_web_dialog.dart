import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../common/tabView_text_widget.dart';
import '../../../../common_components/app_elevated_button.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../../../utils/app_utils/assets/assets_data.dart';
import '../../../../utils/app_utils/colors/app_colors.dart';
import '../../../../utils/app_utils/string/strings.dart';
import '../../../auth/auth_controller/auth_controller.dart';
import '../responsive_view/location_update_body.dart';

locationUpdateWebDialog(
    {required BuildContext context,
    required String des,
    required VoidCallback onTap}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        surfaceTintColor: Theme.of(context).colorScheme.onError,
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        child: GetBuilder<AuthController>(
          builder: (authController) {
            return Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: AppTheme.white),
              child: ResponsiveBuilder(builder: (context, sizingInformation) {
                double size = MediaQuery.of(context).size.width * 0.5;
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop) {
                  size = 700;
                } else if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.tablet) {
                  size = MediaQuery.of(context).size.width * 0.7;
                } else if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile) {
                  size = MediaQuery.of(context).size.width;
                }
                return  SizedBox(
                  width: size,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppSpacer.p24(),
                          SvgPicture.asset(Assets.imagesConfirmImg),
                          AppSpacer.p16(),
                          TabViewTextWidget(
                              color: Theme.of(context).colorScheme.shadow,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              text: Strings.updateLocation),
                          AppSpacer.p2(),
                      
                      
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: locationUpdateWebBody(
                                context: context, authController: authController),
                          ),
                      
                          TabViewTextWidget(
                              color: Theme.of(context).colorScheme.shadow,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              text: des),
                          AppSpacer.p24(),
                          Row(
                            children: [
                              Expanded(child: AppElevatedButton(
                                title: Strings.update,
                                onPressed: onTap,
                              )),
                              AppSpacer.p16(),
                              Expanded(child: AppElevatedButton(
                                title: Strings.no,
                                backGroundColor: AppTheme.transparent,
                                onPressed: () {
                                  Navigator.pop(context);
                                  authController.updateLocation();
                                },
                              )),
                              
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      );
    },
  );
}
