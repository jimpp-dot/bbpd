import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:shared/shared.dart';

import '../model/pb/generated/common_roomticket.pb.dart';
import '../model/pb/room_ticket_repo.dart';

/// 房间门票设置页面
///
class RoomModifyTicketScreen extends StatefulWidget {
  final int rid;

  const RoomModifyTicketScreen(this.rid, {Key? key}) : super(key: key);

  @override
  State<RoomModifyTicketScreen> createState() => _RoomModifyTicketScreenState();

  static Future show(BuildContext context, int rid) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoomModifyTicketScreen(rid),
        settings: const RouteSettings(name: '/RoomModifyTicketScreen'),
      ),
    );
  }
}

class _RoomModifyTicketScreenState extends State<RoomModifyTicketScreen> {
  final ValueNotifier<bool> _switchController = ValueNotifier<bool>(false);
  final IGiftManager _giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

  /// 是否设置进房门票，默认为false
  bool _isOpenEnterRoomSwitch = false;

  /// 当前房间选中的礼物ID
  int _selectGiftId = 0;

  /// 记录更换的礼物ID
  int _giftId = 0;

  @override
  void initState() {
    super.initState();
    _switchController.addListener(
      () async {
        refresh(() {
          _isOpenEnterRoomSwitch = _switchController.value;
        });
        Tracker.instance.track(
          TrackEvent.click,
          properties: {'click_page': 'click_roomtickets_setup', 'on': _switchController.value ? 1 : 0},
        );
      },
    );
    _loadData();
  }

  void _loadData() async {
    ResRoomTicketConfig resp = await RoomTicketRepo.getTicket(widget.rid);
    if (resp.success && resp.hasData() && Util.parseInt(resp.data.giftId) > 0) {
      _selectGiftId = resp.data.giftId;
      _switchController.value = true;
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.room_ticket_set,
          style: TextStyle(color: R.color.mainTextColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 72,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                K.room_set_enter_room_titck_title,
                                style: TextStyle(color: R.color.unionRankText1, fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                K.room_open_enter_room_give_gift,
                                style: TextStyle(color: R.color.unionRankText1.withOpacity(0.4), fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        AdvancedSwitch(
                          activeColor: R.color.mainBrandColor,
                          inactiveColor: Colors.grey.withOpacity(0.2),
                          thumb: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: Colors.white),
                          ),
                          width: 46,
                          height: 28,
                          controller: _switchController,
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black.withOpacity(0.1), height: 1),
                  if (_isOpenEnterRoomSwitch)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 24, bottom: 16),
                      child: Text(
                        K.room_ticket_gift_select,
                        style: TextStyle(color: R.color.unionRankText1, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  _giftManager.getEnterRoomTicketGiftWidget(
                    context,
                    open: _isOpenEnterRoomSwitch,
                    selectGiftId: _selectGiftId,
                    onGiftItemTap: (int giftId) {
                      _giftId = giftId;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () async {
                  NormalNull resp = await RoomTicketRepo.setTicket(widget.rid, _isOpenEnterRoomSwitch ? _giftId : 0);
                  if (resp.success) {
                    Fluttertoast.showCenter(msg: K.room_set_success);
                    if (mounted) Navigator.of(context).pop();
                  } else if (Util.validStr(resp.msg)) {
                    Fluttertoast.showCenter(msg: resp.msg);
                  }
                  Tracker.instance.track(
                    TrackEvent.click,
                    properties: {'click_page': 'click_roomtickets_okbt', 'rid': widget.rid, 'giftId': _giftId},
                  );
                },
                child: Container(
                  height: 52,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.0),
                    gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
                  ),
                  child: Text(
                    K.room_confirm,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
