import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'vote_result.dart';

//import 'package:were_wolf/src/room/wolfnew/model/wolf_beans.dart';
import '../../../../k.dart';

class ReplayList extends StatefulWidget {
  final String day;
  final String rid;
  final String permanent_vvc;
  final List<RoomPosition> roomPosition;
  final Map? res;

  const ReplayList(this.rid, this.day, this.permanent_vvc, this.roomPosition,
      {super.key, this.res});

  @override
  State createState() {
    return _ReplayListState();
  }
}

class _ReplayListState extends State<ReplayList>
    with
        AutomaticKeepAliveClientMixin<ReplayList>,
        SingleTickerProviderStateMixin<ReplayList> {
  bool _loading = false;
  Map? _res;
  final List _Nightlist = [];
  final List _dayList = [];

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    _res = widget.res;
    if (_res == null) {
      _loading = true;
      _load();
    } else {
      _initData();
    }
  }

  void _load() async {
    try {
      String url = "${System.domain}roomwolfv2/replayDetail";
      final Map<String, String> params = {
        "rid": widget.rid,
        'day': widget.day,
        "permanent_vvc": widget.permanent_vvc
      };

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      _loading = false;
      _res = response.value();
      if (_res == null || _res!["data"] == null) {
        return;
      }
      _initData();
      if (!mounted) {
        return;
      }
      setState(() {});
    } catch (e) {
      Log.d(e);
      setState(() {
        _loading = false;
      });
    }
  }

  void _initData() {
    _Nightlist.clear();
    _dayList.clear();
    List list = _res!["data"]['list'];
    for (var element in list) {
      if (element['is_night'] == '1') {
        _Nightlist.add(element);
      } else {
        _dayList.add(element);
      }
    }
    if (_Nightlist.isNotEmpty) {
      Map<String, dynamic> nightMap = {
        "action": "title",
        "action_name":
            R.string('wolf_replay_night', args: ['${_res!["data"]['day']}'])
      };
      _Nightlist.insert(0, nightMap);
    }
    if (_dayList.isNotEmpty) {
      Map<String, dynamic> dayMap = {
        "action": "title",
        "action_name":
            R.string('wolf_replay_day', args: ['${_res!["data"]['day']}'])
      };
      _dayList.insert(0, dayMap);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Loading();
    }
    if (_Nightlist.isEmpty && _dayList.isEmpty) {
      return Container();
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildDayWidget(),
          if (_dayList.isNotEmpty) const SizedBox(height: 12),
          _buildNightWidget(),
        ],
      ),
    );
  }

  Widget _buildNightWidget() {
    if (_Nightlist.isEmpty) {
      return Container();
    }
    List<Widget> res = [];
    for (var element in _Nightlist) {
      Widget widget = _buildItem(element);
      res.add(widget);
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 8, start: 5, end: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFCCCAE5),
      ),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: res),
    );
  }

  Widget _buildDayWidget() {
    if (_dayList.isEmpty) {
      return Container();
    }
    List<Widget> res = [];
    for (var element in _dayList) {
      Widget widget = _buildItem(element);
      res.add(widget);
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 8, start: 5, end: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFCCCAE5),
      ),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: res),
    );
  }

  Widget _buildItem(dynamic item) {
    switch (item['action']) {
      case 'title':
        return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            child: _buildTitleItemWidget(item['action_name']));
      case 'wolf.kill': //狼人杀人--阵营行为
        int position = Util.parseInt(item['to_position']);
        int uid = Util.parseInt(item['to_uid']);
        String role = item['to_role'];
        String icon = item['to_icon'];
        String name = item['action_name'];
        return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            child: _buildTargetItemWidget(name, position, uid, icon, role,
                action: item['action']));
      case 'seer.role': //预言家查验目标
      case 'guard.role': //守护守卫目标
      case 'witch.antidote': //女巫对目标使用解药
      case 'witch.position': //女巫对目标使用毒药
      case 'hunter.gun': //猎人开枪目标
      case 'police.change': //移交警徽
        int fromPosition = Util.parseInt(item['from_position']);
        int fromUid = Util.parseInt(item['from_uid']);
        String fromIcon = item['from_icon'];
        String fromRole = item['from_role'];
        int toPosition = Util.parseInt(item['to_position']);
        int toUid = Util.parseInt(item['to_uid']);
        String toIcon = item['to_icon'];
        String toRole = item['to_role'];
        String name = item['action_name'];
        return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            child: _buildTargetItemWidget(
                name, toPosition, toUid, toIcon, toRole,
                fromPosition: fromPosition,
                fromUid: fromUid,
                fromIcon: fromIcon,
                fromRole: fromRole));
      case 'wolf.explode': //狼人自爆
        String name = item['action_name'];
        int position = Util.parseInt(item['from_position']);
        int uid = Util.parseInt(item['from_uid']);
        String icon = item['from_icon'];
        String role = item['from_role'];
        return Container(
          margin: const EdgeInsetsDirectional.only(bottom: 6),
          padding: const EdgeInsetsDirectional.only(
              top: 12, bottom: 12, start: 5, end: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFFEFEEFC),
          ),
          alignment: Alignment.center,
          child: _buildWolfBombItemWidget(name, position, uid, icon, role),
        );
      case 'daytime.votePublishDead': //投票公布死亡
      case 'daytime.publishDead': //白天公布死亡
      case 'daytime.gunPublishDead': //猎人开枪公布死亡
        String name = item['action_name'];
        List list = item['action_detail'];
        return Container(
            margin: const EdgeInsetsDirectional.only(bottom: 6),
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xFFEFEEFC),
            ),
            alignment: Alignment.center,
            child: _buildDeadItemWidget(item['action'], name, list));
      case 'police.voteResult': //警长竞选投票结果
      case 'daytime.voteResult': //正常投票结果
        String name = item['action_name'];
        Map<int, List<int>> votes = {};
        List? liveList;
        int? killPosition;
        Map? res = item['action_detail'];
        if (res != null) {
          killPosition = Util.parseInt(res['killPosition']);
          liveList = res['posUserDataMap'];
          List voteList = res['newVoteResultPosMap'];
          for (var element in voteList) {
            if (element['key'] is! int) continue;
            votes[element['key']] = [];
            List? value = element['value'];
            if (value != null && value.isNotEmpty) {
              for (var vl in value) {
                votes[element['key']]!.add(vl);
              }
            }
          }
        }
        return _buildVoteItemWidget(
            votes, liveList ?? [], item['action'], name, killPosition ?? 0);

      case 'police.unchange': //撕毁警徽
        String name = item['action_name'];
        int position = Util.parseInt(item['from_position']);
        int uid = Util.parseInt(item['from_uid']);
        String icon = item['from_icon'];
        String role = item['from_role'];
        return Container(
          margin: const EdgeInsetsDirectional.only(bottom: 6),
          padding: const EdgeInsetsDirectional.only(
              top: 12, bottom: 12, start: 5, end: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFFEFEEFC),
          ),
          alignment: Alignment.center,
          child: _buildOneTargetWidget(
              position, uid, icon, role, item['action'],
              actionName: name),
        );
    }
    return Container();
  }

  Widget _buildTargetItemWidget(String actionName, int toPosition, int toUid,
      String toIcon, String toRole,
      {int? fromPosition,
      int? fromUid,
      String? fromIcon,
      String? fromRole,
      String? action}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (action != null && 'wolf.kill' == action)
          R.img('wolfv2/wolf_team_icon.webp',
              width: 103 * Util.ratio,
              height: 43,
              package: ComponentManager.MANAGER_WERE_WOLF,
              fit: BoxFit.fill),
        if (action == null)
          renderVoterItemCircleWidget(
              fromPosition ?? 0, fromUid ?? 0, fromRole ?? '', fromIcon ?? ''),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            R.img('wolfv2/wolf_action_right_icon.svg',
                width: 31,
                height: 16,
                package: ComponentManager.MANAGER_WERE_WOLF),
            const SizedBox(height: 7),
            Container(
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                  color: const Color(0xFF6E58C4),
                ),
                alignment: Alignment.center,
                child: Text(actionName,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)))
          ],
        ),
        const Spacer(),
        renderVoterItemCircleWidget(toPosition, toUid, toRole, toIcon)
      ],
    );
  }

  Widget _buildVoteItemWidget(Map<int, List<int>> votes, List liveList,
      String action, String name, int killPosition) {
    Map? killData = killPosition >= 0 && killPosition < liveList.length
        ? liveList[killPosition]
        : null;
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 6),
      padding: const EdgeInsetsDirectional.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFEFEEFC),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[_buildTagWidget(name), const Spacer()],
            ),
            const SizedBox(height: 6),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                child: VoteResultWidget(votes,
                    livelist: liveList, bgColor: Colors.transparent)),
            const SizedBox(height: 18),
            if (killData != null)
              Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                  child: _buildOneTargetWidget(
                      killPosition,
                      Util.parseInt(killData['uid']),
                      killData['icon'],
                      killData['role'],
                      action)),
            if (killData == null)
              Container(
                  width: 122,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: const Color(0xFF6E58C4),
                  ),
                  child: Text(
                      'police.voteResult' == action
                          ? K.wolf_no_win_police_vote
                          : K.wolf_no_win_kill_vote,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)))
          ]),
    );
  }

  Widget _buildDeadItemWidget(String action, String actionName, List list) {
    List<Widget> res = [];
    for (var element in list) {
      int position = Util.parseInt(element['position']);
      int uid = Util.parseInt(element['uid']);
      String icon = element['icon'];
      String role = element['role'];
      res.add(renderVoterItemCircleWidget(position, uid, role, icon));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[_buildTagWidget(actionName), const Spacer()],
        ),
        const SizedBox(height: 6),
        Padding(
            padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
            child: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              children: res,
            ))
      ],
    );
  }

  Widget _buildWolfBombItemWidget(
      String actionName, int position, int uid, String icon, String role) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        renderVoterItemCircleWidget(position, uid, role, icon),
        const Spacer(),
        R.img('wolfv2/wolf_action_right_icon.svg',
            width: 31, height: 16, package: ComponentManager.MANAGER_WERE_WOLF),
        const Spacer(),
        SizedBox(
            width: 95,
            height: 30,
            child: Stack(
              children: <Widget>[
                PositionedDirectional(
                    top: 5,
                    child: Container(
                      width: 95,
                      height: 25,
                      alignment: AlignmentDirectional.centerStart,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        color: const Color(0xFF6E58C4),
                      ),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.only(start: 36),
                          child: Text(actionName,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                    )),
                PositionedDirectional(
                    start: 8,
                    child: R.img('wolfv2/wolf_bomb_icon.webp',
                        width: 28,
                        height: 28,
                        package: ComponentManager.MANAGER_WERE_WOLF))
              ],
            ))
      ],
    );
  }

  Widget _buildTitleItemWidget(String actionName) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        R.img('wolfv2/wolf_replay_left_icon.svg',
            width: 36, height: 15, package: ComponentManager.MANAGER_WERE_WOLF),
        const SizedBox(width: 5),
        Text(actionName,
            style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF6E58C4),
                fontWeight: FontWeight.w600)),
        const SizedBox(width: 5),
        R.img('wolfv2/wolf_replay_right_icon.svg',
            width: 36, height: 15, package: ComponentManager.MANAGER_WERE_WOLF),
      ],
    );
  }

  Widget renderVoterItemCircleWidget(
      int position, int uid, String wolfRole, String icon) {
    WolfRole role = WolfParseUtil.parseRole(wolfRole);
    return SizedBox(
      width: 103 * Util.ratio,
      height: 43.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          R.img(_getImgPath(role),
              package: ComponentManager.MANAGER_WERE_WOLF, fit: BoxFit.fill),
          PositionedDirectional(
            start: 6,
            top: 2,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Session.uid == uid
                      ? const Color(0xFFFFCF71)
                      : const Color(0xFFA295DF),
                ),
              ),
              child: CommonAvatar(
                path: icon,
                size: 32,
                shape: BoxShape.circle,
              ),
            ),
          ),
          PositionedDirectional(
              top: 22,
              start: 2,
              child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(R.imagePath(
                      Session.uid == uid
                          ? "wolfv2/user_icon/wolf_position_self_bg.webp"
                          : "wolfv2/user_icon/wolf_position_bg.webp",
                      package: ComponentManager.MANAGER_WERE_WOLF)),
                  fit: BoxFit.fill,
                )),
                child: Text(
                  Session.uid == uid ? K.wolf_self_position : '${position + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  String _getImgPath(WolfRole role) {
    switch (role) {
      case WolfRole.Werewolf:
        return 'wolfv2/role/img_replay_role_wolf.webp';
      case WolfRole.Seer:
        return 'wolfv2/role/img_replay_role_seer.webp';
      case WolfRole.Witch:
        return 'wolfv2/role/img_replay_role_witch.webp';
      case WolfRole.Guard:
        return 'wolfv2/role/img_replay_role_guard.webp';
      case WolfRole.Hunter:
        return 'wolfv2/role/img_replay_role_hunter.webp';
      case WolfRole.Popular:
        return 'wolfv2/role/img_replay_role_popular.webp';
      default:
        return 'wolfv2/role/img_replay_role_popular.webp';
    }
  }

  Widget _buildTagWidget(String actionName) {
    return Container(
      width: 69,
      height: 22,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(12), bottomEnd: Radius.circular(100)),
        color: Color(0xFF6E58C4),
      ),
      child: Text(actionName,
          style: const TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildOneTargetWidget(
      int positon, int uid, String icon, String role, String action,
      {String? actionName}) {
    String imgPath = '';
    switch (action) {
      case 'police.voteResult': //警长竞选投票结果
        imgPath = 'wolfv2/wolf_police_vote_icon.svg';
        actionName ??= K.wolf_vote_police;
        break;
      case 'daytime.voteResult': //正常投票结果
        imgPath = 'wolfv2/wolf_replay_vote_icon.svg';
        actionName ??= K.wolf_vote_kill;
        break;
      case 'police.unchange': //撕毁警徽
        imgPath = 'wolfv2/wolf_police_unchage_icon.svg';
        actionName ??= K.wolf_police_unchange;
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        renderVoterItemCircleWidget(positon, uid, role, icon),
        const Spacer(),
        R.img('wolfv2/wolf_action_right_icon.svg',
            width: 31, height: 16, package: ComponentManager.MANAGER_WERE_WOLF),
        const Spacer(),
        Container(
          width: 95,
          height: 25,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.5),
            color: const Color(0xFF6E58C4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              R.img(imgPath,
                  width: 19,
                  height: 19,
                  package: ComponentManager.MANAGER_WERE_WOLF),
              const SizedBox(width: 5),
              Text(actionName ?? '',
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600))
            ],
          ),
        )
      ],
    );
  }
}
