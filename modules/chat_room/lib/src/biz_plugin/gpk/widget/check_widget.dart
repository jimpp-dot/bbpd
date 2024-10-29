import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/assets.dart';

class CheckedWidget extends StatelessWidget {
  final List<Color> gradientColors;

  const CheckedWidget({super.key, required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        shape: BoxShape.circle,
      ),
      child: R.img(
        RoomAssets.chat_room$gpk_gpk_checkbox_selected_svg,
        width: 16,
        height: 16,
      ),
    );
  }
}
