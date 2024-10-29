import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/admin_log.pb.dart';

/// 操作日志
class AdminLogPage extends StatefulWidget {
  final int rid;

  const AdminLogPage({Key? key, required this.rid}) : super(key: key);

  @override
  _AdminLogPageState createState() {
    return _AdminLogPageState();
  }
}

class _AdminLogPageState extends State<AdminLogPage>
    with
        AutomaticKeepAliveClientMixin<AdminLogPage>,
        RefreshMixin<AdminLogPage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<LogList>? _data;

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
    ResAdminLog res = await RoomApi.getRoomAdminLog(widget.rid);
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
          LogList item = _data!.elementAt(index);
          return _buildItem(item);
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }

  Widget _renderMessage(LogList item) {
    return RichText(
      softWrap: true,
      text: TextSpan(
        text: "",
        style: TextStyle(
          color: R.color.mainTextColor,
          fontFamily: Util.fontFamily,
        ),
        children: item.strs
            .map((e) => TextSpan(
                  text: e.k,
                  style: TextStyle(
                    color: e.v == 1
                        ? R.color.mainTextColor
                        : R.color.secondTextColor,
                    fontSize: 14.0,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildItem(LogList item) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 16.0, end: 16.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: R.color.dividerColor,
            width: 0.0,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _renderMessage(item),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              item.dateline,
              style: TextStyle(fontSize: 14.0, color: R.color.secondTextColor),
            ),
          )
        ],
      ),
    );
  }
}
