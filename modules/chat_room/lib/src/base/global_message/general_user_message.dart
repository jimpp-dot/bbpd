import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/gobalRoomMessage.dart';
import 'package:flutter/material.dart';

/// 通用用户飘屏
class GeneralUserMessage extends StatelessWidget {
  static const String generalUserMessage =
      '${RoomConstant.Event_Pb_Prefix}general.user.fly';

  final GlobalMessage data;

  const GeneralUserMessage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 2),
        AvatarWidget(data.uIcon),
        const SizedBox(width: 2),
        _renderCenter(),
        _buildEndIcon(),
      ],
    );
  }

  Widget _renderCenter() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 26,
            child: MarqueeWidget(
              child: _buildMarqueeContent(),
            ),
          ),
          _buildRoomName(),
        ],
      ),
    );
  }

  Widget _buildMarqueeContent() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 2),
        _buildUserInfo(data.uName, data.uTitle, data.uVip, data.uTitleNew),
        _renderContent(),
      ],
    );
  }

  ///  房间名字
  Widget _buildRoomName() {
    return Row(
      children: <Widget>[
        if (data.rid > 0)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 3.0),
            child: R.img(
              "ic_little_room.svg",
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 16,
              height: 16,
            ),
          ),
        if (!Util.isStringEmpty(data.rName))
          Expanded(
            child: Text(
              data.rName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }

  Widget _buildEndIcon() {
    if (!Util.isStringEmpty(data.icon)) {
      return SizedBox(
        width: 74,
        height: 70,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 74,
              height: 70,
              alignment: AlignmentDirectional.center,
              child: CachedNetworkImage(
                imageUrl: Util.parseIcon(data.icon),
                width: 60,
                height: 60,
              ),
            ),
            R.img('ic_gift_mask.png',
                width: 74,
                height: 70,
                package: ComponentManager.MANAGER_BASE_ROOM),
            if (data.giftNum > 1)
              PositionedDirectional(
                end: 6,
                top: 8,
                child: NumText(
                  'X${data.giftNum}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    shadows: [
                      Shadow(
                          offset: Offset(0.0, 2.0),
                          blurRadius: 4.0,
                          color: Color(0xFFFDAE32)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _renderContent() {
    TextStyle style = const TextStyle(
        color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600);
    return Text.rich(
      TextSpan(
        text: data.desc,
        style: style,
        children: <TextSpan>[
          TextSpan(
            text: data.toName,
            style: TextStyle(
              fontFamily: Util.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(
                Utility.getGlobalRoomColor(data.toVip),
              ),
            ),
          ),
          TextSpan(
            text: data.giftName,
            style: TextStyle(
              fontFamily: Util.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFDAE32),
            ),
          ),
        ],
      ),
      maxLines: 1,
    );
  }

  Widget _buildUserInfo(String? name, int? title, int? vip, int titleNew) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserNobilityWidget(
          titleNew: titleNew,
          height: 22.0,
          padding: const EdgeInsetsDirectional.only(end: 2.0),
        ),
        if (vip != null && vip > 0)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 2.0),
            child: UserVipWidget(vip: vip, height: 22),
          ),
        Text(
          '$name',
          maxLines: 1,
          style: TextStyle(
            color: Color(Utility.getGlobalRoomColor(vip)),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
