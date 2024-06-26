import 'package:advertisement_app/common/container_dot_decoration.dart';
import 'package:advertisement_app/common_components/cached_network_image_widget.dart';
import 'package:advertisement_app/config/routes/routing_settings_args_models.dart';
import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/screens/widgets/category_data_not_found_Widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

class HomePageTabWidget extends StatefulWidget {
  final bool isBid;
  final Function(int) onTapTile;
  final String? bidStatus;

  const HomePageTabWidget(
      {super.key, this.isBid = false, required this.onTapTile, this.bidStatus});

  @override
  State<HomePageTabWidget> createState() => _HomePageTabWidgetState();
}

class _HomePageTabWidgetState extends State<HomePageTabWidget> {

  @override
  void initState() {
    Get.find<DashBoardController>().setInitialCurrentIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (requestCubit) {
        return ((requestCubit.isNoData))
            ? categoryDataNotFound(context: context, reLoadOnTap: () {})
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: requestCubit.requestItemsList.length,
                controller: requestCubit.scrollController,
                itemBuilder: (context, index) {
                  var requestListDataAssign =   requestCubit.requestItemsList[index];

                  return ((requestCubit.requestItemsList.isNotEmpty))
                      ? Card(
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
                              widget.onTapTile(index);
                              UserDetails? storedLoginModel =
                                  locator<StoreService>()
                                      .getLoginModel(key: StoreKeys.logInData);

                              GlobalInit.navKey.currentState?.pushNamed(
                                AppRoutes.imagePreviewMainScreen,
                                arguments: ImagePreviewScreenArgs(
                                    imagesList: requestListDataAssign.imagePath ?? [],
                                    categoryData:  requestListDataAssign
                                ),
                              );

                              ///for this when call tile to request details pass just uncomment and pass requestId here
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
                                          controller: Get.find<DashBoardController>().pageController,
                                          itemCount: requestListDataAssign.imagePath?.length ?? 0,
                                          scrollDirection: Axis.horizontal,
                                          onPageChanged: (value) {
                                            requestCubit.imageCurrentIndex = value;
                                            setState(() {});
                                            print("======== CIndex :: ${requestCubit.imageCurrentIndex}");
                                          },
                                          itemBuilder: (context, imageIndex) {

                                            return
                                              cachedNetworkImageWidget(
                                                netWorkImageUrl:
                                                requestListDataAssign
                                                    .imagePath![imageIndex],

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
                                                    ((requestListDataAssign.imagePath?.length ?? 0) >1) )
                                                    ?
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: (requestListDataAssign
                                                        .imagePath ?? []).asMap().entries.map((entry) {

                                                            return GestureDetector(
                                                        onTap: () => requestCubit. carouselController?.animateToPage(entry.key),
                                                        child: dotContainer(color: (Theme.of(context).brightness == Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black)
                                                            .withOpacity(requestCubit.imageCurrentIndex == entry.key ? 0.9 : 0.4)),
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
                        )
                      : Center(child: Container());
                },
              );
      },
    );
  }
}


buildImageSlider({required List<String> images , required BuildContext context , required   List<Widget> imageSliders}) {
  return imageSliders = images
      .map((item) => cachedNetworkImageWidget(
    width: Get.width,
        netWorkImageUrl:
      item,
      ))
      .toList();
}