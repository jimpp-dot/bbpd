import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:date_format/date_format.dart';
import 'package:chat_room/src/protobuf/generated/forbidden_log.pb.dart';

/// 封禁日志
class ForbiddenLogPage extends StatefulWidget {
  final int rid;

  const ForbiddenLogPage({Key? key, required this.rid}) : super(key: key);

  @override
  _ForbiddenLogPageState createState() {
    return _ForbiddenLogPageState();
  }
}

class _ForbiddenLogPageState extends State<ForbiddenLogPage>
    with
        AutomaticKeepAliveClientMixin<ForbiddenLogPage>,
        RefreshMixin<ForbiddenLogPage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<ForbiddenList>? _data;

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
    ResForbiddenLog res = await RoomApi.getRoomForbiddenLog(widget.rid);
    if (res.success) {
      _data = res.data;
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
    } else if (_data == null || _data!.isEmpty) {
      return const EmptyWidget();
    }
    return RefreshIndicatorFactory.of(
      key: _key,
      child: ListView.builder(
        itemCount: _data!.length,
        itemBuilder: (BuildContext context, int index) {
          ForbiddenList item = _data!.elementAt(index);
          return _buildItem(item);
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }

  Widget _buildItem(ForbiddenList item) {
    return InkWell(
      onTap: () async {
        List<SheetItem> res = [];
        res.add(SheetItem(K.room_unforbidden, "unforbidden"));
        SheetCallback? result = await displayModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return RadioBottomSheet(data: res);
            });
        if (result == null || result.reason == SheetCloseReason.Active) {
          return;
        }

        await RoomRepository.xhrAutoError("room/unforbidden", {
          'rid': widget.rid.toString(),
          'to': item.uid.toString(),
        });
        refresh();
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 16.0, end: 16.0, top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            CommonAvatar(
              path: item.icon,
              shape: BoxShape.circle,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item.name,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      _getDateline(item),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              _getDuration(item),
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }

  String _getDateline(ForbiddenList item) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(item.dateline * 1000),
        [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
  }

  String _getDuration(ForbiddenList item) {
    int duration = item.duration;
    if (duration >= 86400) {
      return K.room_few_day(["${duration ~/ 86400}"]);
    } else {
      return K.room_few_mins(["${duration ~/ 60}"]);
    }
  }
}
