import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;

import '../../k.dart';
import '../gift_api.dart';

class CombineGiftRoomPositionWrapper {
  RoomPosition position;
  bool selected;

  CombineGiftRoomPositionWrapper(
      {required this.position, this.selected = false});
}

/// 礼物组合弹框
class SlpCombineGiftDialog extends StatefulWidget {
  final ChatRoomData room; // 房间ID
  final int combineId; // 礼物组合ID
  final String combineName; // 礼物组合名称
  final int combineType; // 礼物组合类型，0-可切换，1-固定单点，2-固定全麦
  const SlpCombineGiftDialog(
      {Key? key,
      required this.room,
      required this.combineId,
      required this.combineName,
      required this.combineType})
      : super(key: key);

  @override
  State<SlpCombineGiftDialog> createState() => _SlpCombineGiftDialogState();

  static Future<void> show(BuildContext context,
      {required ChatRoomData room,
      required int combineId,
      required String combineName,
      required int combineType}) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: SlpCombineGiftDialog(
              room: room,
              combineId: combineId,
              combineName: combineName,
              combineType: combineType),
        );
      },
    );
  }
}

class _SlpCombineGiftDialogState extends State<SlpCombineGiftDialog> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  // 详情数据
  GiftCombineDetailData? _data;

  BbGiftPanelInteractCombine? _combineGift;

  // 麦位上所有的用户表，和gift_b_choose同时取交集
  final List<CombineGiftRoomPositionWrapper> _positions = [];

  // 单点是否选中，从配置中读取
  bool _singleMicSelected = false;

  // 全麦是否选中，从配置中读取
  bool _allMicSelected = false;

  bool _loading = false;
  String _errMsg = '';

  // 礼物A的总金额
  int _totalMoneyA = 0;

  // 礼物B的总金额
  int _totalMoneyB = 0;

  // 当前房间是否有房主
  bool _hasCreator = false;

  // 当前房间是否有接待
  bool _hasReception = false;

  bool _isPaying = false;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(
      TrackEvent.interact_combine_gift_popup,
      properties: {
        'rid': widget.room.rid,
        'interact_combine_gift_id': widget.combineId,
        'interact_combine_gift_name': widget.combineName
      },
    );
    _loadData();
  }

  void _loadData() async {
    refresh(() {
      _loading = true;
      _errMsg = '';
    });
    ResGiftCombineDetail resp =
        await GiftApi.giftCombineDetail(widget.room.rid, widget.combineId);
    if (resp.success && resp.hasData()) {
      _data = resp.data;
      _loading = false;
      _errMsg = '';

      // 礼物组合类型，0-可切换，1-固定单点，2-固定全麦
      if (widget.combineType == 2) {
        // 全麦
        _combineGift = _data?.allCombine;
      } else {
        // 可切换 + 单点
        _combineGift = _data?.singleCombine;
      }

      // 处理数据
      _handleData();
      refresh();
    } else if (Util.validStr(resp.msg)) {
      _loading = false;
      _errMsg = resp.msg;
      refresh();
    }
  }

  void _handleData() {
    // gift_a_to：礼物a赠送对象，1-房主+接待，2-房主，3-接待
    _hasCreator = !Util.parseBool(widget.room.config?.nine) &&
        Util.parseInt(widget.room.createor?.uid) > 0 &&
        Util.parseInt(widget.room.createor?.uid) != Session.uid &&
        Util.validStr(widget.room.createor?.icon) &&
        (Util.parseInt(_combineGift?.giftATo) == 1 ||
            Util.parseInt(_combineGift?.giftATo) == 2);

    _hasReception = Util.parseBool(widget.room.config?.reception) &&
        Util.validList(widget.room.positions) &&
        Util.parseInt(widget.room.positions[0].uid) > 0 &&
        Util.parseInt(widget.room.positions[0].uid) != Session.uid &&
        (Util.parseInt(_combineGift?.giftATo) == 1 ||
            Util.parseInt(_combineGift?.giftATo) == 3);

    _totalMoneyA = 0;
    _totalMoneyB = 0;

    // 如果有房主，就累计加金额
    if (_hasCreator) {
      _totalMoneyA += Util.parseInt(_combineGift?.giftAPrice) *
          Util.parseInt(_combineGift?.giftANum);
    }

    // 如果有接待，就累计加金额
    if (_hasReception) {
      _totalMoneyA += Util.parseInt(_combineGift?.giftAPrice) *
          Util.parseInt(_combineGift?.giftANum);
    }

    // gift_b_to 礼物b赠送方式，1-单点，2-全麦
    _singleMicSelected = Util.parseInt(_combineGift?.giftBTo) == 1;
    _allMicSelected = Util.parseInt(_combineGift?.giftBTo) == 2;

    // gift_b_position 礼物b赠送的麦位范围，从0开始，英文逗号分隔
    String giftBPosition = _combineGift?.giftBPosition ?? '';

    // gift_b_choose 礼物b赠送范围内的默认勾选麦位，从0开始，英文逗号分隔
    String giftBChoose = _combineGift?.giftBChoose ?? '';

    _positions.clear();
    if (Util.validList(widget.room.positions)) {
      for (int i = 0; i < widget.room.positions.length; i++) {
        RoomPosition position = widget.room.positions[i];
        if (position.uid > 0 &&
            position.uid != Session.uid &&
            giftBPosition.contains('${position.position}')) {
          bool currentSelected = giftBChoose.contains('${position.position}');
          _positions.add(CombineGiftRoomPositionWrapper(
              position: position, selected: currentSelected ? true : false));
          if (currentSelected) {
            _totalMoneyB += Util.parseInt(_combineGift?.giftBPrice) *
                Util.parseInt(_combineGift?.giftBNum);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return SizedBox(height: Util.height * 0.5, child: const Loading());
    } else if (Util.validStr(_errMsg)) {
      return SizedBox(
        height: Util.height * 0.5,
        child: ErrorData(
          error: _errMsg,
          onTap: () {
            _loadData();
          },
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),

          // 名称
          if (Util.validStr(_combineGift?.combineName))
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 32),
              child: Text(
                _combineGift?.combineName ?? '',
                style: TextStyle(
                    color: R.color.unionRankText1,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),

          // 礼物A
          if ((_hasCreator || _hasReception) &&
              Util.parseInt(_combineGift?.giftA) > 0) ...[
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  CachedNetworkImage(
                      imageUrl: Util.giftImgUrl(_combineGift?.giftA ?? 0),
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover),
                  const SizedBox(width: 2),
                  Text(
                    _combineGift?.giftAName ?? '',
                    style: TextStyle(
                        color: R.color.unionRankText1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'x${_combineGift?.giftANum ?? 0}',
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.5),
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 14),
              child: Container(
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF6F7F9),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 16, end: 12),
                      child: Text(
                        K.give_something,
                        style: TextStyle(
                            color: R.color.unionRankText1.withOpacity(0.6),
                            fontSize: 12),
                      ),
                    ),
                    // 房主
                    if (_hasCreator) ...[
                      _buildCreatorOrReceptionAvatar(
                          icon: widget.room.createor?.icon ?? '',
                          name: BaseK.K.base_room_creator),
                      const SizedBox(width: 8),
                    ],
                    // 接待
                    if (_hasReception)
                      _buildCreatorOrReceptionAvatar(
                          icon: widget.room.positions[0].icon,
                          name: BaseK.K.base_room_admin),
                  ],
                ),
              ),
            ),
          ],

          // 礼物B
          if (Util.validList(_positions) &&
              Util.parseInt(_combineGift?.giftB) > 0) ...[
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  CachedNetworkImage(
                      imageUrl: Util.giftImgUrl(_combineGift?.giftB ?? 0),
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover),
                  const SizedBox(width: 2),
                  Text(
                    _combineGift?.giftBName ?? '',
                    style: TextStyle(
                        color: R.color.unionRankText1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'x${_combineGift?.giftBNum ?? 0}',
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.5),
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 14),
              child: Container(
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF6F7F9),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 16, end: 12),
                      child: Text(
                        K.give_something,
                        style: TextStyle(
                            color: R.color.unionRankText1.withOpacity(0.6),
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: Util.parseInt(_positions.length),
                        itemBuilder: (context, index) {
                          return _buildAvatarItem(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          // 单点 全麦
          // 礼物组合类型，0-可切换，1-固定单点，2-固定全麦
          if (Util.parseInt(widget.combineType) == 0 &&
              Util.validList(_positions))
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 18),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (Util.parseBool(_data?.hasSingleCombine())) ...[
                    GestureDetector(
                      onTap: () {
                        _combineGift = _data?.singleCombine;
                        _handleData();
                        _singleMicSelected = true;
                        _allMicSelected = false;
                        refresh();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img(
                              _singleMicSelected
                                  ? RoomAssets.ic_checkbox_checked_svg
                                  : RoomAssets.ic_checkbox_unchecked_webp,
                              package: ComponentManager.MANAGER_BASE_ROOM,
                              width: 24,
                              height: 24),
                          const SizedBox(width: 2),
                          Text(
                            K.gift_one_mic,
                            style: TextStyle(
                                color: R.color.mainTextColor.withOpacity(0.4),
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 36),
                  ],
                  if (Util.parseBool(_data?.hasAllCombine()))
                    GestureDetector(
                      onTap: () {
                        _combineGift = _data?.allCombine;
                        _handleData();
                        _singleMicSelected = false;
                        _allMicSelected = true;
                        refresh();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img(
                              _allMicSelected
                                  ? RoomAssets.ic_checkbox_checked_svg
                                  : RoomAssets.ic_checkbox_unchecked_webp,
                              package: ComponentManager.MANAGER_BASE_ROOM,
                              width: 24,
                              height: 24),
                          const SizedBox(width: 2),
                          Text(
                            K.gift_all_mic,
                            style: TextStyle(
                                color: R.color.mainTextColor.withOpacity(0.4),
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

          // 总价
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 18),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.gift_total_price,
                  style: TextStyle(
                      color: R.color.mainTextColor.withOpacity(0.5),
                      fontSize: 13),
                ),
                const SizedBox(width: 4),
                Image.asset(MoneyConfig.moneyIcon, width: 19, height: 16),
                const SizedBox(width: 2),
                Text(
                  MoneyConfig.moneyNum(
                      Util.parseInt(_totalMoneyA + _totalMoneyB)),
                  style: TextStyle(
                    color: R.color.mainBrandColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // 取消 + 确定
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 24),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 48,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Text(
                        K.gift_cancel,
                        style: TextStyle(
                            color: R.color.unionRankText1.withOpacity(0.7),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: onBuy,
                    child: Container(
                      height: 48,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors,
                          )),
                      child: Text(
                        K.gift_confirm,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  /// 构建房主或接待头像
  Widget _buildCreatorOrReceptionAvatar(
      {required String icon, required String name}) {
    return SizedBox(
      width: 32,
      height: 38,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: CommonAvatar(path: icon, size: 32, shape: BoxShape.circle),
          ),
          PositionedDirectional(
            start: 3,
            end: 3,
            bottom: 0,
            child: Container(
              width: 26,
              height: 12,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    colors: R.color.mainBrandGradientColors,
                  )),
              child: Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建麦上用户头像
  Widget _buildAvatarItem({required int index}) {
    CombineGiftRoomPositionWrapper item = _positions[index];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            // 单点
            if (_singleMicSelected) {
              for (CombineGiftRoomPositionWrapper item in _positions) {
                item.selected = false;
              }
              item.selected = true;
              _totalMoneyB = Util.parseInt(_combineGift?.giftBPrice) *
                  Util.parseInt(_combineGift?.giftBNum);
            }

            // 全麦
            if (_allMicSelected) {
              item.selected = !item.selected;
              if (item.selected) {
                _totalMoneyB += Util.parseInt(_combineGift?.giftBPrice) *
                    Util.parseInt(_combineGift?.giftBNum);
              } else {
                _totalMoneyB -= Util.parseInt(_combineGift?.giftBPrice) *
                    Util.parseInt(_combineGift?.giftBNum);
              }
            }
            refresh();
          },
          child: SizedBox(
            width: 32,
            height: 32,
            child: Stack(
              children: [
                CommonAvatar(
                    path: item.position.icon, size: 32, shape: BoxShape.circle),
                if (item.selected)
                  PositionedDirectional(
                    end: 0,
                    bottom: 0,
                    child: R.img(RoomAssets.ic_checkbox_checked_svg,
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        width: 13,
                        height: 13),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  /// 购买逻辑
  void onBuy() async {
    if (_isPaying) {
      return;
    }

    int money = _totalMoneyA + _totalMoneyB;
    if (money <= 0) {
      Fluttertoast.showCenter(msg: K.gift_please_input_give_people);
      return;
    }

    if (_totalMoneyB <= 0) {
      Fluttertoast.showCenter(msg: K.gift_please_input_give_people);
      return;
    }

    SheetCallback? result = await _payManager.showRechargeSheet(context, money);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    String? type = result.value?.key;

    String uidCombine = '';
    if (Util.validList(_positions)) {
      List<CombineGiftRoomPositionWrapper> positions = List.from(_positions);
      positions.retainWhere(
          (element) => element.position.uid > 0 && element.selected);
      for (int i = 0; i < positions.length; i++) {
        CombineGiftRoomPositionWrapper item = positions[i];
        uidCombine += '${item.position.uid}';
        if (i != positions.length - 1) {
          uidCombine += ',';
        }
      }
    }

    _isPaying = true;
    _payManager.pay(
      System.context,
      key: 'gift',
      type: type ?? '',
      refer: 'gift',
      args: {
        'money': money,
        'type': 'slp-consume',
        'params': {
          'consume_type': 'gift_combine',
          'rid': widget.room.rid,
          'combine_id': widget.combineId,
          'combine_type': _allMicSelected ? 2 : 1,
          if (_hasCreator)
            'pay_creator': {
              'gift_id': Util.parseInt(_combineGift?.giftA),
              'gift_num': Util.parseInt(_combineGift?.giftANum),
              'uid': '${Util.parseInt(widget.room.createor?.uid)}',
            },
          if (_hasReception)
            'pay_receptor': {
              'gift_id': Util.parseInt(_combineGift?.giftA),
              'gift_num': Util.parseInt(_combineGift?.giftANum),
              'uid': '${Util.parseInt(widget.room.positions[0].uid)}',
            },
          if (Util.validStr(uidCombine))
            'pay_gs': {
              'gift_id': Util.parseInt(_combineGift?.giftB),
              'gift_num': Util.parseInt(_combineGift?.giftBNum),
              'uid': uidCombine,
            }
        }
      },
      showLoading: (type != IPayManager.pTAvailable),
      onPayed: () => _onPayed(),
      onError: (isErrorCatch) => _onPayError(isErrorCatch),
    );
  }

  void _onPayed() async {
    _isPaying = false;
    Navigator.of(context).pop();
    Fluttertoast.showToast(
        msg: R.string('reward_suc'), gravity: ToastGravity.BOTTOM);
    eventCenter.emit("Gift.SendSuccess");
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }
}
