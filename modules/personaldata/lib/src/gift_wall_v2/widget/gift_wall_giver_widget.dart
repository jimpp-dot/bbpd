import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/gift_wall_v2/page/gift_wall_giver_rank_dialog.dart';
import 'package:personaldata/k.dart';

class GiftWallGiverWidget extends StatelessWidget {
  final bool isAll;
  final String typ;
  final List<String>? userList;

  /// 送还是收
  final String seriesType;

  const GiftWallGiverWidget(
      {super.key,
      this.userList,
      required this.typ,
      required this.seriesType,
      this.isAll = false});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: Util.width,
        ),
        if (isAll)
          PositionedDirectional(
              top: -9,
              child: R.img(
                Assets.personaldata$gift_wall_giver_top_bg_light_webp,
                width: 160,
                height: 20,
              )),
        R.img(
          isAll
              ? Assets.personaldata$gift_wall_giver_bg_light_webp
              : Assets.personaldata$gift_wall_giver_bg_webp,
          width: 93.dp,
          height: 28.dp,
        ),
        PositionedDirectional(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Fluttertoast.showCenter(msg: K.gift_wall_giver_all_toast);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 5),
                child: R.img(
                  Assets.personaldata$gift_wall_giver_text_webp,
                  width: 37.dp,
                  height: 17.dp,
                ),
              ),
            ),
            (userList != null && userList!.isNotEmpty)
                ? _headerWidget(context)
                : R.img(
                    Assets.personaldata$gift_wall_empty_giver_webp,
                    width: 16.dp,
                    height: 16.dp,
                  ),
          ],
        )),
      ],
    );
  }

  Widget _headerWidget(BuildContext context) {
    List<Widget> topUsers = userList!
        .mapIndexed((i, e) => PositionedDirectional(
            start: (i * 9).dp,
            child: Container(
              width: 16.dp,
              height: 16.dp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.dp),
                  color: Colors.white),
              alignment: Alignment.center,
              child: CommonAvatar(
                path: Util.getRemoteImgUrl(e),
                suffix: Util.squareResizeSuffix(50),
                size: 15.dp,
                shape: BoxShape.circle,
              ),
            )))
        .toList();
    return GestureDetector(
      onTap: () {
        if (userList != null && userList!.isNotEmpty) {
          GiftWallGiverRankDialog.show(context, typ, seriesType);
        }
      },
      child: SizedBox(
          width: 8.dp + (topUsers.length * 9).dp,
          height: 16.dp,
          child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              fit: StackFit.loose,
              children: [
                ...topUsers.reversed.toList(),
                PositionedDirectional(
                  end: -5,
                  child: R.img(Assets.personaldata$gift_wall_ic_next_webp,
                      width: 10.dp, height: 10.dp, color: Colors.white),
                ),
              ])),
    );
  }
}
