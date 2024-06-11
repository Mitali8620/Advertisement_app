import 'package:advertisement_app/common_components/cached_network_image_widget.dart';
import 'package:advertisement_app/config/routes/routing_settings_args_models.dart';
import 'package:advertisement_app/constants/app_constants.dart';
import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/screens/widgets/category_data_not_found_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../common/tabView_text_widget.dart';
import '../../../../../common_components/app_elevated_button.dart';
import '../../../../../config/routes/route_constants.dart';
import '../../../../../constants/app_spacer_constants.dart';
import '../../../../../utils/app_utils/assets/assets_data.dart';
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
  // DashBoardController requestCubit = Get.put(DashBoardController());

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
                  var requestListDataAssign =
                      requestCubit.requestItemsList[index];

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
                                    imagesList:
                                        requestListDataAssign.imagePath ?? []),
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
                                    child: PageView.builder(
                                      itemCount:
                                          requestListDataAssign.image?.length ??
                                              0,
                                      itemBuilder: (context, imageIndex) {
                                        return Stack(
                                          children: [
                                            cachedNetworkImageWidget(
                                              netWorkImageUrl:
                                                  requestListDataAssign
                                                      .image![imageIndex],
                                            ),
                                            ((requestListDataAssign
                                                            .image?.length ??
                                                        0) >
                                                    1)
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_back_ios_new_sharp,
                                                            color: blackColor,
                                                          )),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: RotatedBox(
                                                            quarterTurns: 2,
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_back_ios_new_sharp,
                                                              color: blackColor,
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                          ],
                                        );
                                      },
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
