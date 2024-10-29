import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/page/topic_detail_screen.dart';

import '../../assets.dart';
import '../model/pb/generated/square.pb.dart';
import 'dart:math';

class SquareMasterDialog extends StatelessWidget {
  final SquarePopupRsp bean;

  const SquareMasterDialog({super.key, required this.bean});

  static Future<bool?> show(BuildContext context, SquarePopupRsp bean) {
    return DialogQueue.root.enqueue(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        routeSettings: const RouteSettings(name: 'SquareMasterDialog'),
        builder: (_) {
          return SquareMasterDialog(bean: bean);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              width: 280.dp,
              height: 504.dp,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.moment$master_dialog_bg_webp),
                    fit: BoxFit.fitWidth),
              ),
              child: _buildContent(context),
            ),
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

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        (bean.scene == 0) ? _buildTopArea() : _buildHotTopic(context),
        Container(
          alignment: AlignmentDirectional.center,
          margin: EdgeInsetsDirectional.only(top: 4.dp, bottom: 32.dp),
          width: 272.dp,
          height: 222.dp,
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(18)),
            image: DecorationImage(
                image: AssetImage(Assets.moment$master_content_bg_big_webp),
                fit: BoxFit.fitWidth),
          ),
          child: Column(
            children: [
              SizedBox(height: 12.dp),
              R.img(Assets.moment$master_text_task_webp, height: 18.dp),
              SizedBox(height: 12.dp),
              _buildDecList(),
              SizedBox(height: 23.dp),
              _buildBtn(context),
            ],
          ),
        ),
      ],
    );
  }

  /// banner位
  Widget _buildTopArea() {
    return Container(
        alignment: AlignmentDirectional.center,
        width: 272.dp,
        height: 118.5.dp,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.moment$master_content_top_webp),
              fit: BoxFit.fitWidth),
        ));
  }

  /// 热门话题
  Widget _buildHotTopic(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 272.dp,
        height: 118.5.dp,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(18)),
          image: DecorationImage(
              image: AssetImage(Assets.moment$master_content_bg_small_webp),
              fit: BoxFit.fitWidth),
        ),
        child: Column(
          children: [
            SizedBox(height: 12.dp),
            R.img(Assets.moment$master_text_topic_webp, height: 18.dp),
            SizedBox(height: 12.dp),
            Container(
              height: 68.dp,
              margin: EdgeInsetsDirectional.only(start: 10.dp, end: 10.dp),
              padding: EdgeInsetsDirectional.only(start: 10.dp, end: 10.dp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.dp)),
                  color: const Color(0xFFE1FAF7)),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: R.img(Util.getRemoteImgUrl(bean.topic.icon),
                          width: 48.dp, height: 48.dp)),
                  SizedBox(width: 6.dp),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(bean.topic.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15.dp,
                                  color: Colors.black.withOpacity(0.9),
                                  fontWeight: FontWeight.w800)),
                          if (bean.topic.subTitle.isNotEmpty)
                            Text(bean.topic.subTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.dp,
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.normal))
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        TopicDetailScreen.openTopicDetailScreen(context,
            tagId: bean.topic.id, tagName: bean.topic.name);
      },
    );
  }

  /// 装扮list
  Widget _buildDecList() {
    if (bean.goods.isEmpty) {
      return const SizedBox.shrink();
    }
    List<Widget> res = [];
    int maxCount = 3;
    for (int i = 0; i < min(maxCount, bean.goods.length); i++) {
      res.add(_buildDecItem(bean.goods[i]));
      if (i != maxCount) {
        res.add(SizedBox(width: 11.dp));
      }
    }
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: res);
  }

  /// 装扮item
  Widget _buildDecItem(SquareShop goods) {
    return Container(
      width: 70.dp,
      height: 86.dp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.dp)),
        gradient: LinearGradient(colors: [
          const Color(0xFFCEF5F0),
          const Color(0xFFE1FAF7).withOpacity(0)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 2.dp),
          R.img(Util.getRemoteImgUrl(goods.sourceUrl),
              width: 60.dp, height: 60.dp),
          SizedBox(height: 2.dp),
          Text(
            "${goods.name}${goods.cateName}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black.withOpacity(0.9),
                fontSize: 11,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _buildBtn(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 45.dp,
        width: 212.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: const Color(0xFF0157FF),
          borderRadius: BorderRadius.all(Radius.circular(22.dp)),
        ),
        child: R.img(
            (bean.scene == 0)
                ? Assets.moment$master_text_btn_get_award_webp
                : Assets.moment$master_text_btn_see_webp,
            height: 17.dp),
      ),
      onTap: () {
        Navigator.pop(context);
        (bean.scene == 0)
            ? BaseWebviewScreen.show(context, url: bean.activityUrl)
            : TopicDetailScreen.openTopicDetailScreen(context,
                tagId: bean.topic.id, tagName: bean.topic.name);
      },
    );
  }
}
