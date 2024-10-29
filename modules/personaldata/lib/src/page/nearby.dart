import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:personaldata/k.dart';

/// 附近的人
class Nearby extends StatefulWidget {
  final PageRefer? refer;

  const Nearby({Key? key, this.refer}) : super(key: key);

  static Future openNearByScreen(BuildContext context, {Key? key}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const Nearby(
          refer: PageRefer('nearby'),
        );
      },
    ));
  }

  @override
  _NearbyState createState() {
    return _NearbyState();
  }
}

class _NearbyState extends State<Nearby> {
  static const String KEY_NEARBY_SEX = 'nearby.sex';

  String? _cityCode;
  double _longitude = 0;
  double _latitude = 0;

  int _sex = 0;

  bool _loading = false;
  int _pageIndex = 1;
  bool _hasMore = false;
  bool _loadingMoreLock = false;
  bool _nearbyInvisible = false;
  final List _data = [];
  String? _errorMsg;
  late ScrollController _controller;

  final List<String> _followUids = [];

  bool get hasLocation {
    return _longitude != 0.0 && _latitude != 0.0;
  }

  @override
  void initState() {
    super.initState();
    if (Session.sex == 1) {
      // 男性用户默认看女性用户
      _sex = 2;
    } else {
      _sex = 0;
    }
    int localSex = Config.getInt(KEY_NEARBY_SEX, -1);
    if (localSex >= 0) {
      _sex = localSex;
    }
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    _initLocation();
    if (hasLocation) {
      _loading = true;
      _load(1);
    }
  }

  @override
  void dispose() {
    AudioPlay.instance().closeSound();
    _controller.removeListener(_onScroll);
    Location.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: GestureDetector(
          onDoubleTap: _scrollToTop,
          child: Text(
            K.personaldata_nearby,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _onFilter,
            icon: R.img(
              'icon_filter.svg',
              package: ComponentManager.MANAGER_PERSONALDATA,
              color: R.color.mainTextColor,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  /// 双击标题返回top
  _scrollToTop() {
    if (_controller.hasClients) {
      _controller.animateTo(
        0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  _initLocation() async {
    _cityCode = Config.get('location.cityCode');
    _longitude = Util.parseDouble(Config.get('location.longitude'));
    _latitude = Util.parseDouble(Config.get('location.latitude'));
    BBLocationData? loc = await Location.updateLocation();
    if (loc != null && loc.isValid()) {
      if (loc.citycode != null) {
        _cityCode = loc.citycode;
      }
      _longitude = loc.longitude;
      _latitude = loc.latitude;
      if (mounted) {
        setState(() {
          if (_data.isEmpty && _loading == false) {
            _loading = true;
            _load(1);
          }
        });
      }
    }
  }

  _openSettings() async {
    ServiceStatus serviceStatus =
        await Permission.locationWhenInUse.serviceStatus;
    if (serviceStatus == ServiceStatus.enabled) {
      openAppSettings();
    } else {
      if (Platform.isAndroid) {
        AndroidIntent intent = const AndroidIntent(
          action: 'action_location_source_settings',
        );
        await intent.launch();
      } else {
        openAppSettings();
      }
    }
  }

  Future<void> _load(int page) async {
    _loadingMoreLock = true;
    String url = '${System.domain}home/nearby?page=$page&version=1';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'sex': _sex.toString(),
          'cityCode': _cityCode ?? '',
          'longitude': _longitude.toString(),
          'latitude': _latitude.toString(),
        },
        throwOnError: true,
      );

      _loadingMoreLock = false;
      _loading = false;
      if (!mounted) return;
      Map res = response.value();
      List? list = res['data'];
      _nearbyInvisible = res['nearby_invisible'] == true;
      if (list != null && list.length == 1) {
        if (page == 1) {
          _data.clear();
          _followUids.clear();
        }
        List data = list.first['data'] ?? [];
        for (int i = 0; i < data.length; i++) {
          Map item = data[i];
          try {
            ListItem li = _convertData(item);
            _data.add(li);
            if (li.follow) {
              //已关注
              if (!_followUids.contains(li.uid.toString())) {
                _followUids.add(li.uid.toString());
              }
            } else {
              if (_followUids.contains(li.uid.toString())) {
                _followUids.remove(li.uid.toString());
              }
            }
          } catch (e) {
            Log.d(item);
            Log.d(e);
          }
        }

        _pageIndex = page;
        _errorMsg = '';
        _hasMore = res['more'];

        setState(() {});
      }
    } catch (e) {
      Log.d('catch: ${e.toString()}');
      _loadingMoreLock = false;
      _loading = false;
      String message = e.toString();
      if (e is XhrError) {
        Log.d(e.code.toString());
      }
      if (mounted) {
        setState(() {
          _errorMsg = message;
          _hasMore = true;
        });
      }
    }
  }

  Future<void> _reload() async {
    _hasMore = false;
    _pageIndex = 1;
    if (_controller.hasClients) {
      _controller.jumpTo(0.0);
    }
    _load(1);
  }

  //数据转换
  ListItem _convertData(Map data) {
    ListItem item = ListItem.fromJson(data);

    return item;
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent - 40.0 &&
        _hasMore &&
        _loading == false &&
        _loadingMoreLock == false) {
      _loadMore();
    }
  }

  _loadMore() async {
    if (!mounted) return;
    setState(() {
      _errorMsg = '';
    });
    _load(_pageIndex + 1);
  }

  _onFollow(ListItem? item) async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    if (item == null) return;
    NormalNull response =
        await BaseRequestManager.onFollow(item.uid.toString());
    if (response.success) {
      Fluttertoast.showToast(
          msg: R.string('followed'), gravity: ToastGravity.CENTER);
      if (!_followUids.contains(item.uid.toString())) {
        _followUids.add(item.uid.toString());
      }
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
      if (mounted) {
        setState(() {
          //关注失败,需要重新刷新
        });
      }
    }
  }

  _onChat(ListItem? item) async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    if (item == null) return;
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(
      context,
      type: 'private',
      targetId: item.uid,
      title: item.nickName,
    );
  }

  _onTapItem(ListItem? item) {
    if (item != null && item.inRoom > 0) {
      int rid = item.inRoom;
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, rid);
    } else {
      _onTapImage(item);
    }
  }

  _onTapImage(ListItem? item) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, item?.uid ?? 0, refer: widget.refer);
  }

  /// 过滤性别
  _onFilter() async {
    int? sex = await showMenu(
      context: context,
      elevation: 4,
      position: const RelativeRect.fromLTRB(300, 70, 16, 0),
      items: <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              R.img(
                'nearby/male.svg',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  child: Text(
                    R.string('male_only'),
                    style: TextStyle(
                      color: R.color.secondTextColor,
                    ),
                  ),
                ),
              ),
              _sex == 1
                  ? R.img(
                      'nearby/ic_done.svg',
                      width: 16,
                      height: 16,
                      color: R.color.mainBrandColor,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                    )
                  : const SizedBox(width: 16),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              R.img(
                'nearby/female.svg',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 12),
                child: Text(
                  R.string('female_only'),
                  style: TextStyle(
                    color: R.color.secondTextColor,
                  ),
                ),
              ),
              _sex == 2
                  ? R.img(
                      'nearby/ic_done.svg',
                      width: 16,
                      height: 16,
                      color: R.color.mainBrandColor,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                    )
                  : const SizedBox(width: 16),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              R.img(
                'nearby/all.svg',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 12),
                child: Text(
                  R.string('look_all'),
                  style: TextStyle(
                    color: R.color.secondTextColor,
                  ),
                ),
              ),
              _sex == 0
                  ? R.img(
                      'nearby/ic_done.svg',
                      width: 16,
                      height: 16,
                      color: R.color.mainBrandColor,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                    )
                  : const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
    if (sex != null) {
      setState(() {
        _sex = sex;
        _loading = true;
        Config.set(KEY_NEARBY_SEX, _sex.toString());
        _load(1);
      });
    }
  }

  Widget _buildBody() {
    if (!hasLocation) {
      return _buildLocationRequired();
    }
    if (_nearbyInvisible) {
      // 附近隐身
      return _buildNearbyInvisible();
    }
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_data.isEmpty) {
      return ErrorData(
        error: _errorMsg ?? K.personaldata_no_data,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load(_pageIndex);
        },
      );
    }

    return _buildList();
  }

  Widget _buildLocationRequired() {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              bottom: 16,
            ),
            child: R.img(
              'nearby/nearby_location.webp',
              width: 200,
              height: 200,
              package: ComponentManager.MANAGER_PERSONALDATA,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 42),
            child: Text(
              R.string('need_location_authorization_first'),
              style: TextStyle(
                color: R.color.secondTextColor,
              ),
            ),
          ),
          InkWell(
            onTap: _openSettings,
            borderRadius: BorderRadius.circular(27),
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors)),
              width: 200,
              height: 48,
              child: Center(
                child: Text(
                  R.string('authority_location'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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

  Widget _buildNearbyInvisible() {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              bottom: 16,
            ),
            child: R.img(
              'nearby/nearby_location.webp',
              width: 144,
              height: 136,
              package: ComponentManager.MANAGER_PERSONALDATA,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 42),
            child: Text(
              K.need_enable_nearby_visibility,
              style: TextStyle(
                color: R.color.secondTextColor,
              ),
            ),
          ),
          InkWell(
            onTap: _openSettings,
            borderRadius: BorderRadius.circular(27),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: R.color.mainBrandColor,
              ),
              width: 200,
              height: 48,
              child: Center(
                child: Text(
                  K.go_to_settings,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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

  Widget _buildList() {
    return RefreshIndicatorFactory.of(
      onRefresh: _reload,
      child: ListView.builder(
        controller: _controller,
        itemExtent: 92,
        itemCount: _data.length,
        itemBuilder: (context, index) {
          ListItem item = _data[index];
          bool follow = _followUids.contains(item.uid.toString());
          return HomeListItemWidget(
            item: item,
            onFollowClick: _onFollow,
            onChatClick: _onChat,
            follow: follow,
            onItemClick: _onTapItem,
            onImageClick: _onTapImage,
            refer: widget.refer,
          );
        },
      ),
    );
  }
}
