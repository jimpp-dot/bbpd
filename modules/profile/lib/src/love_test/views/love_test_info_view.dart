import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/model/pb/generated/act.pb.dart';
import '../../../assets.dart';
import '../../../k.dart';

class LoveTestInfoView extends StatelessWidget {
  final LoveMatchData info;

  final double fontSizeScale;

  const LoveTestInfoView(
      {super.key, required this.info, this.fontSizeScale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.black, width: 1.dp, style: BorderStyle.solid),
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(60.dp * fontSizeScale),
              topEnd: Radius.circular(20.dp * fontSizeScale),
              bottomStart: Radius.circular(20.dp * fontSizeScale),
              bottomEnd: Radius.circular(20.dp * fontSizeScale)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              top: (-10 * fontSizeScale).dp,
              end: (-10 * fontSizeScale).dp,
              child: R.img(Assets.profile$lovetest_love_test_wow_webp,
                  width: (103 * fontSizeScale).dp,
                  height: (77 * fontSizeScale).dp),
            ),
            _buildBody()
          ],
        ));
  }

  _buildBody() {
    return Column(
      children: [
        _buildHeaderView(info),
        _buildTagListView(info.tagList),
        SizedBox(height: (10 * fontSizeScale).dp),
        _buildLineView(),
        _buildBottomView(info)
      ],
    );
  }

  Widget _buildHeaderView(LoveMatchData info) {
    return Container(
      padding: EdgeInsetsDirectional.all(16.dp * fontSizeScale),
      child: Row(children: [
        CommonAvatar(
            path: info.icon,
            size: 80.dp * fontSizeScale,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(40.dp * fontSizeScale)),
        SizedBox(
          width: 10.dp * fontSizeScale,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(K.profile_love_test_resType,
                style: TextStyle(fontSize: 15.dp * fontSizeScale)),
            Text(info.resType,
                style: TextStyle(
                    fontSize: 28.dp * fontSizeScale,
                    fontFamily: Util.numFontFamily))
          ],
        )
      ]),
    );
  }

  Widget _buildTagListView(List<MatchTag> tagList) {
    var tags = tagList.map((e) {
      return _buildTagView(e);
    }).toList();

    return Column(children: tags);
  }

  Widget _buildTagView(MatchTag tag) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
              start: 16.dp * fontSizeScale,
              top: 5.dp * fontSizeScale,
              end: 16.dp * fontSizeScale,
              bottom: 5.dp * fontSizeScale),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tag.title,
                  style: TextStyle(
                      fontSize: 16.dp * fontSizeScale,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 14.dp * fontSizeScale,
              ),
              Expanded(
                  child: Text(tag.desc,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 14.dp * fontSizeScale,
                          color: const Color(0XFF9B8465))))
            ],
          ),
        ),
        PositionedDirectional(
          top: (-14 * fontSizeScale).dp,
          start: 0,
          child: R.img(Assets.profile$lovetest_love_test_mask_webp,
              width: (48 * fontSizeScale).dp, height: (48 * fontSizeScale).dp),
        ),
      ],
    );
  }

  Widget _buildLineView() {
    return Container(
      width: double.infinity,
      height: 1,
      padding: EdgeInsetsDirectional.only(
          start: 16 * fontSizeScale,
          top: 0,
          end: 16 * fontSizeScale,
          bottom: 0),
      child: Container(color: const Color(0xFF9B8465).withOpacity(0.2)),
    );
  }

  Widget _buildBottomView(LoveMatchData info) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 16 * fontSizeScale,
          top: 16 * fontSizeScale,
          end: 16 * fontSizeScale,
          bottom: 30 * fontSizeScale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(K.profile_love_test_best_cp,
                  style: TextStyle(fontSize: 16.dp * fontSizeScale)),
              R.img(Assets.profile$lovetest_love_test_star_webp,
                  width: 22.dp * fontSizeScale, height: 22.dp * fontSizeScale),
              Text(info.bestCpTitle,
                  style: TextStyle(
                      fontSize: 16.dp * fontSizeScale,
                      fontWeight: FontWeight.bold)),
              R.img(Assets.profile$lovetest_love_test_star_webp,
                  width: 22.dp * fontSizeScale, height: 22.dp * fontSizeScale)
            ],
          ),
          SizedBox(
            height: 10.dp * fontSizeScale,
          ),
          Text(info.bestCpDesc,
              style: TextStyle(
                color: const Color(0xFF9B8465),
                fontSize: 14.dp * fontSizeScale,
              )),
        ],
      ),
    );
  }
}
