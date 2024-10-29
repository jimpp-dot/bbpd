import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../../shared.dart';

extension ScaffoldExtension on Scaffold {
  Widget withCommonBg() {
    return Container(
      height: double.infinity,
      color: R.colors.mainBgColor,
      child: Stack(
        children: [
          Image.asset(
            BaseAssets.shared$normal_main_bg_webp,
            fit: BoxFit.fitWidth,
          ),
          this,
        ],
      ),
    );
  }
}
