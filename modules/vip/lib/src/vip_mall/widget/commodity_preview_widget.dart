import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:vip/k.dart';
import 'package:vip/src/vip_mall/model/commodity_base.dart';

import '../mixin/bag_item_mixin.dart';
import 'commodity_animate_widget.dart';
import 'mall_goods_widget.dart';

/// 物品预览
///
class CommodityPreviewWidget extends StatelessWidget with BagItemMixin {
  final ShopMailCommodity commodity;
  final dynamic extra;
  final String? expireDate;
  final String? expireJumpPage;
  final bool? using;

  final bool isAllBorderRadius;

  /// 是否支持分解
  final bool canBreak;

  /// 分解按钮回调
  final GestureTapCallback? goBreakCallback;

  final String? gradeIcon;
  final String? breakTips;
  final double? borderRadius;

  const CommodityPreviewWidget({
    super.key,
    required this.commodity,
    required this.extra,
    this.expireJumpPage,
    this.expireDate,
    this.using,
    this.canBreak = false,
    this.goBreakCallback,
    this.gradeIcon,
    this.breakTips,
    this.isAllBorderRadius = false,
    this.borderRadius,
  });

  Map<String, dynamic> get extraMap {
    if (extra is Map<String, dynamic>) {
      return extra;
    }
    return {};
  }

  _onExpireDateTaped(BuildContext context) {
    if (expireJumpPage != null && expireJumpPage!.isNotEmpty) {
      BaseWebviewScreen.show(context, url: expireJumpPage!);
    }
  }

  _onMountTaped(BuildContext context) {
    if (extraMap.containsKey('type') && extraMap['type'] == 'gift') {
      GiftConfig config = GiftConfig.fromJson(extraMap);
      CommodityAnimateWidget.show(context, config);
    } else {
      Fluttertoast.showToast(msg: K.vip_commodity_config_error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 个人主页装扮预览
    if (ShopMailCommodityType.Decorate == commodity.commodityType) {
      return _buildDecorationBackground(context);
    }
    // 卡片资料页装扮预览
    if (ShopMailCommodityType.CardDecorate == commodity.commodityType) {
      return _buildCardDecorationBackground(context);
    }
    return _buildBackground(context);
  }

  Widget _buildAnim(DecorateCommodity item) {
    return PositionedDirectional(
      top: 0,
      start: 0,
      end: 0,
      bottom: 310.0 - (812 / 375) * 260,
      child: DecorateDisplayWidget(
        effect: Decorate(item.giftId, item.vapSize),
      ),
    );
  }

  Widget _buildUserInfo(DecorateCommodity item) {
    return PositionedDirectional(
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
                        item.userName,
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
                      uid: item.uid,
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
            height: 65,
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10),
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
                        sex: item.sex,
                        age: item.age,
                        width: 31,
                        height: 14,
                      ),
                    ),
                    if (item.vipLevel > 0) UserVipWidget(vip: item.vipLevel),
                    if (item.popularityLevel > 0) UserPopularity(popularityLevel: item.popularityLevel),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 主页装扮
  Widget _buildDecorationBackground(BuildContext context) {
    DecorateCommodity item = DecorateCommodity.fromJson(extraMap);

    return SizedBox(
      width: Util.width,
      height: 300,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: isAllBorderRadius
                ? BorderRadius.circular(borderRadius ?? 20)
                : BorderRadius.vertical(top: Radius.circular(borderRadius ?? 20)),
            child: CachedNetworkImage(
              imageUrl: commodity.imageBackground,
              width: Util.width,
              height: 300,
              cachedWidth: Util.width.px,
              cachedHeight: 300.px,
              fit: BoxFit.cover,
              placeholder: Container(color: R.color.secondBgColor),
              errorWidget: Container(color: R.color.secondBgColor),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 240,
              height: 288,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  PositionedDirectional(
                    start: 0,
                    end: 0,
                    bottom: 50,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      child: CachedNetworkImage(
                        imageUrl: item.userPhoto,
                        width: 240,
                        height: 240,
                        cachedWidth: 240.px,
                        cachedHeight: 240.px,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _buildUserInfo(item),
                  PositionedDirectional(
                    start: 0,
                    end: 0,
                    bottom: 0,
                    child: R.img(
                      'mall/bg_decorate.webp',
                      width: 240,
                      fit: BoxFit.fitWidth,
                      package: ComponentManager.MANAGER_VIP,
                    ),
                  ),
                  _buildAnim(item),
                  if (Util.validStr(item.titleIcon))
                    PositionedDirectional(
                      top: 11,
                      start: 8,
                      child: CachedNetworkImage(
                        imageUrl: item.titleIcon,
                        height: 40,
                        cachedHeight: 40.px,
                      ),
                    ),
                  PositionedDirectional(
                    top: 19,
                    end: 8,
                    child: _buildExpireDate(context),
                  ),
                ],
              ),
            ),
          ),
          if (canBreak) PositionedDirectional(bottom: 6, start: 8, child: _buildBreakBtn()),
        ],
      ),
    );
  }

  /// 卡片装扮
  Widget _buildCardDecorationBackground(BuildContext context) {
    DecorateCommodity item = DecorateCommodity.fromJson(extraMap);
    return SizedBox(
      width: Util.width,
      height: 250,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: isAllBorderRadius
                ? BorderRadius.circular(borderRadius ?? 20)
                : BorderRadius.vertical(top: Radius.circular(borderRadius ?? 20)),
            child: CachedNetworkImage(
              imageUrl: commodity.imageBackground,
              width: Util.width,
              height: 250,
              cachedWidth: Util.width.px,
              cachedHeight: 250.px,
              fit: BoxFit.cover,
              placeholder: Container(color: R.color.secondBgColor),
              errorWidget: Container(color: R.color.secondBgColor),
            ),
          ),
          PositionedDirectional(
            top: 78,
            start: 0,
            end: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                color: R.colors.bottomBarColor,
                child: DecorateDisplayWidget(
                  effect: Decorate(item.giftId, item.vapSize),
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 22,
            start: 0,
            end: 0,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(item.panelImage),
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 0,
            child: R.img(
              'mall/bg_decorate.webp',
              width: Util.width,
              fit: BoxFit.fitWidth,
              color: R.colors.mainTextColor.withOpacity(0.2),
              package: ComponentManager.MANAGER_VIP,
            ),
          ),
          PositionedDirectional(
            top: 56,
            start: 40,
            end: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: R.colors.bottomBarColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: CommonAvatar(
                      path: commodity.avatar,
                      shape: BoxShape.circle,
                      size: 76,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: 210,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: isAllBorderRadius
                ? BorderRadius.circular(borderRadius ?? 20)
                : BorderRadius.vertical(top: Radius.circular(borderRadius ?? 20)),
            child: CachedNetworkImage(
              imageUrl: commodity.imageBackground,
              width: Util.width,
              height: 210,
              cachedWidth: Util.width.px,
              cachedHeight: 210.px,
              fit: BoxFit.cover,
              placeholder: Container(color: R.colors.bottomBarColor),
              errorWidget: Container(color: R.colors.bottomBarColor),
            ),
          ),
          _buildInnerImage(),
          if (commodity.commodityType == ShopMailCommodityType.Mounts) _buildMountsMask(context),
          PositionedDirectional(
            bottom: 7,
            end: 12,
            child: _buildExpireDate(context),
          ),
          PositionedDirectional(top: 0, start: 0, child: _buildUsingWidget()),
          PositionedDirectional(top: 12, end: 12, child: _buildGradeIcon()),
          if (canBreak) PositionedDirectional(bottom: 6, start: 8, child: _buildBreakBtn()),
          _buildUnuseIndate()
        ],
      ),
    );
  }

  Widget _buildGradeIcon() {
    if (Util.isStringEmpty(gradeIcon)) return const SizedBox.shrink();
    return CachedNetworkImage(
      imageUrl: Util.getRemoteImgUrl(gradeIcon ?? ''),
      height: 24,
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildMountsMask(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onMountTaped(context),
      child: Container(
        alignment: AlignmentDirectional.center,
        child: R.img(
          "ic_gift_play.png",
          width: 42.0,
          height: 42.0,
          package: ComponentManager.MANAGER_VIP,
        ),
      ),
    );
  }

  Widget _buildInnerImage() {
    switch (commodity.commodityType) {
      case ShopMailCommodityType.EnterEffect:
        return buildEnterEffect(commodity, map: extraMap);
      case ShopMailCommodityType.Frame:
        return HeaderFrameWidget(
          commodity.commodityAvatar,
          commodity.commodityImage,
          130,
          commodityLiveOnly: commodity.commodityLiveOnly,
          commodityLiveLabel: commodity.commodityLiveLabel,
        );
      case ShopMailCommodityType.Bubble:
        return buildBubble(commodity, map: extraMap);
      case ShopMailCommodityType.MicrophoneEffect:
        return MicEffectWidget(commodity.commodityAvatar, commodity.commodityImage, 160.dp);
      case ShopMailCommodityType.DummyHonor:
      case ShopMailCommodityType.DummyMedal:
        return buildAchievementMedal(commodity, map: extraMap);
      case ShopMailCommodityType.RoomListDecorate:
        return RoomListDecorate(commodity.commodityAvatar, commodity.commodityImage, 328.dp);
      default:
        return _buildGift();
    }
  }

  Widget _buildGift() {
    return CachedNetworkImage(
      imageUrl: commodity.image,
      width: 193,
      height: 193,
      fit: BoxFit.contain,
    );
  }

  Widget _buildExpireDate(BuildContext context) {
    if (expireDate == null || expireDate!.isEmpty) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => _onExpireDateTaped(context),
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 5, end: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 24,
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img('mall/ic_question_mark.svg', width: 14, height: 14, package: ComponentManager.MANAGER_VIP),
            const SizedBox(width: 3),
            Text(
              K.vip_valid_date(['$expireDate']),
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  /// 穿戴中标识
  Widget _buildUsingWidget() {
    if (using != true) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(20), bottomEnd: Radius.circular(20)),
      ),
      child: Text(commodity.inUseDesc ?? K.vip_wearing_now, style: const TextStyle(color: Colors.white, fontSize: 13)),
    );
  }

  Widget _buildBreakBtn() {
    return Container(
      height: 24,
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: goBreakCallback,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!Util.isStringEmpty(breakTips)) ...[
              Text(
                breakTips ?? '',
                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 12),
            ],
            R.img("vip_bag_break.webp", width: 16, height: 16, package: ComponentManager.MANAGER_VIP),
            Text(
              K.vip_goto_break,
              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnuseIndate() {
    String text = commodity.unuseInvalidDurationDisplay ?? '';
    return Visibility(
      visible: !Util.isNullOrEmpty(text),
      child: PositionedDirectional(
        bottom: 4,
        end: 4,
        child: Container(
          height: 24,
          alignment: Alignment.center,
          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$text${K.vip_dissappear_after}',
            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
