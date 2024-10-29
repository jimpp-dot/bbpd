import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class UnderIconPositionWidget extends StatelessWidget {
  final String? text;
  final String bg;

  const UnderIconPositionWidget(
      {super.key, this.text, this.bg = 'under/bg_usericon_position.svg'});

  @override
  Widget build(BuildContext context) {
    if (text == null || text!.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      width: 16,
      height: 18,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          R.img(bg, package: ComponentManager.MANAGER_BASE_ROOM),
          Text(
            text!,
            style: R.textStyle.body2
                .copyWith(color: Colors.white, fontFamily: Util.numFontFamily),
          )
        ],
      ),
    );
  }
}
