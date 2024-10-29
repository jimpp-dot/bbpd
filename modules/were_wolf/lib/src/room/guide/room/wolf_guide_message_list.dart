import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:provider/provider.dart' hide Selector;

final TextStyle messageTextStyle = TextStyle(
  color: Colors.white.withOpacity(0.6),
  fontSize: 14,
  inherit: true,
  fontWeight: FontWeight.w500,
  fontFamily: Util.fontFamily,
);

///
///
class WolfGuideMessageList extends StatefulWidget {
  const WolfGuideMessageList({super.key});

  @override
  _WolfGuideMessageListState createState() => _WolfGuideMessageListState();
}

class _WolfGuideMessageListState extends State<WolfGuideMessageList>
    with TickerProviderStateMixin<WolfGuideMessageList> {
  late ScrollController _controller;
  final List<MessageContent> _data = [];

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(keepScrollOffset: true);
    _sendLocalMessage();
  }

  void _sendLocalMessage() {
    MessageContent msg = sendGuideMsg(content: K.wolf_v2_guide_msg_desc_3);
    _data.add(msg);

    MessageContent msg1 = sendGuideMsg(text1: K.wolf_v2_guide_msg_desc_1);
    _data.add(msg1);

    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
    for (var element in wolfModel.data.positions!) {
      if (element.uid != Session.uid) {
        MessageContent msg2 = sendGuideMsg(
            text1: '${K.wolf_v2_guide_msg_desc_2} ', text2: element.name);
        _data.add(msg2);
      }
    }

    MessageContent msg3 = sendGuideMsg(
        text1: '${K.wolf_v2_guide_msg_desc_2} ', text2: Session.name);
    _data.add(msg3);
  }

  MessageContent sendGuideMsg(
      {String content = '', String text1 = '', String text2 = ''}) {
    Map extra = {
      'type': 'localGuide',
      'content': content,
      'text1': text1,
      'text2': text2
    };
    MessageContent message = MessageContent.from(
      null,
      extra,
      null,
      null,
    );
    return message;
  }

  @override
  void didUpdateWidget(WolfGuideMessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget _renderLocalMessage(BuildContext context, MessageContent message) {
    Map? extra = message.extra;
    if (extra != null && extra['type'] == 'localGuide') {
      String? content = extra['content'];
      if (content != null && content.isNotEmpty) {
        return Text(
          content,
          style: messageTextStyle.copyWith(
            color: const Color(0xFFFFC900),
          ),
        );
      }

      List<TextSpan> spans = [];
      String? text1 = extra['text1'];
      if (text1 != null && text1.isNotEmpty) {
        spans.add(
          TextSpan(
            text: text1,
            style: messageTextStyle.copyWith(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        );
      }
      String? text2 = extra['text2'];
      if (text2 != null && text2.isNotEmpty) {
        spans.add(
          TextSpan(
            text: text2,
            style: messageTextStyle.copyWith(
              color: Colors.white,
            ),
          ),
        );
      }

      return RichText(
        text: TextSpan(
          text: '',
          style: messageTextStyle.copyWith(
            color: Colors.white.withOpacity(0.6),
          ),
          children: spans,
        ),
      );
    }
    return Container();
  }

  Widget _renderBody(
    BuildContext context,
    MessageContent message,
  ) {
    return _renderLocalMessage(context, message);
  }

  Widget _renderExpanded(BuildContext context) {
    return ListView.builder(
      cacheExtent: 100.0,
      shrinkWrap: true,
      reverse: true,
      physics: const ClampingScrollPhysics(),
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.all(0.0),
      controller: _controller,
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        MessageContent message = _data.elementAt(_data.length - 1 - index);

        return Container(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 4,
                bottom: 4,
              ),
              margin: const EdgeInsets.only(
                left: 19.0,
                right: 19.0,
                top: 2,
                bottom: 2,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                color: Colors.black.withOpacity(0.2),
              ),
              child: _renderBody(
                context,
                message,
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [
      _renderExpanded(context),
    ];
    return Expanded(
      key: _key,
      child: Stack(
        clipBehavior: Clip.none,
        children: res,
      ),
    );
  }
}
