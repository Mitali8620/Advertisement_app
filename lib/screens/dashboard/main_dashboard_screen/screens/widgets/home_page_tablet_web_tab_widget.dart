import 'package:advertisement_app/common/container_dot_decoration.dart';
import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:advertisement_app/common_components/cached_network_image_widget.dart';
import 'package:advertisement_app/config/routes/routing_settings_args_models.dart';
import 'package:advertisement_app/constants/app_constants.dart';
import 'package:advertisement_app/utils/app_utils/string/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../../../common/tabView_text_widget.dart';
import '../../../../../config/routes/route_constants.dart';
import '../../../../../constants/app_spacer_constants.dart';
import '../../../../../utils/core/helpers/global_helper.dart';
import '../../../../../utils/core/services/locator_service.dart';
import '../../../../../utils/core/services/store_keys.dart';
import '../../../../../utils/core/services/store_service.dart';
import '../../../../auth/models/auth_model.dart';
import '../../dashboard_controller/dashboard_controller.dart';
import 'category_data_not_found_Widget.dart';
import 'web_data_header.dart';

class HomePageTabletWebTabWidget extends StatefulWidget {
  const HomePageTabletWebTabWidget({super.key});

  @override
  State<HomePageTabletWebTabWidget> createState() =>
      _HomePageTabletWebTabWidgetState();
}

class _HomePageTabletWebTabWidgetState
    extends State<HomePageTabletWebTabWidget> {
 // DashBoardController requestCubit = Get.put(DashBoardController());

  @override
  void initState() {
    print("requestCubit.requestItemsList :: ${Get.find<DashBoardController>().requestItemsList.length}");
    Get.find<DashBoardController>().setInitialCurrentIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    return GetBuilder<DashBoardController>(builder: (requestCubit) {
      return ((requestCubit.isNoData))
          ? Column(
            children: [
                clientHeader(
                    title: Strings.appName,
                    subTitle: requestCubit.getItemAtIndex(
                        index: requestCubit.currentDrawerIndex.value),
                    searchFlyerController: requestCubit.txtSearchFydeg,dashBoardController: requestCubit),
                AppSpacer.p10(),
              categoryDataNotFoundWeb(context: context,reLoadOnTap: () {
                requestCubit.reloadCategoryData();
              }),
            ],
          )
          : Column(
              children: [
                clientHeader(
                    title: Strings.appName,
                    subTitle: requestCubit.getItemAtIndex(
                        index: requestCubit.currentDrawerIndex.value),
                    searchFlyerController: requestCubit.txtSearchFydeg,dashBoardController: requestCubit),
                AppSpacer.p10(),
                buildWebTabletBody(dashBoardController: requestCubit),
              ],
            );
    });
  }

  Widget buildWebTabletBody({required DashBoardController dashBoardController}) {
    double screenWith = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = (constraints.maxWidth /
                  ((screenWith < 1000)
                      ? ((screenWith < 800))
                          ? ((screenWith < 650))
                              ? 1
                              : 2
                          : 3
                      : 4)) -
              10;
          return Container(
            height: MediaQuery.of(context).size.height - 139,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children:
                dashBoardController.requestItemsList.map((requestListDataAssign) {
                  return Container(
                 //   color: Colors.deepPurple,
                    height: 200,
                    width: itemWidth,
                    child: Card(
                      color: Theme.of(context).colorScheme.onTertiary,
                      surfaceTintColor:
                          Theme.of(context).colorScheme.onTertiary,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      elevation: 1,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          UserDetails? storedLoginModel = locator<StoreService>()
                              .getLoginModel(key: StoreKeys.logInData);

                          GlobalInit.mainNavigation.currentState?.pushNamed(
                            AppRoutes.imagePreviewMainScreen,
                            arguments: ImagePreviewScreenArgs(
                                imagesList: requestListDataAssign.imagePath ?? [],
                                categoryData:  requestListDataAssign),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    PageView.builder(
                                      controller: dashBoardController.pageController,
                                      itemCount: requestListDataAssign.imagePath?.length ?? 0,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (value){
                                        dashBoardController.imageCurrentIndex  = value;

                                        setState(() {});

                                        print("======== CIndex :: ${dashBoardController.imageCurrentIndex}");

                                      },
                                      itemBuilder: (context, imageIndex) {

                                        return
                                            cachedNetworkImageWidget(
                                              netWorkImageUrl: requestListDataAssign.imagePath![imageIndex],
                                              width: itemWidth - 2,
                                            );
                                      },
                                    ),


                                    Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                            child: ((requestListDataAssign.imagePath?.isNotEmpty ?? false)    &&
                                                ((requestListDataAssign.imagePath?.length ?? 0) >1) ) ?
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: (requestListDataAssign
                                                    .imagePath ?? []).asMap().entries.map((entry) {
                                                  return GestureDetector(
                                                    onTap: () => dashBoardController.carouselController?.animateToPage(entry.key),
                                                    child: dotContainer(color: (Theme.of(context).brightness == Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black)
                                                        .withOpacity(dashBoardController.imageCurrentIndex == entry.key ? 0.9 : 0.4)),
                                                  );
                                                }).toList()
                                            )
                                                : Container()))

                                  ],
                                ),
                              ),
                              AppSpacer.p4(),
                              TabViewTextWidget(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .shadow
                                      .withOpacity(0.6),
                                  fontSize: 12,
                                  maxLines: 2,
                                  fontWeight: FontWeight.w500,
                                  text: requestListDataAssign.title ?? ""),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
