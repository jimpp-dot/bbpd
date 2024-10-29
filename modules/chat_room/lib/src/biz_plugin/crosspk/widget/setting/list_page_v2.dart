import 'package:shared/dart_extensions/widget/box_extension.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

import 'list_item.dart';
import 'search_bar.dart';

/// 跨房对战
class CrossPKListPageV2 extends StatefulWidget {
  final ChatRoomData room;
  final List<RoomCrossPkModeInfo> children;

  const CrossPKListPageV2(
      {Key? key, required this.room, required this.children})
      : super(key: key);

  @override
  State<CrossPKListPageV2> createState() => _CrossPKListPageV2State();
}

class _CrossPKListPageV2State extends State<CrossPKListPageV2>
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
    if (!mounted) return;
    if (rsp.success) {
      setState(() {
        _list = rsp.data.list;
      });
    } else {
      Fluttertoast.showToast(msg: rsp.msg);
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.children.isNotEmpty) ...[
          const SizedBox(height: 6),
          ...widget.children.map((e) => _buildRandomMatch(e)).toList(),
          const SizedBox(height: 6),
        ],
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 6, bottom: 6),
          child: CrossPKSearch(
              onChanged: _onTextChanged, onSubmitted: _onSubmitted),
        ),
        Expanded(child: _buildList()),
      ],
    );
  }

  /// 随机匹配
  Widget _buildRandomMatch(RoomCrossPkModeInfo item) {
    // 匹配赛
    if (item.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_2) {
      return Container(
        height: 112,
        margin: const EdgeInsetsDirectional.only(
            start: 12, end: 12, top: 6, bottom: 6),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        decoration: commonBoxDecorationWithParamsBeginAndEnd([
          const Color(0xFF6A87FF).withOpacity(0.1),
          const Color(0xFFF17A7A).withOpacity(0.1)
        ], 15, Alignment.centerLeft, Alignment.centerRight),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.room_cross_pk_match_title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(K.room_cross_pk_match_sub_title,
                    style: const TextStyle(
                        color: Color(0xFfB8B8B8), fontSize: 11)),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => _onTapMatch(item.mode),
              child: Container(
                width: 70,
                height: 28,
                decoration: commonBoxDecorationWithParamsBeginAndEnd(
                    [Color(0xFF60FFF5), Color(0xFF9EFF4E)],
                    14,
                    Alignment.centerLeft,
                    Alignment.centerRight),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.room_cross_pk_match_start,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (item.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_QUALIFY) {
      // 排位赛
      return Container(
        margin: const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 6, bottom: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 112,
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            decoration: commonBoxDecorationWithParamsBeginAndEnd([
              const Color(0xFF6A87FF).withOpacity(0.1),
              const Color(0xFFF17A7A).withOpacity(0.1)
            ], 15, Alignment.centerLeft, Alignment.centerRight),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          K.room_cross_pk_qualifying_title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () => BaseWebviewScreen.show(context,
                              url: Util.getHelpUrlWithQStr('k163')),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: R.img(RoomAssets.chat_room$ic_help_webp,
                                color: Colors.white.withOpacity(0.6),
                                width: 16,
                                height: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(K.room_cross_pk_qualifying_sub_title,
                        style: const TextStyle(
                            color: Color(0xFfB8B8B8), fontSize: 11)),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => _onTapMatch(item.mode),
                  child: Container(
                    width: 70,
                    height: 28,
                    decoration: commonBoxDecorationWithParamsBeginAndEnd(
                        [Color(0xFF60FFF5), Color(0xFF9EFF4E)],
                        14,
                        Alignment.centerLeft,
                        Alignment.centerRight),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.room_cross_pk_match_start,
                      style: const TextStyle(
                          color: Color(0xFF5636FF),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                // R.img(
                //   RoomAssets.chat_room$crosspk_ic_cross_pk_icon_webp,
                //   width: 80,
                //   height: 45,
                //   package: ComponentManager.MANAGER_BASE_ROOM,
                // ),
              ],
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
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
          mode: RoomCrossPKMode.ROOM_CROSS_PK_MODE_2,
          added: _addedRooms.any((e) => e.rid == item.rid),
          onTapButton: () async {
            CrossPKRepo.invite(
                    rid: widget.room.rid,
                    targetRid: item.rid,
                    mode: RoomCrossPKMode.ROOM_CROSS_PK_MODE_2)
                .then((value) {
              if (mounted) {
                Navigator.of(context).maybePop();
              }
            });
          },
        );
      },
    );
  }

  Future _onTapMatch(RoomCrossPKMode mode) async {
    NormalNull resp = await CrossPKRepo.match(widget.room.rid, mode);
    if (resp.success) {
      Fluttertoast.showCenter(msg: '匹配请求已发送~');
      Navigator.of(context).maybePop();
    }
  }
}
