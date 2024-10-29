import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

/// 宝座玩法礼物，顶部说明条
class SlpThroneTopTips extends StatefulWidget {
  final int giftId;
  final String giftIcon;
  final List<int> selectUids;
  final String jumpPage;

  const SlpThroneTopTips(
      {super.key,
      required this.giftId,
      required this.giftIcon,
      required this.selectUids,
      required this.jumpPage});

  @override
  SlpThroneTopTipsState createState() {
    return SlpThroneTopTipsState();
  }
}

class SlpThroneTopTipsState extends State<SlpThroneTopTips> {
  BbGiftThrone? data;

  /// didUpdateWidget回调无法判断list是否发生变化
  int selectListLength = 0;

  @override
  void initState() {
    super.initState();
    selectListLength = widget.selectUids.length;
    eventCenter.addListener('Gift.SendSuccess', _onGiftSendSuccess);
    loadData();
  }

  @override
  void dispose() {
    eventCenter.removeListener('Gift.SendSuccess', _onGiftSendSuccess);
    super.dispose();
  }

  _onGiftSendSuccess(String type, dynamic data) {
    if (widget.selectUids.length == 1) {
      /// 礼物送成功，且只选择一个人，需要刷新tips
      loadData();
    }
  }

  @override
  void didUpdateWidget(SlpThroneTopTips oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (needReload()) {
      loadData();
    }
    selectListLength = widget.selectUids.length;
  }

  bool needReload() {
    /// 仅选一个会展示选中人的等级和进度
    /// 其余都是展示通用的样式
    bool isSelectOne = widget.selectUids.length == 1;
    bool isSelectOneOld = selectListLength == 1;
    return isSelectOne != isSelectOneOld;
  }

  void loadData() async {
    try {
      String uids =
          widget.selectUids.length == 1 ? '${widget.selectUids[0]}' : '';
      String url =
          '${System.domain}go/yy/gift/throneDetail?gift_id=${widget.giftId}&uids=$uids';
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      ResGiftThroneDetail detail =
          ResGiftThroneDetail.fromBuffer(response.bodyBytes);
      if (mounted && detail.success == true) {
        setState(() {
          data = detail.data.throne;
        });
      }
    } catch (e) {
      Log.d('BbThroneTopTipsState error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Util.validStr(widget.jumpPage)) {
          BaseWebviewScreen.show(context, url: widget.jumpPage);
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        child: GradientBorderBox(
          width: Util.width - 16,
          height: 60,
          borderRadius: 12,
          borderWidth: 1,
          gradientColors: const [Color(0xFF9EEEFE), Color(0xFFCDEEFB)],
          child: Container(
            height: 58,
            width: Util.width - 16 - 2,
            padding: const EdgeInsetsDirectional.only(start: 8, end: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFF4EEDDE), Color(0xFF3CBBFD)],
              ),
            ),
            child: Row(
              children: [
                if (Util.validStr(widget.giftIcon)) ...[
                  CachedNetworkImage(
                    imageUrl: widget.giftIcon,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 6),
                ],
                ...buildBody(),
                const SizedBox(
                  width: 8,
                ),
                R.img(
                  Assets.ic_next_small_svg,
                  width: 16,
                  height: 16,
                  color: const Color(0xFF00607A),
                  package: ComponentManager.MANAGER_GIFT,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildBody() {
    if (data == null || !Util.validList(data?.levels)) {
      return [const Spacer()];
    }

    if (widget.selectUids.length == 1) {
      return buildSelectUserLevel();
    } else {
      return buildNormalTips();
    }
  }

  /// 多选/没选，通用说明样式
  List<Widget> buildNormalTips() {
    return [
      SizedBox(
        width: 70,
        child: Text(
          data?.tips ?? '',
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF006193),
            height: 1.2,
          ),
          maxLines: 2,
        ),
      ),
      Container(
        width: 0.5,
        margin: const EdgeInsetsDirectional.only(
            start: 15, end: 20, top: 10, bottom: 10),
        color: Colors.black.withOpacity(0.3),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: data?.levels.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            BbGiftThroneLevel item = data!.levels[index];
            return Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: buildLevelItem(item),
            );
          },
        ),
      ),
    ];
  }

  Widget buildLevelItem(BbGiftThroneLevel item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 7,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
              ),
            ),
            CachedNetworkImage(
              imageUrl:
                  Util.getRemoteImgUrl(item.icon) + Util.getGiftUrlSuffix(),
              width: 25,
              height: 25,
              cachedWidth: 25.px,
              cachedHeight: 25.px,
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: Container(
                height: 10,
                padding: EdgeInsetsDirectional.only(
                    start: 2.5, end: item.needGift == 1 ? 2.5 : 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: const Color(0xFF9DFFF7),
                ),
                child: Text(
                  '${item.needGift}',
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                    color: Color(0xFF209CDC),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          item.name,
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF006193),
            height: 1.1,
          ),
        ),
      ],
    );
  }

  ///
  List<Widget> buildSelectUserLevel() {
    if ((data?.currLevel ?? 1) >=
        (data?.levels[(data?.levels.length ?? 1) - 1].level ?? 1)) {
      /// 送单个人，且已达到最高等级
      return [
        Expanded(
          child: Text(
            data?.tips ?? '',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF006193),
              height: 1.2,
            ),
            maxLines: 2,
          ),
        ),
      ];
    } else {
      return [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data?.tips ?? '',
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF006193),
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              buildProgress(),
            ],
          ),
        ),
      ];
    }
  }

  Widget buildProgress() {
    double totalWidth = 140;
    int current = (data?.currNum ?? 0);
    int total = (data?.totalNum ?? 1);
    if (total < 1) {
      total = 1;
    }
    double colorWidth = min(current / total * totalWidth, totalWidth);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Container(
            width: totalWidth,
            height: 4,
            color: Colors.black12,
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: colorWidth,
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 7),
        Text(
          '$current/$total',
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF006193),
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
