import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/fansLabel.dart';
import 'package:chat_room/src/fans/fans_lable_pannel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/pb/quick_reply_repo.dart';
import '../room_chat_quick_reply_screen.dart';
import '../model/room_quick_reply_msg.dart';

/// 房间输入框
class InputMessage extends StatefulWidget {
  final ChatRoomData room;

  /// 输入框顶部是否展示预设发言内容，默认不展示
  final bool displayPresetSpeechContent;
  final List<RoomQuickReplyMsgData>? quickMsg;
  final Function(List<RoomQuickReplyMsgData>)? updateQuickReplyMsgCallback;

  const InputMessage({
    super.key,
    required this.room,
    this.displayPresetSpeechContent = false,
    this.quickMsg,
    this.updateQuickReplyMsgCallback,
  });

  static Future show(BuildContext context, ChatRoomData room,
      {bool displayPresetSpeechContent = false}) async {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return InputMessage(
          room: room,
          displayPresetSpeechContent: displayPresetSpeechContent,
        );
      },
      maxHeightRatio: 0.75,
    );
  }

  @override
  InputMessageState createState() => InputMessageState();
}

class InputMessageState extends State<InputMessage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController(text: '');
  bool _hasCopy = false;

  bool _showFansLabelPanel = false;

  List<RoomQuickReplyMsgData>? quickMsgData;

  @override
  void initState() {
    _focusNode.addListener(_onFocus);
    if (widget.displayPresetSpeechContent) {
      quickMsgData = widget.quickMsg;
      syncQuickMsg();
    }
    super.initState();
    if (widget.room.purview != Purview.Normal) {
      _load();
    }
    eventCenter.addListener(EventConstant.EventRouteChanged, _onPageChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    eventCenter.removeListener(EventConstant.EventRouteChanged, _onPageChanged);
    super.dispose();
  }

  _onPageChanged(String type, dynamic data) {
    if (data != null && data is List) {
      List routes = data;
      if (routes.length == 2) {
        String preName = routes[1];
        if (preName == '/RoomChatQuickReplyScreen') {
          Log.d(
              'AppNavigatorObserver input_message _onPagePop type: $type, preName: $preName, routes: $routes');
          quickMsgList();
        }
      }
    }
  }

  _load() async {
    ClipboardData? value = await Clipboard.getData(Clipboard.kTextPlain);
    if (value != null &&
        value.text != null &&
        value.text!.isNotEmpty &&
        mounted) {
      setState(() {
        _hasCopy = true;
      });
    }
  }

  void quickMsgList() async {
    if (widget.displayPresetSpeechContent) {
      RoomQuickReplyMsg quickReplyMsg =
          await QuickReplyRepo.quickMsgList(widget.room.rid);
      if (quickReplyMsg.success == true) {
        if (mounted) {
          setState(() {
            quickMsgData = quickReplyMsg.data;
            if (widget.updateQuickReplyMsgCallback != null) {
              widget.updateQuickReplyMsgCallback!(quickMsgData!);
            }
          });
        }
      }
    }
  }

  void syncQuickMsg() async {
    if (widget.displayPresetSpeechContent) {
      NormalNull quickReplyMsg =
          await QuickReplyRepo.syncQuickMsg(widget.room.rid);
      if (quickReplyMsg.success == true) {
        Log.d('go/yy/screen/syncQuickMsg sync succeed');
      }
    }
  }

  _onFocus() {
    if (_focusNode.hasFocus) {
      setState(() {
        _showFansLabelPanel = false;
      });
    }
  }

  _onSubmitted(String value) async {
    if (value.isEmpty) return;

    _textController.clear();
    await OperateUtil.sendText(context, widget.room, value);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  /// emote点击
  _onEmoteTaped() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    double ext = _hasCopy ? 52.0 : 0.0;
    if (_showFansLabelPanel) {
      ext += 367.0;
    }
    if (widget.displayPresetSpeechContent && quickMsgData != null) {
      ext += 60;
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.0 + ext,
        padding: const EdgeInsetsDirectional.only(start: 0.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                ((keyboard == 0.0 && Util.isIphoneX && !_showFansLabelPanel)
                    ? 34.0
                    : 0.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _hasCopy
                ? Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(16.0),
                          topEnd: Radius.circular(16.0),
                          bottomStart: Radius.circular(16.0),
                        )),
                    width: 64.0,
                    height: 52.0,
                    child: IconButton(
                      icon: const Icon(Icons.content_paste),
                      onPressed: () async {
                        try {
                          ClipboardData? value =
                              await Clipboard.getData(Clipboard.kTextPlain);
                          if (value != null &&
                              value.text != null &&
                              value.text!.isNotEmpty &&
                              mounted) {
                            _textController.text = value.text!;
                          }
                        } catch (e) {
                          Log.d('$e');
                        }
                      },
                    ),
                  )
                : Container(),
            if (widget.displayPresetSpeechContent && quickMsgData != null)
              Container(
                height: 52,
                alignment: AlignmentDirectional.centerStart,
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  height: 28,
                  child: ListView.builder(
                    itemCount: quickMsgData!.length + 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          if (index == quickMsgData!.length) {
                            bool ret = await RoomChatQuickReplyScreen.show(
                                context,
                                rid: widget.room.rid,
                                quickMsgData: quickMsgData);
                            if (ret) {
                              // quickMsgList();
                            }
                            return;
                          }
                          _onSubmitted(quickMsgData![index].content);
                        },
                        child: Container(
                          height: 28,
                          margin: EdgeInsets.only(
                              left: index == 0 ? 16 : 8,
                              right: index == 6 ? 16 : 0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.1),
                            borderRadius: const BorderRadiusDirectional.all(
                                Radius.circular(20.0)),
                            border: Border.all(
                                color: const Color(0xFFF6F7F9).withOpacity(0.2),
                                width: 0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: index == quickMsgData!.length
                                ? Row(
                                    children: [
                                      R.img(
                                          RoomAssets
                                              .chat_room$controller_ic_room_edit_webp,
                                          width: 18,
                                          height: 18),
                                      const SizedBox(width: 2),
                                      Text(
                                        K.room_chat_quick_reply_self_define,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  )
                                : Text(
                                    quickMsgData![index].content,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            Container(
              height: 50.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsetsDirectional.only(
                  start: _showFansLabelEntrance() ? 6 : 16),
              child: Row(
                children: <Widget>[
                  if (_showFansLabelEntrance())
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: InkWell(
                          onTap: () {
                            if (_showFansLabelPanel == true) {
                              return;
                            }
                            FocusScope.of(context).requestFocus(FocusNode());
                            _showFansLabelPanel = !_showFansLabelPanel;
                            setState(() {});
                          },
                          child: FansLabel(
                              widget.room.liveFansLabelExtra?.label,
                              _getFansIcon(),
                              _getFansColors())),
                    ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsetsDirectional.only(
                          start: _showFansLabelEntrance() ? 8 : 0),
                      decoration: _showFansLabelEntrance()
                          ? const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xFFF6F7F9))
                          : null,
                      child: TextField(
                        cursorColor: R.color.mainBrandColor,
                        keyboardAppearance: Brightness.light,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 16,
                            fontFamily: Util.fontFamily,
                          ),
                          hintText: K.room_input_hint,
                          isDense: true,
                          counterText: '',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.send,
                        textAlign: TextAlign.start,
                        maxLines: 30,
                        minLines: 1,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Util.fontFamily),
                        focusNode: _focusNode,
                        controller: _textController,
                        autocorrect: true,
                        autofocus: true,
                        onSubmitted: _onSubmitted,
                        maxLength: 150,
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _onEmoteTaped,
                    child: R.img(
                      'controller/ic_room_emote.svg',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      width: 48,
                      height: 48,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _onSubmitted(_textController.value.text),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 12, start: 8),
                      child: Container(
                        width: 58,
                        height: 28,
                        decoration: BoxDecoration(
                          color: R.color.mainBrandColor,
                          borderRadius: BorderRadius.circular(15.5),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          K.room_send_message,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_showFansLabelPanel)
              Expanded(
                  child: FansLabelPanel(
                rid: widget.room.rid,
              ))
          ],
        ),
      ),
    );
  }

  bool _showFansLabelEntrance() {
    return widget.room.liveFansLabelExtra != null &&
        !Util.isStringEmpty(widget.room.liveFansLabelExtra?.label);
  }

  String _getFansIcon() {
    return FansLabel.getLevelIcon(widget.room.liveFansLabelExtra?.level ?? 0,
        Util.parseBool(widget.room.config?.liveDataV3?.newLabel));
  }

  List<Color> _getFansColors() {
    return Util.parseColors(
        FansLabel.getLabelColors(widget.room.liveFansLabelExtra?.level ?? 0));
  }
}
