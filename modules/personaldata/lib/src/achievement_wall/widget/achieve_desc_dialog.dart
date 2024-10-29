import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../K.dart';
import '../../../assets.dart';

///成就点说明弹窗
class AchieveDescDialog extends StatelessWidget {
  const AchieveDescDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        context: context,
        routeSettings: const RouteSettings(name: 'AchieveDescDialog'),
        builder: (BuildContext context) {
          return const AchieveDescDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.only(start: 42.dp, end: 42.dp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 249.dp),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets
                          .personaldata$achievement_wall_achieve_desc_dialog_bg_webp),
                      fit: BoxFit.contain)),
              child: _buildContent(),
            ),
            SizedBox(height: 30.dp),
            GestureDetector(
              child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg,
                  width: 48.dp, height: 48.dp, fit: BoxFit.contain),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 21.dp, end: 21.dp, top: 24.dp, bottom: 24.dp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          R.img(Assets.personaldata$achievement_wall_achieve_desc_webp,
              height: 16.dp),
          SizedBox(height: 20.dp),
          _buildItem(K.achieve_desc_title_1, K.achieve_desc_content_1),
          SizedBox(height: 20.dp),
          _buildItem(K.achieve_desc_title_2, K.achieve_desc_content_2),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String content) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.dp,
                  fontWeight: FontWeight.w900)),
          SizedBox(height: 12.dp),
          Text(content,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.dp,
                  fontWeight: FontWeight.normal)),
        ]);
  }
}
