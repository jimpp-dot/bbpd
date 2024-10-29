import 'dart:io';

import 'package:shared/shared.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class ReqData {
  String? manufacturer;
  String? model;
}

Future<ReqData> getReqData() async {
  ReqData reqData = ReqData();
  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
      reqData.manufacturer = deviceInfo.manufacturer;
      reqData.model = deviceInfo.model;
    } else {
      IosDeviceInfo deviceInfo = await DeviceInfoPlugin().iosInfo;
      reqData.manufacturer = 'Apple';
      reqData.model = deviceInfo.model;
    }
  } on PlatformException catch (e) {
    Log.d(e);
  }
  return reqData;
}
