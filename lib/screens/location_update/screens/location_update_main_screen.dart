import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../constants/auth_header.dart';
import '../../../utils/core/helpers/global_helper.dart';
import '../../auth/auth_controller/auth_controller.dart';
import 'responsive_view/location_update_mobile_page.dart';
import 'responsive_view/location_update_tablet_web_page.dart';

class LocationUpdateMainScreen extends StatefulWidget {
  const LocationUpdateMainScreen({super.key});

  @override
  State<LocationUpdateMainScreen> createState() =>
      _LocationUpdateMainScreenState();
}

class _LocationUpdateMainScreenState extends State<LocationUpdateMainScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(child: GetBuilder<AuthController>(
      builder: (authCubit) {
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) async {},
          child: AppBaseScaffold(appbar: AuthHeader(arrowOnTap: () async {
            print("------------------- back from profile ------------------- **");
            GlobalInit.navKey.currentState?.pop();
          }),
              child: ResponsiveBuilder(builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              return const LocationUpdateTabletWebPage();
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
              return const LocationUpdateTabletWebPage();
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return const LocationUpdateMobilePage();
            }
            return const SizedBox.shrink();
          })),
        );
      },
    ));
  }
}
