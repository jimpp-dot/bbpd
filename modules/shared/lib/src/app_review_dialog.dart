import 'package:shared/K.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppReviewDialog extends StatelessWidget {
  static const KEY_APP_REVIEW_SUCCESS = 'app.review.success';
  static const KEY_APP_REVIEW_SHOW = 'app.review.show';

  const AppReviewDialog({super.key});

  static show(BuildContext context) {
    if (Config.getInt(AppReviewDialog.KEY_APP_REVIEW_SUCCESS, 0) > 0 ||
        Config.getInt(AppReviewDialog.KEY_APP_REVIEW_SHOW, 0) > 0) return;

    Future.delayed(const Duration(minutes: 10), () {
      if (Config.getInt(AppReviewDialog.KEY_APP_REVIEW_SUCCESS, 0) > 0 ||
          Config.getInt(AppReviewDialog.KEY_APP_REVIEW_SHOW, 0) > 0 ||
          Session.uid <= 0) return;
      showDialog(
          context: context,
          builder: (context) {
            return const AppReviewDialog();
          });
      Config.set(AppReviewDialog.KEY_APP_REVIEW_SHOW, '1');
    });
  }

  static Future<void> doAppReview({bool report = true}) async {
    String url;
    if (Util.isAndroid) {
      url = 'market://details?id=${Constant.packageName}';
    } else {
      String appid = Config.get('appinfo.appid');
      if (appid.isEmpty) {
        appid = Constant.iosAppInfoAppId;
      }
      url = 'itms-apps://itunes.apple.com/app/id$appid';
    }
    bool success = false;
    try {
      bool canL = await canLaunch(url);
      if (canL == true) {
        success = await launch(url);
      }
    } catch (e) {
      success = false;
      Log.d('jump error,$e');
    }
    Log.d('Review app in app store with result: $success, url: $url');
    if (success && report) {
      await _reportAppReview();
    }
  }

  static Future<void> _reportAppReview() async {
    if (!Util.isAndroid) return;

    String url = "${System.domain}mission/fivestars";
    try {
      XhrResponse response = await Xhr.postJson(url, {}, throwOnError: true);
      Map data = response.value();
      if (data['success'] == true) {
        Config.set(AppReviewDialog.KEY_APP_REVIEW_SUCCESS, '1');
      }
    } catch (e) {
      Log.d('Request $url with error: ${e.toString()}');
    }
  }

  static Future<void> doKillerAppReview({bool report = true}) async {
    String url;
    if (Util.isAndroid) {
      url = 'market://details?id=${Constant.packageName}';
    } else {
      String appid = Config.get('appinfo.appid');
      if (appid.isEmpty) {
        appid = Constant.iosAppInfoAppId;
      }
      url =
          'itms-apps://itunes.apple.com/cn/app/id$appid?mt=8&action=write-review';
    }
    bool success = false;
    bool canL = await canLaunch(url);
    if (canL == true) {
      success = await launch(url);
    }
    Log.d('Review app in app store with result: $success, url: $url');
    if (success && report) {
      String url = "${System.domain}games/mission/fiveStar";
      try {
        XhrResponse response = await Xhr.postJson(url, {}, throwOnError: true);
        Map data = response.value();
        if (data['success'] == true) {
          Config.set(AppReviewDialog.KEY_APP_REVIEW_SUCCESS, '1');
        }
      } catch (e) {
        Log.d('Request $url with error: ${e.toString()}');
      }
    }
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          R.string('app_review_content', args: [Util.appName]),
          style: R.textStyle.subhead,
          textAlign: TextAlign.center,
        ),
        Container(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              K.app_review_content_desc,
              style: R.textStyle.caption,
            ),
            R.img('ic_coin.png',
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 24,
                height: 24),
            Text(
              ' X 20',
              style: R.textStyle.body1.copyWith(color: const Color(0xFFFF5353)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      contentBuilder: _buildContent,
      negativeButton: NegativeButton(
        text: K.app_review_cancel,
      ),
      positiveButton: PositiveButton(
        text: K.app_review_sure,
        onPressed: () async {
          await AppReviewDialog.doAppReview();
          Navigator.of(context).pop(true);
        },
      ),
    );
  }
}
