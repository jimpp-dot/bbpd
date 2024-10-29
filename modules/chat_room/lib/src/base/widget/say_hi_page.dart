import 'dart:async';
import 'dart:convert';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/public_screen_enhancement_model.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SayHiPage extends StatefulWidget {
  final ChatRoomData room;

  @override
  _SayHiPageState createState() => _SayHiPageState();

  const SayHiPage({
    super.key,
    required this.room,
  });
}

class _SayHiPageState extends State<SayHiPage> {
  bool _display = false;
  List<String> _sayHiArray = []; //自己打招呼的短语
  int _cid = 0; //用于数据上报
  @override
  void initState() {
    super.initState();
    _loadSayHiData();
  }

  void _loadSayHiData() {
    /// 快捷招呼
    if (widget.room.limitTimes != null) {
      int hiTime = widget.room.limitTimes?.hi ?? 0;
      int curTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      // 如果点击过关闭这功能，之后就不会弹出
      int res = Config.getInt('room.sayHi.click', 0);

      if (curTime < hiTime && res == 0) {
        _loadSayHi();
      }
    }
  }

  /// 快捷打招呼
  void _loadSayHi() async {
    PublicScreenEnhancementModel? model = await RoomRepository.loadPublicScreenEnhancement(widget.room.rid, 'hi');

    Tracker.instance.track(TrackEvent.room_public_guide_show, properties: {
      'type': 'say_hi',
      'groups': _cid,
    });
    if (model != null && mounted) {
      _cid = model.data?.cid ?? 0;

      setState(() {
        _display = true;
        _sayHiArray = model.data?.content ?? [];
        Log.d('controller_load sayHiArray = $_sayHiArray');
        Timer(const Duration(seconds: 10), () {
          _closeSayHiBtn();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (_display == false || _sayHiArray.isEmpty) {
      return Container();
    }

    return SizedBox(
      height: 28,
      width: MediaQuery.of(context).size.width, //-22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: ListView.builder(
                itemCount: _sayHiArray.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => clickSayHi(_sayHiArray[index]),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black.withOpacity(0.2),
                      ),
                      margin: const EdgeInsetsDirectional.only(start: 3, end: 3),
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        height: 28.0,
                        margin: const EdgeInsetsDirectional.only(start: 8),
                        child: Text(
                          _sayHiArray[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const Spacer(),
          GestureDetector(
            onTap: clickCloseSayHi,
            child: Container(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: R.img(
                'room_say_hi_close.webp',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 关闭sayhi
  _closeSayHiBtn() {
    Log.d('controller _closeSayHiBtn');
    if (mounted) {
      setState(() {
        _display = false;
      });
    }
  }

  /// 点击关闭按钮
  void clickCloseSayHi() {
    Tracker.instance.track(TrackEvent.say_hi_close, properties: {});
    Config.set('room.sayHi.click', '1');
    clickSayHi('');
  }

  ///点击打招呼的某些文字
  void clickSayHi(String str) {
    if (str.isNotEmpty) {
      _onSubmitted(str);

      Tracker.instance.track(TrackEvent.room_public_guide_click, properties: {
        'type': 'say_hi',
        'content': str,
        'groups': _cid,
      });
    }

    if (mounted) {
      setState(() {
        _display = false;
      });
    }
    _closeSayHiBtn();
  }

  _onSubmitted(String value) async {
    if (value.isEmpty) return;
    try {
      int isGuess = 0;
      if (widget.room.config?.game == Games.Guess) {
        IDrawGuessManager? drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        if (drawGuessManager != null) {
          if (drawGuessManager.isDrawing()) {
            isGuess = 1;
          }
        }
      }

      DataRsp dataRsp = await widget.room.sendMessage(
          value,
          json.encode({
            'vip': Session.vip,
            'vip_new': Session.vipNew,
            'title': Session.title,
            'title_new': Session.titleNew,
            'defends': widget.room.defend,
            'is_guess': isGuess,
            'position': widget.room.positionForCurrentUser?.position ?? -1,
            'is_live': widget.room.config?.types == RoomTypes.Live ? 1 : 0,
            'live_uid': widget.room.createor?.uid ?? 0,
            'live_label': widget.room.config?.liveDataV3?.fansLabel ?? '',
          }));

      if (dataRsp.success) {
        Tracker.instance.track(TrackEvent.room_public_chat, properties: {
          'rid': widget.room.rid,
          'msg_type': 'text',
          if (!Util.isNullOrEmpty(widget.room.config?.typeName)) 'type_label': widget.room.config?.typeName,
          if (!Util.isNullOrEmpty(widget.room.config?.originalRFT)) 'room_factory_type': widget.room.config?.originalRFT,
          if (!Util.isNullOrEmpty(widget.room.config?.settlementChannel)) 'settlement_channel': widget.room.config?.settlementChannel,
        });
      } else if (dataRsp.msg?.isNotEmpty == true) {
        Fluttertoast.showCenter(msg: dataRsp.msg);
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }
}
