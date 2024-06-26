import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import '../../../../common/container_dot_decoration.dart';
import '../../../../common_components/cached_network_image_widget.dart';
import '../../../../config/routes/app_router.dart';
import '../../../../config/routes/route_constants.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../../../utils/core/helpers/global_helper.dart';
import '../../../dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import '../../../dashboard/main_dashboard_screen/screens/widgets/main_menu.dart';
import '../../../dashboard/model/category_response_data_model.dart';
import '../../../network_home_page/initial_page.dart';
import '../../widgets/image_bottom_description_widget.dart';

class ImagePreviewTabletWebPage extends StatefulWidget {
  final List<String> imageData;
  final CategoryData categoryData;

  const ImagePreviewTabletWebPage({super.key, required this.imageData, required this.categoryData});

  @override
  State<ImagePreviewTabletWebPage> createState() =>
      _ImagePreviewTabletWebPageState();
}

class _ImagePreviewTabletWebPageState extends State<ImagePreviewTabletWebPage> {
  int? currentIndex;
  List<Widget>? imageSliders;
  PageController? _pageController;
  bool blockScroll = false;
  @override
  void initState() {
    print("------------ Image is :: ${widget.imageData}");

    Get.find<DashBoardController>().setInitialCurrentIndex();
    currentIndex = 0;
    _pageController = PageController(initialPage: currentIndex ?? 0);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imagePreview(),
        AppSpacer.p16(),
        AppSpacer.p10(),
        imageBottomDescriptionWidget(description: widget.categoryData.description ?? ""),
        AppSpacer.p16(),
        imageBottomLocationWidget(location: widget.categoryData.location ?? ""),
      ],
    );
  }


  Widget  buildImagePreviewBody(){
    return Row(
      children: [
        SideMenu(),
        AppSpacer.p10(),
        Expanded(
            child: Navigator(
              key: GlobalInit.mainNavigation,
              reportsRouteUpdateToEngine: true,
              initialRoute: AppRoutes.imagePreviewMainScreen,
              onGenerateRoute: AppRouter.generateRoute,
              onUnknownRoute: (settings) {
                return MaterialPageRoute(
                    builder: (_) => const InitiallyHomePage());
              },
            ))
      ],
    );
  }

  Widget imagePreview() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: Get.height * 0.6,
      ),
      child: PageView.builder(
        allowImplicitScrolling: true,

        controller: Get.find<DashBoardController>().pageController,
        itemCount: widget.imageData.length ?? 0,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          Get.find<DashBoardController>().imageCurrentIndex = value;
          setState(() {});
          print("======== CIndex :: ${Get.find<DashBoardController>().imageCurrentIndex}");
        },
        itemBuilder: (context, imageIndex) {
          return Stack(
            children: [

              SizedBox(
                height: Get.height * 0.9,
                width: Get.width,
                child: PinchZoomReleaseUnzoomWidget(
                  twoFingersOn: () => setState(() => blockScroll = true),
                  twoFingersOff: () => Future.delayed(
                    const Duration(milliseconds: 150),
                        () => setState(() => blockScroll = false),
                  ),
                  minScale: 0.8,
                  maxScale: 4,
                  resetDuration: const Duration(milliseconds: 150),
                  boundaryMargin: const EdgeInsets.only(bottom: 0),
                  clipBehavior: Clip.none,
                  maxOverlayOpacity: 0.5,
                  overlayColor: Colors.black,
                  child:   cachedNetworkImageWidget(
                    height: Get.height * 0.9,
                    width: Get.width,
                    boxFit: BoxFit.fitHeight,
                    netWorkImageUrl: widget.imageData[imageIndex],
                  ),
                ),
              ),



              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                      child: ((widget.imageData.isNotEmpty ?? false)    &&
                          ((widget.imageData.length ?? 0) >1) )
                          ?
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: (widget.imageData).asMap().entries.map((entry) {

                            return GestureDetector(
                              onTap: () => Get.find<DashBoardController>(). carouselController?.animateToPage(entry.key),
                              child: dotContainer(color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                                  .withOpacity(Get.find<DashBoardController>().imageCurrentIndex == entry.key ? 0.9 : 0.4)),
                            );
                          }).toList()
                      )
                          : Container()))




            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
