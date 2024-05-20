import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common_components/cached_network_image_widget.dart';
import '../../../../../constants/app_constants.dart';
import '../../../../../constants/auth_header.dart';
import '../../../../../utils/core/helpers/global_helper.dart';

class ImagePreviewScreen extends StatefulWidget {
  final List<String> imageData;

  const ImagePreviewScreen({super.key, required this.imageData});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
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
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _decrementPage() {
    if ((currentIndex ?? 0) > 0) {
      _pageController?.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
        appbar: AuthHeader(arrowOnTap: () async {
          print("------------------- back from login ------------------- **");
          GlobalInit.navKey.currentState?.pop();
        }),
        child: Container(
          child: PageView.builder(
            itemCount: widget.imageData.length ?? 0,
            itemBuilder: (context, imageIndex) {
              return Stack(
                children: [
                  cachedNetworkImageWidget(
                    height: Get.height * 0.9,
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
                                          duration: Duration(milliseconds: 300),
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
                                          duration: Duration(milliseconds: 300),
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
                      : SizedBox(),
                ],
              );
            },
          ),
        ));
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
