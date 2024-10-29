import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/foundation.dart';

// 测试包失效时间
const kDebugBuildExpireDay = 7;

/// only run in debug and profile build.
/// check the build time, and exit app if build expired.
void validDebugBuild() async {
  if (!kReleaseMode && Platform.isAndroid) {
    // BUILD_TIME value is Seconds since UNIX epoch, from command $(date +%s)
    const buildTime = int.fromEnvironment('BUILD_TIME', defaultValue: 0);
    if (buildTime == 0) return;

    const expireDay =
        int.fromEnvironment('EXPIRE_DAY', defaultValue: kDebugBuildExpireDay);

    final buildDate = DateTime.fromMillisecondsSinceEpoch(buildTime * 1000);

    // only apks with 'whitelist' channel can skip this check.
    // so that we can make old debug apks run again by rewriting the channel to 'whitelist'
    //  with command `java -jar walle-cli-all.jar batch -c whitelist`
    if (DateTime.now().difference(buildDate).inDays >= expireDay) {
      await PushUtils.presentLocationNotification(
          id: 0, title: '测试包已过期', body: '请安装新包或联系工程师', payload: '');
      exit(0);
    }
  }
}
