import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
print("------------ Image is :: ${widget.imageData}");

super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
        appbar: AuthHeader(arrowOnTap: () async {
          print("------------------- back from login ------------------- **");
          GlobalInit.navKey.currentState?.pop();
        }),
        child: Container(
          child: Expanded(
            child: PageView.builder(
              itemCount: widget.imageData.length ?? 0,
              itemBuilder: (context, imageIndex) {
                print(
                    "requestListDataAssign.images![imageIndex] $imageIndex ${widget.imageData[imageIndex]}");
                return Stack(
                  children: [
                    cachedNetworkImageWidget(
                      netWorkImageUrl: widget.imageData[imageIndex],
                    ),
                    ((widget.imageData.length ?? 0) > 1)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_back_ios_new_sharp,
                                    color: blackColor,
                                  )),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: Icon(
                                      Icons.arrow_back_ios_new_sharp,
                                      color: blackColor,
                                    ),
                                  )),
                            ],
                          )
                        : SizedBox(),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
