import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_small.pb.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/src/api/message_repo.dart';

import 'small_account_msg_setting_widget.dart';

class SmallAccountMsgPage extends StatefulWidget {
  const SmallAccountMsgPage({super.key});

  @override
  State<StatefulWidget> createState() => _SmallAccountMsgState();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SmallAccountMsgPage(),
      settings: const RouteSettings(name: '/smallAccount'),
    ));
  }
}

class _SmallAccountMsgState extends State<SmallAccountMsgPage>
    with BaseScreenStateMixin {
  DialogLoadingController? _controller;
  late ILoginManager _loginManager;

  List<SmallAccountList> _data = [];

  @override
  void initState() {
    super.initState();

    _loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

    _loadData();

    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(
        Im.EventMessageReceivedBoxShowBySmallAccount, _onEventBySmallAccount);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener(
        Im.EventMessageReceivedBoxShowBySmallAccount, _onEventBySmallAccount);
    super.dispose();
  }

  void _onEventBySmallAccount(String type, Object? value) async {
    Log.d("small_account_notify _onEventBySmallAccount3 $type, $value");
    if (value == null || !Session.isLogined) return;
    _loadData();
  }

  _onLogin(String type, dynamic value) {
    Log.d("_onLogin type:$type, value:$value");
    if (value == null || !Session.isLogined) return;
    if (value['origin'] != value['now']) {
      _loadData();
    }
  }

  void _loadData() async {
    ResSmallAccountList res =
        await MessageRepo.getSmallAccountList(needDetail: 1);
    if (res.success) {
      _data = res.list;
      setScreenReady();
      for (var item in _data) {
        loadSmallAccountMsg(item);
      }
      Future.delayed(const Duration(milliseconds: 100),
          () => eventCenter.emit(EventConstant.EventSmallAccountUpdate, null));
    } else {
      setScreenError(handleErrorTap: true);
    }
  }

  void loadSmallAccountMsg(SmallAccountList item) async {
    if (item.uid != Session.uid && item.state == 1) {
      item.msgCount =
          await Im.getTotalUnreadCountBySmallAccount(item.uid.toString()) ?? 0;
      item.msgList.clear();
      item.msgList
          .addAll(await Im.getMsgIconListBySmallAccount(item.uid.toString()));
      refresh();
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: R.colors.homeBgColor,
        backColor: R.colors.mainTextColor,
        title: Text(
          K.small_account_msg_title,
          style: R.textStyle.title.copyWith(color: R.colors.mainTextColor),
        ),
        actions: [_buildActionSetting()],
      ),
      backgroundColor: R.colors.homeBgColor,
      body: SafeArea(
        child: buildStatusContent(),
      ),
    );
  }

  Widget _buildAddAccount() {
    return InkWell(
      onTap: () {
        if (_data.length < 50) {
          _loginManager.openOneKeyLogin(context, type: 'small_account');
        } else {
          Fluttertoast.showCenter(
              msg: R.string("setting_small_account_limit_tip"));
        }
      },
      child: Rext.themeCardContainer(
        width: double.infinity,
        height: 46,
        cornerRadius: 8.0,
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              size: 24,
              color: Color(0xFFCECECE),
            ),
            const SizedBox(width: 6),
            Text(
              R.string("setting_add_account"),
              style: TextStyle(color: R.colors.mainTextColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurAccount(SmallAccountList item) {
    return Rext.themeCardContainer(
      width: double.infinity,
      height: 54,
      cornerRadius: 8.0,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildAvatar(item.icon, 32, showBorder: false),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 26,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: R.colors.moduleBgColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Text(
              R.string("setting_current_account"),
              style: TextStyle(
                color: R.colors.secondTextColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveAccount(SmallAccountList item, int index) {
    List<Widget> receiveMsgWidgets = _buildAvatarListWidget(
        item.msgList.map((e) => e.icon).toList(),
        K.small_account_receive_msg_num([getMsgNumber(item.msgCount)]));
    List<Widget> onlineFriendWidgets = _buildAvatarListWidget(
        item.onlineFriendList.map((e) => e.icon).toList(),
        K.small_account_online_friends_num(
            [getOnlineNumber(item.onlineFriendCount)]));

    return GestureDetector(
      onLongPress: () {
        _onTapDelete(item, index);
      },
      onTap: () {
        if (Session.uid != item.uid) {
          //非当前账号,才切换
          _onSwitchAccount(item.uid, icon: item.icon, phone: item.mobile);
        }
      },
      child: Rext.themeCardContainer(
        width: double.infinity,
        cornerRadius: 8.0,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: AlignmentDirectional.center,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildAvatar(item.icon, 32, showBorder: false),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.name,
                      style: TextStyle(
                          color: R.colors.mainTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 26,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: R.colors.highlightColor.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Text(
                      K.small_account_change,
                      style: TextStyle(
                        color: R.colors.highlightColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (item.msgCount > 0 || item.onlineFriendCount > 0)
              Divider(height: 1, color: R.colors.dividerColor),
            if (item.msgCount > 0)
              Container(
                height: 100,
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.small_account_receive_msg,
                      style: TextStyle(
                        color: R.colors.thirdTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 36,
                      child: Stack(
                        children: receiveMsgWidgets,
                      ),
                    ),
                  ],
                ),
              ),
            if (item.onlineFriendCount > 0)
              Container(
                width: double.infinity,
                height: 100,
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.small_account_online_friends,
                      style: TextStyle(
                        color: R.colors.thirdTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 36,
                      child: Stack(
                        children: onlineFriendWidgets,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInactiveAccount(SmallAccountList item, index) {
    return GestureDetector(
      onLongPress: () {
        _onTapDelete(item, index);
      },
      onTap: () {
        if (Session.uid != item.uid) {
          //非当前账号,才切换
          _onSwitchAccount(item.uid, icon: item.icon, phone: item.mobile);
        }
      },
      child: Rext.themeCardContainer(
        width: double.infinity,
        cornerRadius: 8.0,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildAvatar(item.icon, 32, showBorder: false),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                item.name,
                style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 24,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: R.colors.moduleBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                R.string("setting_out_time"),
                style: TextStyle(
                  color: R.colors.secondTextColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAvatarListWidget(List<String> icons, String numStr) {
    List<Widget> result = [];
    icons.take(3).toList().forEachIndexed((index, element) {
      result.insert(
          0,
          PositionedDirectional(
            top: 0,
            bottom: 0,
            start: (32.0 * index),
            child: _buildAvatar(element, 36),
          ));
    });
    result.add(Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        numStr,
        style: TextStyle(
          color: R.colors.thirdTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ));
    return result;
  }

  void _onSwitchAccount(int uid, {String? icon, String? phone}) async {
    /// 是否开启保护模式
    if (Session.getInt('young_mode', 0) == 1) {
      Toast.show(context, R.string('setting_close_juveniles_to_logout'));
      return;
    }
    String dtoken = Session.getString('dtoken', '');

    showLoading(R.string('setting_requesting'));
    //发送验证码
    String method = "account/smallaccountlogin";
    String url = System.domain + method;
    Map<String, String> post = {
      'dtoken': dtoken,
      'target': uid.toString(),
    };

    Log.d(post);

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Map res = response.value();
      bool success = res['success'];

      hideLoading();
      if (success && res['data'] != null && res['data'] != false) {
        //记录用户信息
        int origin = Session.uid;
        await Session.setValues(res['data']);

        eventCenter.emit(EventConstant.EventLogin,
            {'origin': origin, 'now': Session.uid, 'login_type': 'switch'});
        Tracker.instance.track(TrackEvent.change_small_account, properties: {
          'uid': origin,
          'status': 1,
        });

        if (Session.role == UserRole.REG) {
          _loginManager.openLoginProfile(context);
        }

        /// 发送账号切换消息
        eventCenter.emit(EventConstant.EventSwitchAccount, {});

        Fluttertoast.showToast(
            msg: R.string('setting_change_account_success'),
            gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }

        _goToLogin(uid, icon: icon, phone: phone);
      }
    } catch (e) {
      hideLoading();

      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);

      _goToLogin(uid, icon: icon, phone: phone);
    }
  }

  void _goToLogin(int uid, {String? icon, String? phone}) {
    Tracker.instance.track(TrackEvent.change_small_account, properties: {
      'uid': Session.uid,
      'status': 0,
    });

    //success为false(账号未在设备登录过,需要进入安全手机号验证流程)
    if (BaseConfig.instance.smallAccount) {
      // 小号切换 输入验证码 新
      if (phone?.isNotEmpty == true) {
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openSafeMobileCheckScreen(context,
            type: 'check', uid: uid.toString(), phone: phone, icon: icon);
      } else {
        // 跳转添加
        _loginManager.openPhoneLogin(context, type: 'small_account');
      }
    }
  }

  void _onTapDelete(SmallAccountList item, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            width: 312,
            title: R.string('small_account_delete_title'),
            titleTextColor: const Color(0xFF202020),
            negativeButton: const NegativeButton(
              width: 130,
              height: 48,
              textColor: Color(0xB3202020),
            ),
            positiveButton: PositiveButton(
              width: 130,
              height: 48,
              useGradientBg: true,
              gradientBg: R.colors.mainBrandGradientColors,
              text: R.string('setting_delete'),
              textColor: R.colors.brightTextColor,
              onPressed: () {
                _onTapDeleteSmallAccount(item.uid, index);
                Navigator.of(context).pop(true);
              },
            ),
          );
        });
  }

  void _onTapDeleteSmallAccount(int targetUid, int index) async {
    NormalNull res = await MessageRepo.deleteSmallAccount(targetUid);
    if (res.success) {
      _data.removeAt(index);
      refresh();
    } else {
      Fluttertoast.showToast(msg: res.msg);
    }
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

  String getMsgNumber(int num) {
    return (num < 100) ? '$num' : '99+';
  }

  String getOnlineNumber(int num) {
    return (num <= 10) ? '$num' : '10+';
  }

  Widget _buildAvatar(String icon, double size, {bool showBorder = true}) {
    if (showBorder) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: ClipOval(
          child: CommonAvatar(
            path: icon,
            size: size,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return ClipOval(
        child: CommonAvatar(
          path: icon,
          size: size,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget _buildActionSetting() {
    return IconButton(
      key: GlobalKey(),
      iconSize: 24,
      padding: const EdgeInsetsDirectional.only(start: 8, end: 16),
      icon: R.img(
        'ic_settings.svg',
        width: 24,
        height: 24,
        color: R.colors.mainTextColor,
        package: ComponentManager.MANAGER_PROFILE,
      ),
      onPressed: () {
        SmallAccountMsgSettingWidget.show(context);
      },
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 12, bottom: 12),
      child: ListView.separated(
        itemCount: _data.length + 1,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return (index == 0)
              ? _buildAddAccount()
              : _buildSmallAccountItem(_data[index - 1], index - 1);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: (index == 0) ? 12 : 20);
        },
      ),
    );
  }

  Widget _buildSmallAccountItem(SmallAccountList item, int index) {
    if (Session.uid == item.uid) {
      return _buildCurAccount(item);
    } else if (item.state == 1) {
      return _buildActiveAccount(item, index);
    } else {
      return _buildInactiveAccount(item, index);
    }
  }
}
