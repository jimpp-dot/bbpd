import 'package:shared/shared.dart';
import 'package:shared/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../k.dart';

class AppIOSReviewDialog extends StatefulWidget {
  static const KEY_APP_IOS_ACTIVE_COUNT = "app.ios.active.count";
  static const KEY_APP_IOS_HAS_RATING = "app.ios.has.rating";

  const AppIOSReviewDialog({super.key});

  static show(BuildContext context) async {
    if (Util.isAndroid) return;
    int hasRating = Config.getInt(KEY_APP_IOS_HAS_RATING, 0);
    Log.d("AppIOSReviewDialog hasRating = $hasRating");
    if (hasRating > 0) return;
    int currentCount = getAndAddLunchCount();

    Log.d("AppIOSReviewDialog#show!!!");
    String url = "${System.domain}mission/showEvaluate";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map data = response.value();
      Log.d("AppIOSReviewDialog msg = $data");
      if (data['success']) {
        bool pop = data["data"]["popUp"];
        int activeCount = data["data"]["activeCount"];
        Log.d(
            "AppIOSReviewDialog activeCount=$activeCount and currentCount=$currentCount and pop=$pop");
        if (currentCount > activeCount && pop) {
          DialogQueue.root.enqueue(
              context: context,
              builder: (context) {
                return const AppIOSReviewDialog();
              });
        }
      } else {
        Log.d("AppIOSReviewDialog showEvaluate api error and data");
      }
    } catch (e) {
      Log.d('AppIOSReviewDialog Request $url with error: ${e.toString()}');
    }
  }

  static getAndAddLunchCount() {
    int count = Config.getInt(KEY_APP_IOS_ACTIVE_COUNT, 0);
    int currentCount = count + 1;
    Config.set(KEY_APP_IOS_ACTIVE_COUNT, currentCount.toString());
    return currentCount;
  }

  static Future<void> goToAppStore() async {
    String appid = Config.get('appinfo.appid');
    if (appid.isEmpty) {
      appid = Constant.iosAppInfoAppId;
    }
    String url =
        'itms-apps://itunes.apple.com/app/id$appid?action=write-review';
    bool success = false;
    bool canL = await canLaunch(url);
    if (canL == true) {
      success = await launch(url);
    }
    Log.d('Review app in app store with result: $success, url: $url');
  }

  static Future<void> postEvaluateData(int rating, String feedback) async {
    String url = "${System.domain}mission/evaluate";
    Map<String, String> postData = {"star": rating.toString()};
    if (feedback.isNotEmpty) {
      postData["feedback"] = feedback;
    }

    Log.d("postEvaluateData url = $url and data = $postData");

    try {
      XhrResponse response =
          await Xhr.postJson(url, postData, throwOnError: true);
      Map data = response.value();
      if (data['success'] == true) {
        Log.d("postEvaluateData success!");
      } else {
        Log.d("postEvaluateData error!");
      }
    } catch (e) {
      Log.d('postEvaluateData Request $url with error: ${e.toString()}');
    }
  }

  @override
  _AppIOSReviewDialogState createState() => _AppIOSReviewDialogState();
}

class _AppIOSReviewDialogState extends State<AppIOSReviewDialog> {
  static const int VIEW_STATE_INIT = -1;
  static const int VIEW_STATE_3_LESS = 3;
  static const int VIEW_STATE_5_RATING = 5;

  int _viewState = -1;
  int _ratingCount = 0;
  String _feedBackText = "";

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        R.img(
          'icon_app_comment.webp',
          package: ComponentManager.MANAGER_BASE_CORE,
          height: _getImgHeight().floor() * 1.0,
          width: _getImgWidth().floor() * 1.0,
          fit: BoxFit.fill,
        ),
        Stack(
          children: [
            PositionedDirectional(
              top: -2,
              child: Container(
                width: _getImgWidth().floor() * 1.0,
                height: 5,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              decoration: BoxDecoration(
                color: R.color.mainBgColor,
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(16),
                  bottomEnd: Radius.circular(16),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    R.string('app_review_question', args: [Util.appName]),
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    child: StarWidget(
                      star: 0,
                      onTap: _onRatingUpdate,
                      padding: const EdgeInsetsDirectional.only(end: 12),
                      width: 35,
                      height: 35,
                    ),
                  ),
                  _viewState == VIEW_STATE_INIT
                      ? Text(
                          R.string("app_review_click_star",
                              args: [Util.appName]),
                          style: TextStyle(
                              fontSize: 14, color: R.color.thirdTextColor),
                        )
                      : Container(),
                  _viewState == VIEW_STATE_3_LESS
                      ? SizedBox(
                          height: 96,
                          child: Theme(
                            data: ThemeData(
                                primaryColor: R.color.secondBgColor,
                                hintColor: R.color.secondBgColor),
                            child: TextField(
                              maxLines: 3,
                              onChanged: (v) => _feedBackText = v,
                              autofocus: false,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: R.color.secondBgColor,
                                hintText:
                                    R.string("app_review_three_star_hint"),
                                hintStyle: const TextStyle(
                                    color: Color(0xFF5B6389), fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  _viewState == VIEW_STATE_5_RATING
                      ? Center(
                          child: Text(
                            R.string("app_review_five_star",
                                args: [Util.appName]),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: R.color.thirdTextColor, fontSize: 14),
                          ),
                        )
                      : Container(),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _viewState == VIEW_STATE_INIT
                        ? null
                        : Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              _getNegativeButton(),
                              const SizedBox(width: 8, height: 48),
                              _getPositiveButton(),
                            ].where((it) => it != null).toList(),
                          ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  void _onRatingUpdate(int type, int rating) {
    _ratingCount = rating;
    Log.d("onRatingUpdate rating = $rating and _rating_count = $_ratingCount");

    if (rating == 4) {
      Toast.showCenter(context, R.string("app_review_four_star"));
      Navigator.of(context).pop(true);
    } else {
      int viewState = VIEW_STATE_INIT;
      if (rating == 5) {
        viewState = VIEW_STATE_5_RATING;
      } else if (rating == 1 || rating == 2 || rating == 3) {
        viewState = VIEW_STATE_3_LESS;
      }
      setState(() {
        _viewState = viewState;
      });
    }
    Config.set(AppIOSReviewDialog.KEY_APP_IOS_HAS_RATING, "1");
    AppIOSReviewDialog.postEvaluateData(_ratingCount, _feedBackText);
  }

  @override
  Widget build(BuildContext context) {
    return buildTransparent(context);
  }

  Widget _getNegativeButton() {
    String text = K.base_go_back;
    if (_viewState == VIEW_STATE_3_LESS) {
      text = R.string("app_review_feedback_not");
    }
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).pop(false),
          borderRadius: BorderRadius.circular(24),
          child: Ink(
            height: 48,
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                textScaleFactor: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPositiveButton() {
    String text = K.confirm;
    if (_viewState == VIEW_STATE_5_RATING) {
      text = R.string("app_review_go_app_store");
    } else if (_viewState == VIEW_STATE_3_LESS) {
      text = R.string("app_review_feedback_commit");
    }

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handlePositiveButtonClicked,
          borderRadius: BorderRadius.circular(24),
          child: Ink(
            height: 48,
            decoration: BoxDecoration(
              color: R.color.mainBrandColor,
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: R.color.mainBrandGradientColors),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handlePositiveButtonClicked() async {
    if (_viewState == VIEW_STATE_5_RATING) {
      await AppIOSReviewDialog.goToAppStore();
      Navigator.of(context).pop(true);
    } else if (_viewState == VIEW_STATE_3_LESS) {
      if (_feedBackText.isEmpty) {
        Toast.showCenter(context, R.string("app_review_three_star_tips"));
        return;
      }
      AppIOSReviewDialog.postEvaluateData(_ratingCount, _feedBackText);
      Navigator.of(context).pop(true);
    }
  }

  Center buildTransparent(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding:
              const EdgeInsets.only(left: 32, right: 31, top: 24, bottom: 20),
          child: _buildContent(context),
        ),
      ),
    );
  }

  //屏幕适配
  double _getImgHeight() {
    return (170 / 312) * (_getImgWidth());
  }

  //屏幕适配
  double _getImgWidth() => MediaQuery.of(context).size.width - (31.0 + 32.0);
}
