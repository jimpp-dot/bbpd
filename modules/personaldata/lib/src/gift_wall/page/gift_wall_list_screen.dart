/*
 *
 *  Created by yao.qi on 2022/9/7 上午11:31
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/9/7 上午11:28
 *
 */

import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/gift_wall/widget/gift_wall_normal_item_dialog.dart';
import 'package:shared/shared.dart';

import '../../../assets.dart';
import '../model/gift_wall_api.dart';
import '../widget/gift_wall_item_widget.dart';

class GiftWallListScreen extends StatefulWidget {
  final int targetUid;
  final ChatRoomData? room;
  final VoidCallback? giftCountChange;
  final ScrollController? scrollController;
  final int tabId;
  final List<GiftWallItem>? data;

  const GiftWallListScreen(this.targetUid, this.room, {Key? key, this.giftCountChange, this.scrollController, this.tabId = 0, this.data})
      : super(key: key);

  @override
  State<GiftWallListScreen> createState() => _GiftWallListScreenState();
}

class _GiftWallListScreenState extends State<GiftWallListScreen> with AutomaticKeepAliveClientMixin {
  bool _isLoading = true;
  String? _errorMsg;
  List<GiftWallItem> _giftList = [];
  final List<GiftWallItem> _giftShowList = [];

  bool _lightFilter = false;
  int _priceSort = 0;
  int _numSort = 0;

  @override
  void initState() {
    super.initState();
    if (Util.isCollectionEmpty(widget.data)) {
      _load();
    } else {
      _isLoading = false;
      _errorMsg = null;
      _giftList = widget.data ?? [];
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _load() async {
    GiftWallListRes rsp = await GiftWallApi.getBBGiftWallListResp(widget.targetUid, tabId: widget.tabId);
    if (rsp.success == true) {
      _errorMsg = null;
      _giftList = rsp.data;
    } else {
      _errorMsg = rsp.msg;
    }
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildGiftItem(GiftWallItem gift, int index, double width, double height) {
    double ratio = height / 96;
    String bgImage = Assets.personaldata$level_one_bg_png;
    Color txColor, giftNumTextColor;
    txColor = Colors.white;
    /*level 1：黄金  2：白银  3：青铜  4：点亮  0：未点亮*/
    int level = gift.level;
    bool isNotLight = level == 0;
    giftNumTextColor = isNotLight ? Colors.white.withOpacity(0.7) : Colors.white;

    if (level == 1) {
      // 黄金
      bgImage = Assets.personaldata$level_three_bg_png;
    } else if (level == 2) {
      // 白银
      bgImage = Assets.personaldata$level_two_bg_png;
    } else if (level == 3) {
      // 青铜
      bgImage = Assets.personaldata$level_one_bg_png;
    } else {
      if (level == 0) {
        //未点亮
        bgImage = Assets.personaldata$level_weidian_bg_png;
      } else {
        bgImage = Assets.personaldata$level_dian_bg_png;
      }
    }

    // 753 1149

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        GiftWallNormalItemDialog.show(context, gift, bgImage);
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
            child: Container(
              width: width,
              height: width * 1149 / 753,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (R.img(bgImage, width: width, height: height, package: Assets.package) as Image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ColorFiltered(
            colorFilter: gift.num == 0 ? greyscale : const ColorFilter.mode(Colors.transparent, BlendMode.color),
            child: CachedNetworkImage(
              placeholder: const CupertinoActivityIndicator(),
              imageUrl: '${System.imageDomain}static/$giftSubDir/${gift.gid}.png',
              width: 60 * ratio,
              height: 60 * ratio,
              fit: BoxFit.contain,
              fadeInDuration: const Duration(microseconds: 0),
              fadeOutDuration: const Duration(microseconds: 0),
            ),
          ),
          if (Util.validStr(gift.user.icon))
            PositionedDirectional(
              top: 40 * ratio,
              end: 10 * ratio,
              child: Container(
                width: 20 * ratio,
                height: 20 * ratio,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFF6F7F9),
                    width: 0.5,
                  ),
                ),
                alignment: AlignmentDirectional.center,
                child: CommonAvatar(
                  shape: BoxShape.circle,
                  size: 19 * ratio,
                  path: gift.user.icon,
                ),
              ),
            ),
          PositionedDirectional(
            bottom: 0,
            child: Column(
              children: [
                Text(
                  gift.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11 * ratio,
                    color: txColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (gift.num > 0)
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 6 * ratio,
                      bottom: 12 * ratio,
                    ),
                    child: Text(
                      'x${gift.num}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13 * ratio,
                        fontFamily: Util.numFontFamily,
                        package: ComponentManager.MANAGER_BASE_CORE,
                        color: giftNumTextColor,
                      ),
                    ),
                  ),
                // if (gift.num == 0 && Session.uid == widget.targetUid)
                //   Padding(
                //     padding: EdgeInsetsDirectional.only(
                //       top: 7 * ratio,
                //       bottom: 13 * ratio,
                //     ),
                //     child: Text(
                //       K.personal_not_lighten,
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //       style: TextStyle(
                //         fontSize: 11 * ratio,
                //         color: giftNumTextColor,
                //       ),
                //     ),
                //   ),
                // if ()
                (gift.num == 0 && Session.uid != widget.targetUid) == true
                    ? GestureDetector(
                        onTap: () async {
                          if (gift.num == 0 && Session.uid != widget.targetUid) {
                            IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
                            if (widget.room != null) {
                              // 房间礼物面板
                              await manager.showRoomGiftPanel(context, room: widget.room, uid: widget.targetUid, defaultId: gift.gid);

                              Tracker.instance.track(TrackEvent.giftwall_button_click, properties: {
                                'rid': widget.room?.rid ?? 0,
                                'target_uid': widget.targetUid,
                                'room_type': describeEnum(widget.room?.config?.types),
                              });
                            } else {
                              // 资料页礼物面板
                              await manager.showPrivateGiftPanel(context, uid: widget.targetUid, defaultId: gift.gid);

                              Tracker.instance.track(TrackEvent.giftwall_button_click, properties: {
                                'rid': 0,
                                'target_uid': widget.targetUid,
                                'room_type': 0,
                              });
                            }
                            _load();
                            if (widget.giftCountChange != null) {
                              widget.giftCountChange!();
                            }
                          }
                        },
                        child: FittedBox(
                          fit: BoxFit.none,
                          child: Container(
                            height: 20 * ratio,
                            margin: EdgeInsetsDirectional.only(
                              top: 6 * ratio,
                              bottom: 10 * ratio,
                            ),
                            padding: const EdgeInsetsDirectional.only(
                              start: 12,
                              end: 12,
                            ),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              K.personal_gift_wall_send,
                              style: TextStyle(
                                fontSize: 11 * ratio,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: (gift.num > 0 ? 0 : 26) * ratio,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
      child: _buildBody(),
      onRefresh: () async {
        _load();
      },
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Loading(),
      );
    }

    if (Util.validStr(_errorMsg)) {
      return ErrorData(
        fontColor: Colors.black,
        onTap: () {
          _errorMsg = null;
          _isLoading = true;
          setState(() {});
          _load();
        },
      );
    }

    if (!Util.validList(_giftList)) {
      return const Center(
        child: EmptyWidget(
          textColor: Colors.black,
        ),
      );
    }

    return Column(
      children: <Widget>[
        _buildFilter(),
        const SizedBox(height: 10),
        Expanded(child: _buildContent()),
        SizedBox(height: Util.isIphoneX ? Util.iphoneXBottom : 15),
      ],
    );
  }

  Widget _buildContent() {
    /// 筛选 or 排序
    _filterOrSort();

    double crossAxisSpacing = 8;
    double mainAxisSpacing = 16;
    double width = (Util.width - 20 * 2 - crossAxisSpacing * 3) / 4;
    double height = width / 78 * 96;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 78 / 126,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: _giftShowList.length,
        itemBuilder: (context, index) {
          var gift = _giftShowList[index];
          return _buildGiftItem(gift, index, width, height);
        },
      ),
    );
  }

  Widget _buildFilter() {
    String lightIcon = _lightFilter ? 'mate/gift_wall/ic_gift_wall_selected.webp' : 'mate/gift_wall/ic_gift_wall_unselect.webp';
    // Color lightColor = _lightFilter ? R.color.mainTextColor : R.color.secondTextColor;
    Color lightColor = Colors.white;
    String priceIcon;
    Color priceColor;
    if (_priceSort == 2) {
      priceColor = Colors.white;
      priceIcon = 'mate/gift_wall/ic_gift_wall_arrow_up.webp';
    } else if (_priceSort == 1) {
      priceColor = Colors.white;
      priceIcon = 'mate/gift_wall/ic_gift_wall_arrow_down.webp';
    } else {
      priceColor = Colors.white;
      priceIcon = 'mate/gift_wall/ic_gift_wall_arrow_down_d.webp';
    }
    String numIcon;
    Color numColor;
    if (_numSort == 2) {
      numColor = Colors.white;
      numIcon = 'mate/gift_wall/ic_gift_wall_arrow_up.webp';
    } else if (_numSort == 1) {
      numColor = Colors.white;
      numIcon = 'mate/gift_wall/ic_gift_wall_arrow_down.webp';
    } else {
      numColor = Colors.white;
      numIcon = 'mate/gift_wall/ic_gift_wall_arrow_down_d.webp';
    }
    return Container(
      width: double.infinity,
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 20),
          GestureDetector(
            onTap: _onTapLightFilter,
            child: Container(
              width: 68,
              height: 28,
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                color: R.colors.dialogBgColor,
              ),
              alignment: AlignmentDirectional.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(K.personal_gift_wall_filter_light, style: TextStyle(fontSize: 13, color: lightColor)),
                  const SizedBox(width: 4),
                  R.img(lightIcon, width: 16, height: 16, package: ComponentManager.MANAGER_PERSONALDATA),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: _onTapPriceSort,
            child: Container(
              width: 68,
              height: 28,
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                color: R.colors.dialogBgColor,
              ),
              alignment: AlignmentDirectional.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(K.personal_gift_wall_sort_price, style: TextStyle(fontSize: 13, color: priceColor)),
                  const SizedBox(width: 4),
                  R.img(priceIcon, width: 11, height: 11, package: ComponentManager.MANAGER_PERSONALDATA),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: _onTapNumSort,
            child: Container(
              width: 68,
              height: 28,
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                color: R.colors.dialogBgColor,
              ),
              alignment: AlignmentDirectional.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(K.personal_gift_wall_sort_num, style: TextStyle(fontSize: 13, color: numColor)),
                  const SizedBox(width: 4),
                  R.img(numIcon, width: 11, height: 11, package: ComponentManager.MANAGER_PERSONALDATA),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _filterOrSort() {
    _giftShowList.clear();
    if (_lightFilter) {
      _giftShowList.addAll(_giftList.where((e) => e.level > 0));
      return;
    }
    if (_priceSort > 0) {
      _giftShowList.addAll(_giftList);
      _giftShowList.sort((a, b) {
        if (_priceSort == 1) {
          return b.price - a.price;
        } else {
          return a.price - b.price;
        }
      });
      return;
    }
    if (_numSort > 0) {
      _giftShowList.addAll(_giftList);
      _giftShowList.sort((a, b) {
        if (_numSort == 1) {
          return b.num - a.num;
        } else {
          return a.num - b.num;
        }
      });
      return;
    }
    _giftShowList.addAll(_giftList);
  }

  void _onTapLightFilter() {
    _lightFilter = !_lightFilter;
    _priceSort = 0;
    _numSort = 0;
    widget.scrollController?.jumpTo(0);
    refresh();
  }

  void _onTapPriceSort() {
    _lightFilter = false;
    _priceSort++;
    _numSort = 0;
    if (_priceSort > 2) {
      _priceSort = 0;
    }
    widget.scrollController?.jumpTo(0);
    refresh();
  }

  void _onTapNumSort() {
    _lightFilter = false;
    _priceSort = 0;
    _numSort++;
    if (_numSort > 2) {
      _numSort = 0;
    }
    widget.scrollController?.jumpTo(0);
    refresh();
  }
}
