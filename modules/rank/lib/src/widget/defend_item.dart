import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import '../../rank.dart';
import '../rankManager.dart';

/// 守护榜item
class DefendItem extends StatelessWidget {
  final Map data;
  final int index;

  const DefendItem({super.key, required this.data, required this.index});

  Widget _renderIndex(BuildContext context) {
    if (index <= 2) {
      return R.img(Assets.rank_rank_x_png(index + 1),
          width: 20.0, height: 22.0, package: ComponentManager.MANAGER_RANK);
    } else {
      return Container(
        alignment: Alignment.center,
        width: 23.0,
        child: NumText(
          "${index + 1}",
          textScaleFactor: 1.0,
          style: R.textStyle.caption.copyWith(fontSize: 12),
        ),
      );
    }
  }

  List<Widget> _renderInfo(BuildContext context) {
    int uTitle = Util.parseInt(data['utitle_new']);
    int uVip = Util.parseInt(data['uvip']);
    int uPopularity = Util.parseInt(data['upopularity']);
    List<Widget> res = [];

    if (uTitle > 0) {
      res.add(
        UserNobilityWidget(
          titleNew: uTitle,
          padding: const EdgeInsetsDirectional.only(end: 1.0),
        ),
      );
    }

    if (uVip > 0) {
      res.add(
        UserVipWidget(
          vip: uVip,
          padding: const EdgeInsetsDirectional.only(end: 1.0),
        ),
      );
    }

    if (uPopularity > 0) {
      res.add(UserPopularity(
        popularityLevel: uPopularity,
        padding: const EdgeInsetsDirectional.only(end: 1.0),
      ));
    }

    res.add(
      Expanded(
        child: Text(
          data['uname'] ?? '',
          maxLines: 1,
          textScaleFactor: 1.0,
          overflow: TextOverflow.ellipsis,
          style: R.textStyle.subhead
              .copyWith(color: R.color.mainTextColor, height: 1.1),
        ),
      ),
    );

    if (showRankScoreByKey(homeSweetKey)) {
      res.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10.0, start: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: NumText(
                  "${(Util.parseInt(data['money']) ~/ 100)}",
                  textScaleFactor: 1.0,
                  style:
                      const TextStyle(color: Color(0xFFFF5353), fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.0,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 6.0, start: 8.0),
            child: showRankByKey(homeSweetKey)
                ? _renderIndex(context)
                : const SizedBox.shrink(),
          ),
          Container(
            width: 84.0,
            alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                PositionedDirectional(
                  end: 0.0,
                  top: (72.0 - 48.0) / 2,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          RankManager.showImage(context, data['toid'],
                              const PageRefer('RankDefend'));
                        },
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            border: (data['toheader'] != null &&
                                    !UserImageCacheHelper.instance()
                                        .showLocalFrame)
                                ? Border.all(color: Colors.white, width: 0.0)
                                : Border.all(color: Colors.white, width: 1.0),
                          ),
                          child: CommonAvatarWithFrame(
                            uid: Util.parseInt(data['toid']),
                            overflow: -3.0,
                            childWidget: CommonAvatar(
                              path: data['toicon'] ?? '',
                              size: 46,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      if (data['toheader'] != null &&
                          !UserImageCacheHelper.instance().showLocalFrame)
                        PositionedDirectional(
                          start: -4.0,
                          top: -4.0,
                          child: IgnorePointer(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${System.imageDomain}${data['toheader']}",
                              width: 55.0,
                              height: 55.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                PositionedDirectional(
                  start: 0.0,
                  top: (72.0 - 48.0) / 2,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          RankManager.showImage(context, data['uid'],
                              const PageRefer('RankDefend'));
                        },
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            border: (data['uheader'] != null &&
                                    !UserImageCacheHelper.instance()
                                        .showLocalFrame)
                                ? Border.all(color: Colors.white, width: 0.0)
                                : Border.all(color: Colors.white, width: 1.0),
                          ),
                          child: CommonAvatarWithFrame(
                            uid: Util.parseInt(data['uid']),
                            overflow: -3.0,
                            childWidget: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${System.imageDomain}${data['uicon']}",
                                errorWidgetType:
                                    ErrorWidgetType.defaultUserIcon,
                                suffix: '!head150',
                                width: 46.0,
                                height: 46.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (data['uheader'] != null &&
                          !UserImageCacheHelper.instance().showLocalFrame)
                        PositionedDirectional(
                          start: -4.0,
                          top: -4.0,
                          child: IgnorePointer(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${System.imageDomain}${data['uheader']}",
                              width: 55.0,
                              height: 55.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: _renderInfo(context),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 86),
                  child: Text(
                    data['toname'] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: R.textStyle.subhead
                        .copyWith(color: R.color.mainTextColor, height: 1.1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
