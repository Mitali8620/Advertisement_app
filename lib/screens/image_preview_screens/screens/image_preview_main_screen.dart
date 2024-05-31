import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:advertisement_app/constants/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../utils/core/helpers/global_helper.dart';
import 'view/image_preview_mobile_page.dart';
import 'view/image_preview_tablet_web_page.dart';

class ImagePreviewMainScreen extends StatefulWidget {
  final List<String> imageData;

  const ImagePreviewMainScreen({super.key, required this.imageData});

  @override
  State<ImagePreviewMainScreen> createState() => _ImagePreviewMainScreenState();
}

class _ImagePreviewMainScreenState extends State<ImagePreviewMainScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return AppBaseScaffold(appbar: AuthHeader(arrowOnTap: () async {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          GlobalInit.navKey.currentState?.pop();
        } else {
          GlobalInit.mainNavigation.currentState?.pop();
        }
      }), child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return ImagePreviewMobilePage(imageData: widget.imageData ?? []);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return ImagePreviewTabletWebPage(imageData: widget.imageData ?? []);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return ImagePreviewTabletWebPage(imageData: widget.imageData ?? []);
          }
          return const SizedBox.shrink();
        },
      ));
    });
  }
}
