// 星际图鉴入口
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../K.dart';
import '../../../assets.dart';

import 'gift_medal_widget.dart';

// 礼物图鉴入口
class GiftWallPanelWidget extends StatefulWidget {
  final int uid;
  final int lightNum;
  final int totalNum;
  final int rankNum;
  final String levelIcon;
  final List<GiftQualityMeta> medalList;
  final String? refer;
  final String? roomType;
  final int? rid;

  const GiftWallPanelWidget(this.uid, this.lightNum, this.totalNum,
      this.rankNum, this.levelIcon, this.medalList,
      {Key? key, this.refer, this.roomType, this.rid})
      : super(key: key);

  @override
  State<GiftWallPanelWidget> createState() => _GiftWallPanelWidgetState();
}

class _GiftWallPanelWidgetState extends State<GiftWallPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.flow_click, properties: {
          'click_page': widget.refer,
        });
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openGiftWallScreen(context, widget.uid,
            roomType: widget.roomType ?? widget.refer ?? '',
            rid: widget.rid ?? 0);
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
        height: 88,
        width: Util.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Rext.autoStyleImg(
                  Assets.personaldata$gift_wall_gift_wall_bg_webp,
                  width: Util.width - 32,
                  height: 88,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  fit: BoxFit.fill),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsetsDirectional.only(start: 9, end: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.3), width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: R.img(Util.getRemoteImgUrl(widget.levelIcon),
                      width: 70, height: 70),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          rankWidget(),
                          const SizedBox(height: 10),
                          GiftMedalWidget(medalList: widget.medalList)
                        ])),
                const SizedBox(width: 2),
              ],
            ),
            PositionedDirectional(
              end: 8,
              child: R.img(
                BaseAssets.shared$icon_next_fq_svg,
                width: 14,
                height: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  static final TextStyle _textStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: Util.fontFamily,
  );

  static final TextStyle _numTextStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: Util.numFontFamily,
    package: ComponentManager.MANAGER_BASE_CORE,
  );

  Widget rankWidget() {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          const TextSpan(text: " "),
          TextSpan(
              text: K.star_atlas_title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: Util.fontFamily,
              )),
          const TextSpan(text: " "),
          TextSpan(text: K.star_atlas_has_litup, style: _textStyle),
          TextSpan(
              text: ' ${widget.lightNum}/${widget.totalNum}  ',
              style: _numTextStyle),
          TextSpan(
              text: widget.rankNum > 0
                  ? K.star_atlas_rank
                  : K.star_atlas_unboard_rank,
              style: _textStyle),
          TextSpan(
              text: widget.rankNum > 0 ? ' Top ${widget.rankNum}' : ' 1000 ',
              style: _numTextStyle),
          if (widget.rankNum <= 0)
            TextSpan(text: K.star_atlas_name_list, style: _textStyle),
        ],
      ),
    );
  }
}
