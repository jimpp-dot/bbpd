import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vip/src/level/model/level_bean.dart';

import '../../../assets.dart';

/// 特权详情swiper
class LevelDetailSwiper extends StatefulWidget {
  final List<LevelItem> list;
  final int initialIndex;

  static Future show(BuildContext context, List<LevelItem> list,
      {Key? key, int initialIndex = 0}) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        builder: (BuildContext context) {
          return LevelDetailSwiper(list: list, initialIndex: initialIndex);
        });
  }

  const LevelDetailSwiper(
      {super.key, required this.list, this.initialIndex = 0});

  @override
  _LevelDetailSwiperState createState() => _LevelDetailSwiperState();
}

class _LevelDetailSwiperState extends State<LevelDetailSwiper> {
  late SwiperController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SwiperController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onCloseTaped() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 360,
            child: Swiper(
              key: ValueKey(widget.list.length),
              loop: false,
              index: min(widget.list.length, widget.initialIndex),
              scrollDirection: Axis.horizontal,
              viewportFraction: (290 + 16) * Util.ratio / Util.width,
              autoplayDisableOnInteraction: true,
              itemCount: widget.list.length,
              controller: _controller,
              physics: widget.list.length == 1
                  ? const NeverScrollableScrollPhysics()
                  : const PageScrollPhysics(parent: BouncingScrollPhysics()),
              itemBuilder: (BuildContext context, int index) {
                return _buildCard(widget.list[index]);
              },
              onIndexChanged: (index) {
                Log.d("Swiper onIndexChanged $index ");
              },
              onScrollStart: () {
                Log.d("Swiper onScrollStart");
              },
              onScrollEnd: () async {
                Log.d("Swiper onScrollEnd");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 13.0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _onCloseTaped,
              child: R.img(
                'level/ic_close.png',
                width: 43,
                height: 43,
                package: ComponentManager.MANAGER_VIP,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(LevelItem item) {
    return Container(
      width: 290,
      height: 360,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsetsDirectional.only(
          top: 16, bottom: 8, start: 16, end: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF191924), Color(0xff191924)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: GradientBoxBorder(
          gradient: LinearGradient(
              colors: [Color(0xFF64C9FF), Color(0xff3E3BFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: item.popCover,
              width: 257,
              height: 144,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFF7FCFF).withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(Assets.right_icon_tips,
                  package: Assets.package, width: 15 / 2, height: 17 / 2),

              // Container(
              //   width: 29,
              //   height: 2,
              //   margin: const EdgeInsetsDirectional.only(end: 4),
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [const Color(0xFFFFF0B4).withOpacity(0), const Color(0xFFFFF1B4)],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4),
                child: Text(
                  item.remark,
                  style: TextStyle(
                    color: const Color(0xFF56ADFF).withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ),

              R.img(Assets.left_icon_tips,
                  package: Assets.package, width: 15 / 2, height: 17 / 2),
              // Container(
              //   width: 29,
              //   height: 2,
              //   margin: const EdgeInsetsDirectional.only(start: 4),
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [const Color(0xFFFFF1B4), const Color(0xFFFFF0B4).withOpacity(0)],
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
