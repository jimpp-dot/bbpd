import 'dart:io';
import 'package:shared/shared.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../../k.dart';
import '../api.dart';
import '../model/pb/generated/category.pb.dart';

mixin CertificateScreenMixin<T extends StatefulWidget> on State<T> {
  static const String TAG = "CertificateScreenMixin";
  String skillName = "";
  bool loading = true;
  CategoryDetail? skillDetail; // 配置信息
  CategoryVerify? verifyDetail; // 输入信息
  int verifyState = -1; //-1待提交 0 待审核， 1 已拒绝， 2 审核通过， 3 待人工审核
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    Log.d(tag: TAG, "init State");
    loading = true;
    errorMessage = null;
  }

  Future load(int cid) {
    return _load(cid).then((value) => initConfigs());
  }

  @override
  void dispose() {
    super.dispose();
    Log.d(tag: TAG, "dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
          title: Text(skillName,
              style: TextStyle(
                  fontSize: 17,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.bold)),
          actions: verifyState == 2 ? [_buildAction()] : null),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildAction() {
    return GestureDetector(
        onTap: () {
          showCancelDialog(context);
        },
        child: Container(
            padding: const EdgeInsetsDirectional.only(end: 16),
            alignment: AlignmentDirectional.center,
            child: Text(K.cer_cancel,
                style: TextStyle(fontSize: 15, color: R.color.mainTextColor))));
  }

  /// 取消资质
  Future<bool?> showCancelDialog(BuildContext context) {
    return showDialog<bool>(
        barrierDismissible: true,
        barrierColor: Colors.black45,
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: K.cer_cancel,
            content: K.cer_cancel_content(
                ["${skillDetail?.cancelMoney ?? 0}", skillName]),
            contentTextColor: R.color.mainTextColor,
            positiveButton: PositiveButton(
              text: K.cer_confirm,
              useGradientBg: true,
              gradientBg: R.color.mainBrandGradientColors,
              onPressed: () async {
                int price = skillDetail?.cancelMoney ?? 0;

                /// 先判断是否余额不足
                final IPayManager payManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PAY);
                SheetCallback? result =
                    await payManager.showRechargeSheet(System.context, price);
                if (result == null ||
                    result.reason == SheetCloseReason.Active) {
                  return;
                }
                payManager.pay(context,
                    key: 'certificate-cancel',
                    type: result.value?.key ?? 'available',
                    refer: 'certificate',
                    args: {
                      'money': price,
                      'type': 'slp-consume',
                      'params': {
                        'consume_type': 'cancel_category',
                        'cid': skillDetail?.cid ?? 0
                      }
                    },
                    showLoading: true, onPayed: () {
                  Navigator.of(context).pop(true);
                  Fluttertoast.showToast(msg: K.cer_cancel_succeed);
                  var properties = {
                    'uid': Session.uid,
                    'cid': skillDetail?.cid ?? 0,
                    'name': '${skillDetail?.name}'
                  };
                  Tracker.instance
                      .track(TrackEvent.quit_skill, properties: properties);
                  reload(skillDetail?.cid ?? 0);
                  Log.d(tag: TAG, "onPayed");
                }, onError: (isErrorCatch) {
                  Log.d(tag: TAG, "onError");
                }, onPayAppOpen: () {
                  Log.d(tag: TAG, "onPayAppOpen");
                });
              },
            ),
            negativeButton: NegativeButton(
              text: K.cancel,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          );
        });
  }

  Widget _buildBody() {
    if (loading) {
      return const Loading();
    }

    if ((errorMessage != null && errorMessage!.isNotEmpty) ||
        skillDetail == null) {
      return ErrorData(
        error: errorMessage,
        //TODO:  onTap: reload(widget.cid),
      );
    }

    if ((verifyDetail?.verifyState ?? -1) == 0) {
      return buildWait();
    } else {
      return buildContent();
    }
  }

  /// 审核中
  Widget buildWait() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 150, bottom: 0),
            width: 180,
            height: 180,
            child: R.img(
              Assets.certificate$certificate_wait_webp,
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Text(
              K.cer_checking,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: R.color.mainTextColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 2),
            child: Text(
              K.cer_please_wait_result,
              textScaleFactor: 1.0,
              style: TextStyle(
                  fontSize: 12.0, color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              K.cer_check_apply_notice,
              textScaleFactor: 1.0,
              style: TextStyle(
                  fontSize: 12.0, color: Colors.black.withOpacity(0.5)),
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.only(top: 12, bottom: 12 + Util.iphoneXBottom),
            child: InkWell(
              onTap: () {
                ISettingManager? manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_SETTINGS);
                manager?.openHelpScreen(context);
              },
              child: Text(
                K.cer_user_help,
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 16.0,
                  color: R.color.thirdBrightColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// title
  Widget buildTitleWidget(String title,
      {double? left, double? top, double? right, double? bottom}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: left ?? 0,
          end: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0),
      child: Text(
        title,
        style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  ///content
  Widget buildContentWidget(String content,
      {double? left, double? top, double? right, double? bottom}) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: EdgeInsets.only(
          left: left ?? 16,
          right: right ?? 16,
          top: top ?? 12,
          bottom: bottom ?? 0),
      child: Text(
        content,
        style: TextStyle(color: R.color.thirdTextColor, fontSize: 13.0),
      ),
    );
  }

  Widget buildDivider() {
    return Container(height: 1, color: R.color.dividerColor);
  }

  void initConfigs();

  Widget buildContent();

  Future<CategoryDetail?> _load(int cid) async {
    ResCategoryDetail rsp = await Api.getCertificateDetail(cid);
    if (rsp.success) {
      skillDetail = rsp.category;
      verifyDetail = rsp.verify;
      skillName = skillDetail?.name ?? skillName;
    } else {
      errorMessage = rsp.msg;
    }
    loading = false;
    return skillDetail;
  }

  reload(int cid) async {
    if (!mounted) return;
    setState(() {
      loading = true;
      errorMessage = null;
    });
    load(cid);
  }

  ///上传音频
  Future<String?> uploadFile(String localPath) async {
    Log.d("start upload localPath :$localPath");
    String? filePath;
    int startTime = DateTime.now().millisecondsSinceEpoch;
    OssUploadDataResp rsp = await BaseRequestManager.getFileUploadUrl('audio');
    if (rsp.success && rsp.data != null) {
      bool result =
          await BaseRequestManager.uploadFile(rsp.data!, File(localPath));
      if (result == true) {
        filePath = BaseRequestManager.getOssFilePath(
            rsp.data?.dir ?? '', File(localPath));
        int endTime = DateTime.now().millisecondsSinceEpoch;
        Log.d("upload succeed,path:$filePath,time cost:${endTime - startTime}");
      }
    }
    return filePath;
  }

  refresh() {
    if (mounted) setState(() {});
  }
}
