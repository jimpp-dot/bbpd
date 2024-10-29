import 'dart:math' as math;

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/message/message_send_data.dart';
import 'package:chat_room/src/base/message/message_send_frequency.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';

import '../../model/pb/generated/emotion.pb.dart';
import 'vip_emote_pay_screen.dart';

/// emote 面板
class InputEmote extends StatefulWidget {
  final ChatRoomData room;

  final VoidCallback? onSuccess;

  final EmoteTabType emoteTabType;

  final int pubMsgInterval;

  final List<EmojiItem>? emotionList;

  final List<EmojiPrice>? priceList;

  final int leftSeconds;

  final int emojiGroupId;

  final String? emojiDesc;

  final String? title;

  final String? defaultIcon;

  final String? background;

  const InputEmote(
      {Key? key,
      required this.room,
      this.emotionList,
      this.priceList,
      this.emojiGroupId = 0,
      this.emojiDesc,
      this.onSuccess,
      this.leftSeconds = 0,
      this.title,
      this.defaultIcon,
      this.background,
      this.emoteTabType = EmoteTabType.NORMAL,
      this.pubMsgInterval = 0})
      : super(key: key);

  @override
  InputEmoteState createState() => InputEmoteState();
}

class InputEmoteState extends State<InputEmote> with AutomaticKeepAliveClientMixin<InputEmote> {
  @override
  bool get wantKeepAlive => true;

  GlobalKey? _itemKey;

  double _radio = 0.0;

  EmoteTabType get emoteTabType => widget.emoteTabType;

  bool isLocked = true;

  int _leftSeconds = 0;

  @override
  void initState() {
    super.initState();
    initData();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      RenderBox? cardRenderBox = _itemKey?.currentContext?.findRenderObject() as RenderBox?;
      double cardHeight = cardRenderBox?.size.height ?? 0;
      if (cardHeight > 0 && _radio == 0.0) {
        double itemWidth = (Util.width - 16.dp * 6) / 5;
        _radio = itemWidth / cardHeight;
        refresh();
      }
    });
  }

  @override
  void didUpdateWidget(covariant InputEmote oldWidget) {
    super.didUpdateWidget(oldWidget);
    initData();
  }

  void initData() {
    _leftSeconds = widget.leftSeconds;
    isLocked = _leftSeconds <= 0;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.emotionList == null) return const SizedBox.shrink();
    switch (emoteTabType) {
      case EmoteTabType.VIP:
        return _renderVIP(context);
      default:
        return _render(context);
    }
  }

  _send(GiftItem item) async {
    int position = 0; //围观人发送
    int uid = Session.uid;
    RoomPosition? pos = widget.room.positions.firstWhereOrNull((RoomPosition position) {
      return position.uid == uid;
    });

    if (pos != null && pos.uid > 0) {
      position = pos.position + 2;
    } else if ((widget.room.isEightPosition || widget.room.isFivePosition) && Session.uid == widget.room.config?.uid) {
      position = 1;
    }
    List<int> emoteData = [];
    switch (item.key) {
      case 'coin':
      case 'coin_new':
        //硬币
        emoteData = _randCoin();
        break;

      case 'rand':
      case 'rand_new':
        //抽签
        emoteData = _randRand();
        break;

      case 'stone':
      case 'stone_new':
        //猜拳
        emoteData = _randStone();
        break;
    }
    Map<String, dynamic> extra = {
      'emote': item.key,
      'emote_sender': uid,
      'emote_position': position,
      'emote_data': emoteData,
      'duration': item.duration,
      'img_format': item.format,
      'now': widget.room.serverTime,
    };
    String text = item.name;
    DataRsp dataRsp = await widget.room.sendMessage(
      text,
      MessageSendData.msgExtraJsonEncode(widget.room, extra: extra),
      checkFrequency: MsgSendFrequency.instance.isEmoteRestrict(),
    );
    if (!dataRsp.success) {
      if (dataRsp.msg?.isNotEmpty == true) {
        Fluttertoast.showCenter(msg: dataRsp.msg);
      }
      return;
    }
    if (widget.onSuccess != null) {
      widget.onSuccess!();
    }
    _trackReport(item);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  _trackReport(GiftItem item) {
    Tracker.instance.track(TrackEvent.room_public_chat, properties: {
      'rid': widget.room.realRid,
      'msg_type': 'emoji',
      'emote_name': EmoteUtil.getEmoteName(item),
      if (!Util.isNullOrEmpty(widget.room.config?.typeName)) 'type_label': widget.room.config?.typeName,
      if (!Util.isNullOrEmpty(widget.room.config?.originalRFT)) 'room_factory_type': widget.room.config?.originalRFT,
      if (!Util.isNullOrEmpty(widget.room.config?.settlementChannel)) 'settlement_channel': widget.room.config?.settlementChannel,
    });
  }

  _randDice() {
    var random = math.Random();
    return [random.nextInt(6)];
  }

  _randCoin() {
    var random = math.Random();
    return [random.nextInt(2)];
  }

  _randRand() {
    var random = math.Random();
    return [random.nextInt(8)];
  }

  _randStone() {
    var random = math.Random();
    return [random.nextInt(3)];
  }

  Widget _render(BuildContext context) {
    List<GiftItem> listData = widget.emotionList!.map<GiftItem>((item) {
      return GiftItem(name: item.name, key: item.key, onlyInMic: item.onlyInMic);
    }).toList();
    bool inMic = ClientRole.Broadcaster == widget.room.role;
    Iterable<GiftItem> list = listData.isNotEmpty
        ? listData.where((GiftItem item) {
            if (inMic) {
              return true;
            }
            return item.onlyInMic == false;
          })
        : [];

    int rowNum = 6;
    double itemWidth = (Util.width - 12.dp) / rowNum;
    double itemHeight = itemWidth + 18.dp;
    bool overColumn = list.length % rowNum != 0;
    int columnNum = (list.length ~/ rowNum) + (overColumn ? 1 : 0);
    double height = itemHeight * columnNum + 12.dp + Util.iphoneXBottom;

    return Container(
      padding: EdgeInsetsDirectional.only(start: 6.dp, top: 6.dp, end: 6.dp, bottom: 6.dp),
      height: height,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(0.0),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        crossAxisCount: rowNum,
        shrinkWrap: true,
        childAspectRatio: itemWidth / itemHeight,
        children: list.map((GiftItem item) {
          return Column(
            children: <Widget>[
              IconButton(
                icon: CachedNetworkImage(
                  width: 30,
                  height: 30,
                  imageUrl: EmoteUtil.emoteImgUrl(item.key),
                  fadeInDuration: const Duration(microseconds: 0),
                  fadeOutDuration: const Duration(microseconds: 0),
                  fit: BoxFit.cover,
                ),
                onPressed: () {
                  _send(item);
                },
              ),
              Container(
                height: 18.dp,
                alignment: Alignment.center,
                child: Text(
                  EmoteUtil.getEmoteName(item),
                  style: TextStyle(fontSize: 12.dp, color: Colors.white),
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _renderVIP(BuildContext context) {
    List<GiftItem> emoteData = widget.emotionList!.map<GiftItem>((item) {
      return GiftItem(name: item.name, key: item.key, onlyInMic: item.onlyInMic);
    }).toList();
    bool inMic = ClientRole.Broadcaster == widget.room.role;
    Iterable<GiftItem> list = emoteData.isNotEmpty
        ? emoteData.where((GiftItem item) {
            if (inMic) {
              return true;
            }
            return item.onlyInMic == false;
          })
        : [];

    int rowNum = 6;
    double itemWidth = (Util.width - 12.dp) / rowNum;
    double itemHeight = itemWidth + 18.dp;
    bool overColumn = list.length % rowNum != 0;
    int columnNum = (list.length ~/ rowNum) + (overColumn ? 1 : 0);
    double height = itemHeight * columnNum + 12.dp + Util.iphoneXBottom + _leftSeconds > 0 ? 110.dp : 0;
    return Container(
      padding: EdgeInsetsDirectional.only(start: 6.dp, top: 6.dp, end: 6.dp, bottom: 6.dp),
      height: height,
      child: Column(
        children: [
          if (_leftSeconds > 0)
            Container(
              height: 44.dp,
              margin: EdgeInsetsDirectional.only(start: 16.dp),
              child: Row(
                children: [
                  Text(
                    K.validity_remaining([(DateUtils.formatDuration(_leftSeconds))]),
                    style: TextStyle(color: const Color(0xE6FFFFFF), fontSize: 16.dp, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // 去付费
                      VipEmotePayScreen.show(
                        context,
                        widget.room,
                        priceList: widget.priceList,
                        emojiDesc: widget.emojiDesc,
                        emojiGroupId: widget.emojiGroupId,
                        title: widget.title,
                        defaultIcon: widget.defaultIcon,
                        background: widget.background,
                      );
                    },
                    child: Container(
                      height: 30.dp,
                      width: 52.dp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.dp)),
                        gradient: LinearGradient(
                          colors: R.dColor.mainBrandGradientColors,
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        K.renewal_fee,
                        style: TextStyle(color: const Color(0xFF080A31), fontSize: 14.dp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.dp,
                  )
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(0.0),
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                crossAxisCount: rowNum,
                shrinkWrap: true,
                childAspectRatio: itemWidth / itemHeight,
                children: list.map((GiftItem item) {
                  return Column(
                    children: <Widget>[
                      IconButton(
                        icon: CachedNetworkImage(
                          imageUrl: EmoteUtil.emoteImgUrl(item.key),
                          fadeInDuration: const Duration(microseconds: 0),
                          fadeOutDuration: const Duration(microseconds: 0),
                        ),
                        onPressed: () {
                          if (isLocked && widget.priceList?.isNotEmpty == true) {
                            // 去付费
                            VipEmotePayScreen.show(
                              context,
                              widget.room,
                              priceList: widget.priceList,
                              emojiDesc: widget.emojiDesc,
                              emojiGroupId: widget.emojiGroupId,
                              title: widget.title,
                              defaultIcon: widget.defaultIcon,
                              background: widget.background,
                            );
                          } else {
                            _send(item);
                          }
                        },
                      ),
                      Container(
                          height: 18.dp,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isLocked)
                                R.img(
                                  BaseAssets.ic_lock_svg,
                                  width: 12.dp,
                                  height: 12.dp,
                                  package: ComponentManager.MANAGER_BASE_CORE,
                                ),
                              Text(
                                EmoteUtil.getEmoteName(item),
                                style: TextStyle(fontSize: 12.dp, color: Colors.white),
                              ),
                            ],
                          ))
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
