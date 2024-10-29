import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/assets.dart';
import '../../rank.dart';

/// 手气
class LuckyItem extends StatelessWidget {
  final Map data;
  final int? index;

  const LuckyItem({super.key, required this.data, this.index});

  List<Widget> _renderInfo(BuildContext context) {
    int uTitleNew = Util.parseInt(data['utitle_new']);
    int uvip = Util.parseInt(data['uvip']);
    int ucolor = getVipColor(Util.parseInt(data['uvip']), false);
    List<Widget> res = [];
    if (!NobilityUtil.titleIsInvalid(uTitleNew)) {
      res.add(Padding(
          padding: const EdgeInsetsDirectional.only(end: 1.0),
          child: UserNobilityWidget(
            titleNew: uTitleNew,
          )));
    }
    if (uvip > 0) {
      res.add(Padding(
        padding: const EdgeInsetsDirectional.only(
          end: 1.0,
        ),
        child: UserVipWidget(vip: uvip),
      ));
    }
    res.add(Expanded(
      child: Text(
        data['uname'],
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Color(ucolor)),
      ),
    ));

    return res;
  }

  String _getBoxName() {
    if (data.containsKey('name') && data['name'] is String) {
      return data['name'];
    }
    switch (data['type']) {
      case 'gold':
        return BoxUtil.goldBoxName;
      case 'silver':
        return BoxUtil.silverBoxName;
    }

    return BoxUtil.copperBoxName;
  }

  int _getBoxColor() {
    switch (data['type']) {
      case 'gold':
        return 0xFFFFB11D;

      case 'silver':
        return 0xFFA6B2BB;
    }

    return 0xFFD0967C;
  }

  List<Widget> _renderGiftInfo(BuildContext context) {
    if (data['type'] == 'piece') {
      return <Widget>[
        Text(
          K.rank_collect,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          K.rank_rush_together,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.red),
        ),
        Text(
          K.rank_compose,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          data['cname'],
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: const Color(0xFF26A6FF)),
        ),
      ];
    }

    List<Widget> res = [];
    res.add(Text(
      K.rank_open,
      textScaleFactor: 1.0,
      style: Theme.of(context).textTheme.bodySmall,
    ));
    res.add(
      Text(
        _getBoxName(),
        textScaleFactor: 1.0,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Color(_getBoxColor()),
            ),
      ),
    );
    res.add(NumText(
      "x${data['open_num']} ",
      textScaleFactor: 1.0,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: const Color(0xFFFF4F66)),
    ));
    res.add(Text(
      K.rank_get,
      textScaleFactor: 1.0,
      style: Theme.of(context).textTheme.bodySmall,
    ));
    res.add(Text(
      data['cname'],
      textScaleFactor: 1.0,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: const Color(0xFF26A6FF)),
    ));
    res.add(NumText(
      "x${data['cnum']}",
      textScaleFactor: 1.0,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: const Color(0xFFFF4F66)),
    ));
    return res;
  }

  @override
  Widget build(BuildContext context) {
    double paddingSecond = Util.parseInt(data['rid']) > 0 ? 1 : 4;

    int rid = Util.parseInt(data['rid']);

    return InkWell(
      onTap: rid > 0
          ? () {
              RankManager.showRoom(context, rid);
            }
          : null,
      child: Container(
        height: 94,
        padding: const EdgeInsetsDirectional.only(start: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      RankManager.showImage(
                        context,
                        data['uid'],
                        const PageRefer('RankLucky'),
                      );
                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(28.0)),
                      child: data['uicon'] != null &&
                              data['uicon'].toString().isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: System.imageDomain + data['uicon'],
                              suffix: '!head150',
                              width: 56.0,
                              height: 56.0,
                            )
                          : R.img(
                              BaseAssets.shared$ic_user_none_png,
                              package: ComponentManager.MANAGER_BASE_CORE,
                              width: 56.0,
                              height: 56.0,
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: _renderInfo(context),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: paddingSecond, bottom: 0),
                        child: Row(
                          children: _renderGiftInfo(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16.0, top: 16),
                  child: Column(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: System.imageDomain + data['cimage'],
                        width: 45.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
            _renderRoomName(context, rid)
          ],
        ),
      ),
    );
  }

  Widget _renderRoomName(BuildContext context, int rid) {
    if (rid > 0) {
      return Row(
        children: <Widget>[
          Container(width: 68.0),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 2.0),
            child: R.img(
              Assets.room_little_svg,
              // color: R.color.thirdTextColor,
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_RANK,
            ),
          ),
          Expanded(
            child: Text(
              data['rname'],
              maxLines: 1,
              textScaleFactor: 1.0,
              style: R.textStyle.subCaption,
            ),
          ),
          Container(
            width: 60.0,
            margin: const EdgeInsetsDirectional.only(end: 16.0),
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              _getDateline(),
              maxLines: 1,
              style: R.textStyle.subCaption,
            ),
          )
        ],
      );
    } else {
      return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          width: 60.0,
          margin: const EdgeInsetsDirectional.only(end: 16.0),
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            _getDateline(),
            maxLines: 1,
            style: R.textStyle.subCaption,
          ),
        ),
      );
    }
  }

  String _getDateline() {
    int dateline = Util.parseInt(data['dateline']);
    if (dateline > 0) {
      return Utility.getDateDiff(dateline);
    }
    return K.three_days_ago;
  }
}
