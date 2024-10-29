import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/admin/room_admin_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/ranking_love.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 真爱榜
class RankLovePage extends StatefulWidget {
  final int rid;

  const RankLovePage({Key? key, required this.rid}) : super(key: key);

  @override
  State createState() => _RankLovePageState();
}

class _RankLovePageState extends State<RankLovePage>
    with
        AutomaticKeepAliveClientMixin<RankLovePage>,
        RefreshMixin<RankLovePage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<LoveList>? _data;

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
    ResRankingLove res = await RoomApi.getRoomLoveList(widget.rid);
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
      return const Center(child: CupertinoActivityIndicator());
    } else if (_data == null ||
        _data!.isEmpty ||
        !showRankListByKey(roomLoveKey)) {
      return const EmptyWidget();
    }
    return RefreshIndicatorFactory.of(
      key: _key,
      child: ListView.builder(
        itemCount: _data!.length,
        itemBuilder: (BuildContext context, int index) {
          LoveList item = _data!.elementAt(index);
          return LoveItemWidget(
            data: item,
            showRoomInfo: false,
          );
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }
}

class LoveItemWidget extends StatelessWidget {
  final LoveList data;
  final bool showRoomInfo;

  const LoveItemWidget({Key? key, required this.data, this.showRoomInfo = true})
      : super(key: key);

  List<Widget> _renderInfo(BuildContext context) {
    int uTitleNew = data.utitleNew;
    int uVip = data.uvip;
    int uPopularity = data.upopularity;
    int uColor = Utility.getVipColor(uVip, false);
    List<Widget> res = [];
    if (!NobilityUtil.titleIsInvalid(uTitleNew)) {
      res.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 1.0),
          child: UserNobilityWidget(
            titleNew: uTitleNew,
          ),
        ),
      );
    }
    if (uVip > 0) {
      res.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 2.0),
          child: UserVipWidget(vip: uVip),
        ),
      );
    }
    if (uPopularity > 0) {
      res.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 2.0),
          child: UserPopularity(popularityLevel: uPopularity),
        ),
      );
    }
    res.add(
      Expanded(
        child: Text(
          data.uname,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Color(uColor), height: 1.0),
        ),
      ),
    );

    return res;
  }

  Widget _renderPackage() {
    int giftId = data.giftid;
    int giftNum = data.giftnum;
    if (giftId > 0) {
      return Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(2.5),
            child: CachedNetworkImage(
              imageUrl: Util.giftImgUrl(giftId),
              width: 45.0,
              height: 45.0,
              cachedWidth: 45.px,
              cachedHeight: 45.px,
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
            )
        ],
      );
    } else {
      // 开通黄金守护
      return R.img(
        "radio_buy_icon_1.png",
        width: 45,
        height: 45,
        package: ComponentManager.MANAGER_BASE_ROOM,
      );
    }
  }

  _onTap(BuildContext context) {
    if (data.rid <= 0 || !showRoomInfo) return;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, data.rid);
  }

  Widget _buildIcon(BuildContext context, bool isTo) {
    int uid = isTo ? data.touid : data.uid;
    String icon = isTo ? data.toicon : data.uicon;
    return GestureDetector(
      onTap: () {
        if (uid > 0) {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, uid,
              refer: const PageRefer('RankLove'));
        }
      },
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: Colors.white, width: 1.0),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(23)),
          child: CommonAvatarWithFrame(
            uid: uid,
            overflow: -3.0,
            childWidget: CachedNetworkImage(
              errorWidgetType: ErrorWidgetType.defaultUserIcon,
              imageUrl: "${System.imageDomain}$icon",
              suffix: '!head150',
              width: 46.0,
              height: 46.0,
            ),
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
            Container(
              width: 96.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 2.0),
              child: R.img(
                'room_little.svg',
                color: R.color.thirdTextColor,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_RANK,
              ),
            ),
            Expanded(
              child: Text(
                data.rname,
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
                Utility.getDateDiff(data.dateline),
                maxLines: 1,
                textScaleFactor: 1.0,
                style: R.textStyle.subCaption,
              ),
            )
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
            Utility.getDateDiff(data.dateline),
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
    int toColor = Utility.getVipColor(data.tovip, false);
    int rid = data.rid;
    int giftId = data.giftid;
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        height: 94,
        margin: const EdgeInsetsDirectional.only(start: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 84,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        PositionedDirectional(
                          start: 36.0,
                          top: 0,
                          child: _buildIcon(context, true),
                        ),
                        _buildIcon(context, false),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 12.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: _renderInfo(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Row(
                              children: [
                                Text(
                                  giftId > 0
                                      ? R.string('rank_reward')
                                      : K.room_protect,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(height: 1.0),
                                ),
                                Flexible(
                                  child: Text(
                                    data.toname,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Color(toColor), height: 1.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 15.0),
                    child: _renderPackage(),
                  )
                ],
              ),
            ),
            _renderRoomName(context, rid),
          ],
        ),
      ),
    );
  }
}
