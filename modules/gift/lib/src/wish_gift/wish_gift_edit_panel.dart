import 'dart:math';

import 'package:chat_room/assets.dart';
import 'package:gift/k.dart';
import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/wish_gift/repo/wish_gift_repo.dart';
import 'package:chat_room/chat_room.dart';

import '../../assets.dart';
import '../widget/wish_edit_reward_words_widget.dart';
import '../widget/wish_invalid_countdown_widget.dart';
import '../widget/wish_reward_words_widget.dart';
import 'edit_wish_reward_words_bottom_sheet.dart';
import 'model/wish_gift_beans.dart';
import 'package:shared/k.dart' as BaseK;

import 'reset_wish_invalid_time_bottom_sheet.dart';

class WishGiftEditPanel extends StatefulWidget {
  final ChatRoomData room;

  const WishGiftEditPanel({Key? key, required this.room}) : super(key: key);

  static Future show(BuildContext context, ChatRoomData room) {
    return displayModalBottomSheet(
        context: context,
        isBarrierDismissible: true,
        defineBarrierColor: Colors.transparent,
        maxHeightRatio: 0.7,
        builder: (BuildContext context) {
          return WishGiftEditPanel(
            room: room,
          );
        });
  }

  @override
  _WishGiftEditPanelState createState() => _WishGiftEditPanelState();
}

class _WishGiftEditPanelState extends BaseScreenState<WishGiftEditPanel> {
  double _progressWidth = 0.0;

  double _itemWidth = 0.0;

  bool _checked = false;

  bool _editing = false;

  final double _giftItemHeight = 128.0;

  WishGiftsData? _data;

  bool _add = false;

  String _rewardWords = ''; // 答谢文案

  int _day = 0;
  int _hour = 0;
  int? _reserveRank;

  @override
  void initState() {
    super.initState();
    _itemWidth = (Util.width - 28 * 2 - 11 * 2) / 3;
    _progressWidth = _itemWidth - 16;
    _loadData();
  }

  void _loadData() async {
    WishGiftsResp resp = await WishGiftRepo.getWishGiftsData(widget.room.rid);
    if (resp.success == true) {
      _data = resp.data;
      _updateData();
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg, errorMsgColor: Colors.white);
    }
  }

  void _updateData() {
    if (_data == null || Util.isCollectionEmpty(_data?.gifts)) {
      _add = true;

      /// 默认开启每日自动
      _data = WishGiftsData([], [], true, 0, 0, '', 0, '', 0);
    }

    _checked = _data!.autoOpen;

    while (_data!.gifts.length < 3) {
      _data!.gifts.add(WishGift.giftId(-1));
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SingleChildScrollView(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              padding:
                  EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 12),
              decoration: const BoxDecoration(
                  color: Color(0xCC171621),
                  borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(16))),
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  _buildTitleBar(),
                  WishInvalidCountdownWidget(
                    isEdit: _editing,
                    countdown: Util.parseInt(_data?.countdown),
                    editCallback: () {
                      ResetWishInvalidTimeBottomSheet.show(context,
                          day: Util.parseInt(_day),
                          hour: Util.parseInt(_hour),
                          reserveRank: Util.parseInt(_reserveRank),
                          resetWishTimeCallback:
                              (int day, int hour, int reserveRank) {
                        _day = day;
                        _hour = hour;
                        _reserveRank = reserveRank;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  WishRewardWorldsWidget(
                      rid: widget.room.rid,
                      topSenders: _data?.topSenders ?? [],
                      senderNum: _data?.senderNum ?? 0),
                  Stack(
                    children: [
                      PositionedDirectional(
                          end: 16,
                          bottom: 0,
                          child: R.img(
                            Assets.gift_wish_box_bg_webp,
                            width: 76.0,
                            height: 53.0,
                            package: ComponentManager.MANAGER_GIFT,
                          )),
                      Container(
                        constraints: const BoxConstraints(minHeight: 160),
                        child: buildStatusContent(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        K.gift_open_wish_auto_daily,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _checked = !_checked;
                          setState(() {});
                          if (!_add && isScreenReady()) {
                            _changeAutoOpen();
                          }
                        },
                        child: R.img(
                            _checked
                                ? Assets.gift_wish_checked_png
                                : Assets.gift_wish_uncheck_png,
                            width: 47,
                            height: 28,
                            package: ComponentManager.MANAGER_GIFT),
                      ),
                      const SizedBox(
                        width: 18,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (_add)
                    InkWell(
                      onTap: _submit,
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(
                            start: 16, end: 16),
                        height: 52,
                        decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            gradient: LinearGradient(colors: [
                              const Color(0xFF6D5DFF)
                                  .withOpacity(_canSubmit ? 1 : 0.4),
                              const Color(0xFFC56AFF)
                                  .withOpacity(_canSubmit ? 1 : 0.4)
                            ])),
                        child: Center(
                          child: Text(
                            K.gift_make_wish,
                            style: TextStyle(
                                color: Colors.white
                                    .withOpacity(_canSubmit ? 1 : 0.4),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get _canSubmit {
    return _data?.gifts.firstWhereOrNull((element) => element.giftId > 0) !=
            null ||
        !_add;
  }

  Widget _buildGifts() {
    List<Widget> children = [];

    for (int i = 0; i < _data!.gifts.length; i++) {
      children.add(_buildItem(i));
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }

  Widget _buildItem(int index) {
    WishGift gift = _data!.gifts[index];
    if (gift.giftId == -1) {
      return _buildAdd(index);
    } else {
      return _buildGiftItem(gift, index);
    }
  }

  Widget _buildGiftItem(WishGift wishGift, int index) {
    double percent =
        wishGift.wishNum > 0 ? wishGift.incomeNum / wishGift.wishNum : 0;

    return Stack(
      children: [
        Container(
          height: _giftItemHeight,
          width: _itemWidth,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: const Color(0xFF000000).withOpacity(0.4)),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              CachedNetworkImage(
                imageUrl:
                    Util.giftImgUrl(wishGift.giftId) + Util.getGiftUrlSuffix(),
                width: 64,
                height: 64,
              ),
              Text(
                wishGift.name ?? '',
                style: TextStyle(
                    fontSize: 13, color: Colors.white.withOpacity(0.6)),
              ),
              Container(
                height: 20,
                width: _progressWidth,
                margin:
                    const EdgeInsetsDirectional.only(top: 4, start: 8, end: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Center(
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: '${wishGift.incomeNum}',
                        style: const TextStyle(
                            color: Color(0xFFC56AFF), fontSize: 11),
                      ),
                      TextSpan(
                        text:
                            '/${K.gift_number_suffix(['${wishGift.wishNum}'])}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6), fontSize: 11),
                      ),
                    ],
                  )),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                  height: 4,
                  margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
                  child: Stack(
                    children: [
                      Container(
                        width: _progressWidth,
                        decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            color: Colors.white.withOpacity(0.1)),
                      ),
                      Container(
                        width: _progressWidth * (min(1.0, percent)),
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            gradient: LinearGradient(colors: [
                              Color(0xFF9E6AFF),
                              Color(0xFFFF6AF7)
                            ])),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        if (_add || _editing)
          PositionedDirectional(
              end: -2,
              top: -2,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _data!.gifts[index] = WishGift.giftId(-1);
                  setState(() {});
                },
                child: R.img(RoomAssets.room_ic_close_svg,
                    width: 32,
                    height: 32,
                    color: Colors.white.withOpacity(0.4),
                    package: ComponentManager.MANAGER_BASE_ROOM),
              )),
      ],
    );
  }

  Widget _buildAdd(int index) {
    return InkWell(
      onTap: () {
        _chooseGift(index);
      },
      child: Container(
        width: _itemWidth,
        height: _giftItemHeight,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: const Color(0xFF000000).withOpacity(0.4)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(RoomAssets.premade_add_svg,
                  width: 28,
                  height: 28,
                  color: Colors.white.withOpacity(0.6),
                  package: ComponentManager.MANAGER_BASE_ROOM),
              const SizedBox(
                height: 8,
              ),
              Text(
                K.gift_add_gift_wish,
                style: TextStyle(
                    fontSize: 11, color: Colors.white.withOpacity(0.6)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return SizedBox(
      height: 44,
      width: Util.width,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Text(
            K.gift_today_gift_wish,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          if (!_add && isScreenReady())
            PositionedDirectional(
                top: 20,
                end: 16,
                child: InkWell(
                  onTap: () {
                    if (_editing) {
                      _submit();
                    } else {
                      _editing = true;
                      setState(() {});
                    }
                  },
                  child: Text(
                    _editing ? BaseK.K.finish : BaseK.K.base_edit,
                    style: TextStyle(
                        color: R.color.mainBrandColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ))
        ],
      ),
    );
  }

  void _chooseGift(int index) async {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    double maxHeight = _add ? 410.0 : 366.0;
    SelectGiftInfo? selectGiftInfo = await giftManager
        .showChooseGiftPanel(context, room: widget.room, maxHeight: maxHeight);
    if (selectGiftInfo != null) {
      int num = selectGiftInfo.num;
      int giftId = selectGiftInfo.id;
      WishGift? aGift = _data?.gifts.firstWhereOrNull(
        (item) => item.giftId == giftId,
      );
      if (aGift != null) {
        Fluttertoast.showToast(
            msg: K.gift_cannot_choose_same, gravity: ToastGravity.CENTER);
        return;
      }

      if (!_add) {
        _editing = true;
      }

      WishGift wishGift = WishGift(
          selectGiftInfo.id, selectGiftInfo.name, selectGiftInfo.price, num, 0);
      _data!.gifts[index] = wishGift;
      setState(() {});
    }
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
      padding: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 12, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: const Color(0xFF6F5EFF).withOpacity(0.08)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WishEditRewardWordsWidget(
              padding: const EdgeInsetsDirectional.only(bottom: 18),
              isCreatorOrReception: true,
              isEdit: _editing,
              rewardWords: _data?.rewardWords ?? '',
              rewardWordsEditCallback: () async {
                String? text = await EditWishRewardWordsBottomSheet.show(
                  context,
                  rewardWords: Util.validStr(_rewardWords)
                      ? _rewardWords
                      : (Util.parseStr(_data?.rewardWords) ?? ''),
                  rewardWordsAudit: Util.parseInt(_data?.rewardWordsAudit),
                );
                if (Util.validStr(text)) {
                  _rewardWords = text;
                }
              }),
          _buildGifts(),
          const SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: K.gift_total_value_prefix,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0x99FFFFFF),
                  ),
                ),
                TextSpan(
                  text: '${_getTotalPrice()}',
                  style:
                      const TextStyle(color: Color(0xFFC56AFF), fontSize: 13),
                ),
                TextSpan(
                  text: MoneyConfig.moneyName,
                  style:
                      const TextStyle(fontSize: 13, color: Color(0x99FFFFFF)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _getTotalPrice() {
    int price = 0;
    for (var gift in _data!.gifts) {
      if (gift.giftId > 0) {
        price += (gift.price * gift.wishNum);
      }
    }
    return price;
  }

  void _submit() async {
    if (_canSubmit) {
      List<WishGift> list = [];
      for (var element in _data!.gifts) {
        if (element.giftId > 0) {
          list.add(element);
        }
      }
      bool re = await WishGiftRepo.postWishGiftsData(
          widget.room.rid, list, _checked,
          rewardWords: _rewardWords,
          duration: (_day * 24 + _hour) * 3600,
          reserveRank: _reserveRank);
      if (re == true) {
        Navigator.of(context).pop();
      }
    }
  }

  void _changeAutoOpen() async {
    bool re =
        await WishGiftRepo.postWishGiftsAutoOpen(widget.room.rid, _checked);
    if (re == false) {
      _checked = !_checked;
      setState(() {});
    }
  }
}
