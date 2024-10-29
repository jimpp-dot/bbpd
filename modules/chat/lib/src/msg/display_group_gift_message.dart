import 'package:chat/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DisplayGroupGiftMessage extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final bool fromSelf;
  const DisplayGroupGiftMessage(
      {super.key,
      required this.message,
      required this.extra,
      required this.fromSelf});

  @override
  State<StatefulWidget> createState() => DisplayGroupGiftMessageState();
}

class DisplayGroupGiftMessageState extends State<DisplayGroupGiftMessage> {
  Color get leftBgColor => darkMode ? const Color(0x30FF56D1) : Colors.white;

  Color get rightBgColor =>
      darkMode ? const Color(0xB3221B5B) : const Color(0xFF8D6BF7);

  static final Set<MessageContent> _autoPlayedSet = {};

  static const String _tag = "DisplayGroupGiftMessageState";

  @override
  void initState() {
    super.initState();
    if (widget.message.inlineExtra != null &&
        widget.message.inlineExtra?.isNotEmpty == true) {
      Log.d(tag: _tag, "init state");
    } else {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        Log.d(tag: _tag, "init state,start autoplay1");
        if (_autoPlayedSet.contains(widget.message)) {
          return;
        }
        Log.d(tag: _tag, "init state,start autoplay2");
        _autoPlayedSet.add(widget.message);
        eventCenter.emit('UserChat.PlayGift', widget.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fromSelf) {
      return _renderGiftInfoFromSelf(context, widget.extra);
    } else {
      return _renderGiftInfoFromOther(context, widget.extra);
    }
  }

  Widget _renderGiftInfoFromSelf(BuildContext context, Map extra) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 14.0, bottom: 14, end: 16),
      alignment: AlignmentDirectional.topEnd,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 12.0, end: 12.0, top: 14.0, bottom: 14.0),
        decoration: BoxDecoration(
          color: rightBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: _buildContent(extra, true),
      ),
    );
  }

  Widget _renderGiftInfoFromOther(BuildContext context, Map extra) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 6.0, bottom: 6),
      alignment: AlignmentDirectional.topStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 12.0,
              end: 12.0,
              top: 6.0,
            ),
            child: CommonAvatarWithFrame(
              uid: Util.parseInt(extra['from_uid']),
              overflow: -3.0,
              childWidget: CommonAvatar(
                path: extra['from_icon'],
                suffix: '!head100',
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                size: 40,
                onTap: () {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager
                      .openImageFloatScreenDisplayModalBottomSheet(
                          context, Util.parseInt(extra['from_uid']), null, 4,
                          useEmptyRoom: true,
                          chatGroupId: Util.parseInt(extra["group_id"]));
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(extra["from_name"]),
              Container(
                margin: const EdgeInsetsDirectional.only(top: 6.0, bottom: 6),
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 12.0, end: 12.0, top: 14.0, bottom: 14.0),
                  decoration: BoxDecoration(
                    color: leftBgColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: _buildContent(extra, false),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTitle(String name) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 13,
          fontFamily: Util.fontFamily),
    );
  }

  Widget _buildAvatar(String name, String icon, bool self) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        CommonAvatar(
          path: icon,
          suffix: '!head100',
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          size: 40,
          onTap: () {},
        ),
        PositionedDirectional(
          bottom: 0,
          child: IgnorePointer(
              child: Container(
            height: 10,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsetsDirectional.only(start: 2, end: 2),
            padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
            decoration: BoxDecoration(
                color: self
                    ? (darkMode
                        ? const Color(0xFF302C5C)
                        : const Color(0xFF997AF8))
                    : darkMode
                        ? const Color(0xFF4A2E56)
                        : const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(5)),
            child: Text(name,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: self
                        ? Colors.white.withOpacity(0.9)
                        : R.colors.mainTextColor,
                    fontSize: 7,
                    fontWeight: FontWeight.w500)),
          )),
        ),
      ],
    );
  }

  Widget _buildContent(Map extra, bool self) {
    List<dynamic> list = extra["to_profile"];
    List<Widget> toList = [];
    for (dynamic sender in list) {
      if (sender is Map) {
        toList.add(_buildAvatar(sender["name"], sender["icon"], self));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        R.img('${System.imageDomain}static/gift_big/${extra['gift_id']}.png',
            width: 48, height: 48),
        const SizedBox(width: 6),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: extra["gift_name"],
                  style: TextStyle(
                      color: self
                          ? Colors.white.withOpacity(0.9)
                          : R.colors.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
              TextSpan(
                  text: " X${extra["gift_num"]} ",
                  style: const TextStyle(
                      color: Color(0xFF6CFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: K.chat_gift_send,
                  style: TextStyle(
                      color: self
                          ? Colors.white.withOpacity(0.9)
                          : R.colors.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ])),
            const SizedBox(height: 9),
            Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Wrap(
                spacing: 4,
                runSpacing: 9,
                children: toList,
              ),
            )
          ],
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
