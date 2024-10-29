import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import 'model/pb/quick_reply_repo.dart';
import 'model/room_quick_reply_msg.dart';

/// 房间聊天快捷回复
class RoomChatQuickReplyScreen extends StatefulWidget {
  final int rid;
  final List<RoomQuickReplyMsgData>? quickMsgData;

  const RoomChatQuickReplyScreen(
      {super.key, required this.rid, this.quickMsgData});

  @override
  State<RoomChatQuickReplyScreen> createState() =>
      _RoomChatQuickReplyScreenState();

  static Future<bool> show(BuildContext context,
      {Key? key,
      required int rid,
      List<RoomQuickReplyMsgData>? quickMsgData}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoomChatQuickReplyScreen(
            key: key, rid: rid, quickMsgData: quickMsgData),
        settings: const RouteSettings(name: '/RoomChatQuickReplyScreen'),
      ),
    );
  }
}

class _RoomChatQuickReplyScreenState extends State<RoomChatQuickReplyScreen> {
  final int maxShortTextLength = 6;

  List<RoomQuickReplyMsgData> items = [];

  @override
  void initState() {
    super.initState();
    items = widget.quickMsgData ?? [];
    quickMsgList();
  }

  void quickMsgList() async {
    RoomQuickReplyMsg quickReplyMsg =
        await QuickReplyRepo.quickMsgList(widget.rid);
    if (quickReplyMsg.success == true) {
      refresh(() {
        items = quickReplyMsg.data ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        K.room_chat_quick_reply(['${items.length}', '$maxShortTextLength']),
        onBackPressedCallback: () {
          Navigator.of(context).pop(true);
        },
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 8),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                K.room_chat_quick_reply_tip,
                style: TextStyle(
                    color: const Color(0xFF202020).withOpacity(0.6),
                    fontSize: 11),
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                for (int i = 0; i < items.length; i++)
                  _buildShortLanguageItem(i, items[i]),
              ],
              onReorder: (int oldIndex, int newIndex) async {
                /// 排序快捷语
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }

                List<RoomQuickReplyMsgData> tempItems = [];
                tempItems.addAll(items);
                var tempChild = tempItems.removeAt(oldIndex);
                tempItems.insert(newIndex, tempChild);
                String ids = '';
                if (tempItems.isNotEmpty) {
                  for (int i = 0; i < tempItems.length; i++) {
                    final item = tempItems[i];
                    ids += '${item.id}';
                    if (i != tempItems.length - 1) {
                      ids += ',';
                    }
                  }
                }
                if (ids.isNotEmpty) {
                  var child = items.removeAt(oldIndex);
                  items.insert(newIndex, child);
                  refresh(() {});
                  NormalNull res = await QuickReplyRepo.sortQuickMsg(ids);
                  if (res.success == false) {
                    var child = items.removeAt(newIndex);
                    items.insert(oldIndex, child);
                    refresh(() {});
                    Fluttertoast.showCenter(msg: K.room_request_error_retry);
                  }
                }
              },
              proxyDecorator:
                  (Widget child, int index, Animation<double> animation) {
                return Material(
                  shadowColor: const Color(0xFF000000).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12.0),
                  animationDuration: const Duration(milliseconds: 500),
                  child: child,
                );
              },
            ),
          ),
          Container(
            height: 76,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: InkWell(
              onTap: () async {
                if (items.isNotEmpty && items.length >= 6) {
                  return;
                }
                await displayModalBottomSheet(
                  context: context,
                  defineBarrierColor: Colors.black.withOpacity(0.5),
                  builder: (BuildContext context) => RoomAddShortPhraseWidget(
                    onSubmitCallback: (value) async {
                      /// 添加快捷语
                      NormalNull res = await QuickReplyRepo.saveQuickMsg(value);
                      if (res.success == true) {
                        Navigator.of(context).pop();
                        Fluttertoast.showCenter(
                            msg: K.room_gmic_add_album_success);
                        quickMsgList();
                      } else {
                        Fluttertoast.showCenter(
                            msg: res.msg.isNotEmpty
                                ? res.msg
                                : K.room_something_went_wrong);
                      }
                    },
                  ),
                  maxHeightRatio: 0.75,
                  isBarrierDismissible: false,
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: R.color.mainBrandGradientColors
                        .map(
                          (e) => e.withOpacity(
                              items.isNotEmpty && items.length >= 6 ? 0.5 : 1),
                        )
                        .toList(),
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  K.room_add_short_content,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).padding.bottom,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildShortLanguageItem(int index, RoomQuickReplyMsgData item) {
    return Slidable(
      key: ValueKey(item),
      direction: Axis.horizontal,
      closeOnScroll: true,
      endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            CustomSlidableAction(
              autoClose: false,
              onPressed: (context) async {
                /// 删除快捷语
                NormalNull res = await QuickReplyRepo.delQuickMsg(item.id);
                if (res.success == true) {
                  Fluttertoast.showCenter(msg: K.room_topic_delete_success);
                  Slidable.of(context)?.close();
                  items.removeAt(index);
                  refresh(() {});
                  quickMsgList();
                } else {
                  Fluttertoast.showCenter(msg: res.msg);
                }
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4267),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: R.img(
                    'ic_slide_delete.webp',
                    width: 24.0,
                    height: 24.0,
                    package: ComponentManager.MANAGER_MESSAGE,
                  ),
                ),
              ),
            ),
          ]),
      child: GestureDetector(
        onTap: () async {
          await displayModalBottomSheet(
            context: context,
            defineBarrierColor: Colors.black.withOpacity(0.5),
            builder: (BuildContext context) => RoomAddShortPhraseWidget(
              text: item.content,
              onSubmitCallback: (value) async {
                if (item.content == value) {
                  Navigator.of(context).pop();
                  Fluttertoast.showCenter(msg: K.room_no_modifyed);
                  return;
                }

                /// 修改快捷语
                NormalNull res =
                    await QuickReplyRepo.saveQuickMsg(value, id: item.id);
                if (res.success == true) {
                  Navigator.of(context).pop();
                  Fluttertoast.showCenter(
                      msg: K.room_quick_reply_modify_success);
                  quickMsgList();
                } else {
                  Fluttertoast.showCenter(
                      msg: res.msg.isNotEmpty
                          ? res.msg
                          : K.room_something_went_wrong);
                }
              },
            ),
            maxHeightRatio: 0.75,
            isBarrierDismissible: false,
          );
        },
        child: ShortLanguageItem(key: ValueKey(item), text: item.content),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////
//// 短语item
/////////////////////////////////////////////////////////////////////////
class ShortLanguageItem extends StatefulWidget {
  final String text;

  const ShortLanguageItem({Key? key, required this.text}) : super(key: key);

  @override
  State<ShortLanguageItem> createState() => _ShortLanguageItemState();
}

class _ShortLanguageItemState extends State<ShortLanguageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF).withOpacity(0.1),
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(12.0)),
        border: Border.all(
            color: const Color(0xFF202020).withOpacity(0.2), width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          widget.text,
          style: const TextStyle(color: Color(0xFF202020), fontSize: 14),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////
//// 添加常用语
/////////////////////////////////////////////////////////////////////////
class RoomAddShortPhraseWidget extends StatefulWidget {
  final String? text;
  final Function(String)? onSubmitCallback;

  const RoomAddShortPhraseWidget({Key? key, this.text, this.onSubmitCallback})
      : super(key: key);

  @override
  State<RoomAddShortPhraseWidget> createState() => _RoomAddShortPhraseState();
}

class _RoomAddShortPhraseState extends State<RoomAddShortPhraseWidget> {
  late FocusNode _focusNode;
  final TextEditingController _textController = TextEditingController();
  int currentTextLength = 20;
  final int maxTextLength = 20;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);
    if (widget.text != null && widget.text!.isNotEmpty) {
      _textController.text = widget.text!;
      currentTextLength = maxTextLength - widget.text!.length;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
  }

  _onFocus() {
    Log.d("focus --------------- ${_focusNode.hasFocus}");
    if (_focusNode.hasFocus) {
      refresh(() {});
    }
  }

  _onSubmitted(String? value) async {
    if (value == null || value.isEmpty) return;
    if (widget.onSubmitCallback != null) {
      widget.onSubmitCallback!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 177,
      padding: const EdgeInsetsDirectional.only(start: 0.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: kToolbarHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16.0),
                topEnd: Radius.circular(16.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      K.room_add_common_language,
                      style: const TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_textController.text.isEmpty) {
                      Fluttertoast.showCenter(
                          msg: K.room_input_empty_content_tip);
                      return;
                    }
                    if (widget.onSubmitCallback != null) {
                      widget.onSubmitCallback!(_textController.text);
                    }
                  },
                  child: Container(
                    width: 100,
                    height: kToolbarHeight,
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16),
                      child: Text(
                        K.room_vehicle_team_disband_sure,
                        style: const TextStyle(
                            color: Color(0xFF313131), fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 20, left: 16, right: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFFF6F7F9),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(12.0)),
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        cursorColor: R.color.mainBrandColor,
                        keyboardAppearance: Brightness.light,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: const Color(0xFF313131).withOpacity(0.3),
                            fontSize: 16,
                            fontFamily: Util.fontFamily,
                          ),
                          hintText: K.room_please_add,
                          isDense: true,
                          counterText: '',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.send,
                        textAlign: TextAlign.start,
                        maxLines: 30,
                        minLines: 1,
                        maxLength: 20,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Util.fontFamily),
                        focusNode: _focusNode,
                        controller: _textController,
                        autocorrect: true,
                        autofocus: true,
                        onSubmitted: _onSubmitted,
                        onChanged: (value) {
                          if (value.length > 20) {
                            currentTextLength = 0;
                            _textController.text = value.safeSubstring(0, 20);
                            refresh(() {});
                            return;
                          }
                          currentTextLength = maxTextLength - value.length;
                          refresh(() {});
                        },
                      ),
                    )),
                    Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        '$currentTextLength/$maxTextLength',
                        style: TextStyle(
                            color: const Color(0xFF202020).withOpacity(0.4),
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
