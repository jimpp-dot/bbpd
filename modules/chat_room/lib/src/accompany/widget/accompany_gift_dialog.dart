import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/accompany/model/accompany_model.dart';

/// 陪伴房神秘礼物弹窗
class AccompanyGiftDialog extends StatelessWidget {
  final AccompanyMysteryGift gift;

  const AccompanyGiftDialog({super.key, required this.gift});

  static void show(
      {BuildContext? buildContext, required AccompanyMysteryGift gift}) {
    BuildContext context = buildContext ?? System.context;
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            final ThemeData theme = Theme.of(context);
            final pageChild = AccompanyGiftDialog(gift: gift);
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: false,
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
        width: 312.dp,
        height: 342.dp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.dp),
          gradient: const LinearGradient(
              colors: [Color(0xFFD000FF), Color(0xFF4C42F5)],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.dp),
            CachedNetworkImage(
                imageUrl: gift.picUrl, width: 141.dp, height: 141.dp),
            SizedBox(height: 16.dp),
            Text(K.room_accompany_get_mystery_gift,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 21.dp)),
            SizedBox(height: 8.dp),
            Text('${gift.name}x${gift.num}',
                style: TextStyle(
                    color: const Color(0xFFFCE78D),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.dp)),
            SizedBox(height: 30.dp),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 263.dp,
                height: 56.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28.dp),
                ),
                child: Text(K.room_known,
                    style: TextStyle(
                        color: const Color(0xFF2206A6),
                        fontSize: 15.dp,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
