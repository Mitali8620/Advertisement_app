import 'package:advertisement_app/constants/app_spacer_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import '../../../../common/container_dot_decoration.dart';
import '../../../../common_components/cached_network_image_widget.dart';
import '../../../dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import '../../../dashboard/model/category_response_data_model.dart';
import '../../widgets/image_bottom_description_widget.dart';

class ImagePreviewMobilePage extends StatefulWidget {
  final List<String> imageData;
  final CategoryData categoryData;

  const ImagePreviewMobilePage({super.key, required this.imageData, required this.categoryData});

  @override
  State<ImagePreviewMobilePage> createState() => _ImagePreviewMobilePageState();
}

class _ImagePreviewMobilePageState extends State<ImagePreviewMobilePage> {
  int? currentIndex;
  List<Widget>? imageSliders;
  PageController? _pageController;
  bool? blockScroll;


  DashBoardController dashBoardController =Get.find<DashBoardController>();
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imagePreview(),
          AppSpacer.p16(),
          imageBottomDescriptionWidget(description: widget.categoryData.description ?? ""),
          AppSpacer.p16(),
          imageBottomLocationWidget(location: widget.categoryData.location ?? ""),

        ],
      ),
    );
  }

  Widget imagePreview() {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          height: Get.height * 0.6,
          child: PageView.builder(
            controller: Get.find<DashBoardController>().pageController,
            itemCount: widget.imageData.length ?? 0,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value){
              Get.find<DashBoardController>().imageCurrentIndex  = value;

              setState(() {});

              print("======== CIndex --  :: ${Get.find<DashBoardController>().imageCurrentIndex}");

            },
            itemBuilder: (context, imageIndex) {
              return Stack(
                children: [


                  SizedBox(
                    height: Get.height * 0.7,
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
                      child:         cachedNetworkImageWidget(
                        height: Get.height * 0.7,
                        width: Get.width,
                        netWorkImageUrl: widget.imageData[imageIndex],
                      ),
                    ),
                  ),
                ],
              );
            },
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
                        onTap: () => dashBoardController. carouselController?.animateToPage(entry.key),
                        child: dotContainer(color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(dashBoardController.imageCurrentIndex == entry.key ? 0.9 : 0.4)),
                      );
                    }).toList()
                )
                    : Container()))

      ],
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
