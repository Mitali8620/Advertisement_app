import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {
  const AppSpacer._({Key? key, this.h, this.w}) : super(key: key);

  factory AppSpacer.p80() => const AppSpacer._(
        h: 80,
        w: 0,
      );

  factory AppSpacer.p60() => const AppSpacer._(
        h: 60,
        w: 0,
      );

  factory AppSpacer.p48() => const AppSpacer._(
        h: 48,
        w: 48,
      );

  factory AppSpacer.p32() => const AppSpacer._(
        h: 32,
        w: 32,
      );

  factory AppSpacer.p24() => const AppSpacer._(
        h: 24,
        w: 24,
      );

  factory AppSpacer.p18() => const AppSpacer._(
        h: 18,
        w: 18,
      );

  factory AppSpacer.p16() => const AppSpacer._(
        h: 16,
        w: 16,
      );

  factory AppSpacer.p12() => const AppSpacer._(
        h: 12,
        w: 12,
      );

  factory AppSpacer.p10() => const AppSpacer._(
        h: 10,
        w: 10,
      );

  factory AppSpacer.p8() => const AppSpacer._(
        h: 8,
        w: 8,
      );

  factory AppSpacer.p4() => const AppSpacer._(
        h: 4,
        w: 4,
      );

  factory AppSpacer.p2() => const AppSpacer._(
        h: 2,
        w: 2,
      );

  /// height of the sizedBox
  final double? h;

  /// width of the sizedBox
  final double? w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}
