//
//  global_setting_page.dart
//  zego-express-example-topics-flutter
//
//  Created by Patrick Fu on 2020/11/23.
//  Copyright © 2020 Zego. All rights reserved.
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:zego_express_engine/zego_express_engine.dart';

import 'package:zego_express_engine_example/utils/zego_config.dart';
import 'package:zego_express_engine_example/utils/zego_utils.dart';

import 'package:universal_io/io.dart';

class GlobalSettingPage extends StatefulWidget {
  const GlobalSettingPage({Key? key}) : super(key: key);

  @override
  _GlobalSettingPageState createState() => _GlobalSettingPageState();
}

class _GlobalSettingPageState extends State<GlobalSettingPage> {
  final TextEditingController _appIDEdController = TextEditingController();
  final TextEditingController _userIDEdController = TextEditingController();
  final TextEditingController _userNameEdController =
      TextEditingController();
  final TextEditingController _appSignEdController =
      TextEditingController();
  final TextEditingController _tokenEdController = TextEditingController();

  String _version = "";

  ZegoScenario _scenario = ZegoScenario.Default;
  bool _enablePlatformView = false;

  bool _isCameraPermissionGranted = false;
  bool _isMicrophonePermissionGranted = false;

  @override
  void initState() {
    super.initState();

    ZegoExpressEngine.getVersion().then((value) {
      setState(() => _version = value);
    });

    if (ZegoConfig.instance.appID > 0) {
      _appIDEdController.text = ZegoConfig.instance.appID.toString();
    }

    if (ZegoConfig.instance.userID.isNotEmpty) {
      _userIDEdController.text = ZegoConfig.instance.userID;
    }

    _userNameEdController.text = ZegoConfig.instance.userName;

    if (ZegoConfig.instance.appSign.isNotEmpty) {
      _appSignEdController.text = ZegoConfig.instance.appSign;
    }

    if (ZegoConfig.instance.token.isNotEmpty) {
      _tokenEdController.text = ZegoConfig.instance.token;
    }

    _scenario = ZegoConfig.instance.scenario;
    _enablePlatformView = ZegoConfig.instance.enablePlatformView;

    if (Platform.isAndroid || Platform.isIOS) {
      Permission.camera.status.then((value) => setState(() =>
          _isCameraPermissionGranted = value == PermissionStatus.granted));
      Permission.microphone.status.then((value) => setState(() =>
          _isMicrophonePermissionGranted = value == PermissionStatus.granted));
    } else {
      _isCameraPermissionGranted = true;
      _isMicrophonePermissionGranted = true;
    }
  }

  Future<void> requestCameraPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    setState(() => _isCameraPermissionGranted = cameraStatus.isGranted);
  }

  Future<void> requestMicrophonePermission() async {
    PermissionStatus microphoneStatus = await Permission.microphone.request();
    setState(() => _isMicrophonePermissionGranted = microphoneStatus.isGranted);
  }

  Future<bool> _onWillPop() async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Do you need to save the settings before exiting?'),
            actions: <Widget>[
              TextButton(
                child: const Text('NO, EXIT'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('OK, SAVE'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  _onSaveButtonClicked();
                },
              ),
            ],
          );
        });
    if (result == null) {
      return false;
    } else {
      return true;
    }
  }

  void _onSaveButtonClicked() {
    String strAppID = _appIDEdController.text.trim();
    String userID = _userIDEdController.text.trim();
    String userName = _userNameEdController.text.trim();
    String appSign = _appSignEdController.text.trim();
    String token = _tokenEdController.text.trim();

    int? appID = int.tryParse(strAppID);

    if (!_isCameraPermissionGranted) {
      ZegoUtils.showAlert(context,
          'Camera permission is not granted, please click the camera icon to request permission');
      return;
    }

    if (!_isMicrophonePermissionGranted) {
      ZegoUtils.showAlert(context,
          'Microphone permission is not granted, please click the mic icon to request permission');
      return;
    }

    ZegoConfig.instance.appID = appID ?? 0;
    ZegoConfig.instance.userName = userName;
    ZegoConfig.instance.userID = userID;
    ZegoConfig.instance.appSign = appSign;
    ZegoConfig.instance.token = token;
    ZegoConfig.instance.scenario = _scenario;
    ZegoConfig.instance.enablePlatformView = _enablePlatformView;
  }

  bool get _needAskSave {
    bool needAskSave = false;
    if (!_isCameraPermissionGranted || !_isMicrophonePermissionGranted) {
      needAskSave = true;
    }

    String strAppID = _appIDEdController.text.trim();
    String userID = _userIDEdController.text.trim();
    String userName = _userNameEdController.text.trim();
    String appSign = _appSignEdController.text.trim();
    String token = _tokenEdController.text.trim();

    int appID = int.tryParse(strAppID) ?? 0;
    if (!needAskSave && appID != ZegoConfig.instance.appID) {
      needAskSave = true;
    }
    if (!needAskSave && userID != ZegoConfig.instance.userID) {
      needAskSave = true;
    }
    if (!needAskSave && userName != ZegoConfig.instance.userName) {
      needAskSave = true;
    }
    if (!needAskSave && token != ZegoConfig.instance.token) {
      needAskSave = true;
    }
    if (!needAskSave && appSign != ZegoConfig.instance.appSign) {
      needAskSave = true;
    }
    if (!needAskSave && ZegoConfig.instance.scenario != _scenario) {
      needAskSave = true;
    }
    if (!needAskSave &&
        ZegoConfig.instance.enablePlatformView != _enablePlatformView) {
      needAskSave = true;
    }
    return needAskSave;
  }

  // ----- Widgets -----

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Setting'),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _onSaveButtonClicked)
        ],
      ),
      body: SafeArea(
          child: WillPopScope(
              onWillPop: () async {
                if (!_needAskSave) {
                  return true;
                }
                return await _onWillPop();
              },
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () =>
                    FocusScope.of(context).requestFocus(FocusNode()),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      userInfoWidget(),
                      checkPermissionWidget(),
                      appIDWidget(),
                      appSignOrTokenWidget(),
                      selectScenarioWidget(),
                      selectRendererWidget(),
                    ],
                  ),
                ),
              ))),
    );
  }

  Widget checkPermissionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 20.0)),
        const Text("Permission status: (Press icon to request)"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    icon: _isCameraPermissionGranted
                        ? const Icon(Icons.camera_alt)
                        : const Icon(Icons.camera_alt_outlined),
                    iconSize: 50.0,
                    onPressed: requestCameraPermission),
                Text(_isCameraPermissionGranted ? '✅' : '❗️')
              ],
            ),
            const SizedBox(width: 50),
            Row(
              children: [
                IconButton(
                    icon: _isMicrophonePermissionGranted
                        ? const Icon(Icons.mic)
                        : const Icon(Icons.mic_none),
                    iconSize: 50.0,
                    onPressed: requestMicrophonePermission),
                Text(_isMicrophonePermissionGranted ? '✅' : '❗️')
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget userInfoWidget() {
    return Column(children: [
      const Padding(padding: EdgeInsets.only(top: 20.0)),
      Row(
        children: <Widget>[
          const Text('Native SDK Version: '),
          Expanded(child: Text(_version)),
        ],
      ),
      const Padding(padding: EdgeInsets.only(top: 10.0)),
      Row(
        children: <Widget>[
          const Text('User ID: '),
          const Padding(padding: EdgeInsets.only(left: 10.0)),
          Expanded(
              child: TextField(
            controller: _userIDEdController,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
              hintText: 'Please enter UserID',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff0e88eb))),
            ),
          )),
        ],
      ),
      const Padding(
        padding: EdgeInsets.only(top: 10.0),
      ),
      Row(
        children: <Widget>[
          const Text('User Name: '),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          Expanded(
              child: TextField(
            controller: _userNameEdController,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
              hintText: 'Please enter UserName',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff0e88eb))),
            ),
          )),
        ],
      ),
    ]);
  }

  Widget appIDWidget() {
    return Column(
      children: [
        Row(
          children: <Widget>[
            const Text('AppID:'),
            GestureDetector(
              child: const Icon(Icons.help_outline),
              onTap: () {
                ZegoUtils.showAlert(context,
                    'Developers can get appID from admin console, please apply on https://console.zego.im/dashboard');
              },
            ),
          ],
        ),
        TextField(
          controller: _appIDEdController,
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
            hintText: 'Please enter AppID',
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0e88eb))),
          ),
        ),
      ],
    );
  }

  Widget appSignOrTokenWidget() {
    if (kIsWeb) {
      return _tokenWidget();
    } else {
      return _appSignWidget();
    }
  }

  Widget _appSignWidget() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        Row(
          children: <Widget>[
            const Text('AppSign:'),
            GestureDetector(
              child: const Icon(Icons.help_outline),
              onTap: () {
                ZegoUtils.showAlert(context,
                    'Developers can get appSign from admin console, please apply on  https://console.zego.im/dashboard');
              },
            ),
          ],
        ),
        TextField(
          controller: _appSignEdController,
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
            hintText: 'Please enter AppSign',
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0e88eb))),
          ),
        ),
      ],
    );
  }

  Widget _tokenWidget() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        Row(
          children: <Widget>[
            const Text('Token:'),
            GestureDetector(
              child: const Icon(Icons.help_outline),
              onTap: () {
                ZegoUtils.showAlert(context,
                    'Web only support token, Developers can get token from admin console, please apply on  https://console.zego.im/dashboard');
              },
            ),
          ],
        ),
        TextField(
          controller: _tokenEdController,
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
            hintText: 'Please enter token',
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0e88eb))),
          ),
        ),
      ],
    );
  }

  Widget selectScenarioWidget() {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Scenario'),
            DropdownButton(
                value: _scenario,
                items: ZegoScenario.values
                    .where(
                      (element) {
                        if (ZegoScenario.values.indexOf(element) >=
                            ZegoScenario.values.indexOf(ZegoScenario.Default)) {
                          if (kIsWeb &&
                              (element == ZegoScenario.HighQualityChatroom ||
                                  element == ZegoScenario.Karaoke)) {
                            return false;
                          }
                          return true;
                        }
                        return false;
                      },
                    )
                    .map((value) => DropdownMenuItem<ZegoScenario>(
                        value: value,
                        child: Text(
                          value.toString(),
                        )))
                    .toList(),
                onChanged: (ZegoScenario? scenario) {
                  if (scenario != null) {
                    setState(() {
                      _scenario = scenario;
                    });
                  }
                })
          ],
        ));
  }

  Widget selectRendererWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(padding: EdgeInsets.only(top: 20.0)),
      const Text('Rendering options'),
      const Text('(Ways to render video frames)', style: TextStyle(fontSize: 10.0)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ChoiceChip(
            label: const Text('TextureRenderer'),
            selected: !_enablePlatformView,
            onSelected: (value) =>
                setState(() => _enablePlatformView = !value),
          ),
          ChoiceChip(
            label: const Text('PlatformView'),
            selected: _enablePlatformView,
            onSelected: (value) =>
                setState(() => _enablePlatformView = value),
          ),
        ],
      ),
    ]);
  }
}
