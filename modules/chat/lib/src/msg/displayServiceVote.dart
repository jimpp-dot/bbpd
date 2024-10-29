import 'dart:convert';

import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayServiceVote extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayServiceVote(
      {super.key, required this.message, required this.extra});

  @override
  _DisplayServiceVoteState createState() => _DisplayServiceVoteState();
}

class _DisplayServiceVoteState extends State<DisplayServiceVote> {
  String _ok = 'none';

  @override
  void initState() {
    super.initState();
    try {
      String? inline = widget.message.inlineExtra;
      if (inline != null && inline.isNotEmpty) {
        Map? data = json.decode(inline);
        if (data != null && data.containsKey('ok')) {
          _ok = data['ok'];
        }
      } else {
        _load();
      }
    } catch (e) {
      Log.d(e);
    }
  }

  _load() async {
    try {
      XhrResponse response = await Xhr.postJson(
          '${System.domain}auto/check',
          {
            'uuid': widget.message.messageUId!,
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true && res['data'] is String) {
        await _setExtra(res['data']);
        if (mounted) {
          setState(() {
            _ok = res['data'];
          });
        }
      }
    } catch (e) {}
  }

  _setExtra(String value) async {
    String extra = json.encode({'ok': value});
    await Im.setMessageExtra(widget.message.messageId, extra);
    eventCenter.emit('MsgExtraChanged',
        {'messageId': widget.message.messageId, 'extra': extra});
  }

  _voteNo() async {
    await _vote(false);
  }

  _voteYes() async {
    await _vote(true);
  }

  _vote(bool ok) async {
    try {
      await Xhr.postJson(
          '${System.domain}auto/vote',
          {
            'uuid': widget.message.messageUId!,
            'sid': widget.extra['sid'] ?? '',
            'ok': ok ? '1' : '0'
          },
          throwOnError: true);
      String value = ok ? 'yes' : 'no';
      await _setExtra(value);
      if (mounted) {
        setState(() {
          _ok = value;
        });
      }
    } catch (e) {
      if (!mounted) Toast.showCenter(context, e.toString());
    }
  }

  Widget _renderBody() {
    if (_ok == 'yes') {
      return Text(
        K.you_have_evaluate_satisfied,
        style: R.textStyle.body2.copyWith(color: Colors.black),
      );
    } else if (_ok == 'no') {
      return Text(
        K.you_have_evaluate_not_satisfied,
        style: R.textStyle.body2.copyWith(color: Colors.black),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: GestureDetector(
              onTap: _voteNo,
              child: Container(
                width: 58.0,
                height: 24.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: R.colors.mainBrandGradientColors,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                ),
                child: Text(
                  K.chat_not_satisfied,
                  style: const TextStyle(
                    color: Color(0xFFFEFEFE),
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _voteYes,
            child: Container(
              width: 60.0,
              height: 26.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: R.colors.mainBrandGradientColors,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(23.0)),
              ),
              child: Text(
                K.chat_satisfied,
                style: const TextStyle(
                  color: Color(0xFFFEFEFE),
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.0,
      height: 80.0,
      padding: const EdgeInsets.only(
          left: 18.0, right: 18.0, top: 10.0, bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            K.please_evaluate_our_service,
            maxLines: 1,
            style: R.textStyle.body1.copyWith(color: R.colors.mainTextColor),
          ),
          _renderBody()
        ],
      ),
    );
  }
}
