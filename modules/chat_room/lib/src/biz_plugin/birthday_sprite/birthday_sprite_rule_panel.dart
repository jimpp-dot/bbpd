import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

/// 召唤生日小精灵面板
class BirthdaySpriteRulePanel extends StatefulWidget {
  final int rid;
  final String spriteIcon;
  final String ruleUrl;

  const BirthdaySpriteRulePanel(
      {super.key,
      required this.rid,
      required this.spriteIcon,
      required this.ruleUrl});

  @override
  State<BirthdaySpriteRulePanel> createState() =>
      _BirthdaySpriteRulePanelState();

  static Future<bool?> show(
      BuildContext context, int rid, String spriteIcon, String? ruleUrl) async {
    if (Util.isStringEmpty(ruleUrl)) return false;
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      builder: (context) => BirthdaySpriteRulePanel(
          rid: rid, spriteIcon: spriteIcon, ruleUrl: ruleUrl!),
    );
  }
}

class _BirthdaySpriteRulePanelState extends State<BirthdaySpriteRulePanel> {
  bool _isAgree = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          width: Util.width,
          padding: EdgeInsetsDirectional.all(16.dp),
          decoration: BoxDecoration(
            color: const Color(0xB3171621),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.dp)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              _buildRule(),
              _buildAgreement(),
              _buildCallBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        R.img(widget.spriteIcon, width: 50.dp, height: 50.dp),
        SizedBox(width: 5.dp),
        R.img(RoomAssets.chat_room$ic_birthday_sprite_tips_webp,
            width: 195.dp, height: 28.dp),
        const Spacer(),
      ],
    );
  }

  Widget _buildRule() {
    return Container(
      width: Util.width,
      height: 190.dp,
      alignment: AlignmentDirectional.center,
      margin: EdgeInsetsDirectional.only(
          start: 6.dp, top: 18.dp, end: 6.dp, bottom: 15.dp),
      child: BaseWebviewScreen(
          url: widget.ruleUrl, transparent: true, embeddedWidget: true),
    );
  }

  Widget _buildAgreement() {
    return GestureDetector(
      onTap: () {
        _isAgree = !_isAgree;
        refresh();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _isAgree
              ? CheckBoxChecked(width: 18.dp, height: 18.dp)
              : CheckBoxUnchecked(
                  width: 18.dp, height: 18.dp, color: Colors.white30),
          SizedBox(width: 6.dp),
          Text(
            K.room_birthday_sprite_rule_tip,
            style: TextStyle(
                fontSize: 13.dp,
                fontFamily: Util.fontFamily,
                color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCallBtn() {
    return GestureDetector(
      onTap: _callBirthdaySprite,
      child: Container(
        width: 135.dp,
        height: 30.dp,
        margin: EdgeInsetsDirectional.only(
            top: 12.dp, bottom: 10.dp + Util.iphoneXBottom),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFF7D2EE6),
            Color(0xFFFF6BB3),
            Color(0xFFE4FE7C)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(15.dp)),
        ),
        child: Text(
          K.room_call_birthday_sprite,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.dp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _callBirthdaySprite() async {
    if (!_isAgree) {
      Fluttertoast.showCenter(msg: K.room_birthday_sprite_not_agree_tip);
      return;
    }
    NormalNumber resp;
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/yy/room/callElf',
        {'rid': '${widget.rid}'},
        throwOnError: true,
      );
      resp = NormalNumber.fromBuffer(response.bodyBytes);
      if (resp.success) {
        Navigator.of(context).pop(true);
      }
      if (Util.validStr(resp.msg)) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: K.room_birthday_sprite_call_error);
    }
  }
}
