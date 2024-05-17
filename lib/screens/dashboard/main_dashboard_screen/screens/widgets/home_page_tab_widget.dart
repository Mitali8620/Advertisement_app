import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/tabView_text_widget.dart';
import '../../../../../common_components/app_elevated_button.dart';
import '../../../../../constants/app_spacer_constants.dart';
import '../../../../../utils/app_utils/assets/assets_data.dart';
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
  DashBoardController requestCubit = Get.put(DashBoardController());

  @override
  void initState() {
    // TODO: implement initState

    print(
        "requestCubit.requestItemsList :: ${requestCubit.requestItemsList.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ((requestCubit.isNoData))
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesNoActivityFoundIcon,
                  height: MediaQuery.of(context).size.height * 0.3),
              AppSpacer.p24(),
              TabViewTextWidget(
                  color: Theme.of(context).colorScheme.shadow,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  text: "S.of(context).noActiveOrder"),
              AppSpacer.p18(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: AppElevatedButton(
                  title: "S.of(context).createNewOrder",
                  onPressed: () {
                    ///call create request page
                  },
                ),
              ),
            ],
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: requestCubit.requestItemsList.length,
            controller: requestCubit.scrollController,
            itemBuilder: (context, index) {
              var requestListDataAssign = requestCubit.requestItemsList[index];

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
                          LoginModel? storedLoginModel = locator<StoreService>()
                              .getLoginModel(key: StoreKeys.logInData);

                          ///for this when call tile to request details pass just uncomment and pass requestId here
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TabViewTextWidget(
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      text: "#123456"),
                                  TabViewTextWidget(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .shadow
                                          .withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      text: "676"),
                                ],
                              ),
                              AppSpacer.p4(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TabViewTextWidget(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .shadow
                                          .withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      text:
                                          "Number of item ( ${requestCubit.requestItemsList.length.toString() } )"),
                                  TabViewTextWidget(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      text: "Bids ( 123 )"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(child: Container());
            },
          );
  }
}
