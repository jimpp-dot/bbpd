import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/superadmin_quickanswer_data.dart';

/// 超管快捷回复
class SuperAdminQuickAnswerWidget extends StatefulWidget {
  final ChatRoomData? room;

  const SuperAdminQuickAnswerWidget({super.key, this.room});

  @override
  _SuperAdminQuickAnswerWidgetState createState() =>
      _SuperAdminQuickAnswerWidgetState();

  static void show(BuildContext context, {ChatRoomData? room}) {
    displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1.0,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {},
            child: SuperAdminQuickAnswerWidget(room: room),
          );
        });
  }
}

class _SuperAdminQuickAnswerWidgetState
    extends State<SuperAdminQuickAnswerWidget> {
  SuperAdminQuickAnswerRsp? _rsp;

  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _load() async {
    _rsp = await RoomApi.getQuickReplyData(widget.room?.rid ?? 0);

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      height: 376.0 * Util.ratio,
      decoration: const BoxDecoration(
          color: Color(0XB31C1C1E),
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16))),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_rsp == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if (_rsp != null &&
        (_rsp!.success == false ||
            _rsp!.data == null ||
            _rsp!.data!.list == null)) {
      return EmptyWidget(
        onTap: () {
          _load();
        },
        desc: _rsp!.msg ?? BaseK.K.no_data,
      );
    }

    return Column(children: [
      Padding(
        padding: const EdgeInsetsDirectional.only(top: 20, bottom: 3),
        child: Text(
          K.room_superadmin_quickanswer,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0X66FFFFFF),
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: _rsp!.data.list.length,
          itemBuilder: _itemBuilder,
        ),
      ),
    ]);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    String text = _rsp!.data.list[index];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        await OperateUtil.sendText(context, widget.room, text);

        if (mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              height: 55,
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 1,
              color: const Color(0X1AFFFFFF),
            ),
          ],
        ),
      ),
    );
  }
}
