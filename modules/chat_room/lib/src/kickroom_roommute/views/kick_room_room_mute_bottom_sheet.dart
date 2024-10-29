import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

import '../models/generated/common_title_skills.pb.dart';
import '../providers/room_general_setting_repository.dart';
import 'pk_skills_confirm_dialog.dart';

/// 踢房/禁言技能库面板

class KickRoomRoomMuteBottomSheet extends StatefulWidget {
  final int uid;
  final String name;
  final String avatarUrl;
  final int rid;
  final bool isOfficial;

  const KickRoomRoomMuteBottomSheet(
      {super.key,
      this.uid = 0,
      this.name = '',
      this.avatarUrl = '',
      this.rid = 0,
      this.isOfficial = false});

  @override
  State<KickRoomRoomMuteBottomSheet> createState() =>
      _KickRoomRoomMuteBottomSheetState();

  static Future<void> show(BuildContext context,
      {Key? key,
      int uid = 0,
      String name = '',
      String avatarUrl = '',
      int rid = 0,
      bool isOfficial = false}) async {
    displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.4),
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return KickRoomRoomMuteBottomSheet(
            key: key,
            uid: uid,
            name: name,
            avatarUrl: avatarUrl,
            rid: rid,
            isOfficial: isOfficial);
      },
      maxHeightRatio: 0.75,
    );
  }
}

class _KickRoomRoomMuteBottomSheetState
    extends State<KickRoomRoomMuteBottomSheet> {
  TitleRoomSkillData? _data;

  bool _loading = true;
  String _errMsg = '';

  final Debounce _debounce =
      Debounce(duration: const Duration(milliseconds: 600));

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _debounce.dispose();
    super.dispose();
  }

  void _loadData() async {
    refresh(() {
      _loading = true;
      _errMsg = '';
    });
    ResTitleRoomSkill resp = await RoomGeneralSettingRepository.skills(
        uid: widget.uid, rid: widget.rid);
    if (resp.success && resp.hasData()) {
      refresh(() {
        _loading = false;
        _errMsg = '';
        _data = resp.data;
      });
    } else if (Util.validStr(resp.msg)) {
      refresh(() {
        _loading = false;
        _errMsg = resp.msg;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFFFFF1DE), Color(0xFFFFF4E5)],
        ),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16),
          topEnd: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  '202303/09/6409926e9dff29.52137673.webp'),
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            top: 10,
            end: 12,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: R.img(
                  BaseAssets.shared$close_icon_svg,
                  width: 18,
                  color: R.color.mainTextColor,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  K.personaldata_skill_title,
                  style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 26),
              Center(
                child: ClipOval(
                  child: Container(
                    width: 86,
                    height: 86,
                    color: Colors.white,
                    child: Center(
                      child: CommonAvatar(
                        path: widget.avatarUrl,
                        size: 80,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      color: Color(0xFF242528),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28),
                child: SizedBox(
                  height: 192,
                  child: _buildBody(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    } else if (Util.validStr(_errMsg)) {
      return Center(
        child: ErrorData(
          error: _errMsg,
          onTap: () {
            _loadData();
          },
        ),
      );
    } else if (Util.validList(_data?.skills)) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: Util.parseInt(_data?.skills.length),
        itemBuilder: (context, index) => _buildItem(index),
      );
    } else if (Util.isCollectionEmpty(_data?.skills)) {
      return EmptyWidget(
        onTap: () {
          _loadData();
        },
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildItem(int index) {
    TitleRoomSkillItem? skill = _data?.skills[index];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: (Util.width - 50) / 2,
          height: 192,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFFDE3BD), width: 0.5),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(skill?.icon ?? ''),
                width: 48,
                height: 48,
                cachedWidth: 48.px,
                cachedHeight: 48.px,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                skill?.name ?? '',
                style: TextStyle(
                    color: R.color.unionRankText1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              if (!widget.isOfficial)
                Expanded(
                  child: Text(
                    skill?.desc ?? '',
                    style: TextStyle(
                        color: R.color.mainTextColor.withOpacity(0.6),
                        fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () => _debounce.call(() => _onTap(skill)),
                  child: Container(
                    height: 42,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFDBAF63), Color(0xFFF4D49C)],
                      ),
                    ),
                    child: Text(
                      skill?.buttonTxt ?? '',
                      style: const TextStyle(
                          color: Color(0xFF533400),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        SizedBox(
            width: index != Util.parseInt(_data?.skills.length) - 1 ? 10 : 0)
      ],
    );
  }

  void _onTap(TitleRoomSkillItem? skill) {
    if (skill?.key == 'kick_out') {
      // 踢人
      PkSkillsConfirmDialog.show(
        context,
        mainTitle: K.room_kick_title,
        subTitle: K.room_kick_desc(['10']),
        cancelButtonText: K.cancel,
        confirmButtonText: K.sure,
        confirmCallback: () async {
          Tracker.instance.track(TrackEvent.click, properties: {
            'click_page': 'click_skillpage_kickout_button',
            'uid': Util.parseInt(widget.uid),
            'rid': Util.parseInt(widget.rid),
          });
          Navigator.of(context).pop();
          ChatRoomData? room = ChatRoomData.getInstance();
          RoomPosition? position = ChatRoomUtil.getPositionByUid(widget.uid);
          await RoomRepository.xhrAutoError('room/kickout?version=2', {
            'rid': '${room != null ? room.realRid : widget.rid}',
            'uid': '${widget.uid}',
            'position': '${position != null ? position.position : -1}',
            'desc': 'noble_kick_room',
            'time': '600',
            'vrid': '0'
          });
        },
      );
    } else if (skill?.key == 'user_mute') {
      // 禁言
      PkSkillsConfirmDialog.show(
        context,
        mainTitle: K.room_mute_title,
        subTitle: K.room_mute_desc(['10']),
        cancelButtonText: K.cancel,
        confirmButtonText: K.sure,
        confirmCallback: () async {
          Tracker.instance.track(TrackEvent.click, properties: {
            'click_page': 'click_skillpage_usermute_button',
            'uid': Util.parseInt(widget.uid),
            'rid': Util.parseInt(widget.rid),
          });
          Navigator.of(context).pop();
          // 用户禁言
          NormalNull resp = await RoomGeneralSettingRepository.roomUserMute(
              uid: widget.uid, rid: widget.rid);
          if (resp.success) {
            Fluttertoast.showCenter(msg: K.room_operate_success);
          } else if (Util.validStr(resp.msg)) {
            Fluttertoast.showCenter(msg: resp.msg);
          }
        },
      );
    }
  }
}
