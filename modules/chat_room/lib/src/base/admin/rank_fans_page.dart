import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/admin/room_admin_screen.dart';
import 'package:chat_room/src/base/page/editFansLabel.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/base/widget/fansLabel.dart';
import 'package:chat_room/src/fans/join_fans_group_screen.dart';
import 'package:chat_room/src/protobuf/generated/ranking_fans.pb.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

/// 粉丝榜
class RankFansPage extends StatefulWidget {
  final int rid;
  final int uid;

  const RankFansPage({
    Key? key,
    required this.rid,
    required this.uid,
  }) : super(key: key);

  @override
  _RankFansPageState createState() {
    return _RankFansPageState();
  }
}

class _RankFansPageState extends State<RankFansPage> with AutomaticKeepAliveClientMixin<RankFansPage>, RefreshMixin<RankFansPage> {
  final GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  FansData? _data;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _load() async {
    ResRankingFans res = await RoomApi.getRoomFansList(widget.rid, widget.uid);
    if (res.success) {
      _data = res.data;
      eventCenter.emit(RoomAdminScreen.Event_Refresh_Rank_Switch, res.hideRank);
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  @override
  refresh() async {
    if (_key.currentState != null) {
      await _key.currentState?.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (_data == null || !showRankListByKey(roomFansKey)) {
      return const EmptyWidget();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildFansTop(),
        Expanded(
          child: buildFansList(),
        ),
        // 房主不展示顶部排名
        if (Session.uid != widget.uid) buildFansBottom(),
      ],
    );
  }

  Widget buildFansTop() {
    String totalMoney;
    if (_data!.liveInfo.money < 10000) {
      totalMoney = '${_data!.liveInfo.money}';
    } else {
      double money = _data!.liveInfo.money ~/ 100 * 100 / 10000; // 取小数点时不进行四舍五入
      NumberFormat format = NumberFormat();
      format.maximumFractionDigits = 2;
      format.minimumFractionDigits = 0;
      totalMoney = '${format.format(money)}W';
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 94,
          width: Util.width,
          padding: const EdgeInsetsDirectional.only(top: 7, start: 16, end: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                R.imagePath(
                  'fans_top_bg.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12, end: 10),
                child: CommonAvatar(
                  path: _data!.liveInfo.icon,
                  shape: BoxShape.circle,
                  onTap: () {
                    RoomNavUtil.showImage(context, _data!.liveInfo.liveUid, const PageRefer('AdminFans'));
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      K.room_anchor_fans_name([(_data!.liveInfo.name)]),
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (showRankScoreByKey(roomFansKey)) ...[
                      const SizedBox(height: 3),
                      Row(
                        children: <Widget>[
                          Text(
                            K.room_week_charm_money,
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          Text(
                            totalMoney,
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
              if (showRankByKey(roomFansKey)) ...[
                const SizedBox(width: 15),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 44,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            R.imagePath(
                              'room_fans_rank_bg.webp',
                              package: ComponentManager.MANAGER_BASE_ROOM,
                            ),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text(
                        _data!.liveInfo.rank,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 2),
                      child: Text(
                        K.room_anchor_ranking,
                        style: const TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(width: 19),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              Text(
                K.room_fans_num(['${_data!.fansCount}']),
                style: TextStyle(fontSize: 15, color: R.color.mainTextColor),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onMoreTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: R.img(
                    'ic_list_more.svg',
                    width: 24,
                    height: 24,
                    color: R.color.secondTextColor,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFansBottom() {
    return Container(
      width: Util.width,
      height: 76,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: R.color.mainTextColor.withOpacity(0.03),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: _data!.currentRank.isFans > 0 ? _FansItem(_data!.currentRank) : buildNoFansBottom(),
    );
  }

  Widget buildFansList() {
    return RefreshIndicatorFactory.of(
        key: _key,
        child: ListView.builder(
          itemCount: _data!.list.length,
          itemBuilder: (BuildContext context, int index) {
            FansList item = _data!.list.elementAt(index);
            return _FansItem(item);
          },
        ),
        onRefresh: () async {
          return _load();
        });
  }

  void onMoreTap() async {
    String? clickType = await showMenu(
      context: context,
      color: const Color(0xFF2D2D2D),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      position: const RelativeRect.fromLTRB(300, 260, 12, 0),
      items: <PopupMenuEntry<String>>[
        // 榜单说明
        PopupMenuItem<String>(
          value: 'fans_detail',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 15),
              R.img('ic_fans_detail.svg', width: 24, height: 24, package: ComponentManager.MANAGER_BASE_ROOM),
              const SizedBox(width: 8),
              Text(
                K.room_fans_rank_detail,
                style: TextStyle(fontSize: 15, color: R.color.mainTextColor),
              ),
            ],
          ),
        ),
        // 房主编辑铭牌
        if (Session.uid == widget.uid)
          PopupMenuItem<String>(
            value: 'edit_label',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  width: 15,
                ),
                R.img('ic_edit_label.svg', width: 24, height: 24, package: ComponentManager.MANAGER_BASE_ROOM),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  K.room_edit_label,
                  style: TextStyle(fontSize: 15, color: R.color.mainTextColor),
                ),
              ],
            ),
          ),
      ],
    );

    if ('fans_detail' == clickType) {
      // 启动H5页面
      BaseWebviewScreen.show(context, url: Util.getHelpUrlWithQStr('k29'));
    } else if ('edit_label' == clickType) {
      // 编辑铭牌
      EditFansLabel.show(context: context, fansLabel: _data!.currentRank.label, uid: widget.uid);
    }
  }

  Widget buildNoFansBottom() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            K.room_to_be_fans_title(['${_data!.fansCount}']),
            maxLines: 1,
            style: TextStyle(fontSize: 14, color: R.color.thirdTextColor),
          ),
        ),
        GestureDetector(
          onTap: _joinFans,
          child: Container(
            width: 90,
            height: 32,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15.5)),
            ),
            alignment: Alignment.center,
            child: Text(
              K.room_to_be_fans_button,
              style: TextStyle(fontSize: 13, color: R.color.mainBgColor),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  void _joinFans() async {
    bool? join = await JoinFansGroupScreen.show(context, rid: widget.rid);

    // 加入粉丝团成功，但是并没有关注主播，帮用户关注下
    if (join == true && _data?.liveInfo.follow == 0) {
      NormalNull res = await BaseRequestManager.onFollow('${_data!.liveInfo.liveUid}', refer: 'rank_fans');
      Log.d('_joinFans res = ${res.success}');
    }

    if (join == true) {
      _load();
    }
  }
}

class _FansItem extends StatelessWidget {
  final FansList item;

  const _FansItem(this.item) : super();

  @override
  Widget build(BuildContext context) {
    String subTitle = K.room_fans_Integral(['${item.credit}']);
    if (item.credit < 10000) {
      subTitle = K.room_fans_Integral(['${item.credit}']);
    } else {
      double money = item.credit ~/ 100 * 100 / 10000; // 取小数点时不进行四舍五入
      NumberFormat format = NumberFormat();
      format.maximumFractionDigits = 2;
      format.minimumFractionDigits = 0;
      subTitle = K.room_fans_Integral(['${format.format(money)}W']);
    }
    if (item.level < 1 && item.creditNeed > 0) {
      subTitle = K.room_fans_short_integral(['${item.creditNeed}']);
    }

    return InkWell(
      onTap: () async {
        RoomNavUtil.showImage(context, item.uid, const PageRefer('AdminFans'));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 0.0, end: 16.0, top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              margin: const EdgeInsetsDirectional.only(end: 5.0),
              alignment: Alignment.center,
              child: showRankByKey(roomFansKey) ? _renderIndex(context, item.rank) : const SizedBox.shrink(),
            ),
            CommonAvatar(
              path: item.icon,
              shape: BoxShape.circle,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        subTitle,
                        style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (item.level > 0)
              FansLabel(
                item.label,
                item.labelImage,
                Util.parseColors(item.labelColors),
                height: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _renderIndex(BuildContext context, int index) {
    if (index == 1 || index == 2 || index == 3) {
      return R.img(
        "rank/top_rank$index.webp",
        width: 30.0,
        height: 30.0,
        package: ComponentManager.MANAGER_BASE_CORE,
      );
    } else {
      return NumText(
        index.toString(),
        style: Theme.of(context).textTheme.bodySmall,
      );
    }
  }
}
