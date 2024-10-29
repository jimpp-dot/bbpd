import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/anchor_zone/welfare_model.dart';
import '../../k.dart';
import 'package:shared/util/color_constant.dart';

/// 本期粉丝团积分控件
class FanGroupIntegralWidget extends StatelessWidget {
  final FanGroupIntegral? data;

  const FanGroupIntegralWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isFirstStage = data?.isFirstStage ?? true;
    List<Widget> widgets = [];
    widgets.add(_background('fan_group_integral_bg.webp'));
    widgets.add(_title(K.vip_fan_group_points));
    if ((data?.isAnchor ?? false) == false) {
      widgets.add(_contribute(K.vip_my_contribute, data?.point ?? ''));
    }
    bool isFullLevel = data?.isFullLevel ?? false;
    widgets.add(_buildLack(isFullLevel, data?.lackPoint ?? 0));
    widgets.add(_progress(isFirstStage, data?.nextStageProgress ?? 0));
    widgets.add(_rightLevelImage(isFullLevel, data?.currentStageImageUrl));
    widgets.add(isFirstStage
        ? _leftLevelCircle
        : _leftLevelImage(data?.previousStageImageUrl));
    widgets.add(_endTime(K.vip_fans_group_end_time([data?.endDate ?? ''])));
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 12),
      child: Stack(alignment: AlignmentDirectional.topStart, children: widgets),
    );
  }

  /// 背景图
  Widget _background(String img) =>
      R.img(img, package: ComponentManager.MANAGER_VIP);

  /// 标题"本期粉丝团积分控件"
  Widget _title(String title) => Container(
      margin: const EdgeInsetsDirectional.only(start: 12, top: 8),
      child: YouSheText(title,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500)));

  /// 我的贡献
  Widget _contribute(String title, String points) => Align(
        alignment: AlignmentDirectional.topEnd,
        child: Container(
          padding: const EdgeInsetsDirectional.only(top: 9),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                const SizedBox(width: 3),
                Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 15, end: 15, top: 4, bottom: 4),
                    decoration: const BoxDecoration(
                      color: Color(0X66000000),
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(15)),
                    ),
                    child: Text(points,
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorConstant.welfareContributeTextColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: Util.numFontFamily))),
                const SizedBox(width: 10)
              ]),
        ),
      );

  Widget _buildLack(bool isTopLevel, int lockPoint) {
    if (!isTopLevel && lockPoint <= 0) return Container();
    return Container(
        margin: const EdgeInsetsDirectional.only(top: 48),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isTopLevel
                    ? K.vip_fans_group_top_level
                    : K.vip_fans_group_lack(['$lockPoint']),
                style: const TextStyle(
                    fontSize: 11,
                    color: ColorConstant.welfareContributeTextColor,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ]));
  }

  /// 福利升级左侧实心黄圆点
  /// 当用户积分大于0且小于第1阶段的积分
  Widget get _leftLevelCircle => Container(
      margin: const EdgeInsetsDirectional.only(start: 14, top: 61),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: ColorConstant.welfareContributeTextColor,
          border: Border.all(
              width: 1.0, color: ColorConstant.welfareContributeTextColor),
          shape: BoxShape.circle));

  /// 福利升级左侧图片
  Widget _leftLevelImage(String? url) => _image(
      url,
      ColorConstant.welfareContributeTextColor,
      const EdgeInsetsDirectional.only(start: 10, top: 44));

  /// 福利升级右侧图片
  Widget _rightLevelImage(bool isTopLevel, String? url) => Align(
        alignment: AlignmentDirectional.topEnd,
        child: _image(
            url,
            isTopLevel
                ? ColorConstant.welfareContributeTextColor
                : Colors.white.withOpacity(0.2),
            const EdgeInsetsDirectional.only(end: 10, top: 44)),
      );

  /// 积分进度条
  Widget _progress(bool isFirstStage, double percent) {
    double marginLeft = isFirstStage ? 33 : 65;
    double width = Util.width - (20 * 2 + 65 + marginLeft);
    if (percent <= 0) percent = 0;
    if (percent >= 1) percent = 1;
    bool full = percent == 1;
    return Stack(children: [
      Container(
        margin: EdgeInsetsDirectional.only(start: marginLeft, end: 65, top: 68),
        width: width,
        height: 6,
        color: const Color(0X660d0d0d),
      ),
      Container(
        margin: EdgeInsetsDirectional.only(start: marginLeft, end: 65, top: 68),
        width: width * percent,
        height: 6,
        decoration: BoxDecoration(
            color: ColorConstant.welfareContributeTextColor,
            borderRadius: full
                ? BorderRadiusDirectional.zero
                : const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(3), bottomEnd: Radius.circular(3))),
      ),
    ]);
  }

  /// 粉丝团福利结束时间
  Widget _endTime(String text) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(top: 84),
            padding: const EdgeInsetsDirectional.only(
                start: 6, end: 6, top: 2, bottom: 2),
            height: 20,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadiusDirectional.circular(10)),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  /// 左侧图片
  Widget _image(String? url, Color strokeColor, EdgeInsetsDirectional margin) {
    return Container(
      margin: margin,
      width: 56,
      height: 56,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 2.0, color: strokeColor),
          shape: BoxShape.circle),
      child: Container(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
            color: Color(0XFF3D178B), shape: BoxShape.circle),
        child: Center(
          child: ClipOval(
            child: (url?.isNotEmpty ?? false)
                ? CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  )
                : const SizedBox(width: 40, height: 40),
          ),
        ),
      ),
    );
  }
}
