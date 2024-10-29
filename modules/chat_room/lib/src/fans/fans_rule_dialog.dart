import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

/// 五星活动挑战规则
class FansRuleDialog extends StatelessWidget {
  final String fansRule;

  const FansRuleDialog({Key? key, required this.fansRule}) : super(key: key);

  static Future<bool?> show(BuildContext context, String fansRule) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return FansRuleDialog(fansRule: fansRule);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 6.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          K.room_fans_rule,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: R.color.mainBrandColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 12.0, end: 12.0, bottom: 12.0, top: 12.0),
                          child: Text(
                            fansRule.split('\\n').join('\n'),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: R.color.mainTextColor,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                PositionedDirectional(
                  end: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      alignment: Alignment.center,
                      child: R.img(
                        'room_ic_close.svg',
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
