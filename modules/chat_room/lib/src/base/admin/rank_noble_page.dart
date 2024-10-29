import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/admin/room_admin_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/ranking_noble.pb.dart';
import 'package:chat_room/src/roomNavUtil.dart';

/// 贵族榜
class RankNoblePage extends StatefulWidget {
  final int rid;

  const RankNoblePage({Key? key, required this.rid}) : super(key: key);

  @override
  State<RankNoblePage> createState() => _RankNoblePageState();
}

class _RankNoblePageState extends State<RankNoblePage>
    with
        AutomaticKeepAliveClientMixin<RankNoblePage>,
        RefreshMixin<RankNoblePage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<NobleList> _data = [];

  // 房间贵族榜，增加开通的底部按钮
  NobilityCenterResponse? _response;
  NobilityMealsResponse? _mealsResponse;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
    _loadNobleInfo();
  }

  _load() async {
    ResRankingNoble res = await RoomApi.getRoomNobleList(widget.rid);
    if (res.success) {
      _data = res.data;
      eventCenter.emit(RoomAdminScreen.Event_Refresh_Rank_Switch, res.hideRank);
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  _loadNobleInfo() async {
    _response = await NobilityRepository.getNobilityInfo();
    _mealsResponse = await NobilityRepository.getNobilitySubscribeList();
    if (mounted) setState(() {});
  }

  @override
  refresh() async {
    if (_key.currentState != null) {
      _key.currentState!.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (_data.isEmpty || !showRankListByKey(roomNobleKey)) {
      return const EmptyWidget();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RefreshIndicatorFactory.of(
            key: _key,
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                NobleList item = _data.elementAt(index);
                return _buildItem(item);
              },
            ),
            onRefresh: () async {
              await _load();
              return;
            },
          ),
        ),
        // 开通爵位
        if (_response?.success == true && _mealsResponse?.success == true)
          _buildTitleBottom(),
      ],
    );
  }

  Widget _buildItem(NobleList item) {
    return InkWell(
      onTap: () async {
        RoomNavUtil.showImage(context, item.uid, const PageRefer('AdminVip'));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 16.0, end: 16.0, top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            CommonAvatar(
              path: item.icon,
              size: 56,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: _renderMessage(item),
                  ),
                ],
              ),
            ),
            NobilityCornerMarker(titleNew: item.titleNew),
          ],
        ),
      ),
    );
  }

  int _getYear(int birthday) {
    if (birthday <= 0) return 0;
    DateTime now = DateTime.fromMillisecondsSinceEpoch(birthday * 1000);
    return ((DateTime.now().millisecondsSinceEpoch -
                now.millisecondsSinceEpoch) /
            86400 /
            1000 /
            365)
        .floor();
  }

  List<Widget> _renderMessage(NobleList item) {
    int age = item.hasBirthday() ? _getYear(item.birthday) : 0;
    int sex = item.hasSex() ? item.sex : 0;
    bool displayInfo = age > 0 && sex > 0;

    List<Widget> output = [];
    if (displayInfo) {
      output.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 4),
        child: UserSexAndAgeWidget(sex: sex, age: age),
      ));
    }

    output.add(
      UserNobilityWidget(
        titleNew: item.titleNew,
        padding: const EdgeInsetsDirectional.only(end: 3.0),
      ),
    );

    return output;
  }

  Widget _buildTitleBottom() {
    if (NobilityUtil.useNewNobilitySystem) {
      return const SizedBox();
    }
    return Container(
      width: Util.width,
      height: 72 + Util.iphoneXBottom,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            offset: const Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
      ),
      child: _response!.openedNobility
          ? _buildReNewArea()
          : _buildOpenNobilityButton(),
    );
  }

  Widget _buildReNewArea() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 10, bottom: 10),
      child: Row(
        children: [
          CommonAvatar(
            path: Session.icon,
            size: 52,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (Session.name),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  K.room_nobility_validity_to +
                      Utility.formatDateToDay(
                          _response?.myInfo?.subscribeTime ?? 0),
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.thirdTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildBuyButton(),
        ],
      ),
    );
  }

  Widget _buildBuyButton() {
    if (_mealsResponse == null) return const SizedBox.shrink();
    if (_mealsResponse?.autoSubscribedType == AutoSubType.Null) {
      return _buildReNewButton();
    } else {
      return _buildOpenedAutoButton();
    }
  }

  Widget _buildReNewButton() {
    return GestureDetector(
      onTap: () async {
        IVipManager manager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        await manager.openNobilityBuyDialog(context);
        _load();
      },
      child: Container(
        width: 68,
        height: 32,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFDBAF63), Color(0xFFF4D49C)]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          K.room_nobility_renewal,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF533400),
          ),
        ),
      ),
    );
  }

  Widget _buildOpenedAutoButton() {
    return Container(
      height: 32,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      decoration: BoxDecoration(
        border:
            Border.all(color: R.color.mainTextColor.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        K.room_nobility_already_auto_sub + _mealsResponse!.autoSubscribedString,
        style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: R.color.thirdTextColor),
      ),
    );
  }

  Widget _buildOpenNobilityButton() {
    return GestureDetector(
      onTap: () async {
        IVipManager manager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        await manager.openNobilityBuyDialog(context);
        _load();
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(
            top: 10, bottom: 10, start: 20, end: 20),
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFDBAF63), Color(0xFFF4D49C)]),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          K.room_nobility_open_privilege,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF533400),
          ),
        ),
      ),
    );
  }
}
