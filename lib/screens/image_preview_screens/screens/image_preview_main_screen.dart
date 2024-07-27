import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:advertisement_app/constants/auth_header.dart';
import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../utils/core/helpers/global_helper.dart';
import '../../dashboard/model/category_response_data_model.dart';
import 'view/image_preview_mobile_page.dart';
import 'view/image_preview_tablet_web_page.dart';

class ImagePreviewMainScreen extends StatefulWidget {
  final List<String> imageData;
  final CategoryData categoryData;

  const ImagePreviewMainScreen({super.key, required this.imageData, required this.categoryData});

  @override
  State<ImagePreviewMainScreen> createState() => _ImagePreviewMainScreenState();
}

class _ImagePreviewMainScreenState extends State<ImagePreviewMainScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SafeArea(child: AppBaseScaffold(appbar:
      AuthHeader(arrowOnTap: () async {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          GlobalInit.navKey.currentState?.pop();
        } else {
          GlobalInit.mainNavigation.currentState?.pop();
        }
      },headerText:Get.find<DashBoardController>().formatDateRange(createdAt:widget.categoryData.createdAt ??"" ,
          toDate: widget.categoryData.toDate ??"")


        ,), child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return ImagePreviewTabletWebPage(imageData: widget.imageData ?? [],categoryData: widget.categoryData,);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return ImagePreviewTabletWebPage(imageData: widget.imageData ?? [],categoryData: widget.categoryData,);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return ImagePreviewMobilePage  (imageData: widget.imageData ?? [],categoryData: widget.categoryData,);
          }
          return const SizedBox.shrink();
        },
      )));
    });
  }
}
