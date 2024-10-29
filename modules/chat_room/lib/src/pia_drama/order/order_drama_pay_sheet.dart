import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../chat_room.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';

/// pia戏点本支付
class OrderDramaPaySheet extends StatefulWidget {
  final PiaJuBen juben;
  final RoomPosition? reception;
  final RoomPosition? creator;
  final List<RoomPosition> gsList;
  final ChatRoomData room;

  const OrderDramaPaySheet({
    Key? key,
    required this.juben,
    this.reception,
    this.creator,
    required this.gsList,
    required this.room,
  }) : super(key: key);

  @override
  OrderDramaPayState createState() {
    return OrderDramaPayState();
  }

  static Future<bool?> show(
    BuildContext context, {
    required PiaJuBen juben,
    RoomPosition? reception,
    RoomPosition? creator,
    required List<RoomPosition> gsList,
    required ChatRoomData room,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      settings: const RouteSettings(name: '/order_drama_pay'),
      builder: (BuildContext context) {
        return OrderDramaPaySheet(
          juben: juben,
          reception: reception,
          creator: creator,
          gsList: gsList,
          room: room,
        );
      },
    );
  }
}

class OrderDramaPayState extends State<OrderDramaPaySheet> {
  List<RoomPosition> selectGs = [];

  late IPayManager _payManager;

  @override
  void initState() {
    super.initState();
    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    if (widget.juben.type == PiaJuBenType.PiaJuBenTypeSingle) {
      selectGs.add(widget.gsList[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            height: 550,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xB26968FF), Color(0xB29274FF)],
              ),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBar(),
                if (widget.juben.type == PiaJuBenType.PiaJuBenTypeMulti)
                  _buildGsList(),
                Expanded(
                  child: _buildBody(),
                ),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 44,
      margin: const EdgeInsetsDirectional.only(top: 10),
      child: BaseAppBar.custom(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.juben.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backColor: Colors.white.withOpacity(0.6),
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        _buildFeeTitle(K.room_order_drama_gs_fee),
        ..._buildGsFee(),
        if (widget.reception != null) ...[
          _buildFeeTitle(K.room_order_drama_reception_fee),
          _buildFeeItem(
            widget.juben.payRecepition,
            widget.reception!,
          ),
        ],
        if (widget.creator != null) ...[
          _buildFeeTitle(K.room_order_drama_room_owner_fee),
          _buildFeeItem(
            widget.juben.payCreator,
            widget.creator!,
          ),
        ],
      ],
    );
  }

  List<Widget> _buildGsFee() {
    List<Widget> fee = [];

    if (widget.juben.type == PiaJuBenType.PiaJuBenTypeSingle) {
      fee.add(_buildFeeItem(
        widget.juben.payGs,
        widget.gsList[0],
      ));
    } else {
      for (RoomPosition pos in selectGs) {
        fee.add(_buildFeeItem(
          widget.juben.payGs,
          pos,
        ));
      }
    }

    return fee;
  }

  Widget _buildFeeTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(top: 12, start: 16, bottom: 8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildFeeItem(PiaJuBenPayNeed need, RoomPosition pos) {
    return SliverToBoxAdapter(
      child: Container(
        width: Util.width - 32,
        height: 80,
        margin: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 4, bottom: 4),
        padding: const EdgeInsetsDirectional.only(start: 14, end: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(8),
          color: Colors.white10,
          border: Border.all(color: const Color(0x33F6F7F9), width: 0.5),
        ),
        child: Row(
          children: [
            CommonAvatar(
              path: pos.icon,
              size: 52,
              shape: BoxShape.circle,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pos.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      UserSexAndAgeWidget(
                        sex: pos.sex == Sex.Male ? 1 : 2,
                        age: pos.age,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      UserNobilityWidget(
                        titleNew: pos.titleNew,
                        height: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CachedNetworkImage(
                  imageUrl: Util.giftIcon(need.giftIcon),
                  width: 60,
                  height: 60,
                ),
                if (need.giftNum > 1)
                  PositionedDirectional(
                    top: 2,
                    end: -2,
                    child: Container(
                      height: 16,
                      padding:
                          const EdgeInsetsDirectional.only(start: 3, end: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(9),
                        color: const Color(0xFFFF5F7D),
                      ),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'x${need.giftNum}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(MoneyConfig.moneyIcon, width: 20, height: 20),
            Text(
              MoneyConfig.moneyNum(need.giftNum * need.giftPrice),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGsList() {
    return Container(
      width: Util.width,
      height: 44,
      margin: const EdgeInsetsDirectional.only(top: 18, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(start: 20),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: _buildGs(index, widget.gsList[index]),
                );
              },
              itemCount: widget.gsList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                bool hasSelectAll = selectGs.length == widget.gsList.length;
                selectGs.clear();
                if (!hasSelectAll) {
                  selectGs.addAll(widget.gsList);
                }
              });
            },
            child: Container(
              width: 52,
              height: 30,
              margin: const EdgeInsetsDirectional.only(start: 6, end: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                widget.gsList.length == selectGs.length
                    ? K.cancel
                    : K.room_select_all,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGs(int index, RoomPosition pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectGs.contains(pos)) {
            selectGs.remove(pos);
          } else {
            selectGs.add(pos);
          }
        });
      },
      child: selectGs.contains(pos)
          ? Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: R.color.mainBrandColor, width: 1),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: CommonAvatar(
                    path: pos.icon,
                    size: 38,
                    shape: BoxShape.circle,
                  ),
                ),
                PositionedDirectional(
                  top: 28,
                  start: 12,
                  child: R.img(
                    'ic_checkbox_checked.svg',
                    width: 16,
                    height: 16,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 4),
              child: CommonAvatar(
                path: pos.icon,
                size: 40,
                shape: BoxShape.circle,
              ),
            ),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: () {
        order();
      },
      child: Container(
        width: Util.width - 40,
        height: 52,
        margin: EdgeInsetsDirectional.only(
            start: 20,
            end: 20,
            top: 10,
            bottom: Util.isIphoneX ? Util.iphoneXBottom : 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(26),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          '${K.room_order_drama_pay}${getMoneyStr()}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  int getTotalMoney() {
    int money = 0;
    if (Util.parseInt(widget.creator?.uid) > 0) {
      money +=
          (widget.juben.payCreator.giftPrice * widget.juben.payCreator.giftNum);
    }
    if (Util.parseInt(widget.reception?.uid) > 0) {
      money += (widget.juben.payRecepition.giftPrice *
          widget.juben.payRecepition.giftNum);
    }

    if (widget.juben.type == PiaJuBenType.PiaJuBenTypeSingle) {
      money += (widget.juben.payGs.giftPrice * widget.juben.payGs.giftNum);
    } else {
      /// 多人本，根据选择Gs个数
      money += (widget.juben.payGs.giftPrice *
          widget.juben.payGs.giftNum *
          selectGs.length);
    }

    return money;
  }

  String getMoneyStr() {
    return MoneyConfig.moneyNum(getTotalMoney()) + MoneyConfig.moneyName;
  }

  void order() async {
    if (widget.juben.type == PiaJuBenType.PiaJuBenTypeMulti &&
        !Util.validList(selectGs)) {
      Fluttertoast.showCenter(msg: K.room_select_empty_gs);
      return;
    }

    _displayPay();
  }

  _displayPay() async {
    if (_isPaying) return;
    _isPaying = true;

    SheetCallback? result =
        await _payManager.showRechargeSheet(context, getTotalMoney());
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      _isPaying = false;
      return;
    }

    _pay(result.value?.key);
  }

  bool _isPaying = false;

  void _pay(String? type) {
    String gsUis = '';
    for (RoomPosition pos in selectGs) {
      gsUis = '$gsUis${pos.uid},';
    }

    gsUis = gsUis.substring(0, gsUis.length - 1);

    _payManager.pay(context,
        key: 'gift',
        type: type ?? '',
        args: {
          'money': getTotalMoney(),
          'type': 'slp-consume',
          'params': {
            'consume_type': 'piadrama_juben',
            'rid': widget.room.rid,
            'jid': widget.juben.jid,
            'type':
                widget.juben.type == PiaJuBenType.PiaJuBenTypeSingle ? 1 : 2,
            'pay_receptor': {
              'gift_id': widget.juben.payRecepition.giftId,
              'gift_num': widget.juben.payRecepition.giftNum,
              'uid': '${widget.reception?.uid ?? 0}',
            },
            'pay_creator': {
              'gift_id': widget.juben.payCreator.giftId,
              'gift_num': widget.juben.payCreator.giftNum,
              'uid': '${widget.creator?.uid ?? 0}',
            },
            'pay_gs': {
              'gift_id': widget.juben.payGs.giftId,
              'gift_num': widget.juben.payGs.giftNum,
              'uid': gsUis,
            },
          }
        },
        showLoading: (type != IPayManager.pTAvailable),
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _isPaying = false;

    Fluttertoast.showCenter(msg: K.room_order_drama_succ);

    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }
}
