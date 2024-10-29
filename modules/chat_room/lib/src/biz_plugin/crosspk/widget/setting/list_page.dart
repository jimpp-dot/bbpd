import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

import 'list_item.dart';
import 'search_bar.dart';

class CrossPKListPage extends StatefulWidget {
  final ChatRoomData room;
  final RoomCrossPKMode mode;

  const CrossPKListPage({
    Key? key,
    required this.room,
    this.mode = RoomCrossPKMode.ROOM_CROSS_PK_MODE_2,
  }) : super(key: key);

  @override
  State<CrossPKListPage> createState() => _CrossPKListPageState();
}

class _CrossPKListPageState extends State<CrossPKListPage>
    with AutomaticKeepAliveClientMixin {
  List<RoomCrossPkRole> _list = [];

  final List<RoomCrossPkRole> _addedRooms = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    RespRoomCrossPkList rsp = await CrossPKRepo.getRoomList(widget.room.rid);
    if (rsp.success && mounted) {
      setState(() {
        _list = rsp.data.list;
      });
    } else {
      Toast.show(context, rsp.msg);
    }
  }

  void _search(String text) async {
    RespRoomCrossPkSearch rsp = await CrossPKRepo.search(widget.room.rid, text);
    if (!mounted) return;
    if (rsp.success) {
      setState(() {
        _list = rsp.data.list;
      });
    } else {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  void _onTextChanged(String text) {
    if (text.isEmpty) {
      _load();
    }
  }

  void _onSubmitted(String text) {
    if (text.trim().isNotEmpty) {
      _search(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        _buildRandomMatch(),
        if (widget.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_3)
          _buildInviteScuffleBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CrossPKSearch(
              onChanged: _onTextChanged, onSubmitted: _onSubmitted),
        ),
        Expanded(child: _buildList()),
      ],
    );
  }

  /// 随机匹配
  Widget _buildRandomMatch() {
    return Container(
      height: 60,
      alignment: AlignmentDirectional.center,
      margin: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(RoomAssets.chat_room$crosspk_random_match_bg_webp),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 86),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  K.fast_start,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 1),
                  child: Text(
                    K.pick_a_random_anchor_close_to_your_level,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 18, end: 18),
            child: GestureDetector(
              onTap: () {
                CrossPKRepo.match(widget.room.rid, widget.mode).then((value) {
                  if (mounted) {
                    Navigator.of(context).maybePop();
                  }
                });
              },
              child: Container(
                width: 70,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.room_pk_random_match,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFCF55DD),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 邀请混战
  Widget _buildInviteScuffleBar() {
    return Container(
      height: 60,
      alignment: AlignmentDirectional.center,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(RoomAssets.chat_room$crosspk_invite_bg_webp),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          ..._buildAddedRoom(),
          const Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 18, end: 18),
            child: GestureDetector(
              onTap: () {
                // 3房混战，邀请
                if (_addedRooms.length == 2) {
                  for (var role in _addedRooms) {
                    CrossPKRepo.invite(
                        rid: widget.room.rid,
                        targetRid: role.rid,
                        mode: widget.mode);
                  }
                  if (mounted) {
                    Navigator.of(context).maybePop();
                  }
                }
              },
              child: Container(
                width: 70,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.room_invite_pk,
                  style: TextStyle(
                    fontSize: 12,
                    color: _addedRooms.length == 2
                        ? const Color(0xFF61C8FF)
                        : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAddedRoom() {
    if (_addedRooms.isEmpty) {
      return [_buildRoomIcon(null), _buildRoomIcon(null)];
    } else if (_addedRooms.length == 1) {
      return [_buildRoomIcon(_addedRooms.first), _buildRoomIcon(null)];
    } else {
      return [
        _buildRoomIcon(_addedRooms.first),
        _buildRoomIcon(_addedRooms[1])
      ];
    }
  }

  Widget _buildRoomIcon(RoomCrossPkRole? item) {
    if (item == null) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 12),
        child: R.img(
          RoomAssets.chat_room$crosspk_ic_add_room_svg,
          width: 40,
          height: 40,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 12),
        child: CommonAvatar(
          path: item.icon,
          size: 40,
          shape: BoxShape.circle,
          onTap: () {
            setState(() {
              _addedRooms.remove(item);
            });
          },
        ),
      );
    }
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _list.length,
      itemExtent: 60,
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      itemBuilder: (context, index) {
        RoomCrossPkRole item = _list[index];
        return CrossPKListItem(
          item: item,
          mode: widget.mode,
          added: _addedRooms.any((e) => e.rid == item.rid),
          onTapButton: () async {
            if (widget.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_2 ||
                widget.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_TOWER) {
              // 邀请
              CrossPKRepo.invite(
                      rid: widget.room.rid,
                      targetRid: item.rid,
                      mode: widget.mode)
                  .then((value) {
                if (mounted) {
                  Navigator.of(context).maybePop();
                }
              });
            } else if (widget.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_3) {
              if (_addedRooms.length < 2) {
                setState(() {
                  _addedRooms.add(item);
                });
              }
            }
          },
        );
      },
    );
  }
}
