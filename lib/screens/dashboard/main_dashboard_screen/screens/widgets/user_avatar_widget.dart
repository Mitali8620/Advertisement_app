import 'package:flutter/material.dart';
import '../../../../../common_components/cached_network_image_widget.dart';

Widget userAvatarWidget() {
  return cachedNetworkImageCircleWidget(
      netWorkImageUrl: "https://imgs.search.brave.com/hn8zKSWqXcFo-YaT9HAzqq1II8PRlo4lBCsOx3A7Mj8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAxOC8w/Mi8wOC8yMi8yNy9m/bG93ZXItMzE0MDQ5/Ml82NDAuanBn",
      width: 50,
      height: 50);
}
