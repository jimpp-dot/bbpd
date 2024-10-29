import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 房间底部 关注后，主播开播及时通知 面板
///
class BottomFollowDialog extends StatefulWidget {
  final String icon;
  final String name;

  const BottomFollowDialog({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  _BottomFollowDialogState createState() => _BottomFollowDialogState();

  static Future<bool?> show(BuildContext context, String? icon, String? name) {
    return displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return BottomFollowDialog(icon: icon ?? '', name: name ?? '');
      },
    );
  }
}

class _BottomFollowDialogState extends State<BottomFollowDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        _buildInfoContent(),
        _buildAvatar(),
      ],
    );
  }

  Widget _buildInfoContent() {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius:
            const BorderRadiusDirectional.vertical(top: Radius.circular(16)),
      ),
      padding:
          EdgeInsetsDirectional.only(top: 25, bottom: Util.iphoneXBottom + 4),
      child: buildContent(),
    );
  }

  Widget _buildAvatar() {
    return PositionedDirectional(
      top: -30,
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
            border: Border.all(color: R.color.mainBgColor, width: 2.5),
            shape: BoxShape.circle),
        child: CommonAvatar(
          path: widget.icon,
          size: 80,
          shape: BoxShape.circle,
          loadingWidget: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 52),
        Text(
          widget.name,
          style: TextStyle(
              fontSize: 18,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 1,
              color: R.color.dividerColor,
              margin: const EdgeInsetsDirectional.only(end: 2),
            ),
            Text(
              K.room_follow_notify_tips,
              style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
            ),
            Container(
              width: 60,
              height: 1,
              color: R.color.dividerColor,
              margin: const EdgeInsetsDirectional.only(start: 2),
            ),
          ],
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            Navigator.of(context).pop(true);
          },
          child: Container(
            height: 56,
            margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
            decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors)),
            child: Center(
              child: Text(
                K.room_follow_now,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }
}
