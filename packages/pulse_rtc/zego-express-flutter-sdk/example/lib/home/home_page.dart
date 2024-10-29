//
//  home_page.dart
//  zego-express-example-topics-flutter
//
//  Created by Patrick Fu on 2020/11/12.
//  Copyright © 2020 Zego. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:zego_express_engine_example/home/global_setting_page.dart';
import 'package:zego_express_engine_example/topics/quick_start/quick_start_page.dart';

import 'package:zego_express_engine_example/utils/zego_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  bool _checkConfiguration() {
    if (ZegoConfig.instance.appID <= 0) {
      return false;
    }
    if (ZegoConfig.instance.userID.isEmpty) {
      return false;
    }
    if (kIsWeb) {
      // ZEGO RTC Web SDK requires token
      if (ZegoConfig.instance.token.isEmpty) {
        return false;
      }
    } else {
      // ZEGO RTC Native SDK requires appSign
      if (ZegoConfig.instance.appSign.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void onPressQuickStartButton() {
    if (_checkConfiguration()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return QuickStartPage();
      }));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Tips'),
              content: const Text(
                  'Please set up AppID and other necessary configuration first'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return GlobalSettingPage();
                    }));
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ZegoExpressExample'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return GlobalSettingPage();
                }));
              },
            )
          ],
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                child: const Text(
                  'This is a simple demo showing how to use the SDK to implement basic publish and play stream functions.',
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
              SizedBox(
                  width: 150.0,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: const Color(0xff0e88eb),
                    onPressed: onPressQuickStartButton,
                    child: const Text('Quick Start'),
                  )),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: const Text(
                  'For more features, please refer to the example topic demo.',
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
              SizedBox(
                  width: 150.0,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: const Color(0xff0e88eb),
                    child: const Text('Open Github'),
                    onPressed: () => launch(
                        'https://github.com/zegoim/zego-express-example-topics-flutter'),
                  )),
            ],
          ),
        )));
  }
}
