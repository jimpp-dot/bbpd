import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';

import '../../rank.dart';
import 'base/rank_item_base.dart';

/// 真爱列表
class LoveItemWidget extends StatelessWidget {
  final int index;
  final LoveItemData data;
  final bool showRoomInfo;

  const LoveItemWidget(
      {Key? key,
      required this.data,
      required this.index,
      this.showRoomInfo = true})
      : super(key: key);

  List<Widget> _renderInfo(BuildContext context) {
    int uTitleNew = data.userFrom.titleNew;
    int uVip = data.userFrom.vip;
    int uPopularity = data.userFrom.popularity;
    int uColor = getVipColor(uVip);
    List<Widget> res = [];

    res.add(
      UserNobilityWidget(
        titleNew: uTitleNew,
        padding: const EdgeInsetsDirectional.only(start: 1.0),
      ),
    );

    if (uVip > 0) {
      res.add(
        UserVipWidget(
          vip: uVip,
          padding: const EdgeInsetsDirectional.only(end: 2.0),
        ),
      );
    }

    if (uPopularity > 0) {
      res.add(
        UserPopularity(
          popularityLevel: uPopularity,
          padding: const EdgeInsetsDirectional.only(end: 2.0),
        ),
      );
    }

    res.add(
      Expanded(
        child: Text(
          data.userFrom.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              R.textStyle.subhead.copyWith(color: Color(uColor), height: 1.0),
        ),
      ),
    );

    return res;
  }

  Widget _renderPackage() {
    int gifId = data.giftId;
    int giftNum = data.giftNum;
    if (gifId > 0) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: CachedNetworkImage(
              imageUrl: Util.squareResize(Util.giftImgUrl(gifId), 150),
              width: 45.0,
              height: 45.0,
            ),
          ),
          if (giftNum > 1)
            PositionedDirectional(
              end: 0,
              top: 0,
              child: Text(
                'x$giftNum',
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      );
    } else {
      // 开通黄金守护
      return R.img(
        RoomAssets.radio_buy_icon_1_png,
        width: 45,
        height: 45,
        package: ComponentManager.MANAGER_BASE_ROOM,
      );
    }
  }

  _onTap(BuildContext context) {
    if (data.rId <= 0 || !showRoomInfo) return;
    RankManager.showRoom(context, data.rId);
  }

  Widget _buildIcon(BuildContext context, ItemUserInfo userInfo) {
    return GestureDetector(
      onTap: () {
        if (userInfo.uid > 0) {
          RankManager.showImage(
              context, userInfo.uid, const PageRefer('RankLove'));
        }
      },
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: Colors.white, width: 1.0),
        ),
        child: CommonAvatarWithFrame(
          uid: userInfo.uid,
          overflow: -3.0,
          childWidget: CommonAvatar(
            path: userInfo.icon,
            size: 46,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _renderRoomName(BuildContext context, int rid) {
    if (rid > 0 && showRoomInfo) {
      return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 96.0),
            R.img(
              Assets.room_little_svg,
              color: R.color.thirdTextColor,
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_RANK,
            ),
            const SizedBox(width: 2.0),
            Expanded(
              child: Text(
                data.rName,
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
                Utility.getDateDiff(data.dateLine),
                maxLines: 1,
                textScaleFactor: 1.0,
                style: R.textStyle.subCaption,
              ),
            ),
          ],
        ),
      );
    } else {
      return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          width: 60.0,
          margin: const EdgeInsetsDirectional.only(end: 16.0),
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            Utility.getDateDiff(data.dateLine),
            maxLines: 1,
            textScaleFactor: 1.0,
            style: R.textStyle.subCaption,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int toColor = getVipColor(data.userTo.vip);
    int rid = data.rId;
    int giftid = data.giftId;
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        height: 94,
        margin: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 84,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      PositionedDirectional(
                        start: 36.0,
                        top: 0,
                        child: _buildIcon(context, data.userTo),
                      ),
                      _buildIcon(context, data.userFrom),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _renderInfo(context),
                      ),
                      Row(
                        children: [
                          Text(
                            giftid > 0
                                ? K.rank_reward
                                : R.string('room_protect'),
                            style: R.textStyle.subhead.copyWith(height: 1.0),
                          ),
                          Flexible(
                            child: Text(
                              data.userTo.name,
                              overflow: TextOverflow.ellipsis,
                              style: R.textStyle.subhead
                                  .copyWith(color: Color(toColor), height: 1.0),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 15.0),
                  child: _renderPackage(),
                )
              ],
            ),
            _renderRoomName(context, rid)
          ],
        ),
      ),
    );
  }
}

class LoveItemData {
  final int rId;
  final String rName;
  final int giftId;
  final int dateLine;
  final int giftNum;
  final ItemUserInfo userFrom;
  final ItemUserInfo userTo;

  LoveItemData.fromJson(Map json)
      : rId = Util.parseInt(json['rid']),
        rName = Util.parseStr(json['rname']) ?? '',
        giftId = Util.parseInt(json['gifid']),
        dateLine = Util.parseInt(json['dateline']),
        giftNum = Util.parseInt(json['giftNum'], 1),
        userFrom = ItemUserInfo(
          Util.parseInt(json['uid']),
          Util.parseInt(json['uvip']),
          Util.parseInt(json['upopularity']),
          Util.parseInt(json['utitle_new']),
          Util.parseStr(json['uname']) ?? '',
          Util.parseStr(json['uicon']) ?? '',
        ),
        userTo = ItemUserInfo(
          Util.parseInt(json['touid']),
          Util.parseInt(json['tovip']),
          Util.parseInt(json['topopularity']),
          Util.parseInt(json['totitle_new']),
          Util.parseStr(json['toname']) ?? '',
          Util.parseStr(json['toicon']) ?? '',
        );
}
