import 'dart:async';
import 'dart:convert';

import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:shared/model/friend_bean.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';

import '../../chatRoomData.dart';

class RoomInviteFriendWidget extends StatefulWidget {
  final int rid;

  const RoomInviteFriendWidget({super.key, required this.rid});

  @override
  _RoomInviteFriendWidgetState createState() => _RoomInviteFriendWidgetState();
}

class _RoomInviteFriendWidgetState extends State<RoomInviteFriendWidget> with SingleTickerProviderStateMixin {
  final GlobalKey<_RoomInviteListWidgetState> _keyNearly = GlobalKey();
  final GlobalKey<_RoomInviteListWidgetState> _keyGroup = GlobalKey();
  final GlobalKey<_RoomInviteListWidgetState> _keyFriend = GlobalKey();

  final List<String> _tabs = [K.room_friend,
    // K.room_near_person,
    K.room_group_friend];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 0.5,
          // color: R.color.dividerColor,
          margin: const EdgeInsetsDirectional.only(start: 20.0, end: 20, bottom: 15),
        ),
        Container(
          height: 40,
          alignment: AlignmentDirectional.center,
          child: CommonTabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: CommonUnderlineTabIndicator(
              borderSide: BorderSide(width: 4, color: R.color.mainBrandColor),
            ),
            tabs: _tabs.map((tab) => Tab(child: Text(tab))).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const ClampingScrollPhysics(),
            children: <Widget>[
              RoomInviteListWidget(
                type: RoomInviteListType.Friend,
                key: _keyFriend,
                rid: widget.rid,
              ),
              RoomInviteListWidget(
                type: RoomInviteListType.Nearly,
                key: _keyNearly,
                rid: widget.rid,
              ),
              RoomInviteListWidget(
                type: RoomInviteListType.Group,
                key: _keyGroup,
                rid: widget.rid,
              ),
            ],
          ),
        )
      ],
    );
  }
}

enum RoomInviteListType {
  Friend,
  Nearly,
  Group,
}

class RoomInviteListWidget extends StatefulWidget {
  final RoomInviteListType type;
  final int rid;

  const RoomInviteListWidget({super.key, required this.type, required this.rid});

  @override
  State<StatefulWidget> createState() => _RoomInviteListWidgetState();
}

class _RoomInviteListWidgetState extends State<RoomInviteListWidget> {
  final List<FriendItem> _contactList = [];
  bool _loading = true;
  final int pageSize = 20;
  int pageIndex = 1;
  String? _error;

  bool _more = true;
  bool _lock = false;
  final ScrollController _controller = ScrollController();
  String _searchKey = '';
  Timer? _cancelTimer;
  Map? _roomInfo;
  final GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    _load(1);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
    _cancelTimer?.cancel();
  }

  _onScroll() {
    if (!_controller.hasClients) return;
    if (_more == true && _lock == false && _controller.position.maxScrollExtent == _controller.offset) {
      _load(pageIndex + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (widget.type == RoomInviteListType.Friend)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12, start: 20, end: 20, bottom: 10),
            child: SearchBar(
              _onQueryChanged,
              hintText: R.string('input_name_to_search'),
              height: 46,
              searchIcon: R.img(
                'icon_search.svg',
                width: 18,
                height: 18,
                package: ComponentManager.MANAGER_SEARCH,
              ),
            ),
          ),
        Expanded(
          child: _buildBody(),
        ),
      ],
    );
  }

  Widget _buildBody() {
    if (_loading && pageIndex == 1) {
      return const Loading();
    }
    if (_error != null) {
      return Center(
        child: ErrorData(
          error: _error,
          onTap: () => _load(pageIndex),
        ),
      );
    }

    if (widget.type == RoomInviteListType.Friend && _searchKey.isNotEmpty && pageIndex == 1 && _contactList.isEmpty) {
      return _buildEmpty();
    }
    if (_contactList.isEmpty) {
      return EmptyWidget(
        size: 150,
        onTap: () => _load(1),
      );
    }

    return RefreshIndicatorFactory.of(
      key: _key,
      onRefresh: _onRefresh,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10, bottom: 10),
        child: ListView.separated(
          controller: _controller,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _contactList.length,
          padding: const EdgeInsets.all(0.0),
          itemBuilder: (context, index) => _renderContactList(index),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 24),
        ),
      ),
    );
  }

  Widget _renderContactList(int index) {
    return RoomInviteFriendItem(
      _contactList[index],
      widget.type,
      widget.rid,
      roomInfo: _roomInfo,
    );
  }

  Widget _buildEmpty() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Util.height / 3),
      child: Text(
        R.string('no_result'),
        style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
      ),
    );
  }

  Future _onRefresh() async {
    await _load(1);
  }

  _load(int page) async {
    _lock = true;
    String url = '${System.domain}go/yy/friend/data';
    Map<String, String> params = {
      "type": widget.type == RoomInviteListType.Group ? 'group' : 'friend',
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "query": _searchKey,
    };

    if (widget.type == RoomInviteListType.Friend) {
      url = '${System.domain}invite/getFriendsList';
      params = {
        "rid": widget.rid.toString(),
        "page": page.toString(),
        "pageSize": pageSize.toString(),
        "query": _searchKey,
      };
    }

    if (widget.type == RoomInviteListType.Nearly) {
      url = '${System.domain}invite/getNearbyInRoom';
      double lng = Util.parseDouble(Config.get('location.longitude'));
      double lat = Util.parseDouble(Config.get('location.latitude'));
      params = {
        "rid": widget.rid.toString(),
        "page": page.toString(),
        "pageSize": pageSize.toString(),
        "query": '',
        'longitude': lng.toString(),
        'latitude': lat.toString()
      };
    }

    try {
      XhrResponse response = await Xhr.postJson(
        url,
        params,
        throwOnError: true,
        formatJson: url.contains('go/yy/friend/data'),
      );
      Map res = response.value();
      List? list = res['data'];
      if (page == 1) {
        _contactList.clear();
      }

      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          try {
            FriendItem friend = FriendItem.fromJson(item);
            friend.isGroup = widget.type == RoomInviteListType.Group;
            if (friend.uid > 0) {
              _contactList.add(friend);
            }
          } catch (e) {
            Log.d(e);
          }
        }
        if (list.length < pageSize) {
          _more = false;
        } else {
          _more = true;
        }
      } else {
        _more = false;
      }

      pageIndex = page;
      _error = null;
    } catch (e) {
      Log.d(e);
      _error = e.toString();
    }

    if (page == 1 && widget.type == RoomInviteListType.Group && _error == null) {
      //群组请求房间消息发送im
      String url = "${System.domain}room/getFriends/?rid=${widget.rid}";
      XhrResponse response = await Xhr.getJson(url);
      if (response.error == null) {
        _roomInfo = response.value()['room'];
        _error = null;
      } else {
        _error = response.error.toString();
      }
    }

    _loading = false;
    _lock = false;
    if (mounted) {
      setState(() {});
    }
  }

  void _onQueryChanged(String text) {
    setState(() {
      _loading = true;
    });
    _cancelTimer?.cancel();
    _cancelTimer = Timer(Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  /// [query] 搜索key
  void _search(String query) async {
    resetData();
    _searchKey = query;
    _load(1);
  }

  //重置数据并刷行界面
  resetData() {
    _contactList.clear();
    setState(() {});
  }
}

class RoomInviteFriendItem extends StatefulWidget {
  final FriendItem data;
  final RoomInviteListType type;
  final Map? roomInfo;
  final int rid;

  const RoomInviteFriendItem(this.data, this.type, this.rid, {super.key, this.roomInfo});

  @override
  _RoomInviteFriendItemState createState() => _RoomInviteFriendItemState();
}

class _RoomInviteFriendItemState extends State<RoomInviteFriendItem> {
  @override
  Widget build(BuildContext context) {
    String inviteText = needShareToFree() ? (K.free + K.room_invite_empty) : K.room_invite_empty;

    List<String> icons = [];
    if (widget.data.members != null && widget.data.members!.isNotEmpty) {
      for (var member in widget.data.members!) {
        icons.add(member['icon']);
      }
    } else if (widget.data.memberIcons != null) {
      icons = widget.data.memberIcons!;
    }
    String statusStr = '';
    bool fromNearly = false;
    if (widget.type == RoomInviteListType.Nearly) {
      statusStr = widget.data.distanceStr;
      fromNearly = true;
    }

    if (widget.type == RoomInviteListType.Friend) {
      if ((widget.data.room ?? 0) > 0) {
        statusStr = K.room_partying;
      } else if (widget.data.online == 1) {
        statusStr = K.room_present_online;
      } else if (widget.data.online == 2) {
        statusStr = K.room_invisible;
      } else {
        statusStr = widget.data.onlineDiff ?? '';
      }
    }

    bool selected = widget.data.hasInvite;
    return GestureDetector(
      onTap: () {
        if (widget.data.isGroup) {
          IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
          chatManager.openUserChatScreen(
            context,
            type: 'group',
            targetId: widget.data.uid,
            title: widget.data.name,
            official: widget.data.official ?? 0,
          );
        } else {
          IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, widget.data.uid, fromNearby: fromNearly);
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IgnorePointer(
            child: Container(
              child: icons.isNotEmpty
                  ? GroupIconCircle(icons: icons, width: 40)
                  : StatusAvatar(
                      avatarRadius: 19,
                      radius: 20,
                      roomName: widget.data.userConfig?.roomTypeName ?? '',
                      roomIcon: widget.data.userConfig?.acuteIcon ?? '',
                      colors: widget.data.userConfig?.bgColors,
                      userAvatar: widget.data.icon,
                      uid: widget.data.uid,
                      rid: widget.data.room,
                      online: widget.data.online == 1,
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 2),
                  child: Text(
                    widget.data.markName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
                  ),
                ),
                if (widget.type == RoomInviteListType.Group)
                  IDWidget(
                    uid: widget.data.uid,
                    fontColor: R.color.secondTextColor,
                  ),
                // if (widget.type != RoomInviteListType.Group)
                //   Text(
                //     statusStr,
                //     style: R.textStyle.regular14.copyWith(color: R.color.secondTextColor),
                //   ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => _itemClick(widget.data),
            child: Container(
              width: needShareToFree() ? 70 : 54,
              height: 25,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: !selected ? R.color.mainBrandColor : R.color.mainTextColor),
              ),
              child: Text(
                selected ? K.room_has_invite : inviteText,
                style: R.textStyle.medium14.copyWith(fontSize: 13),
              ),
            ),
          )
        ],
      ),
    );
  }

  _itemClick(FriendItem item) async {
    if (item.hasInvite) {
      return;
    }
    if (widget.type == RoomInviteListType.Group) {
      MessageContent content = MessageContent('text', SendUser(Session.uid.toString(), Session.name, Session.icon));
      content.content = K.room_who_invite_join_room([(Session.name), "${widget.roomInfo?['name'] ?? ''}"]);
      content.extra = json.encode({
        'type': 'invite_room',
        'name': widget.roomInfo?['name'] ?? '',
        'prefix': widget.roomInfo?['prefix'] ?? '',
        'icon': widget.roomInfo?['icon'] ?? '',
        'tagName': widget.roomInfo?['tagValue'] ?? '',
        'rid': widget.roomInfo?['rid'] ?? '',
        'from': '${item.uid}'
      });
      content.sentStatus = 'SENT';
      int? result = await Future.any([
        Im.sendMessage(ConversationType.Group, '${item.uid}', content),
        Future.delayed(const Duration(seconds: 2)),
      ]);
      if (result != null && result > 0) {
        item.hasInvite = true;
        Fluttertoast.showCenter(msg: K.invite_has_send_waite);
        if (mounted) {
          setState(() {});
        }
      } else {
        Fluttertoast.showCenter(msg: K.invite_msg_dend_failed);
      }
    } else {
      String type = 'nearby';
      if (widget.type == RoomInviteListType.Friend) {
        type = 'friend';
      }

      if (needShareToFree()) {
        BaseResponse freeResponse = await RoomApi.inviteDrainageShareRoom(
          item.uid.toString(),
          widget.rid.toString(),
        );
        if (!freeResponse.success && Util.validStr(freeResponse.msg)) {
          Fluttertoast.showCenter(msg: freeResponse.msg);
          return;
        }
      }

      BaseResponse response = await RoomApi.inviteUserJoinRoom(
        item.uid.toString(),
        widget.rid.toString(),
        type,
        item.distance ?? 0,
      );
      if (response.success) {
        item.hasInvite = true;
        String sucToast = needShareToFree() ? K.room_share_private_room_for_free : K.invite_has_send_waite;
        Fluttertoast.showCenter(msg: sucToast);
        if (mounted) {
          setState(() {});
        }
      } else {
        Fluttertoast.showCenter(msg: response.msg);
      }
    }
  }

  /// 大小房间：小房支持设置礼物，在这种房间，分享后可免礼物进房
  bool needShareToFree() {
    if (widget.type != RoomInviteListType.Friend) {
      return false;
    }

    ChatRoomData? room = ChatRoomData.getInstance();

    /// 小房间设置了礼物
    return room != null && room.drainagePreviewData != null && Util.parseInt(room.drainagePreviewData!.giftId) > 0;
  }
}
