import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

class NoticeFansWidget extends StatefulWidget {
  final int rid;
  final String title;
  final String content;
  final String btnTitle;
  final VoidCallback? onBtnTap;

  const NoticeFansWidget(this.rid,
      {super.key,
      this.title = '',
      this.content = '',
      this.btnTitle = '',
      this.onBtnTap});

  @override
  _NoticeFansWidgetState createState() => _NoticeFansWidgetState();

  static show(BuildContext context, int rid,
      {String title = '',
      String content = '',
      String btnTitle = '',
      VoidCallback? onBtnTap}) {
    bool hasShow = title == K.room_start_recruit
        ? Config.getBool(BBConfigKey.hasShowNoticeStartRecruitToday(), false)
        : Config.getBool(BBConfigKey.hasShowNoticeFansToday(), false);
    if (!hasShow) {
      displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return NoticeFansWidget(
              rid,
              title: title,
              content: content,
              btnTitle: btnTitle,
              onBtnTap: onBtnTap,
            );
          });
      title == K.room_start_recruit
          ? Config.setBool(BBConfigKey.hasShowNoticeStartRecruitToday(), true)
          : Config.setBool(BBConfigKey.hasShowNoticeFansToday(), true);
    }
  }
}

class _NoticeFansWidgetState extends State<NoticeFansWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(8), topEnd: Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.title.isNotEmpty ? widget.title : K.room_notify_fans,
            style: R.textStyle.medium18,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 34, 20, 40),
            child: Text(
              widget.content.isNotEmpty
                  ? widget.content
                  : K.room_notice_fans_tips,
              style: R.textStyle.regular16
                  .copyWith(color: R.color.secondTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          WidgetUtils.buildDivider(margin: EdgeInsetsDirectional.zero),
          GestureDetector(
            onTap: _tapAction,
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              margin: EdgeInsetsDirectional.fromSTEB(
                20,
                12,
                20,
                12 + Util.iphoneXBottom,
              ),
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors)),
              child: Text(
                widget.btnTitle.isNotEmpty
                    ? widget.btnTitle
                    : K.room_notification,
                style: R.textStyle.regular16.copyWith(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  _tapAction() async {
    if (widget.onBtnTap != null) {
      widget.onBtnTap!();
      Navigator.of(context).pop();
    } else {
      BaseRequestManager.inviteFansJoinRoom('${widget.rid}').then((value) {
        if (value.success) {
          Fluttertoast.showCenter(
              msg: K.room_notice_success_left(['${value.leftInviteNum}']));
        } else {
          Fluttertoast.showCenter(msg: value.msg);
        }
        Navigator.of(context).pop();
      });
    }
  }
}
