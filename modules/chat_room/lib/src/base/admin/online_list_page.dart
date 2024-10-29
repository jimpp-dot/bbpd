import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/cplove/repo/cplove_repo.dart';
import 'package:chat_room/src/protobuf/generated/online_list.pb.dart';
import 'package:flutter/material.dart' hide SearchBar;

/// 房间在线列表
class OnlineListPage extends StatefulWidget {
  final int rid;
  final Purview? purview;
  final int pos;

  const OnlineListPage({
    Key? key,
    required this.rid,
    this.purview,
    this.pos = -1,
  }) : super(key: key);

  @override
  _OnlineListPageState createState() {
    return _OnlineListPageState();
  }
}

class _OnlineListPageState extends State<OnlineListPage>
    with
        AutomaticKeepAliveClientMixin<OnlineListPage>,
        RefreshMixin<OnlineListPage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<ListData>? _data;
  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();
  Timer? _cancelTimer;
  late ScrollController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();

    _controller = ScrollController();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _cancelTimer?.cancel();
    _closeInput();
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  _load({String? word}) async {
    //_closeInput();
    ResOnlineList res = await RoomApi.getRoomOnlineList(widget.rid, word ?? '');
    if (res.success) {
      _data = res.data.list;
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
    return GestureDetector(
      onTap: _closeInput,
      child: RefreshIndicatorFactory.of(
        key: _key,
        child: _buildContent(),
        onRefresh: () async {
          await _load();
          return;
        },
      ),
    );
  }

  Widget _buildContent() {
    List<Widget> slivers = [];

    if (Session.joinBroker) {
      slivers.add(SliverToBoxAdapter(
        child: _buildSearchBar(),
      ));
    }

    if (_loading) {
      slivers.add(const SliverFillRemaining(
        child: Loading(),
      ));
    } else if (Util.isCollectionEmpty(_data)) {
      slivers.add(const SliverToBoxAdapter(child: EmptyWidget()));
    } else {
      slivers.add(SliverList(
        delegate: FixedExtentSliverChildBuilderDelegate(
          _buildItem,
          childCount: _data!.length,
        ),
      ));
    }

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _controller,
      slivers: slivers,
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 4, bottom: 6),
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        _onQueryChanged,
        key: _inputKey,
        height: 36,
        hintText: K.room_search_by_name_id,
      ),
    );
  }

  _closeInput() {
    if (_inputKey.currentState != null) {
      _inputKey.currentState?.close();
    }
  }

  void _onQueryChanged(String text) {
    setState(() {
      _loading = true;
    });
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  Widget _buildItem(BuildContext context, int index) {
    ListData data = _data!.elementAt(index);
    return InkWell(
      onTap: () async {
        ChatRoomData? room = ChatRoomData.getInstance();
        if (room == null) return;
        int uid = data.uid;

        List<SheetItem> res = [];
        bool isNotPrivate = ChatRoomData.exists() &&
            room.config?.property != RoomProperty.Private;

        bool isJuben = room.config != null &&
            room.config?.property == RoomProperty.Game &&
            room.config?.type == 'juben';
        bool isGame = isJuben ||
            (room.config?.game != null && room.config?.game != Games.None);

        bool isBusinessHeart = room.isBusinessHeart;
        int cpNamingUid = room.config?.cpNamingUser?.uid ?? 0;
        bool isArtCenterInsertOtherRoom = room.isArtCenterInsertOtherRoom;

        if (!isArtCenterInsertOtherRoom &&
            Session.uid != uid &&
            data.role != 'createor' &&
            (widget.purview == Purview.Createor ||
                widget.purview == Purview.SuperAdmin)) {
          if (isNotPrivate) {
            res.add(SheetItem(K.room_pic_other_mic, "mic-pick"));
          }
          res.add(SheetItem(K.room_kickout, "kickout"));
        }

        if (!isArtCenterInsertOtherRoom &&
            isBusinessHeart &&
            Session.uid != uid &&
            (widget.purview == Purview.Createor ||
                widget.purview == Purview.SuperAdmin)) {
          if (cpNamingUid == uid) {
            res.add(SheetItem(K.room_remove_naming_user, 'cancel-naming-user'));
          } else {
            res.add(SheetItem(K.room_set_naming_user, 'set-naming-user'));
          }
        }

        if (Session.uid != uid) {
          res.add(SheetItem(K.room_tab_item_package, "package"));
          res.add(SheetItem(K.room_look_info, "profile"));
        }
        if (!isArtCenterInsertOtherRoom &&
            !isJuben &&
            (widget.purview == Purview.Createor ||
                (room.permission & AdminWriteOperation > 0)) &&
            isNotPrivate &&
            !(room.isKtvRoom || room.isKtvChorusRoom)) {
          if (data.role == 'admin') {
            res.add(SheetItem(K.room_cancel_manage, "admin.cancel"));
          } else {
            res.add(SheetItem(K.room_set_reception_manager, "admin.set.super"));
            res.add(SheetItem(K.room_set_normal_manager, "admin.set"));
          }
        }
        if (res.isEmpty) {
          return;
        }
        SheetCallback? result = await displayModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return RadioBottomSheet(
                  title: K.room_what_do_u_do([(data.name)]), data: res);
            });
        if (result == null || result.reason == SheetCloseReason.Active) {
          return;
        }

        switch (result.value?.key) {
          case 'profile':
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, uid,
                refer: const PageRefer('AdminOnline'));
            break;

          case 'package':
            IGiftManager giftManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_GIFT);
            giftManager.showRoomGiftPanel(context,
                room: ChatRoomData.getInstance(), uid: uid);
            break;

          case 'kickout':
            await ChatRoomUtil.kickOut(context,
                rid: widget.rid, uid: uid, isGame: isGame);
            refresh();
            break;

          case 'mic-pick':
            if (ChatRoomData.exists()) {
              await RoomRepository.joinMic(widget.rid, widget.pos,
                  uid: uid, needCertify: false);
              refresh();
            }
            break;
          case 'admin.cancel':
          case 'admin.set.super':
          case 'admin.set':
            if (!ChatRoomData.exists()) return;
            int adminValue = 0;
            if (result.value?.key == 'admin.set.super') {
              adminValue = 1;
            }
            await RoomRepository.xhrAutoError("room/setAdmin", {
              'rid': ChatRoomData.getInstance()?.rid.toString() ?? '',
              'uid': data.uid.toString(),
              'admin': adminValue.toString(),
              'op': result.value?.key == 'admin.cancel' ? 'remove' : 'add'
            });
            refresh();
            break;
          case 'set-naming-user':
          case 'cancel-naming-user':
            NormalNull normalNull = await CpLoveRepo.setNamingUser(
                ChatRoomData.getInstance()?.rid ?? 0,
                data.uid,
                result.value?.key == 'set-naming-user');
            if (normalNull.success) {
              Fluttertoast.showToast(
                  msg: K.room_operate_success, gravity: ToastGravity.CENTER);
            } else {
              Fluttertoast.showToast(
                  msg: normalNull.msg, gravity: ToastGravity.CENTER);
            }
            break;
        }
      },
      child: OnlineListItem(data, const PageRefer('AdminOnline')),
    );
  }

  _search(String text) {
    _load(word: text);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    _closeInput();
  }
}

class OnlineListItem extends StatelessWidget {
  final ListData data;
  final PageRefer refer;

  const OnlineListItem(this.data, this.refer, {Key? key}) : super(key: key);

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
//    String role = '';
//    bool isCreateor = false;
//    if (data.containsKey('role')) {
//      if (data['role'] == 'createor') {
//        role = R.string('room_owner');
//        isCreateor = true;
//      } else if (data['role'] == 'admin') {
//        role = R.string('room_manage');
//      }
//    }

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
    if (data.hasPopularityLevel()) {
      popularityLevel = Util.parseInt(data.popularityLevel);
    }

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

    ///Rich标签
    if (data.richIcon.isNotEmpty) {
      output.add(Padding(
          padding: const EdgeInsetsDirectional.only(end: 6.0),
          child: R.img(Util.getRemoteImgUrl(data.richIcon), height: 26)));
    }

    // 新贵标签
    if (data.hasNewNobile()) {
      int newNoble = Util.parseInt(data.newNobile);

      if (newNoble > 0) {
        output.add(const Padding(
          padding: EdgeInsetsDirectional.only(end: 3.0),
          child: NewNobleWidget(),
        ));
      }
    } else if (data.hasIsNewer()) {
      // 萌新
      int isNewer = Util.parseInt(data.isNewer);

      if (isNewer > 0) {
        output.add(const Padding(
          padding: EdgeInsetsDirectional.only(end: 3.0),
          child: NewerWidget(),
        ));
      }
    }

    // 归因新用户标签
    if (Session.joinBroker == true && data.hasRookie()) {
      int sevenNew = Util.parseInt(data.rookie.sevenNew);
      int payLevel = Util.parseInt(data.rookie.payLevel);

      output.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 3.0),
        child: UserNewTransferWidget(sevenNew: sevenNew, payLevel: payLevel),
      ));
    }

    return output;
  }

  Widget _renderRole() {
    String role = '';
    if (data.hasRole()) {
      if (data.role == 'createor') {
        role = K.room_owner;
      } else if (data.role == 'admin') {
        role = K.room_manage;
      }
    }
    if (role.isNotEmpty) {
      return Container(
        margin: const EdgeInsetsDirectional.only(start: 4),
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        decoration: const BoxDecoration(
          color: Color(0xFFF1F1F1),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        alignment: Alignment.center,
        child: Text(
          role,
          style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Color(0xFF202020)),
        ),
      );
    }
    return Container();
  }

  ///付费标签
  Widget _renderPayTag() {
    if (!data.showPaidTag) {
      return const SizedBox.shrink();
    }

    String role = K.room_pay;

    return Container(
      margin: const EdgeInsetsDirectional.only(start: 4),
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFACC),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      alignment: Alignment.center,
      child: Text(
        role,
        style: const TextStyle(
            fontSize: 9, fontWeight: FontWeight.w500, color: Color(0xFF924f00)),
      ),
    );
  }

  Widget _renderOnlineTime() {
    int onlineTime = 0;
    if (data.hasOnlineTime()) {
      onlineTime = Util.parseInt(data.onlineTime);
    }
    int min = onlineTime ~/ 60;
    String text = K.room_online_time_minute([min.toString()]);
    return Text(
      text,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: R.color.secondTextColor,
        fontFamily: Util.fontFamily,
      ),
    );
  }

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
                  Row(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxWidth: Util.width - 200),
                        child: Text(
                          data.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: R.textStyle.regular16,
                        ),
                      ),
                      _renderRole(),
                      _renderPayTag(),
                      const Spacer(),
                      if (data.hasMic() && data.mic > 0)
                        Text(
                          K.room_in_mic_already,
                          style: R.textStyle.regular12
                              .copyWith(color: R.color.thirdTextColor),
                        ),
                    ],
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
                  _renderOnlineTime(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
