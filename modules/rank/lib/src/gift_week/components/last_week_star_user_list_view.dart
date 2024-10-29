import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';

/// 礼物周星榜上周明星人物列表，可循环滚动
class LastWeekStarUserListView extends StatefulWidget {
  final List<WeekStar> weekStarList;

  final int? currRankType;

  const LastWeekStarUserListView(
      {super.key, required this.weekStarList, this.currRankType});

  @override
  State<LastWeekStarUserListView> createState() =>
      _LastWeekStarUserListViewState();
}

class _LastWeekStarUserListViewState extends State<LastWeekStarUserListView> {
  final double _itemHeight = 196;

  late PageController _pageController;

  @override
  void dispose() {
    _pageController.removeListener(_pageScrollListener);
    _pageController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0, viewportFraction: 0.29);
    _pageController.addListener(_pageScrollListener);
  }

  _pageScrollListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Log.d('len = ${widget.weekStarList.length}');

    var list = widget.weekStarList;

    return Container(
      height: _itemHeight,
      alignment: AlignmentDirectional.center,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) =>
            _buildItem(context, index, list[index]),
        separatorBuilder: (context, index) {
          return Container(
            width: 12,
          );
        },
        itemCount: list.length,
      ),
    );
  }

  _buildItem(BuildContext context, int index, WeekStar data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: 106,
        height: _itemHeight,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.imagePath(
                Assets.gift_week_user_week_star_bg_webp,
                package: ComponentManager.MANAGER_RANK)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 1,
            ),

            /// 礼物信息
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: Util.parseIcon(data.giftIcon),
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  data.giftName,
                  style: R.textStyle.medium14
                      .copyWith(color: const Color(0xFFDF4B0E)),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),

            /// 用户头像
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(72)),
                border: Border.all(color: const Color(0xFFFFAD7A), width: 1),
              ),
              child: CommonAvatar(
                path: Util.parseIcon(data.userIcon),
                size: 72,
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(70)),
                onTap: () {
                  /// 跳转个人主页
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageScreen(
                    System.context,
                    data.uid,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            /// 用户名称
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                data.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: R.textStyle.medium14
                    .copyWith(color: const Color(0xFFFFCAA9)),
              ),
            ),
            const SizedBox(
              height: 4,
            ),

            /// 礼物数
            if (_showRankScoreByType(widget.currRankType))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${K.rank_gift_num}${data.giftNum}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: R.textStyle.medium14
                      .copyWith(color: const Color(0xFFDF4B0E)),
                ),
              ),
          ],
        ),
      ),
    );

    // Matrix4 matrix4 = Matrix4.identity();
    // double currScale;
    // double currTrans;
    //
    // double _pageViewHeight = _itemHeight;
    // double _scaleFactor = 0.95;
    //
    // if (index == _currPageValue.floor()) {
    //   /// 当前的Item
    //   currScale = 1 -(_currPageValue - index) * (1 - _scaleFactor);
    //   currTrans = _pageViewHeight * (1 - currScale) /2;
    // } else if (index == _currPageValue.floor() + 1) {
    //   /// 右边的item
    //   currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
    //   currTrans = _pageViewHeight * (1 - currScale) /2;
    // } else if (index == _currPageValue.floor() - 1) {
    //   /// 左边的item
    //   currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    //   currTrans = _pageViewHeight * (1 - currScale) / 2;
    // } else {
    //   /// 不在屏幕显示的item
    //   currScale = _scaleFactor;
    //   currTrans = _pageViewHeight * (1 - _scaleFactor) / 2;
    // }
    // /// 剧中对齐
    // double _itemAlignValue = currTrans;
    // // if (widget.itemAlign == AlignmentDirectional.topCenter) {
    // //   /// 顶部对齐
    // //   _itemAlignValue = 0.0;
    // // } else if (widget.itemAlign == AlignmentDirectional.bottomCenter) {
    // //   /// 底部对齐
    //   _itemAlignValue = 2*currTrans;
    // // }
    // matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0.0, _itemAlignValue , 0.0);
    //
    // return Transform(
    //   transform: matrix4,
    //   child: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 4),
    //     child: Container(
    //       width: 106,
    //       height: _itemHeight,
    //       alignment: AlignmentDirectional.center,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: (R.img(
    //             'gift_week/user_week_star_bg.webp',
    //             package: ComponentManager.MANAGER_RANK,
    //           ) as Image).image,
    //         ),
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           SizedBox(height: 1,),
    //           /// 礼物信息
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               CachedNetworkImage(imageUrl: Util.parseIcon(data.giftIcon),width: 32,height: 32,),
    //               SizedBox(width: 2,),
    //               Text(data.giftName,style: R.textStyle.medium14.copyWith(color: Color(0xFFDF4B0E)),),
    //             ],
    //           ),
    //           SizedBox(height: 12,),
    //           /// 用户头像
    //           Container(
    //             width: 72,
    //             height: 72,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadiusDirectional.all(Radius.circular(72)),
    //               border: Border.all(color: Color(0xFFFFAD7A),width: 1),
    //             ),
    //             child: CommonAvatar(
    //               path: Util.parseIcon(data.userIcon),
    //               size: 72,
    //               borderRadius: BorderRadiusDirectional.all(Radius.circular(70)),
    //               onTap: () {
    //                 /// 跳转个人主页
    //                 IPersonalDataManager personalDataManager = ComponentManager.instance
    //                     .getManager(ComponentManager.MANAGER_PERSONALDATA);
    //                 personalDataManager.openImageScreen(System.context, data.uid,);
    //               },
    //             ),
    //           ),
    //           SizedBox(height: 8,),
    //           /// 用户名称
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 8),
    //             child: Text(data.userName,maxLines: 1,overflow: TextOverflow.ellipsis,style: R.textStyle.medium14.copyWith(color: Color(0xFFFFCAA9)),),
    //           ),
    //           SizedBox(height: 4,),
    //           /// 礼物数
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 8),
    //             child: Text('${K.rank_gift_num}${data.giftNum}',maxLines: 1,overflow: TextOverflow.ellipsis,style: R.textStyle.medium14.copyWith(color: Color(0xFFDF4B0E)),),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

bool _showRankScoreByType(int? rankType) {
  if (rankType == 1) {
    return showRankScoreByKey(giftWeekStarLiveKey);
  }
  if (rankType == 2) {
    return showRankScoreByKey(giftWeekStarPlatformKey);
  }
  if (rankType == 3) {
    return showRankScoreByKey(giftWeekStarBigwigKey);
  }
  return false;
}
