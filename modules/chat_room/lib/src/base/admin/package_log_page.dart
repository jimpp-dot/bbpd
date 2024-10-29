import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/package_log.pb.dart';

/// 打赏日志
class PackageLogPage extends StatefulWidget {
  final int rid;

  const PackageLogPage({Key? key, required this.rid}) : super(key: key);

  @override
  _PackageLogPageState createState() {
    return _PackageLogPageState();
  }
}

class _PackageLogPageState extends State<PackageLogPage>
    with
        AutomaticKeepAliveClientMixin<PackageLogPage>,
        RefreshMixin<PackageLogPage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<PackageList>? _data;

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
    ResPackageLog res = await RoomApi.getRoomPackageLog(widget.rid);
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
          PackageList item = _data!.elementAt(index);
          return _buildItem(item);
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }

  Widget _buildItem(PackageList item) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 20.0, end: 20.0, top: 11.0, bottom: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: R.color.dividerColor,
            width: 0.0,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 2),
                  child: Text(
                    item.from.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.mainTextColor,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              NumText(
                '+${MoneyConfig.moneyNum(item.money, fractionDigits: 2)}',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  height: 1.2,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 2),
                child: Image.asset(
                  MoneyConfig.moneyIcon,
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  item.to.name,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.secondTextColor,
                  ),
                ),
              ),
              Text(
                item.dateline,
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.secondTextColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
