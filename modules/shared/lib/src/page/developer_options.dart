import 'dart:async';
import 'package:shared/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/page/developer/other_developer_setting_page.dart';
import 'package:shared/util/cache_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared/util/developer/guagua/pluggable.dart';

import 'developer/gift_anim_test_page.dart';

const String SER_KEY = 'dop.ser_key';

const String PROXY_SWITCH_KEY = 'http_proxy_open';
const String PROXY_KEY = 'http_proxy.key';
const String HTTP2_KEY = 'user_http2.key';

/// 房间内的rtc类型
int devRoomRtcType = 0;

/// zego房间ans类型
int? devZegoAnsType;
String iapPassword = '';

class DeveloperUtil {
  static String get iapPassword {
    return Config.get('dev.iapPassword');
  }

  static set iapPassword(String value) {
    Config.set('dev.iapPassword', value);
  }
}

class DevOptionsPlugin implements Pluggable {
  @override
  ImageProvider<Object>? get iconImageProvider => null;

  @override
  String get name => 'devoptions';

  @override
  String get displayName => 'Dev ';

  @override
  void onTrigger() async {
    DeveloperOptionScreen.show(Constant.context);
  }

  @override
  IconData get iconData => Icons.developer_mode_rounded;
}

class DeveloperOptionScreen extends StatefulWidget {
  static const String routeName = '/DeveloperOptionScreen';

  const DeveloperOptionScreen({Key? key}) : super(key: key);

  static Future show(BuildContext context) {
    IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    int index = mainManager.appNavigatorObserverGetIndex(routeName);

    /// 判断此时栈中是否已经存在此页面
    if (index > -1) {
      // 已存在 则pop此页面上面的所有页面
      Navigator.of(context).popUntil(ModalRoute.withName(routeName));
      return Future.value();
    } else {
      // 不存在 则push
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const DeveloperOptionScreen(),
        settings: const RouteSettings(name: routeName),
      ));
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<DeveloperOptionScreen> {
  int _serverValue = 0; // 当前环境
  int _serverChangeValue = 0; // 切换环境所对应的值

  bool _showPerformanceOverlay = false;
  bool _enableTrackerLog = false;
  bool _gameOnlineDev = false;
  Map<int, Map> devSessions = {};
  final IBASEGameCoreManager _baseGameCoreManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WEBGAME_CORE);

  bool _http2 = useHttp2;

  bool get http2 => _http2;

  set http2(bool value) {
    _http2 = value;
    Config.setBool(HTTP2_KEY, _http2);
  }

  @override
  void initState() {
    super.initState();
    _serverValue = Util.parseInt(Config.get(SER_KEY, '0'));
    _serverChangeValue = _serverValue;
    _showPerformanceOverlay = Util.showPerformanceOverlay;
    _enableTrackerLog = Util.parseBool(Config.getInt('track_log_enabled', 0));
    http2 = Util.parseBool(Config.getBool(HTTP2_KEY, useHttp2)) && _serverValue == 0;
    _gameOnlineDev = _baseGameCoreManager.isOnlineDev();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _buildServerEnv(),
      _buildProxy(),
      _buildSwitch(),
      _buildGiftTest(),
      _buildRoomResourceTest(),
      _buildTokenViewer(),
      _buildChannel(),
      _buildTestWeb(),
      _buildTestSchema(),
      _buildIapPassword(),
      _buildRoomRtc(),
      _buildZegoAns(),
      _buildGameOnlineDev(),
      _buildTrackerLog(),
      _buildCleanLocalConfig(),
      _buildCleanImgCacheConfig(),
      // TODO: Might want to reintegrate memory leak check.
      // _buildLeakCheck(),
      _buildOther(),
    ];

    return WillPopScope(
      onWillPop: _checkChange,
      child: Scaffold(
        appBar: BaseAppBar(
          K.base_developer_screen,
          actionTitle: K.base_restart_validate,
          onBackPressedCallback: _onBack,
          onPressed: _save,
        ),
        backgroundColor: R.color.mainBgColor,
        body: ListView.builder(
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 10),
          itemCount: children.length,
          itemBuilder: (_, index) {
            return children[index];
          },
        ),
      ),
    );
  }

  Future _onBack() async {
    bool result = await _checkChange();
    if (result) {
      Navigator.of(context).pop();
    }
  }

  Future<bool> _checkChange() async {
    if (_serverValue != _serverChangeValue) {
      bool result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.tips,
            content: '切换环境需要重新登录才能生效，返回后将不会生效，确认返回？',
            positiveButton: PositiveButton(text: K.base_go_back),
          );
        },
      );
      return result == true;
    }
    return true;
  }

  Widget _buildServerEnv() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
          child: Text(
            K.base_server_domain,
            style: R.textStyle.subtitle,
          ),
        ),
        RadioListTile<int>(
          title: Text(K.base_online_domain, style: TextStyle(color: R.color.mainTextColor)),
          subtitle: Text(BaseConfig.instance.mainDomain, style: TextStyle(color: R.color.secondTextColor)),
          activeColor: R.color.mainBrandColor,
          value: 0,
          groupValue: _serverChangeValue,
          isThreeLine: false,
          onChanged: _onServerChanged,
        ),
        RadioListTile<int>(
          title: Text(K.base_alpha_domain, style: TextStyle(color: R.color.mainTextColor)),
          subtitle: Text('alpha.happyxq.cc.cn', style: TextStyle(color: R.color.secondTextColor)),
          activeColor: R.color.mainBrandColor,
          value: 1,
          groupValue: _serverChangeValue,
          onChanged: _onServerChanged,
        ),
        RadioListTile<int>(
          title: Text(K.base_dev_domain, style: TextStyle(color: R.color.mainTextColor)),
          subtitle: Text('dev-api.happyxq.cc.cn', style: TextStyle(color: R.color.secondTextColor)),
          activeColor: R.color.mainBrandColor,
          value: 2,
          groupValue: _serverChangeValue,
          onChanged: _onServerChanged,
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<int>(
                title: Text(K.base_local_domain, style: TextStyle(color: R.color.mainTextColor)),
                subtitle: Text(getLocalServerIp, style: TextStyle(color: R.color.secondTextColor)),
                activeColor: R.color.mainBrandColor,
                value: 3,
                groupValue: _serverChangeValue,
                onChanged: _onServerChanged,
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: _setLocalServerIp,
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.base_set_domain,
                  style: TextStyle(fontSize: 16, color: R.color.mainBgColor),
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }

  void _setLocalServerIp() {
    TextEditingController ipController = TextEditingController(text: getLocalServerIp);
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            backgroundColor: R.color.mainBgColor,
            content: SizedBox(
              height: 100,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                controller: ipController,
                style: TextStyle(color: R.color.mainTextColor),
                decoration: InputDecoration(
                  prefixText: K.base_local_ip,
                  prefixStyle: TextStyle(color: R.color.secondTextColor),
                  hintText: getLocalServerIp,
                  hintStyle: TextStyle(color: R.color.secondTextColor),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  K.cancel,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: Text(K.sure, style: TextStyle(color: R.color.mainTextColor)),
                onPressed: () {
                  Navigator.pop(context, {'local_server_ip': ipController.text});
                },
              ),
            ],
          );
        }).then((data) {
      if (data is Map) {
        String? localServerIp = Util.parseStr(data['local_server_ip']);
        Log.d('localServerIp: $localServerIp');
        if (localServerIp != null && localServerIp.isNotEmpty) {
          Config.set('local_server_ip', localServerIp);
          setState(() {});
        }
      }
    });
  }

  _onServerChanged(int? value) async {
    if (value == null) return;
    setState(() {
      _serverChangeValue = value;
      http2 = value == 0; // 仅正式环境下，支持http2
    });
  }

  //一般退出重新登录就可以了，不必重启，便于调试
  void _save() {
    Config.set(SER_KEY, _serverChangeValue.toString());

    DeveloperOptions.initServer();

    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.initRtcSDKConfig();

    IMainManager mgr = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mgr.restart();

    Session.logout();
    if (Util.isLoginBeforeBoot()) {
      eventCenter.emit('System.Need.Login', context);
    } else {
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }
  }

  Widget _buildSwitch() {
    List<Widget> data = [];

    /// 暗黑模式
    data.add(ListTile(
      dense: true,
      title: Text(
        '暗黑模式',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: CupertinoSwitch(
        value: darkMode,
        activeColor: R.color.mainBrandColor,
        onChanged: (bool value) async {
          bool result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog(
                title: K.tips,
                content: '确认${value ? '打开' : '关闭'}暗黑模式吗？',
                positiveButton: PositiveButton(text: K.sure),
              );
            },
          );
          if (result == true) {
            darkMode = value;
            Config.setBool(DARK_MODE, darkMode);
            Get.forceAppUpdate();
            Navigator.popUntil(System.context, ModalRoute.withName('/'));
          }
        },
      ),
    ));

    /// 性能开关
    data.add(ListTile(
      dense: true,
      title: Text(
        K.performance_switch,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: CupertinoSwitch(
        value: _showPerformanceOverlay,
        activeColor: R.color.mainBrandColor,
        onChanged: (bool value) async {
          setState(() {
            _showPerformanceOverlay = value;
          });
          Util.showPerformanceOverlay = value;
        },
      ),
    ));

    if (kDebugMode) {
      data.add(ListTile(
        dense: true,
        title: Text(
          '礼物特效播放原始mp4（模拟器）',
          textScaleFactor: 1.0,
          style: R.textStyle.subtitle,
        ),
        trailing: CupertinoSwitch(
          value: Config.getBool('SIMULATOR_PLAY_MP4', false),
          activeColor: R.color.mainBrandColor,
          onChanged: (bool value) async {
            setState(() {
              Config.setBool('SIMULATOR_PLAY_MP4', value);
            });
          },
        ),
      ));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: data);
  }

  Widget _buildProxy() {
    List<Widget> data = [];

    /// use http2
    data.add(ListTile(
      dense: true,
      title: Text(
        'use http2',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: CupertinoSwitch(
        value: http2,
        activeColor: R.color.mainBrandColor,
        onChanged: (bool value) async {
          if (_serverChangeValue != 0) {
            // 仅正式环境下，支持http2
            Fluttertoast.showCenter(msg: '仅正式环境下，支持http2');
            return;
          }
          setState(() {
            http2 = value;
          });
        },
      ),
    ));

    /// 服务器及代理设置
    data.add(
      ListTile(
        dense: true,
        onTap: () {
          showDialog(
            context: context,
            builder: (buildContext) {
              String host = "";
              String proxyIP = '192.168.x.x';
              String proxyPort = '8888';
              if (_serverValue == 1) {
                host = "alpha.happyxq.cc.cn";
              } else if (_serverValue == 2) {
                host = "116.62.125.230";
              } else if (_serverValue == 3) {
                host = getLocalServerIp;
              } else {
                host = BaseConfig.instance.mainDomain;
              }
              String proxy = Constant.proxy ?? Config.get(PROXY_KEY);
              if (Util.validStr(proxy) && proxy.split(':').length == 2) {
                proxyIP = proxy.split(':').first;
                proxyPort = proxy.split(':').last;
              }
              TextEditingController hostController = TextEditingController(text: host);
              TextEditingController proxyIPController = TextEditingController(text: proxyIP);
              TextEditingController proxyPortController = TextEditingController(text: proxyPort);
              return AlertDialog(
                backgroundColor: R.color.mainBgColor,
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        maxLines: 1,
                        controller: hostController,
                        style: TextStyle(color: R.color.mainTextColor),
                        decoration: InputDecoration(
                          prefixText: K.common_server_address,
                          prefixStyle: TextStyle(color: R.color.secondTextColor),
                          hintText: System.domain,
                          hintStyle: TextStyle(color: R.color.secondTextColor),
                        ),
                        onChanged: (text) {},
                      ),
                      TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.datetime,
                        controller: proxyIPController,
                        style: TextStyle(color: R.color.mainTextColor),
                        decoration: InputDecoration(
                          prefixText: K.proxy_server_ip,
                          prefixStyle: TextStyle(color: R.color.secondTextColor),
                          hintText: proxyIP,
                          hintStyle: TextStyle(color: R.color.secondTextColor),
                        ),
                        onChanged: (text) {},
                      ),
                      TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.datetime,
                        controller: proxyPortController,
                        style: TextStyle(color: R.color.mainTextColor),
                        decoration: InputDecoration(
                          prefixText: K.proxy_server_port,
                          prefixStyle: TextStyle(color: R.color.secondTextColor),
                          hintText: proxyPort,
                          hintStyle: TextStyle(color: R.color.secondTextColor),
                        ),
                        onChanged: (text) {},
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      K.cancel,
                      style: TextStyle(color: R.color.mainTextColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                  TextButton(
                    child: Text(
                      K.sure,
                      style: TextStyle(color: R.color.mainTextColor),
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        {'host': hostController.text, 'proxyIP': proxyIPController.text, 'proxyPort': proxyPortController.text},
                      );
                    },
                  ),
                ],
              );
            },
          ).then((data) {
            if (data is Map) {
              String? host = Util.parseStr(data['host']);
              String? proxyIP = Util.parseStr(data['proxyIP']);
              String? proxyPort = Util.parseStr(data['proxyPort']);
              Log.d("host = $host and proxyIP = $proxyIP and proxyPort = $proxyPort and systemt.host = ${System.domain}");

              if (host != null && host.isNotEmpty) {
                System.mainDomain = host;
              } else {
                System.mainDomain = BaseConfig.instance.mainDomain;
              }
              if (Util.validStr(proxyIP) && Util.validStr(proxyPort)) {
                Constant.proxy = '$proxyIP:$proxyPort';
                Config.set(PROXY_KEY, Constant.proxy);
                Config.setBool(PROXY_SWITCH_KEY, true);
              } else {
                Config.setBool(PROXY_SWITCH_KEY, false);
                Constant.proxy = null;
              }
              setState(() {});
            }
          });
        },
        title: Text(
          K.proxy_server_setting,
          textScaleFactor: 1.0,
          style: R.textStyle.subtitle,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoSwitch(
              value: !Util.isStringEmpty(Constant.proxy),
              activeColor: R.color.mainBrandColor,
              onChanged: (bool value) async {
                if (!Util.isStringEmpty(Constant.proxy)) {
                  Config.setBool(PROXY_SWITCH_KEY, value);
                  setState(() => Constant.proxy = null);
                } else {
                  String proxy = Config.get(PROXY_KEY);
                  if (Util.isStringEmpty(proxy)) {
                    Fluttertoast.showCenter(msg: '请添加代理');
                    return;
                  }
                  Fluttertoast.showCenter(msg: proxy);
                  Config.setBool(PROXY_SWITCH_KEY, value);
                  setState(() => Constant.proxy = proxy);
                }
              },
            ),
            Icon(Icons.navigate_next, color: R.color.secondTextColor),
          ],
        ),
      ),
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: data);
  }

  Widget _buildGameOnlineDev() {
    return ListTile(
      dense: true,
      title: Text(
        '游戏在线调试',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: CupertinoSwitch(
        value: _gameOnlineDev,
        activeColor: R.color.mainBrandColor,
        onChanged: (bool value) async {
          setState(() {
            _gameOnlineDev = value;
            _baseGameCoreManager.switchOnlineDev(value);
          });
        },
      ),
    );
  }

  Widget _buildChannel() {
    return ListTile(
      title: Text(
        K.base_edit_channel,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DeviceInfo.channel,
            style: R.textStyle.trailing,
          ),
          Icon(
            Icons.navigate_next,
            color: R.color.secondTextColor,
          ),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (buildContext) {
              String channel = '';
              return AlertDialog(
                backgroundColor: R.color.mainBgColor,
                content: SizedBox(
                  height: 100,
                  child: TextField(
                    controller: TextEditingController(text: channel),
                    decoration: InputDecoration(
                      labelText: K.base_edit_channel,
                      labelStyle: TextStyle(color: R.color.mainTextColor),
                      hintText: K.base_edit_channel,
                      hintStyle: TextStyle(color: R.color.thirdTextColor),
                    ),
                    onChanged: (text) {
                      channel = text;
                    },
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      K.cancel,
                      style: TextStyle(color: R.color.mainTextColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                  TextButton(
                    child: Text(K.sure, style: TextStyle(color: R.color.mainTextColor)),
                    onPressed: () {
                      Navigator.pop(context, {'channel': channel});
                    },
                  ),
                ],
              );
            }).then((data) {
          if (data is Map) {
            String? channel = Util.parseStr(data['channel']);
            if (channel != null && channel.isNotEmpty) {
              DeviceInfo.channel = channel;
              setState(() {});
            }
          }
        });
      },
    );
  }

  Widget _buildIapPassword() {
    return ListTile(
      title: Text(
        K.base_edit_iap_password,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DeveloperUtil.iapPassword,
            style: R.textStyle.trailing,
          ),
          Icon(
            Icons.navigate_next,
            color: R.color.secondTextColor,
          ),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (buildContext) {
              String password = DeveloperUtil.iapPassword;
              return AlertDialog(
                backgroundColor: R.color.mainBgColor,
                content: SizedBox(
                  height: 100,
                  child: TextField(
                    controller: TextEditingController(text: password),
                    decoration: InputDecoration(
                      labelText: K.base_edit_iap_password,
                      labelStyle: TextStyle(color: R.color.mainTextColor),
                      hintText: K.base_edit_iap_password,
                      hintStyle: TextStyle(color: R.color.thirdTextColor),
                    ),
                    onChanged: (text) {
                      password = text;
                    },
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      K.cancel,
                      style: TextStyle(color: R.color.mainTextColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                  TextButton(
                    child: Text(K.sure, style: TextStyle(color: R.color.mainTextColor)),
                    onPressed: () {
                      Navigator.pop(context, {'password': password});
                    },
                  ),
                ],
              );
            }).then((data) {
          if (data is Map) {
            String? value = Util.parseStr(data['password']);
            if (value != null && value.isNotEmpty) {
              DeveloperUtil.iapPassword = value;
              setState(() {});
            }
          }
        });
      },
    );
  }

  Widget _buildTokenViewer() {
    return ListTile(
      title: Text(
        K.base_debug_copy_token_title,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: Text(
          Session.token,
          style: R.textStyle.trailing,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () {
        String token = Session.token;
        if (!Util.isNullOrEmpty(token)) {
          Clipboard.setData(ClipboardData(text: token)).then((_) {
            Fluttertoast.showCenter(msg: K.base_debug_copy_token_toast);
          });
        }
      },
    );
  }

  Widget _buildTestWeb() {
    return ListTile(
      dense: true,
      onTap: () {
        showDialog(
          context: context,
          builder: (buildContext) {
            String url = '';
            return AlertDialog(
              backgroundColor: R.color.mainBgColor,
              content: SizedBox(
                height: 100,
                child: TextField(
                  controller: TextEditingController(text: url),
                  decoration: InputDecoration(
                    labelText: 'H5 address',
                    labelStyle: TextStyle(color: R.color.mainTextColor),
                    hintText: K.base_input_h5_address,
                    hintStyle: TextStyle(color: R.color.thirdTextColor),
                  ),
                  onChanged: (text) => url = text,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(K.cancel, style: TextStyle(color: R.color.mainTextColor)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                  child: Text(K.sure, style: TextStyle(color: R.color.mainTextColor)),
                  onPressed: () => Navigator.pop(context, {'url': url}),
                ),
              ],
            );
          },
        ).then((data) {
          if (data is Map) {
            String? url = Util.parseStr(data['url']);
            if (url != null && url.isNotEmpty) {
              SchemeUrlHelper.instance().jump(url, type: 'web');
            }
          }
        });
      },
      title: Text(
        K.base_test_h5,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: R.color.secondTextColor,
      ),
    );
  }

  /// schema测试
  Widget _buildTestSchema() {
    return ListTile(
      dense: true,
      onTap: () {
        showDialog(
          context: context,
          builder: (buildContext) {
            String url = 'bbpd://com.ly.bbpd.android/common_redirect?page=*';
            return AlertDialog(
              backgroundColor: R.color.mainBgColor,
              content: SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 12),
                  child: TextField(
                    controller: TextEditingController(text: url),
                    maxLines: 3,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      labelText: 'Schema url',
                      labelStyle: TextStyle(color: R.color.mainTextColor),
                      hintText: K.base_input_h5_address,
                      hintStyle: TextStyle(color: R.color.thirdTextColor),
                    ),
                    onChanged: (text) => url = text,
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(K.cancel, style: TextStyle(color: R.color.mainTextColor)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                  child: Text(K.sure, style: TextStyle(color: R.color.mainTextColor)),
                  onPressed: () => Navigator.pop(context, {'url': url}),
                ),
              ],
            );
          },
        ).then((data) {
          if (data is Map) {
            String? url = Util.parseStr(data['url']);
            if (url != null && url.isNotEmpty) {
              SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, url);
            }
          }
        });
      },
      title: Text(
        '测试Schema跳转',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: R.color.secondTextColor,
      ),
    );
  }

  Widget _buildTrackerLog() {
    return ListTile(
      dense: true,
      title: Text(
        K.base_shu_log,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: CupertinoSwitch(
        value: _enableTrackerLog,
        activeColor: R.color.mainBrandColor,
        onChanged: (bool value) async {
          setState(() {
            _enableTrackerLog = value;
          });
          Tracker.enableTrackLog(_enableTrackerLog);
          Config.set('track_log_enabled', '${value ? 1 : 0}');
        },
      ),
    );
  }

  _buildCleanLocalConfig() {
    return ListTile(
      dense: true,
      title: Text(
        K.base_reset_local_config,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: GestureDetector(
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool cleaned = await prefs.clear();
          if (cleaned) {
            Fluttertoast.showToast(msg: "Cleaned!");
          }
        },
        child: const Icon(Icons.delete),
      ),
    );
  }

  _buildCleanImgCacheConfig() {
    return ListTile(
      dense: true,
      title: Text(
        "清除图片缓存",
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: GestureDetector(
        onTap: () async {
          imageCache.clear();
          await CacheUtil.clearCache(false);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }

  _buildRoomRtc() {
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    String curRtcDes = roomManager.getDevCurRoomRtcDes(devRoomRtcType);
    return ListTile(
      dense: true,
      title: Text(
        K.base_rtc_room_type,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            curRtcDes,
            style: R.textStyle.trailing,
          ),
          Icon(
            Icons.navigate_next,
            color: R.color.secondTextColor,
          ),
        ],
      ),
      onTap: () async {
        int? result = await roomManager.showDevRoomRtcSelectDialog(context);
        if (result != null) {
          devRoomRtcType = result;
          setState(() {});
        }
      },
    );
  }

  _buildZegoAns() {
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    String curr = roomManager.getDevCurRoomZegoAnsDes();
    return ListTile(
      dense: true,
      title: Text(
        'Zego的ans类型',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            curr,
            style: R.textStyle.trailing,
          ),
          Icon(
            Icons.navigate_next,
            color: R.color.secondTextColor,
          ),
        ],
      ),
      onTap: () async {
        int? mode = await roomManager.showDevRoomZegoAnsSelectDialog(context);
        if (mode != null) {
          devZegoAnsType = mode;
        }
        setState(() {});
      },
    );
  }

  Widget _buildOther() {
    return ListTile(
      dense: true,
      onTap: () {
        OtherDeveloperSettingPage.show(context);
      },
      title: Text(
        '其他',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: R.color.secondTextColor,
      ),
    );
  }

  Widget _buildGiftTest() {
    return ListTile(
      dense: true,
      onTap: () => GiftAnimTestPage.show(context),
      title: Text(
        '礼物动画测试',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: R.color.secondTextColor,
      ),
    );
  }

  Widget _buildRoomResourceTest() {
    return ListTile(
      dense: true,
      onTap: () => RoomResourceMockPage.launch(context),
      title: Text(
        '房间资源测试',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: R.color.secondTextColor,
      ),
    );
  }
}

class DeveloperOptions {
  static void initServer() {
    int ser = Util.parseInt(Config.get(SER_KEY, '0'));
    System.isDevHost = ser == 2; // 测试环境host
    System.mainDomain = BaseConfig.instance.mainDomain;
    switch (ser) {
      case 0: // 正式
        System.replaceConfigs();
        break;
      case 1: // alpha
        System.replaceConfigs({
          'domain': 'https://alpha.happyxq.cc.cn/',
          'payDomain': 'https://alpha.happyxq.cc.cn/',
        });
        break;
      case 2: // dev
        System.replaceConfigs({
          'domain': 'https://dev-api.happyxq.cc.cn/',
          'payDomain': 'https://dev-api.happyxq.cc.cn/',
        });
        break;
      case 3: // local
        System.replaceConfigs({
          'domain': 'https://$getLocalServerIp/',
          'payDomain': 'https://$getLocalServerIp/',
          'webSocketDomain': 'ws://$getLocalServerIp:6545',
          'webSocketKeepDomain': 'ws://$getLocalServerIp:8545',
          'exposureDomain': 'http://$getLocalServerIp:2355',
          'logDomain': 'https://$getLocalServerIp/'
        });
        break;
    }
    // 仅正式环境下，支持http2
    bool http2 = Util.parseBool(Config.getBool(HTTP2_KEY, useHttp2)) && ser == 0;
    Config.setBool(HTTP2_KEY, http2);
  }
}

String get getLocalServerIp => Config.get('local_server_ip', BaseConfig.instance.localDomain);

int? useDevRtcType(int? serverType) {
  if (devRoomRtcType > 0) {
    Fluttertoast.showToast(msg: K.base_dev_room_rtc_type_tip(['$devRoomRtcType']));
    return devRoomRtcType;
  }
  return serverType;
}
