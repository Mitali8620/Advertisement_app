import 'package:flutter/material.dart';
import 'app_inset_constants.dart';

/// paddings
const EdgeInsets padding0 = EdgeInsets.zero;
const EdgeInsets padding4 = EdgeInsets.all(AppInsets.xs);
const EdgeInsets padding8 = EdgeInsets.all(AppInsets.sm);
const EdgeInsets padding16 = EdgeInsets.all(AppInsets.md);
const EdgeInsets padding24 = EdgeInsets.all(AppInsets.lg);
const EdgeInsets paddingH8 =
    EdgeInsets.symmetric(horizontal: AppInsets.sm);
const EdgeInsets paddingV4 = EdgeInsets.symmetric(vertical: AppInsets.xs);
const EdgeInsets paddingV8 = EdgeInsets.symmetric(vertical: AppInsets.sm);
const EdgeInsets paddingH16 =
    EdgeInsets.symmetric(horizontal: AppInsets.md);
const EdgeInsets paddingV16 =
    EdgeInsets.symmetric(vertical: AppInsets.md);
const EdgeInsets paddingH24 =
    EdgeInsets.symmetric(horizontal: AppInsets.lg);
const EdgeInsets paddingV24 =
    EdgeInsets.symmetric(vertical: AppInsets.lg);

/// dividers
Divider divider = const Divider(height: 1);

/// borders
RoundedRectangleBorder roundedBorder16 =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppInsets.xl));

/// colors
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
