import 'package:shared/assets.dart';
import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../../assets.dart';
import 'banner_repo.dart';
import 'model/recommend_top_info.dart';

/// 置顶推荐弹窗
class RecommendTopDialog extends StatefulWidget {
  const RecommendTopDialog({
    Key? key,
  }) : super(key: key);

  static Future openRecommendTopDialog(BuildContext context) {
    return DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      duration: const Duration(milliseconds: 250),
      builder: (context) => const RecommendTopDialog(),
    );
  }

  @override
  _RecommendTopDialogState createState() => _RecommendTopDialogState();
}

class _RecommendTopDialogState extends State<RecommendTopDialog> {
  bool _loading = true;
  String? _errorMsg;
  bool _recommended = false;
  RecommendTopInfo? _info;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    DataRsp<RecommendTopInfo> rsp = await BannerRepo.getRecommendTopInfo();
    _loading = false;
    if (rsp.success == true) {
      _info = rsp.data;
      _recommended = _info?.recommended ?? false;
    } else {
      _errorMsg = rsp.msg;
      Fluttertoast.showToast(msg: rsp.msg);
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_loading || (_errorMsg != null && _errorMsg!.isNotEmpty)) {
      return CustomAlertDialog(
        width: 312,
        height: 334,
        contentBuilder: (context) {
          return SizedBox(
            height: 220,
            child: _loading
                ? const Loading()
                : ErrorData(
                    top: 0,
                    bottom: 0,
                    error: _errorMsg,
                    onTap: () {
                      _errorMsg = null;
                      _loading = true;
                      setState(() {});
                      _loadData();
                    },
                  ),
          );
        },
        closeWidget: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: R.img(
              BaseAssets.shared$ic_close_svg,
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 16,
              height: 16,
              color: R.color.mainTextColor,
            ),
          ),
        ),
      );
    }

    if (_recommended) {
      return _RecommendSuccessView();
    } else {
      return _RecommendIntroView(
        info: _info,
        recommendCallback: () {
          setState(() {
            _recommended = true;
          });
        },
      );
    }
  }
}

class _RecommendIntroView extends StatelessWidget {
  DialogLoadingController? _controller;
  final RecommendTopInfo? info;
  final VoidCallback? recommendCallback;

  _RecommendIntroView({Key? key, this.info, this.recommendCallback})
      : super(key: key);

  void _showLoading(BuildContext context) {
    if (_controller != null) {
      return;
    }

    _controller = DialogLoadingController();
    _controller?.show(context: context);
  }

  void _hideLoading() {
    _controller?.close();
    _controller = null;
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        R.img(Assets.settings$balance_recommend_top_demo_png,
            width: 264,
            height: 144,
            package: ComponentManager.MANAGER_SETTINGS,
            fit: BoxFit.cover),
        const SizedBox(
          height: 16,
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${info?.limitText}',
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: Util.fontFamily),
              ),
              TextSpan(
                text: '${info?.dayText}',
                style: TextStyle(
                    color: const Color(0xFFFDA252),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: Util.fontFamily),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        _renderProgress(info?.chargeNum ?? 0, info?.limitNum ?? 0),
      ],
    );
  }

  /// 任务完成进度
  Widget _renderProgress(int progress, int total) {
    bool disabled = progress < total;
    double factor = progress / total;
    if (factor > 1) {
      factor = 1;
    }

    return SizedBox(
      width: 264,
      height: 14,
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.infinity,
            height: 14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: R.color.dividerColor),
          ),
          FractionallySizedBox(
            widthFactor: factor,
            heightFactor: 1,
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: double.infinity,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$progress',
                style: TextStyle(
                  fontSize: 9,
                  color: disabled ? R.color.mainTextColor : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '/$total',
                style: TextStyle(
                  fontSize: 9,
                  color: disabled ? R.color.secondTextColor : Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool disabled = (info?.chargeNum ?? 0) < (info?.limitNum ?? 0);

    return WillPopScope(
      onWillPop: () async => false,
      child: CustomAlertDialog(
        width: 312,
        height: 342,
        contentBuilder: (context) {
          return _buildContent();
        },
        positiveButton: PositiveButton(
          onPressed: disabled
              ? null
              : () async {
                  _showLoading(context);
                  DataRsp rsp = await BannerRepo.doRecommendTop();
                  _hideLoading();
                  if (rsp.success == true) {
                    if (recommendCallback != null) {
                      recommendCallback!();
                    }
                  } else {
                    Fluttertoast.showToast(msg: rsp.msg ?? '');
                  }
                },
          text: K.setting_goto_recommend,
          width: 216,
          height: 48,
          canDisable: disabled,
          useGradientBg: true,
          textSize: disabled ? 16 : 15,
          textColor:
              disabled ? R.color.mainTextColor.withOpacity(0.2) : Colors.white,
          gradientBg: disabled
              ? [
                  const Color(0xFFE7EAEF),
                  R.color.secondBgColor,
                ]
              : R.color.mainBrandGradientColors,
        ),
        closeWidget: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: R.img(
              BaseAssets.shared$ic_close_svg,
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 16,
              height: 16,
              color: R.color.mainTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _RecommendSuccessView extends StatelessWidget {
  Widget _buildContent() {
    return Column(
      children: <Widget>[
        R.img(Assets.settings$balance_recommend_top_done_png,
            width: 214,
            height: 144,
            package: ComponentManager.MANAGER_SETTINGS,
            fit: BoxFit.cover),
        const SizedBox(
          height: 24,
        ),
        Text(
          K.setting_recommend_top_success,
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          K.setting_recommend_top_success_desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomAlertDialog(
        width: 312,
        height: 334,
        contentBuilder: (context) {
          return _buildContent();
        },
        closeWidget: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: R.img(
              BaseAssets.shared$ic_close_svg,
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 16,
              height: 16,
              color: R.color.mainTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
