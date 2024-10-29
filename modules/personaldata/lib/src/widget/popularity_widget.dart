import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 人气标签
class PopularityWidget extends StatelessWidget {
  const PopularityWidget({
    Key? key,
    required this.tag,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return LabelWidget(
      height: 14,
      bgColor: const Color(0xFFFF849D),
      icon: R.imagePath(
        "ic_fire.svg",
        package: ComponentManager.MANAGER_PERSONALDATA,
      ),
      text: tag ?? '',
      textSize: 8.0,
      iconWidth: 7,
      iconHeight: 8,
    );
  }
}
