import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../constants/app_constants.dart';
import '../constants/app_spacer_constants.dart';
import '../utils/core/networking/netwok_handling/network_connectivity_controller.dart';
import 'no_internet_connection.dart';

/// this widget is stateless widget for base scaffold
/// [child] and [padding] are required parameters
/// [padding] are used for giving padding to a [child] widget
/// [floatingWidget] are used for floating action button widget
class AppBaseScaffold extends StatelessWidget {
  AppBaseScaffold({
    Key? key,
    required this.child,
    this.appbar,
    this.padding,
    this.backgroundColor,
    this.floatingWidget,
    this.bottomNavigationBar,
    this.floatingButtonLocation,
    this.resizeToAvoidBottomInset,
    this.drawerWidget,
    this.topPadding,
  }) : super(key: key);

  /// child widget
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Widget? appbar;
  final Widget? drawerWidget;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final double? topPadding;

  /// floatingWidget widget
  final Widget? floatingWidget;

  /// for [bottomNavigationBar]  widget
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingButtonLocation;

  NetworkConnectivityCubit cubitData = Get.put(NetworkConnectivityCubit());

  ///padding EdgeInsets
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {

      return Obx(() {
        return

            /// don't remove this, print("IsNetworkConnected:: ${cubitData.isNetWorkOn}");
            Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          drawer: (drawerWidget != null) ? drawerWidget! : const SizedBox(),
          appBar: appbar != null
              ? PreferredSize(
                  preferredSize: Size(
                      double.infinity,
                      (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop ||
                              sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet)
                          ? 120
                          : MediaQuery.of(context).size.height * 0.09),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: topPadding ?? 8),
                    child: SingleChildScrollView(
                      physics: (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop ||
                              sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet)
                          ? const BouncingScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                         // AppSpacer.p24(),
                          appbar ?? const SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                )
              : const PreferredSize(
                  preferredSize: Size(double.infinity, 0),
                  child: SizedBox.shrink()),
          floatingActionButton: floatingWidget,
          body: Padding(
            padding: padding ?? padding16,
            child: (cubitData.isNetworkOn.value)
                ? child
                : const NoInterNetConnectionView(),
          ),
          floatingActionButtonLocation:
              floatingButtonLocation ?? FloatingActionButtonLocation.centerTop,
          bottomNavigationBar: bottomNavigationBar ?? const SizedBox(),
        );
      });
    });
  }
}
