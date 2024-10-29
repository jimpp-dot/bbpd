import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/protobuf/generated/admin_list.pb.dart';

/// 管理员列表
class AdminListPage extends StatefulWidget {
  final int rid;

  const AdminListPage({Key? key, required this.rid}) : super(key: key);

  @override
  _AdminListPageState createState() {
    return _AdminListPageState();
  }
}

class _AdminListPageState extends State<AdminListPage>
    with
        AutomaticKeepAliveClientMixin<AdminListPage>,
        RefreshMixin<AdminListPage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<AdminList>? _data;

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
    ResAdminList res = await RoomApi.getRoomAdminList(widget.rid);
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
          AdminList item = _data!.elementAt(index);
          return _buildItem(item);
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }

  Widget _buildItem(AdminList item) {
    return InkWell(
      onTap: () async {
        List<SheetItem> res = [];
        res.add(SheetItem(K.room_cancel_manage, "admin-cancel"));
        SheetCallback? result = await displayModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return RadioBottomSheet(
                  title: K.room_what_do_u_do([(item.name)]), data: res);
            });
        if (result == null || result.reason == SheetCloseReason.Active) {
          return;
        }
        await RoomRepository.xhrAutoError('room/setAdmin', {
          'rid': widget.rid.toString(),
          'uid': item.uid.toString(),
          'op': 'remove'
        });
        refresh();
      },
      child: _Item(item, const PageRefer('AdminAdmin')),
    );
  }
}

class _Item extends StatelessWidget {
  final AdminList data;
  final PageRefer refer;

  const _Item(this.data, this.refer) : super();

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

  List<Widget> _renderMessage() {
    int year = 0;
    if (data.hasYear() && data.year > 0) {
      year = data.year;
    } else if (data.hasBirthday()) {
      year = _getYear(Util.parseInt(data.birthday));
    }
    int sex = Util.parseInt(data.sex);
    bool displayInfo = year > 0 && sex > 0;

    int vip = 0;
    int titleNew = 0;
    int popularityLevel = 0;
    // if (data.hasPopularityLevel()) {
    //   popularityLevel = Util.parseInt(data.popularityLevel);
    // }

    if (data.hasVip()) {
      vip = Util.parseInt(data.vip);
    }

    if (data.hasTitleNew()) {
      titleNew = Util.parseInt(data.titleNew);
    }

    List<Widget> output = [];
    // 性别年龄标签
    if (displayInfo) {
      output.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 4),
        child: UserSexAndAgeWidget(
          sex: sex,
          age: year,
        ),
      ));
    }

    if (popularityLevel > 0) {
      output.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 6),
        child: UserPopularity(
          popularityLevel: popularityLevel,
        ),
      ));
    }
    // vip
    if (vip > 0) {
      output.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 6.0),
        child: UserVipWidget(vip: vip),
      ));
    }
    // 头衔
    output.add(
      UserNobilityWidget(
        titleNew: titleNew,
        padding: const EdgeInsetsDirectional.only(end: 6.0),
      ),
    );

    return output;
  }

  // Widget _renderOnlineTime() {
  //   int onlineTime = 0;
  //   if (data.hasOnlineTime()) {
  //     onlineTime = Util.parseInt(data.onlineTime);
  //   }
  //   int min = onlineTime ~/ 60;
  //   String text = K.room_online_time_minute([min.toString()]);
  //   return Text(
  //     text,
  //     style: TextStyle(
  //       fontSize: 11,
  //       fontWeight: FontWeight.w400,
  //       color: R.color.secondTextColor,
  //       fontFamily: Util.fontFamily,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 16.0, end: 16.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          CommonAvatar(
            path: data.icon,
            shape: BoxShape.circle,
            size: 56,
            onTap: () {
              int uid = data.uid;
              if (uid > 0) {
                IPersonalDataManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                manager.openImageScreen(context, uid, refer: refer);
              }
            },
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12.0),
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: R.textStyle.regular16,
                  ),
                  const SizedBox(height: 7),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _renderMessage(),
                    ),
                  ),
                  const SizedBox(height: 7),
                  // _renderOnlineTime(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
