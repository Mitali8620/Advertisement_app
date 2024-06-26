import 'package:advertisement_app/constants/app_spacer_constants.dart';
import 'package:advertisement_app/utils/app_utils/assets/assets_data.dart';
import 'package:advertisement_app/utils/app_utils/colors/app_colors.dart';
import 'package:advertisement_app/utils/app_utils/string/strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/kTextField.dart';
import '../../../../../utils/core/constants/app_constants.dart';
import '../../../../splash/screens/splash_screen.dart';
import '../../dashboard_controller/dashboard_controller.dart';

Widget clientHeader(
    {String? title,
    required String? subTitle,
    required TextEditingController searchFlyerController
      , required DashBoardController dashBoardController
    }) {
  return Column(
    children: [
      Row(
        children: [
          Text(title ?? "Client",
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(width: AppConstant.defaultPadding * 0.8),
          Container(
            height: 25,
            width: 3,
            color: AppTheme.dividerColor,
          ),
          const SizedBox(width: AppConstant.defaultPadding * 0.8),
          Expanded(
              child: AutoSizeText(subTitle ?? "Management",
                  maxFontSize: 20,
                  minFontSize: 10,
                  style: const TextStyle(
                      fontSize: 20, color: AppTheme.dividerColor))),
          Container(
            height: 50,
            width: 50,
            child: Image.asset(Assets.appLogoImage),
          ),
        ],
      ),
      AppSpacer.p10(),
      Row(
        children: [
          Expanded(
            flex: 2,
            child: buildSearchTextField(searchFlyerController: searchFlyerController,dashBoardController: dashBoardController),
          ),
          const Expanded(flex: 7, child: SizedBox())
        ],
      ),
    ],
  );
}

Widget buildSearchTextField({required TextEditingController searchFlyerController, required DashBoardController dashBoardController}) {
  return GetBuilder<DashBoardController>(
    builder: (controller) {
      return KTextField(
        controller: searchFlyerController,
        labelText: Strings.search,
        fontColor: AppTheme.black,
        suffixIcon: InkWell(
           onTap:  (){
              controller.clearSearchData();
            }
        ,child: const Icon(Icons.close)),
        onChanged: (value){
          searchFyndeg.value = value;
          controller.update();

          Future.delayed(const Duration(milliseconds: 300)).then((v) {
            controller.setInitialAllHomeDataValue(isFRomSearch: true);
          print("searchFyndeg.value :: ${searchFyndeg.value}");

          controller.currentDrawerIndex.value = 0;

            controller.update();

            controller.changeTabBarIndex(0,isFromSearch: true);
            controller.update();

            controller.firstMenuOnTap();


            controller.tabController?.animateTo(0);
            controller.update();
          });
        },
        bgColor: AppTheme.greyBackGroundColor,
        fontSize: 14,
        borderColor: Colors.transparent,
        keyboardType: TextInputType.text,
      );
    }
  );
}
