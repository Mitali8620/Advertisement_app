import 'package:advertisement_app/constants/app_spacer_constants.dart';
import 'package:advertisement_app/utils/core/networking/api_endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/container_dot_decoration.dart';
import '../../../../common_components/app_elevated_button.dart';
import '../../../../common_components/cached_network_image_widget.dart';
import '../../../../utils/app_utils/colors/app_colors.dart';
import '../../../../utils/app_utils/string/strings.dart';
import '../../../../utils/core/services/launcher_url_link.dart';
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
          Row(
            children: [
              imageBottomLocationWidget(location: widget.categoryData.location ?? ""),
              InkWell(
                onTap: (){
                  LauncherLink().launcherLink(
                      link: ApiEndpoints().buildLocationRedirectionString(
                          lat: (widget.categoryData.latitude.toString().contains(".")) ?
                          double.parse(widget.categoryData.latitude.toString() ?? "0") :
                          int.parse(widget.categoryData.latitude.toString() ?? "0"),
                          lng: (widget.categoryData.longitude.toString().contains(".")) ?
                          double.parse(widget.categoryData.longitude.toString() ?? "0") :
                          int.parse(widget.categoryData.longitude.toString() ?? "0")));
                },
                child: Icon(Icons.location_on_outlined),
              )
            ],
          ),
///direction, website Button
          AppSpacer.p16(),

          webSireAndDirectionBtnRow(
              directionLink: widget.categoryData.directionLink ?? "",
              webSiteLink: widget.categoryData.websiteLink ?? "")
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



Widget webSireAndDirectionBtnRow({required String webSiteLink , required String directionLink}){
  return  (kIsWeb)?

      Container(width: Get.width*0.4,
      child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: (kIsWeb) ? 1 : 2,
                  child: directionBtn(directionLink: directionLink)),
              AppSpacer.p4(),
              Expanded(
                flex: (kIsWeb) ? 1 : 2,
                child: webSiteBtn(webSiteLink: webSiteLink),
              ),
            ],
          ),
        )
      : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 2, child: directionBtn(directionLink: directionLink)),
            AppSpacer.p4(),
            Expanded(
              flex: 2,
              child: webSiteBtn(webSiteLink: webSiteLink),
            ),
          ],
        );
}

Widget webSiteBtn({required String webSiteLink}){
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: 0, vertical: 0),
    child:  AppElevatedButton(
      title: Strings.webSite,
      backGroundColor: AppTheme.transparent,
      onPressed: () {
        print("----------- website ----------");
        LauncherLink().launcherLink(link: webSiteLink
        );
      },
    ),
  );
}

Widget directionBtn({required String directionLink}){
  return  Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: 0, vertical: 0),
    child:  AppElevatedButton(
      title: Strings.direction,
      backGroundColor: AppTheme.transparent,
      onPressed: () async {
        print("----------- direction ----------");
        print("=-------- launch URL");

        LauncherLink().launcherLink(link: directionLink);

      },
    ),
  );
}