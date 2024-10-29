import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

/// 安全手机号选择账号列表界面
class SafeMobileSelectUidScreen extends StatefulWidget {
  final String? safeMobile;
  final String? code;
  final String? areaCode;
  final String? type;
  final String? uid;

  const SafeMobileSelectUidScreen(
      {Key? key,
      this.areaCode,
      this.safeMobile,
      this.code,
      this.uid,
      this.type})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SafeMobileSelectUidState();
  }

  static void show(BuildContext context,
      {String? safeMobile,
      String? areaCode,
      String? code,
      String? uid,
      String? type}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SafeMobileSelectUidScreen(
          safeMobile: safeMobile,
          areaCode: areaCode,
          code: code,
          type: type,
          uid: uid,
        ),
        settings: const RouteSettings(name: '/safeMobileSelectUid'),
      ),
    );
  }
}

class _SafeMobileSelectUidState extends State<SafeMobileSelectUidScreen> {
  final List<ListItem> _data = [];
  bool _loading = true;
  String _token = '';

  DialogLoadingController? _controller;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Widget _renderBody() {
    //显示初次加载中
    if (_loading && _data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return CustomScrollView(
      slivers: <Widget>[
        _data.isNotEmpty
            ? SliverList(
                delegate: SliverChildListDelegate([
                Container(
                  margin: const EdgeInsets.only(
                      top: 26.0, bottom: 11.0, left: 18.0, right: 32.0),
                  child: Text(K.setting_select_account_to_login,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: R.color.mainTextColor,
                      )),
                ),
              ]))
            : SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(height: 1),
                  ],
                ),
              ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _buildItem(index);
            },
            childCount: _data.length,
            addAutomaticKeepAlives: false,
            semanticIndexOffset: 15,
          ),
          itemExtent: 104.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.setting_select_account,
      ),
      body: _renderBody(),
    );
  }

  //根据安全手机号和验证码，获取该安全手机号对应的绑定账号列表
  Future<void> _load() async {
//    //模拟数据
//    setState(() {
//      this._data.add(ListItem(103273360, 'qq', '佳怡爸', '201904/15/5cb3f3ddd8f0a3.67110888.png', '佳怡爸', false, '1天前'));
//      this._data.add(ListItem(103273361, 'wx', '佳怡妈', '201904/16/5cb53b8be00470.76143413.png', '佳怡妈', false, '5小时前'));
//      this._data.add(ListItem(103273362, 'other', '佳博爸', '201904/16/5cb54a687d3503.98146850.png', '佳博爸', true, '4小时前'));
//    });
//    return;
//    //模拟数据

    String method = "account/safelogin";
    String url = System.domain + method;
    Map<String, String> post = {
      'mobile': widget.safeMobile ?? '',
      'code': widget.code ?? '',
      'area': widget.areaCode ?? '',
    };

    if (widget.type == 'rebind') {
      post['uid'] = widget.uid ?? '';
      post['type'] = 'rebind';
    }
    XhrResponse response = await Xhr.postJson(url, post);

    _loading = false;

    if (response.error != null) {
      Navigator.pop(context);
      String message = response.error.toString();
//      if (response.error.code == XhrErrorCode.Json) {//返回数据异常(没有绑定的uid列表数据)
//        message = "该安全手机号未绑定任何账号";
//      }
      Fluttertoast.showToast(msg: message, gravity: ToastGravity.CENTER);
      return;
    }

    Map res = response.response as Map;
    if (res['success'] == false) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "" + res['msg'], gravity: ToastGravity.CENTER);
      return;
    }

    List? data = res['data'];

    if (data == null || data.isEmpty) {
      //安全手机号下没有uid列表，退出
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: K.setting_bind_none_in_the_safephone,
          gravity: ToastGravity.CENTER);
      return;
    }

    if (!mounted) return;
    //拿列表刷新界面
    setState(() {
      _token = res['token'];

      for (int i = 0; i < data.length; i++) {
        Map item = data[i];
        try {
          _data.add(ListItem.fromJson(item));
        } catch (e) {
          Log.d(item);
          Log.d(e);
        }
      }
    });
  }

  //登录
  Future<void> _login(ListItem item) async {
    showLoading(K.setting_logining);

    String dtoken = Session.getString('dtoken', '');

    String method = "account/safelogin";
    String url = System.domain + method;
    Map<String, String> post = {
      'mobile': widget.safeMobile ?? '',
      'token': _token,
      'uid': "${item.uid}",
      'dtoken': dtoken,
      'area': widget.areaCode ?? ''
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);

      Map res = response.response as Map;
      bool success = res['success'];
      if (success && res['data'] != null && res['data'] != false) {
        //记录用户信息
        int origin = Session.uid;
        await Session.setValues(res['data']);
        eventCenter.emit(EventConstant.EventLogin, {
          'origin': origin,
          'now': Session.uid,
          'login_type': 'tel',
          'is_auto': false
        });

        if (Session.role == UserRole.REG) {
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          loginManager.openLoginProfile(context, replace: true);
        }

        Fluttertoast.showToast(
            msg: K.setting_login_success, gravity: ToastGravity.CENTER);

        //退出当前页面
        if (Util.isLoginBeforeBoot()) {
          eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
        } else {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    hideLoading();
  }

  void showLoading(String message) {
    if (_controller != null) {
      _controller!.setLabel(message);
      return;
    }

    _controller = DialogLoadingController();
    _controller!.show(context: context, message: message);
  }

  void hideLoading() {
    _controller?.close();
    _controller = null;
  }

  //构建每个item
  Widget _buildItem(int index) {
    ListItem item = _data.elementAt(index);
    return InkWell(
      onTap: () async {
        await _login(item);
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 15.0,
          bottom: 15.0,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(27.5),
                child: CachedNetworkImage(
                  imageUrl: "${System.imageDomain}${item.icon}",
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 55.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name ?? '',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: R.color.mainTextColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    IDWidget(
                      uid: item.uid,
                      fontSize: 14,
                      fontColor: R.color.thirdTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5.0),
              alignment: AlignmentDirectional.centerEnd,
              height: 55.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      item.platformIcon != null
                          ? Container(
                              width: 18,
                              height: 18,
                              margin:
                                  const EdgeInsetsDirectional.only(end: 5.0),
                              alignment: Alignment.center,
                              child: Image.asset(
                                item.platformIcon,
                                width: 18.0,
                                height: 18.0,
                                package: ComponentManager.MANAGER_SETTINGS,
                              ),
                            )
                          : const SizedBox(width: 1, height: 18),
                      Text(
                        item.platform != "phone"
                            ? (item.nickName.safeSubstring(
                                    0, min(8, item.nickName.length))) +
                                (item.nickName.length > 8 ? ".." : "")
                            : item.mobile ?? '',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: R.color.thirdTextColor,
                        ),
                        textAlign: TextAlign.end,
                        maxLines: 1,
//                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                  Text(
                    item.onlineStatus,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    style: TextStyle(
                      color: R.color.thirdTextColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  int? uid;
  String? platform;
  String nickname;
  String? icon;
  String? name;
  bool? online;
  String? online_diff;
  String? mobile;

  String get nickName => nickname.isNotEmpty ? nickname : (name ?? '');

  String get onlineStatus => (online != null && online!)
      ? K.setting_current_online
      : (online_diff ?? '');

  String get platformIcon {
    if (platform == 'qq') {
      return 'assets/images/nlogin_qq.png';
    } else if (platform == 'wechat') {
      return 'assets/images/nlogin_wechat.png';
    } else if (platform == 'phone') {
      return 'assets/images/nlogin_phone.png';
    } else {
      return '';
    }
  }

  ListItem(this.uid, this.platform, this.nickname, this.icon, this.name,
      this.online, this.online_diff, this.mobile);

  ListItem.fromJson(Map data)
      : uid = Util.parseInt(data['uid']),
        platform = data['platform'] != null
            ? data['platform'].toString()
            : (data['mobile'] != null ? 'phone' : ''),
        nickname = data['nickname'] ?? '',
        icon = data['icon'].toString(),
        name = data['name'] == null ? '' : data['name'].toString(),
        online = Util.parseInt(data['online']) > 0,
        online_diff = data['online_diff'] ?? '',
        mobile = data['mobile'] ?? '';
}
