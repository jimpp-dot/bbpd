import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../K.dart';
import '../../../assets.dart';

/// 升级提示
class LevelUpDialog extends StatefulWidget {
  final String? content;
  final VoidCallback? callBack;

  const LevelUpDialog({Key? key, this.content, this.callBack})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => LevelUpDialogState();

  static Future<void> show(
      BuildContext context, String content, VoidCallback callBack) async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            content: LevelUpDialog(
              content: content,
              callBack: callBack,
            ),
          );
        });
  }
}

class LevelUpDialogState extends State<LevelUpDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsetsDirectional.only(
              start: 24.dp, end: 24.dp, top: 15.dp, bottom: 15.dp),
          width: 300.dp,
          height: 218.dp,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    Assets.personaldata$gift_wall_task_congra_dialog_bg_webp),
                fit: BoxFit.fitWidth),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(K.gift_wall_level_up_title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.dp,
                      fontWeight: FontWeight.w900)),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20.dp, bottom: 20.dp),
                child: Text(widget.content ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.dp,
                        fontWeight: FontWeight.w500)),
              ),
              GestureDetector(
                  onTap: () async {
                    if (widget.callBack != null) {
                      widget.callBack!.call();
                    }
                  },
                  child: Container(
                    width: 184.dp,
                    height: 54.dp,
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Assets
                              .personaldata$gift_wall_gift_bg_btn_bg_pz_webp)),
                    ),
                    child: Text(K.gift_wall_level_up_btn,
                        style: TextStyle(
                            letterSpacing: 8.dp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20.dp)),
                  )),
            ],
          ),
        ),
        SizedBox(height: 20.dp),
        GestureDetector(
          child: R.img(Assets.personaldata$gift_wall_ic_close_svg,
              width: 32.dp,
              height: 32.dp,
              fit: BoxFit.contain,
              package: ComponentManager.MANAGER_PERSONALDATA),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
