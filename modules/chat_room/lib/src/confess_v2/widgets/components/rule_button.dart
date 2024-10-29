import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

class RuleBtn extends StatelessWidget {
  const RuleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          BaseWebviewScreen.show(context, url: Util.parseActHelpUrl('cprule')),
      child: R.img(
        RoomAssets.chat_room$confess_v2_ic_rule_png,
        width: 36.dp,
        height: 40.dp,
      ),
    );
  }
}
