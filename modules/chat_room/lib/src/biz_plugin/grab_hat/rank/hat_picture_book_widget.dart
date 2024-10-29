import 'dart:math';

import 'package:chat_room/assets.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_merge_vap_overlay.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat_rank.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';

class HatPictureBookWidget extends StatefulWidget {
  final HatActivityAtlasData activityData;
  const HatPictureBookWidget({Key? key, required this.activityData})
      : super(key: key);

  @override
  State<HatPictureBookWidget> createState() => _HatPictureBookWidgetState();
}

class _HatPictureBookWidgetState extends State<HatPictureBookWidget> {
  final _chooseIndex = 0.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _myHatInfoWidget(),
          _mixWidget(),
          SizedBox(
            height: 20.dp,
          ),
          _rewardsWidget(),
          SizedBox(
            height: 20.dp,
          ),
          R.img(
            RoomAssets.chat_room$grab_hat_hat_app_logo_webp,
            width: 60.dp,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 20.dp,
          ),
        ],
      ),
    );
  }

  Widget _myHatInfoWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffFDE6D7), width: 0.5),
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff381E6b)),
      child: Row(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsetsDirectional.only(
                  start: 12, top: 12, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(widget.activityData.me.icon),
                width: 36,
                height: 36,
              )),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(widget.activityData.me.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
          ),
          const SizedBox(
            width: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(
                        text: '点亮分数：',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: widget.activityData.me.light.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(
                        text: '魅力值：',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: widget.activityData.me.charm.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  bool _isMergeing = false;

  Widget _mixWidget() {
    return Obx(() {
      HatActivityCategoryItem item =
          widget.activityData.hatCategories[_chooseIndex.value];

      List<Widget> contentList = [];
      List<Widget> rowList = [];
      for (int i = 0; i < item.hats.length; i++) {
        HatActivityHatItem hatItem = item.hats[i];
        Widget hatItemWidget = _itemWidget(hatItem);
        rowList.add(hatItemWidget);
        rowList.add(SizedBox(
          width: 26.dp,
        ));

        if ((i + 1) % 3 == 0 || i + 1 == item.hats.length) {
          rowList.removeLast();
          contentList.add(Row(
            mainAxisSize: MainAxisSize.min,
            children: [...rowList],
          ));
          contentList.add(SizedBox(
            height: 28.dp,
          ));
          rowList.removeRange(0, rowList.length);
        }
      }
      return Padding(
        padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp, top: 15.dp),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned.fill(
              child: Image.asset(
                RoomAssets.chat_room$grab_hat_hat_middle_bg_webp,
                width: Util.width - 16.dp,
                centerSlice: const Rect.fromLTWH(158, 243, 40, 40),
                scale: 2,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                //根据图片大小确定最小高度
                minHeight: 528 / 359 * (Util.width - 16.dp),
                minWidth: Util.width - 16.dp,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 55.dp,
                  ),
                  _buttonsWidget(),
                  SizedBox(
                    height: 32.dp,
                  ),
                  ...contentList,
                  GestureDetector(
                    onTap: () {
                      if (_isMergeing) return;
                      _isMergeing = true;
                      HatActivityCategoryItem item =
                          widget.activityData.hatCategories[_chooseIndex.value];
                      //先判断数量是否充足
                      for (int i = 0; i < item.hats.length; i++) {
                        HatActivityHatItem hatItem = item.hats[i];
                        if (hatItem.lightTimes <= 0) {
                          Fluttertoast.showCenter(msg: '帽子数量不足无法合成哟');
                          _isMergeing = false;
                          return;
                        }
                      }

                      HatMergeVapOverlay.show(
                          category: item.category,
                          vapUrl: widget.activityData.activity.animation,
                          vapSize: widget.activityData.activity.vapSize,
                          onComplete: (bool success,
                              {HatActivityRewardCommodity? rewardItem}) {
                            _isMergeing = false;
                            if (success) {
                              for (int i = 0; i < item.hats.length; i++) {
                                HatActivityHatItem hatItem = item.hats[i];
                                hatItem.lightTimes =
                                    max(0, hatItem.lightTimes - 1);
                              }
                              //合成后的奖励
                              if (rewardItem != null) {
                                if (_chooseIndex.value <
                                    widget.activityData.collectRewards.length) {
                                  HatActivityCollectRewordItem rewordItemList =
                                      widget.activityData
                                          .collectRewards[_chooseIndex.value];
                                  bool isHave = false;
                                  for (int i = 0;
                                      i < rewordItemList.commodities.length;
                                      i++) {
                                    HatActivityRewardCommodity rewardCommodity =
                                        rewordItemList.commodities[i];
                                    if (rewardCommodity.cid == rewardItem.cid) {
                                      isHave = true;
                                      rewardItem.period = rewardItem.period +
                                          rewardCommodity.period;
                                      rewordItemList.commodities[i] =
                                          rewardItem;
                                      break;
                                    }
                                  }
                                  if (!isHave) {
                                    rewordItemList.commodities.add(rewardItem);
                                  }
                                }
                              }
                              //刷新
                              _chooseIndex.refresh();
                            }
                          });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        R.img(
                          RoomAssets.chat_room$grab_hat_hat_mix_bg_webp,
                          width: 188.dp,
                          fit: BoxFit.fitWidth,
                        ),
                        const Text('合成',
                            style: TextStyle(
                              color: Color(0xffFDE8E2),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.dp,
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: 0,
              child: R.img(
                RoomAssets.chat_room$grab_hat_hat_middle_bg_up_webp,
                width: 132.dp,
                fit: BoxFit.fitWidth,
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              child: R.img(
                RoomAssets.chat_room$grab_hat_hat_bg_down_webp,
                width: 69.dp,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buttonsWidget() {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.activityData.hatCategories.length; i++) {
      HatActivityCategoryItem item = widget.activityData.hatCategories[i];
      Widget button = GestureDetector(
        onTap: () {
          if (i != _chooseIndex.value) {
            _chooseIndex.value = i;
          }
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              end: i < widget.activityData.hatCategories.length - 1 ? 5.dp : 0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 59.dp,
                height: 36.dp,
                decoration: BoxDecoration(
                    color: const Color(0xff5B2EA3),
                    borderRadius: BorderRadius.circular(18.dp)),
              ),
              if (i == _chooseIndex.value)
                PositionedDirectional(
                    bottom: 0,
                    start: 0,
                    child: R.img(
                        RoomAssets.chat_room$grab_hat_hat_choose_light_webp,
                        width: 59.dp,
                        height: 38.dp)),
              Text(item.category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      );
      buttons.add(button);
    }
    return SizedBox(
      width: Util.width - 56.dp,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: buttons,
        ),
      ),
    );
  }

  Widget _itemWidget(HatActivityHatItem hatItem,
      {String? text, List<Color>? colors, Color? textColor}) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(40.dp),
              child: Stack(
                children: [
                  PositionedDirectional(
                      top: 10.dp,
                      start: 10.dp,
                      child: CachedNetworkImage(
                        imageUrl: Util.getRemoteImgUrl(hatItem.url),
                        width: 142.dp,
                        height: 142.dp,
                      )),
                  R.img(RoomAssets.chat_room$grab_hat_hat_icon_mask_webp,
                      width: 80.dp, height: 80.dp),
                ],
              ),
            ),
            PositionedDirectional(
                top: 0,
                end: 0,
                child: Container(
                  height: 18.dp,
                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.dp),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: colors ??
                          (hatItem.lightTimes > 0
                              ? [
                                  const Color(0xffFFBB57),
                                  const Color(0xffFFF19E),
                                  const Color(0xffFFB149)
                                ]
                              : [
                                  const Color(0xffC7C7C7),
                                  const Color(0xff8B8C8D)
                                ]),
                    ),
                    border: Border.all(
                        color: hatItem.lightTimes > 0
                            ? const Color(0xffFF8B00)
                            : const Color(0xffA2A4A4),
                        width: 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                      text ??
                          (hatItem.lightTimes > 0
                              ? '点亮*${hatItem.lightTimes}'
                              : '未点亮'),
                      style: TextStyle(
                        color: textColor ??
                            (hatItem.lightTimes > 0
                                ? const Color(0xffBB5D18)
                                : Colors.white),
                        fontSize: 11.dp,
                        fontWeight: FontWeight.w600,
                      )),
                )),
          ],
        ),
        SizedBox(height: 9.dp),
        Text(hatItem.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }

  Widget _rewardsItemWidget(HatActivityHatItem hatItem,
      {String? text, List<Color>? colors, Color? textColor}) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.dp),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(hatItem.url),
                width: 80.dp,
                height: 80.dp,
              ),
            ),
            R.img(RoomAssets.chat_room$grab_hat_hat_icon_mask_webp,
                width: 80.dp, height: 80.dp),
            PositionedDirectional(
                top: 0,
                end: 0,
                child: Container(
                  height: 18.dp,
                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.dp),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: colors ??
                          (hatItem.lightTimes > 0
                              ? [
                                  const Color(0xffFFBB57),
                                  const Color(0xffFFF19E),
                                  const Color(0xffFFB149)
                                ]
                              : [
                                  const Color(0xffC7C7C7),
                                  const Color(0xff8B8C8D)
                                ]),
                    ),
                    border: Border.all(color: const Color(0xffFF8B00)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                      text ??
                          (hatItem.lightTimes > 0
                              ? '点亮*${hatItem.lightTimes}'
                              : '未点亮'),
                      style: TextStyle(
                        color: textColor ??
                            (hatItem.lightTimes > 0
                                ? const Color(0xffBB5D18)
                                : Colors.white),
                        fontSize: 11.dp,
                        fontWeight: FontWeight.w600,
                      )),
                )),
          ],
        ),
        SizedBox(height: 9.dp),
        Text(hatItem.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }

  Widget _rewardsWidget() {
    return Obx(() {
      HatActivityCollectRewordItem rewordItem;
      if (_chooseIndex.value < widget.activityData.collectRewards.length) {
        rewordItem = widget.activityData.collectRewards[_chooseIndex.value];
      } else {
        rewordItem = HatActivityCollectRewordItem();
      }

      List<Widget> contentList = [];
      List<Widget> rowList = [];

      for (int i = 0; i < rewordItem.commodities.length; i++) {
        HatActivityRewardCommodity rewardCommodity = rewordItem.commodities[i];
        HatActivityHatItem hatItem = HatActivityHatItem(
            name: rewardCommodity.name, url: rewardCommodity.url);
        Widget hatItemWidget = _rewardsItemWidget(hatItem,
            text: '${rewardCommodity.period}天',
            colors: [
              const Color(0xffFFBB57),
              const Color(0xffFFF19E),
              const Color(0xffFFB149)
            ],
            textColor: const Color(0xffBB5D18));
        rowList.add(hatItemWidget);
        rowList.add(SizedBox(
          width: 26.dp,
        ));

        if ((i + 1) % 3 == 0 || i + 1 == rewordItem.commodities.length) {
          rowList.removeLast();
          contentList.add(Row(
            mainAxisSize: MainAxisSize.min,
            children: [...rowList],
          ));
          contentList.add(SizedBox(
            height: 28.dp,
          ));
          rowList.removeRange(0, rowList.length);
        }
      }
      return Padding(
        padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                RoomAssets.chat_room$grab_hat_hat_bottom_bg_webp,
                width: Util.width - 16.dp,
                centerSlice: const Rect.fromLTWH(158, 111, 40, 40),
                scale: 2,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                //根据图片大小确定最小高度
                minHeight: 263 / 359 * (Util.width - 16.dp),
                minWidth: Util.width - 16.dp,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 80.dp,
                  ),
                  ...contentList,
                ],
              ),
            ),
            if (rewordItem.commodities.isEmpty)
              Padding(
                padding: EdgeInsetsDirectional.only(start: 33.dp, end: 33.dp),
                child: Text('暂无奖励，集齐一个图鉴的所有帽子即可合成神秘装扮，快去收集吧',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            Positioned(
              top: 25.dp,
              child: const GradientText('收集奖励',
                  textAlign: TextAlign.center,
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      Color(0xFFFEEDD4),
                      Color(0xFFFBB989),
                    ],
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            PositionedDirectional(
              top: -5,
              child: R.img(
                RoomAssets.chat_room$grab_hat_hat_bottom_bg_up_webp,
                width: 132.dp,
                fit: BoxFit.fitWidth,
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              child: R.img(
                RoomAssets.chat_room$grab_hat_hat_bg_down_webp,
                width: 69.dp,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      );
    });
  }
}
