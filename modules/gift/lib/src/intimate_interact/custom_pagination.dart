import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomPaginationBuilder extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Container(
        width: active ? 8 : 4,
        height: 4,
        key: Key("pagination_$i"),
        decoration: BoxDecoration(
            color: active ? null : const Color(0xFF202020).withOpacity(0.2),
            gradient: active
                ? const LinearGradient(colors: [
                    Color(0xFFC233FF),
                    Color(0xFFF122B0),
                    Color(0xFFF79A7C),
                  ])
                : null,
            borderRadius: BorderRadius.circular(2)),
        margin: const EdgeInsets.all(2),
      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}
