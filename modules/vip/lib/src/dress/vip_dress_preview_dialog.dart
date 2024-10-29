import 'package:flutter/material.dart';
import 'package:shared/assets.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:vip/assets.dart';
import 'package:vip/k.dart';
import 'package:vip/src/dress/love_cat_decorate_widget.dart';
import 'package:vip/src/pb/generated/vip_rpc_pretend.pb.dart';

Widget sourceWidget(BuildContext context, String sourceContent) {
  var style = TextStyle(
    color: R.color.brightTextColor,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  String content = K.dress_source_content([sourceContent]);
  double width = TextUtils.getTextSize(context, content, style, 200, 1).width;
  return sourceContent.isNotEmpty
      ? PositionedDirectional(
          start: 9,
          top: 9,
          child: Container(
            height: 18,
            width: width + 18,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.05), borderRadius: BorderRadius.all(Radius.circular(10.5))),
            child: Text(
              content,
              style: style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      : const SizedBox.shrink();
}

/// 带个人页背景的预览弹窗，支持显示vap动画
class VipUserBgPreviewDilaog extends AlertDialog {
  final PretendInfo item;
  final String previewUrl;
  final int? vapId;
  final int? vapSize;
  final String gotType;

  const VipUserBgPreviewDilaog(this.item, this.previewUrl, this.vapId, this.vapSize, this.gotType, {super.key});

  @override
  Widget build(BuildContext context) {
    double radius = 21;
    double boaderHeight = 280 + 53 - radius;
    return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsetsDirectional.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Container(
                  width: 280,
                  height: boaderHeight,
                  decoration: BoxDecoration(
                    color: R.color.mainBgColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: SizedBox(
                    width: 280,
                    height: boaderHeight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: CachedNetworkImage(
                            imageUrl: Session.icon,
                            width: 280,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                        ),
                        PositionedDirectional(
                          start: 0,
                          end: 0,
                          bottom: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  PositionedDirectional(
                                    start: 0,
                                    end: 0,
                                    bottom: -20,
                                    child: Container(
                                      height: 80,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.4)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        LimitedBox(
                                          maxWidth: 100,
                                          child: Text(
                                            Session.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        IDWidget(
                                          uid: Session.uid,
                                          imagePath: null,
                                          width: 16,
                                          height: 16,
                                          needShadows: true,
                                          fontSize: 13,
                                          fontColor: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  color: R.color.mainBgColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                                alignment: AlignmentDirectional.centerStart,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      BaseK.K.base_current_online,
                                      style: TextStyle(color: R.color.secondTextColor, fontSize: 11),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.only(end: 4.0, top: 2),
                                          child: UserSexAndAgeWidget(
                                            sex: Session.sex,
                                            age: Session.age,
                                            width: 31,
                                            height: 14,
                                          ),
                                        ),
                                        if (Session.vip > 0) UserVipWidget(vip: Session.vip),
                                        if (Session.popularityLevel > 0) UserPopularity(popularityLevel: Session.popularityLevel),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        sourceWidget(context, gotType),
                        // 动效
                        if ((vapId != null && vapId! > 0) || (Util.validStr(previewUrl))) ...[
                          if (item.mp4Source.showType == 1) ...LoveCatDecorateWidget.iconList(item.mp4Source.imageText),
                          PositionedDirectional(
                            top: 0,
                            start: 0,
                            end: 0,
                            bottom: boaderHeight - 280 * 1104 / 510,
                            child: DecorateDisplayWidget(effect: Decorate(vapId ?? 0, vapSize ?? 0, image: previewUrl), repeat: true),
                          ),
                          if (item.mp4Source.showType == 1) ...LoveCatDecorateWidget.nameList(item.mp4Source.imageText),
                        ]
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg, width: 34, height: 34))
          ],
        ));
  }
}

/// 资料卡预览弹窗
class VipUserCardPrevieDilaog extends AlertDialog {
  final String previewUrl;
  final String gotType;

  const VipUserCardPrevieDilaog(this.previewUrl, this.gotType, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 200,
              alignment: Alignment.center,
              //200
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF544B95), Color(0xFF221B5B)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(21),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  //资料卡卡片
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 280,
                        height: 100,
                        alignment: Alignment.center,
                        //200
                        decoration: BoxDecoration(
                            color: R.color.appBarColor,
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(14),
                                topEnd: Radius.circular(14),
                                bottomStart: Radius.circular(21),
                                bottomEnd: Radius.circular(21))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 36),
                            Text(Session.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: R.color.mainTextColor,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis)),
                            const SizedBox(height: 2),
                            Text('ID: ${Session.uid}', style: TextStyle(fontSize: 12, color: R.color.thirdTextColor))
                          ],
                        ),
                      )),
                  sourceWidget(context, gotType),
                  // 装扮条
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: CachedNetworkImage(
                        imageUrl: previewUrl,
                        width: 280,
                        fit: BoxFit.fitWidth,
                        placeholder: Container(color: R.color.secondBgColor),
                        errorWidget: Container(color: R.color.secondBgColor),
                      ),
                    ),
                  ),
                  Center(
                    child: CommonAvatar(
                      path: Session.icon,
                      shape: BoxShape.circle,
                      size: 76,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg, width: 34, height: 34))
          ],
        ));
  }
}

/// 普通预览弹窗(可选显示用户头像)
class VipCommonPreviewDilaog extends AlertDialog {
  final String previewUrl;
  final double sourceRate;
  final double avatarRate;
  final String gotType;

  const VipCommonPreviewDilaog(this.previewUrl, this.sourceRate, this.avatarRate, this.gotType, {super.key});

  @override
  Widget build(BuildContext context) {
    double sourceSize = 180 * sourceRate;
    return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 240,
              alignment: Alignment.center,
              //200
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFECFFEA), Color(0xFFFFFFFF)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(21),
              ),
              child: SizedBox(
                child: Stack(
                  children: [
                    if (avatarRate > 0)
                      Center(
                          child: CommonAvatar(
                        path: Session.icon,
                        shape: BoxShape.circle,
                        size: sourceSize * avatarRate,
                      )),
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: previewUrl,
                        width: sourceSize,
                        height: sourceSize,
                        fit: BoxFit.contain,
                        errorWidget: Container(color: R.color.secondBgColor),
                      ),
                    ),
                    sourceWidget(context, gotType),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg, width: 34, height: 34))
          ],
        ));
  }
}

/// 带vap动画播放按钮的预览弹窗
class VipVapDressPreviewDilaog extends AlertDialog {
  final String previewUrl;
  final int vapId;
  final int vapSize;

  const VipVapDressPreviewDilaog(this.previewUrl, this.vapId, this.vapSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 200,
              alignment: Alignment.center,
              //200
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF544B95), Color(0xFF221B5B)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(21),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: previewUrl,
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      displayModalBottomSheet(
                        isBarrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Container(
                            width: Util.width,
                            height: Util.height,
                            color: Colors.black.withOpacity(0.01),
                            alignment: AlignmentDirectional.center,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [DecorateDisplayWidget(effect: Decorate(vapId, vapSize), repeat: false)],
                            ),
                          );
                        },
                        defineBarrierColor: Colors.black.withOpacity(0.4),
                        maxHeightRatio: 1,
                      );
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      child: R.img(
                        Assets.vip$ic_gift_play_png,
                        width: 42.0,
                        height: 42.0,
                        package: ComponentManager.MANAGER_VIP,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg, width: 34, height: 34))
          ],
        ));
  }
}
