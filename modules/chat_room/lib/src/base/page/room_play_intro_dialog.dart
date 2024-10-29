import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

/// 房间玩法说明
class RoomPlayIntroDialog extends StatelessWidget {
  final String intro;

  const RoomPlayIntroDialog(this.intro, {super.key});

  static show(BuildContext context, String intro) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return RoomPlayIntroDialog(intro);
          }),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
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
        width: Util.width,
        height: Util.width - 32 * 2,
        margin: const EdgeInsetsDirectional.only(start: 32, end: 32),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Text(
                    K.room_play,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  PositionedDirectional(
                    end: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 56,
                        padding: const EdgeInsetsDirectional.only(end: 16),
                        child: R.img(
                          BaseAssets.shared$ic_dialog_close_png,
                          color: R.color.mainTextColor,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, bottom: 16),
              child: Divider(
                height: 0.5,
                thickness: 0.5,
                color: R.color.dividerColor,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                  child: Text(
                    intro,
                    style:
                        TextStyle(fontSize: 14, color: R.color.mainTextColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
