import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:advertisement_app/constants/app_spacer_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../common_components/cached_network_image_widget.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/auth_header.dart';
import '../../../../utils/core/helpers/global_helper.dart';
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

  @override
  void initState() {
    print("------------ Image is :: ${widget.imageData}");
    currentIndex = 0;
    _pageController = PageController(initialPage: currentIndex ?? 0);
    super.initState();
  }

  void _incrementPage() {
    if ((currentIndex ?? 0) < widget.imageData.length - 1) {
      _pageController?.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _decrementPage() {
    if ((currentIndex ?? 0) > 0) {
      _pageController?.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imagePreview(),
        AppSpacer.p16(),
        imageBottomDescriptionWidget(description: widget.categoryData.description ?? ""),
        AppSpacer.p16(),
        imageBottomLocationWidget(location: widget.categoryData.location ?? ""),

      ],
    );
  }

  Widget imagePreview() {
    return Container(
      color: Colors.transparent,
      height: Get.height * 0.6,
      child: PageView.builder(
        controller: Get.find<DashBoardController>().pageController,
        itemCount: widget.imageData.length ?? 0,
        itemBuilder: (context, imageIndex) {
          return Stack(
            children: [
              cachedNetworkImageWidget(
                height: Get.height * 0.7,
                width: Get.width,
                netWorkImageUrl: widget.imageData[imageIndex],
              ),
              ((widget.imageData.length ?? 0) > 1)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                if ((currentIndex ?? 0) > 0) {
                                  _pageController?.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                }
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: blackColor,
                              ),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                if ((currentIndex ?? 0) <
                                    widget.imageData.length - 1) {
                                  _pageController?.animateToPage(
                                      (currentIndex ?? 0) + 1,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                }
                              },
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: blackColor,
                                ),
                              ),
                            )),
                      ],
                    )
                  : const SizedBox(),
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
