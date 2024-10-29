import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat/src/msg/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;

import '../../k.dart';

/// 真心话
class DisplayTrueWord {
  static Widget render(
      {required MessageContent message,
      required Map extra,
      required MessageDisplayDirection? direction,
      required double maxWidth}) {
    String? type = extra['type'];
    if (type == 'true_word_normal' ||
        type == 'true_word_private' ||
        type == 'true_word_private_invite') {
      return DisplayTrueWordMessage(
          message: message,
          extra: extra,
          direction: direction,
          maxWidth: maxWidth);
    } else if (type == 'true_word_answer') {
      return DisplayTrueWordAnswerMessage(
          message: message,
          extra: extra,
          direction: direction,
          maxWidth: maxWidth);
    } else if (type == 'true_word_open') {
      return DisplayTrueWordOpenMessage(
          message: message,
          extra: extra,
          direction: direction,
          maxWidth: maxWidth);
    } else {
      return Container();
    }
  }
}

class DisplayTrueWordMessage extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;
  final double maxWidth;

  const DisplayTrueWordMessage(
      {super.key,
      required this.message,
      required this.extra,
      required this.direction,
      required this.maxWidth});

  @override
  _DisplayTrueWordMessageState createState() => _DisplayTrueWordMessageState();
}

class _DisplayTrueWordMessageState extends State<DisplayTrueWordMessage> {
  bool enabled = true;

  void _xhrError(String? msg) {
    if (msg != null)
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }

  void _onPress(String answer) async {
    if (!enabled) return null;
    if (widget.message.senderId == Session.uid.toString()) {
      Toast.showCenter(context, K.cant_answer_youself);
      return null;
    }

    final String? senderId =
        (widget.direction != MessageDisplayDirection.Left &&
                widget.message.conversationType == 'private')
            ? widget.message.senderId
            : widget.message.targetId;

    Map<String, String> post = {
      'senderId': senderId ?? '',
      'type': widget.extra['type'],
      'content': answer,
      'conversationType': 'private',
    };
    String url = '${System.domain}question/answer';
    XhrResponse response = await Xhr.postJson(url, post);
    if (response.error != null) {
      Fluttertoast.toastException(
          exp: response.error, gravity: ToastGravity.CENTER);
      return;
    }
    Map res = response.value();
    if (res['success'] == false) {
      return _xhrError(res['message']);
    }

    MessageContent content = MessageContent(MessageType.Text,
        SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = answer;

    Map<String, String> extra = {'type': 'true_word_answer'};
    content.extra = json.encode(extra);

    try {
      await Im.sendMessage(
          widget.message.conversationType, widget.message.targetId, content,
          pushContent: BaseK.K.base_truth_word);
    } catch (e) {
      Log.d(e);
    }

    enabled = false;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = ['answer1', 'answer2', 'answer3', 'answer4'];
    List<Widget> columns = [];

    Map map = {'answer1': 'A', 'answer2': 'B', 'answer3': 'C', 'answer4': 'D'};
    for (var answer in answers) {
      if (widget.extra[answer] != null && !widget.extra[answer].isEmpty) {
        columns.add(
          GestureDetector(
            onTap: () {
              _onPress("${map[answer]}.${widget.extra[answer]}");
            },
            child: Container(
              margin: const EdgeInsetsDirectional.only(top: 6, bottom: 4),
              child: Text(
                "${map[answer]}. ${widget.extra[answer]}",
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16.0,
                    color: R.colors.highlightColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      }
    }

    Widget imageFlag;
    if (widget.extra['type'] == 'true_word_normal') {
      imageFlag = buildImageFlag(
          [const Color(0xFFE27F28), const Color(0xFFFFB82A)],
          K.true_word_string);
    } else {
      imageFlag = buildImageFlag(
          [const Color(0xFFFFA8D0), const Color(0xFFFF7092)],
          K.private_word_string);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            imageFlag,
            Container(
              padding: const EdgeInsetsDirectional.only(start: 6.0),
              constraints: BoxConstraints(
                maxWidth: widget.maxWidth - 80,
              ),
              child: Text(
                widget.message.content,
                style: TextStyle(
                  fontSize: 16.0,
                  textBaseline: TextBaseline.ideographic,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columns,
          ),
        )
      ],
    );
  }
}

class DisplayTrueWordAnswerMessage extends StatelessWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;
  final double maxWidth;

  const DisplayTrueWordAnswerMessage(
      {super.key,
      required this.message,
      required this.extra,
      required this.direction,
      required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        buildImageFlag(
            [const Color(0xFF2B83FF), const Color(0xFF3CDBFF)], K.chat_answer),
        Container(
            padding: const EdgeInsetsDirectional.only(start: 6.0),
            constraints: BoxConstraints(maxWidth: maxWidth - 80),
            child: Text(
              message.content,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w500,
              ),
            ))
      ],
    );
  }
}

class DisplayTrueWordOpenMessage extends StatelessWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;
  final double maxWidth;

  const DisplayTrueWordOpenMessage(
      {super.key,
      required this.message,
      required this.extra,
      required this.direction,
      required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildImageFlag(
            [const Color(0xFFADC6FF), const Color(0xFFDD9DFF)], K.chat_open),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 6.0),
          constraints: BoxConstraints(
            maxWidth: maxWidth - 80,
          ),
          child: Text(
            message.content,
            style: TextStyle(
              fontSize: 16.0,
              textBaseline: TextBaseline.ideographic,
              color: R.colors.mainTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildImageFlag(List<Color> colors, String tag) {
  double topPadding = 1.5; // 文字上padding较大，显示效果不局中，人为把背景下移topPadding
  return Container(
    width: 20,
    height: 20,
    margin: EdgeInsetsDirectional.only(top: 4 - topPadding),
    child: Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 0,
          top: 0,
          child: Container(
            width: 20.0,
            height: 20.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        PositionedDirectional(
          start: 0,
          top: -topPadding,
          child: Container(
            width: 20.0,
            height: 20.0,
            alignment: Alignment.center,
            child: Center(
              child: Text(
                tag,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14.2,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
