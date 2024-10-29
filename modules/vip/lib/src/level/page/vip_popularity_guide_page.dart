import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:vip/k.dart';

class VipPopularityGuidePage extends StatefulWidget {
  final bool isVip;

  static const KEY_VIP_GUIDE = 'vip_guide_show';

  static const KEY_POPULAR_GUIDE = 'popularity_guide_show';

  const VipPopularityGuidePage({super.key, required this.isVip});

  @override
  State<StatefulWidget> createState() {
    return _VipPopularityGuidePageState();
  }

  /// kris 屏蔽vip引导
  static Future show(BuildContext buildContext, bool isVip) {
    return Future.value();

    // return displayModalBottomSheet(
    //     context: buildContext,
    //     isBarrierDismissible: true,
    //     maxHeightRatio: 1,
    //     builder: (BuildContext context) {
    //       return VipPopularityGuidePage(isVip: isVip);
    //     });
  }
}

class _VipPopularityGuidePageState extends State<VipPopularityGuidePage> {
  final GlobalKey _leftKey = GlobalKey();
  final GlobalKey _rightKey = GlobalKey();
  double? _height;

  @override
  void initState() {
    super.initState();
    Config.set(widget.isVip ? VipPopularityGuidePage.KEY_VIP_GUIDE : VipPopularityGuidePage.KEY_POPULAR_GUIDE, '1');
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      RenderBox? leftRenderBox = _leftKey.currentContext?.findRenderObject() as RenderBox?;
      RenderBox? rightRenderBox = _rightKey.currentContext?.findRenderObject() as RenderBox?;
      double? leftHeight = leftRenderBox?.size.height;
      double? rightHeight = rightRenderBox?.size.height;
      Log.d('leftHeight = $leftHeight, rightHeight = $rightHeight');
      if (leftHeight != null || rightHeight != null) {
        setState(() {
          _height = max(leftHeight ?? 0, rightHeight ?? 0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFFFEF5ED),
            borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(16), topEnd: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 180,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(R.imagePath("level/vip_popular_guide_title_bg.webp", package: ComponentManager.MANAGER_VIP)),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Text(
                  widget.isVip ? K.vip_vip_introduction : K.vip_popular_introduction,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _buildQuestion(widget.isVip ? K.vip_whats_vip : K.vip_whats_popular,
                      widget.isVip ? K.vip_whats_vip_desc : K.vip_whats_popular_desc, _leftKey),
                ),
                const SizedBox(
                  width: 11,
                ),
                Expanded(
                  child: _buildQuestion(widget.isVip ? K.vip_vip_how_to_update : K.vip_popular_how_to_update,
                      widget.isVip ? K.vip_vip_how_to_update_desc : K.vip_popular_how_to_update_desc, _rightKey),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
              padding: const EdgeInsetsDirectional.only(start: 9, end: 9, top: 16, bottom: 16),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadiusDirectional.all(Radius.circular(8))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.isVip ? K.vip_vip_usefulness : K.vip_popular_usefulness,
                    style: const TextStyle(color: Color(0xFFFDA252), fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    K.vip_level_more_benefit,
                    style: const TextStyle(color: Color(0xFF313131), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildGuideItem('level/ic_badge.webp', K.vip_exclusive_badge,
                          widget.isVip ? K.vip_exclusive_badge_desc : K.vip_exclusive_badge_desc_popular),
                      const SizedBox(
                        width: 12,
                      ),
                      if (widget.isVip) ...[
                        _buildGuideItem('level/ic_gift.webp', K.vip_exclusive_gift, K.vip_exclusive_gift_desc),
                        const SizedBox(
                          width: 12,
                        )
                      ],
                      if (widget.isVip) ...[
                        _buildGuideItem('level/ic_nick_name.webp', K.vip_cool_nick_name, K.vip_cool_nick_name_desc),
                        const SizedBox(
                          width: 12,
                        )
                      ],
                      _buildGuideItem('level/ic_box.webp', K.vip_welfare_precious_box, K.vip_welfare_precious_box_desc),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 48 + Util.iphoneXBottom,
                padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
                color: Colors.white,
                child: Center(
                  child: Text(
                    K.vip_confirm_know,
                    style: const TextStyle(color: Color(0xFF313131), fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildQuestion(String title, String subTitle, GlobalKey key) {
    return Container(
      key: key,
      height: _height,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 10, top: 16, bottom: 16),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadiusDirectional.all(Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFFFDA252), fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            subTitle,
            style: const TextStyle(color: Color(0xFF313131), fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _buildGuideItem(String img, String title, String subTitle) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
                gradient: LinearGradient(
                    colors: [Color(0xFF725947), Color(0xFF3E2D23)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: R.img(img, width: 44, height: 44, package: ComponentManager.MANAGER_VIP),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFFFDA252), fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 90),
            child: Text(
              subTitle,
              style: TextStyle(color: const Color(0xFF313131).withOpacity(0.6), fontSize: 11),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
