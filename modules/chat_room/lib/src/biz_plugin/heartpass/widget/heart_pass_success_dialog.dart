import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/plugin_lucky.pb.dart';

/// 心动闯关成功
class HeartPassSuccessDialog extends StatelessWidget {
  final ResLuckyBreakSuccess data;

  const HeartPassSuccessDialog({super.key, required this.data});

  static void show(
      {BuildContext? buildContext, required ResLuckyBreakSuccess data}) {
    BuildContext context = buildContext ?? System.context;
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            final ThemeData theme = Theme.of(context);
            final pageChild = HeartPassSuccessDialog(data: data);
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
      useRootNavigator: true,
      routeSettings: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 272.dp,
        height: 286.dp,
        alignment: AlignmentDirectional.topCenter,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(16.dp),
          image: DecorationImage(
              image: AssetImage(
                  RoomAssets.chat_room$heartpass_bg_pass_success_webp),
              fit: BoxFit.fill),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.topCenter,
          children: [
            PositionedDirectional(
              top: 32.dp,
              child: R.img(
                  RoomAssets.chat_room$heartpass_bg_pass_success_medal_webp,
                  width: 262.dp,
                  height: 152.dp),
            ),
            PositionedDirectional(
              top: 100.dp,
              start: 106.dp,
              child: CommonAvatar(
                path: data.icon,
                size: 52.dp,
                shape: BoxShape.circle,
              ),
            ),
            PositionedDirectional(
              bottom: 5.dp,
              child: Container(
                width: 262.dp,
                height: 80.dp,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12.dp)),
                  gradient: const LinearGradient(
                      colors: [Colors.white, Color(0xFFFFE0B2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.dp),
                Text(
                  data.title,
                  style: TextStyle(
                      color: const Color(0xff202020),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.dp),
                ),
                SizedBox(height: 5.dp),
                Text(data.subTitle,
                    style: TextStyle(
                        color: const Color(0x99313131), fontSize: 13.dp)),
                SizedBox(height: 137.dp),
                Text(K.room_heart_pass_success_user_tip,
                    style: TextStyle(
                        color: const Color(0xFFB6811B),
                        fontSize: 14.dp,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12.dp),
                if (data.hurdleList.isNotEmpty)
                  Container(
                    height: 30.dp,
                    alignment: AlignmentDirectional.center,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: data.hurdleList
                          .map((e) => Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 2.dp, end: 2.dp),
                              child: CommonAvatar(
                                  path: e,
                                  shape: BoxShape.circle,
                                  size: 30.dp)))
                          .toList(),
                    ),
                  )
              ],
            ),
            PositionedDirectional(
              top: 12.dp,
              end: 12.dp,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: R.img(
                      RoomAssets.chat_room$heartpass_ic_pass_success_close_webp,
                      width: 20.dp,
                      height: 20.dp)),
            ),
          ],
        ),
      ),
    );
  }
}
