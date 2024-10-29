import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/room_user_profile/room_user_profile_logic.dart';
import 'package:personaldata/k.dart';

/// 房间用户资料卡错误页面
class RoomUserProfileErrorWidget extends StatelessWidget {
  final RoomUserProfileLogic logic;
  final int deleteCode;

  const RoomUserProfileErrorWidget(
      {super.key, required this.logic, required this.deleteCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Util.width,
          constraints: const BoxConstraints(
            minHeight: 300,
          ),
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16),
              topEnd: Radius.circular(16),
            ),
          ),
          child: _renderWaitBody(context),
        ),
      ],
    );
  }

  Widget _renderWaitBody(BuildContext context) {
    if (logic.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (logic.error != null) {
      return ErrorData(
        error: logic.error,
        onTap: () {
          logic.loading = true;
          logic.update();
          logic.reLoad();
        },
      );
    }
    if (logic.isMe == false) {
      if (deleteCode > 0) {
        return _renderForbidden(context, deleteCode);
      }
    }
    return const SizedBox.shrink();
  }

  Widget _renderForbidden(BuildContext context, int code) {
    Map<int, String> res = {
      1: K.account_statue_checking,
      2: K.account_statue_banned_speak,
      3: K.account_statue_banned_speak,
      1000: K.account_statue_pause,
    };
    String message =
        res.containsKey(code) ? res[code]! : K.account_statue_banned;
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 50.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          R.img(Assets.personaldata$forbidden_png, width: 346.5, height: 166.5),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 15.0),
            child: Text(
              message,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
