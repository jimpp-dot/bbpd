import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as baseK;
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/base/model/roomRepository.dart';
import '../../chatRoomData.dart';
import 'mic_up_wait_list.dart';

class _DefendConfig {
  final String name;
  final int type;
  final int money;
  final String display;
  int duction_money = 0;
  int ext_id = 0;
  int id = 0;
  int num = 0;
  String ctype = '';
  int only_newpay = 0;
  int state = 0;
  int period = 0;

  _DefendConfig(
      {required this.name,
      required this.type,
      required this.money,
      required this.display});
}

class DefendBuyPanel extends StatefulWidget {
  final int? to;
  final String? toName;
  final int? type;
  final List? config;
  final ChatRoomData? room;

  const DefendBuyPanel({
    super.key,
    this.room,
    this.type,
    this.to,
    this.toName,
    this.config,
  });

  @override
  State createState() => _DefendBuyPanelState();
}

class _DefendBuyPanelState extends State<DefendBuyPanel> {
  final List<List<Color>> tabBgColors = const [
    [Color(0xFFF3BB3B), Color(0xFFFFEB9F)],
    [Color(0xFF6A66B1), Color(0xFFD2EAFF)],
    [Color(0xFFE59F5E), Color(0xFFFFEBE0)]
  ];
  final List<Color> tabTextColors = const [
    Color(0xFFAA6C00),
    Color(0xFF5D5DA7),
    Color(0xFFAA692F)
  ];

  late int _type;
  late List<_DefendConfig> _config;
  bool _tryDefendUseAvailable = false;
  int _money = 0;
  int _duction_money = 0;
  int _cid = 0;
  bool _disposed = false;
  int _only_newpay = 0;
  int _state = 0;
  bool _isFirst = false;

  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  @override
  void initState() {
    _type = widget.type ?? 0;
    _config = [
      _DefendConfig(
        name: K.room_gold,
        type: 1,
        money: 52000,
        display: '520',
      ),
      _DefendConfig(
        name: K.room_silver,
        type: 2,
        money: 5200,
        display: '52',
      ),
      _DefendConfig(
        name: K.room_brass,
        type: 3,
        money: 520,
        display: '5.2',
      ),
    ];

    Map? config;
    try {
      config = widget.config?.firstWhereOrNull(
        (val) => val['position'] == _type,
      );
    } catch (e) {}
    _isFirst = (config == null);

    _load();
    super.initState();
  }

  @override
  void dispose() {
    _disposed = true;
    _payManager.dispose('package');
    _payManager.dispose('defend');
    super.dispose();
  }

  void _load() async {
    try {
      String url = '${System.domain}profile/commoditiesnum';
      XhrResponse response =
          await Xhr.postJson(url, {"type": 'radio-defend'}, throwOnError: true);
      Map res = response.response as Map;
      if (res['data'] != null) {
        Map commodities = res['data'];
        for (var val in _config) {
          var tmp = commodities[val.type.toString()];
          if (tmp != null) {
            val.duction_money = Util.parseInt(tmp['duction_money']);

            val.id = Util.parseInt(tmp['id']);
            val.ext_id = Util.parseInt(tmp['ext_id']);
            val.num = Util.parseInt(tmp['num']);
            val.ctype = tmp['type'];
            val.only_newpay = Util.parseInt(tmp['only_newpay']);
            val.state = Util.parseInt(tmp['state']);
            val.period = Util.parseInt(tmp['period']);
          }
        }
      }
      refresh();
    } catch (e) {}
  }

  _pay() async {
    _DefendConfig config = _config[_type - 1];

    Map<int, int> map = {
      1: 52000,
      2: 5200,
      3: 520,
    };
    _money = map[_type] ?? 0;
    _duction_money = config.duction_money;
    _cid = config.id;
    _only_newpay = config.only_newpay;
    _state = config.state;

    if (config.id > 0) {
      _tryDefendUseAvailable = true;

      _payManager.pay(context,
          key: 'package',
          type: 'available',
          args: {
            'money': _money,
            'type': 'package',
            'params': {
              'price': _money,
              'rid': widget.room?.rid ?? 0,
              'uids': [widget.to].join(','),
              'positions': [0].join(','),
              'defend': _type,
              'cid': _cid.toString(),
              'duction_money': _duction_money.toString(),
              'refer': '${widget.room?.refer}:room'
            }
          },
          onPayed: _onPayed,
          onError: _onPayError);
    } else {
      _displayPayDefend();
    }
  }

  _displayPayDefend() async {
    SheetCallback? result =
        await _payManager.showRechargeSheet(context, _money - _duction_money);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    if (result.value?.key == 'available' && _only_newpay > 0 && _state <= 0) {
      Toast.showCenter(context, K.room_coupn_use_notice);
      return;
    }

    _payManager.pay(context,
        key: 'defend',
        type: result.value!.key,
        args: {
          'money': _money,
          'type': 'package',
          'params': {
            'price': _money,
            'rid': widget.room?.rid ?? 0,
            'uids': [widget.to].join(','),
            'positions': [0].join(','),
            'defend': _type,
            'cid': _cid.toString(),
            'duction_money': _duction_money.toString(),
            'refer': '${widget.room?.refer}:room'
          }
        },
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    Fluttertoast.showToast(
        msg: K.room_open_success, gravity: ToastGravity.CENTER);
  }

  void _onPayError(bool isErrorCatch) {
    if (_disposed) return;
    if (_tryDefendUseAvailable == true) {
      _tryDefendUseAvailable = false;
      _displayPayDefend();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(16), topEnd: Radius.circular(16))
            .resolve(TextDirection.ltr),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            width: Util.width,
            padding: EdgeInsetsDirectional.only(
                start: 20, end: 20, bottom: Util.iphoneXBottom),
            color: const Color(0xFF171621).withOpacity(0.7),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 8),
        _buildTitle(),
        const SizedBox(height: 14),
        _buildDefendTab(),
        const SizedBox(height: 18),
        _buildDefendPermissionTitle(),
        _buildDefendPermissionContent(),
        const SizedBox(height: 18),
        _buildBottom(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 44.0,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.room_defend_open,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 260,
            ),
            child: Text(
              ' ${widget.room?.config?.name}.${widget.toName} ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            K.room_defend_text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefendTab() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDefendTabItem(0),
          const SizedBox(width: 8),
          _buildDefendTabItem(1),
          const SizedBox(width: 8),
          _buildDefendTabItem(2),
        ],
      ),
    );
  }

  Widget _buildDefendTabItem(int index) {
    _DefendConfig item = _config[index];
    double tabWidth = (Util.width - 20 * 2 - 8 * 2) / 3.0;
    double tabHeight = (tabWidth * 252) / 318.0;
    bool selected = (item.type == _type);
    return InkWell(
      onTap: () {
        _type = item.type;
        refresh();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: tabWidth,
            height: tabHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: tabBgColors[index],
              ),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: Colors.white.withOpacity(0.5), width: 1),
            ),
            foregroundDecoration: BoxDecoration(
              color:
                  selected ? Colors.transparent : Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: R.img(
                    'defend/ic_defend_bg.webp',
                    width: tabWidth,
                    height: tabHeight,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: R.img(
                    'defend/ic_defend_icon_${index + 1}.webp',
                    width: tabWidth,
                    height: tabHeight,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: tabTextColors[index],
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: -2,
            top: -2,
            child: _buildDefendTabNum(item),
          ),
        ],
      ),
    );
  }

  Widget _buildDefendTabNum(_DefendConfig config) {
    if (Util.isVerify) return const SizedBox.shrink();

    String num = config.num > 99 ? '99+' : config.num.toString();
    if (config.id > 0 && config.ctype == 'radio-defend') {
      return Container(
        width: 28,
        height: 16,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [Color(0xFFEC96BA), Color(0xFFFF3766)],
          ),
          shape: StadiumBorder(),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          num,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else if (config.id > 0 && config.ctype == 'coupon') {
      return Container(
        width: 28,
        height: 16,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              RoomAssets.chat_room$defend_ic_defend_coupon_bg_webp,
            ),
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          num,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildDefendPermissionTitle() {
    return Container(
      height: 40,
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 35,
            height: 1,
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x001C1C1E), Color(0x80F4D49C)]),
              shape: StadiumBorder(),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            K.room_defend_permission_title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 35,
            height: 1,
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x80F4D49C), Color(0x001C1C1E)]),
              shape: StadiumBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefendPermissionContent() {
    _DefendConfig item = _config[_type - 1];
    return Container(
      height: 96,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF313131).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                'radio_buy_icon_${item.type}.png',
                width: 48,
                height: 48,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
              const SizedBox(height: 4),
              Text(
                K.room_protect_someone([(item.name)]),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.all(4),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: const Color(0x1AD8D8D8),
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: R.img(
                  'defend_${item.type}.png',
                  width: 24,
                  height: 24,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                K.room_protect_medal,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    _DefendConfig item = _config[_type - 1];

    String btnStr = _isFirst ? K.room_open_now : K.room_renewal_protect;
    String priceStr = Util.isVerify
        ? "${MoneyConfig.moneyNum(Util.parseInt(Util.parseDouble(item.display) * 100))}${MoneyConfig.moneyName}"
        : "${MoneyConfig.moneyNum(Util.parseInt(Util.parseDouble(item.display) * 100))}${MoneyConfig.moneyName}/7${baseK.K.base_day}";
    bool lineThrough = false;
    if (item.id > 0 && item.num > 0 && item.ctype == 'coupon') {
      btnStr = Util.isVerify
          ? "${MoneyConfig.moneyNum(Util.parseInt(Util.parseDouble(item.display) * 100) - Util.parseInt(item.duction_money))}${MoneyConfig.moneyName}"
          : "${MoneyConfig.moneyNum(Util.parseInt(Util.parseDouble(item.display) * 100) - Util.parseInt(item.duction_money))}${MoneyConfig.moneyName}/7${baseK.K.base_day}";
      lineThrough = true;
    } else if (item.id > 0 && item.num > 0 && item.ctype == 'radio-defend') {
      String text = item.period > 0
          ? K.room_protect_free_experience(['${item.period * 24}'])
          : '';
      if (text.isNotEmpty) {
        btnStr = text;
      } else {
        btnStr =
            _isFirst ? K.room_open_now_by_prop : K.room_renewal_protect_by_prop;
      }
      lineThrough = true;
    }

    return SizedBox(
      width: double.infinity,
      height: 62,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _buildButton(btnStr),
          PositionedDirectional(
            end: 0,
            top: 0,
            child: _buildPrice(priceStr, lineThrough),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return InkWell(
      onTap: _pay,
      child: Container(
        width: double.infinity,
        height: 52,
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
          shape: const StadiumBorder(),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPrice(String text, bool lineThrough) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFFFA7845), Color(0xFFFF638C)]),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10),
          topEnd: Radius.circular(10),
          bottomStart: Radius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          decoration: lineThrough ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}

displayDefendTypes(BuildContext context, int to, String name, List config,
    ChatRoomData room) async {
  Map<int, Map> map = {};
  for (var value in config) {
    Map val = value;
    int position = Util.parseInt(val['position']);
    map[position] = val;
  }
  List<SheetItem> res = [];
  res.add(SheetItem(K.room_protect_brass, "defend", 3));
  res.add(SheetItem(K.room_protect_silver, "defend", 2));
  res.add(SheetItem(K.room_protect_gold, "defend", 1));

  SheetCallback? result = await displayModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return RadioBottomSheet(
            title: K.room_protect_type,
            data: res,
            render: (BuildContext context, SheetItem? item, int index,
                {VoidCallback? callback}) {
              Map? has = item != null && map.containsKey(item.extra)
                  ? map[item.extra]
                  : null;
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  //color: Colors.white.withOpacity(0.9),
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).dividerColor, width: 0.0)),
                ),
                child: has == null
                    ? Text(
                        item?.label ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.lightBlue, fontSize: 16.0),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            item?.label ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.lightBlue, fontSize: 16.0),
                          ),
                          Container(
                            height: 16.0,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                              left: 6.0,
                            ),
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: const BoxDecoration(
                                color: Color(0xFFff4562),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              has['diff'],
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          )
                        ],
                      ),
              );
            });
      });
  if (result == null || result.reason == SheetCloseReason.Active) {
    return;
  }
  int type = result.value?.extra;
  Map? value = map.containsKey(type) ? map[type] : null;
  if (value == null) {
    //需要购买
    displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DefendBuyPanel(
            room: room,
            to: to,
            toName: name,
            type: type,
            config: config,
          );
        });
  } else {
    if (room.config?.mode == RoomMode.Auto) {
      //自由上麦
      int position = -1;
      if (type == 1 || type == 2) {
        if (room.positions[type].uid == 0) position = type;
      } else {
        if (room.positions[3].uid == 0) {
          position = 3;
        } else if (room.positions[4].uid == 0) {
          position = 4;
        }
      }
      if (position > -1) {
        //可以上麦, 付费上麦暂不做认证
        RoomRepository.joinMic(room.rid, position, needCertify: false);
      } else {
        Fluttertoast.showToast(
            msg: K.room_protect_full_notice, gravity: ToastGravity.CENTER);
      }
    } else {
      //可以排麦, 付费上麦暂不做认证
      await RoomRepository.queue(room.rid, RoomConstant.Queue_Join,
          boss: false, needCertify: false);
      displayWaitList(context, room, false, false);
    }
  }
}

displayWaitList(BuildContext context, ChatRoomData room,
    [bool boss = false, bool isAuction = false, bool admin = false]) {
  MicUpWaitList.show(
      context: context,
      builder: (BuildContext context) {
        return MicUpWaitList(
          room: room,
          isBoss: boss,
          isAuction: isAuction,
          admin: admin,
        );
      });
}

class SquircleBorder extends ShapeBorder {
  final BorderSide side;
  final double? radius;

  const SquircleBorder({
    this.side = BorderSide.none,
    this.radius,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SquircleBorder(
      side: side.scale(t),
      radius: radius,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _squirclePath(rect.deflate(side.width), radius);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _squirclePath(rect, radius);
  }

  static Path _squirclePath(Rect rect, double? radius) {
    final c = rect.center;
    double startX = rect.left;
    double endX = rect.right;
    double startY = rect.top;
    double endY = rect.bottom;

    double midX = c.dx;
    double midY = c.dy;

    if (radius == null) {
      return Path()
        ..moveTo(startX, midY)
        ..cubicTo(startX, startY, startX, startY, midX, startY)
        ..cubicTo(endX, startY, endX, startY, endX, midY)
        ..cubicTo(endX, endY, endX, endY, midX, endY)
        ..cubicTo(startX, endY, startX, endY, startX, midY)
        ..close();
    }

    return Path()

      // Start position
      ..moveTo(startX, startY + radius)

      // top left corner
      ..cubicTo(
        startX,
        startY,
        startX,
        startY,
        startX + radius,
        startY,
      )

      // top line
      ..lineTo(endX - radius, startY)

      // top right corner
      ..cubicTo(
        endX,
        startY,
        endX,
        startY,
        endX,
        startY + radius,
      )

      // right line
      ..lineTo(endX, endY)

      // bottom right corner
      //	..cubicTo(endX, endY, endX, endY, endX - radius, endY,)

      // bottom line
      ..lineTo(startX, endY)

      // bottom left corner
      //	..cubicTo(startX, endY, startX, endY, startX, endY - radius,)

      // left line
      ..moveTo(startX, startY)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        var path = getOuterPath(rect.deflate(side.width),
            textDirection: textDirection);
        canvas.drawPath(path, side.toPaint());
    }
  }
}
