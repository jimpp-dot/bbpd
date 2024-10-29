import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/glory_center/widget/appreciator_tag_widget.dart';

import '../../../assets.dart';
import '../model/pb/generated/slp_glory.pb.dart';

typedef WearCallback = void Function(bool);

class GloryCenterDialog extends StatelessWidget {
  final int uid;
  final GloryCenterWearableBadge badge;
  final int badgeType;
  final WearCallback? wearCallback;

  const GloryCenterDialog(this.uid, this.badge, this.badgeType, {Key? key, this.wearCallback}) : super(key: key);

  static Future<void> show(BuildContext context, int uid, int badgeType, GloryCenterWearableBadge badge,
      {WearCallback? wearCallback}) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: GloryCenterDialog(uid, badge, badgeType, wearCallback: wearCallback),
        );
      },
    );
  }

  bool get isEffective => badge.effective && uid == Session.uid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width - 60.dp,
      height: isEffective ? 422.dp : 362.dp,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: isEffective ? 376.dp : 316.dp,
            padding: EdgeInsets.symmetric(horizontal: 10.dp),
            decoration: BoxDecoration(
              color: R.colors.dialogBgColor,
              borderRadius: BorderRadius.circular(16.dp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.dp,
                ),
                _buildPreviewWidget(),
                SizedBox(
                  height: 14.dp,
                ),
                Text(
                  badge.title,
                  style: TextStyle(fontSize: 16.dp, color: Colors.white),
                ),
                SizedBox(
                  height: 10.dp,
                ),
                _buildDesc(),
                SizedBox(
                  height: 10.dp,
                ),
                _buildWearBtn()
              ],
            ),
          ),
          Positioned(left: 16.dp, top: 15.dp, child: _buildStatusWidget())
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     const SizedBox(height: 24),
          //     Text(
          //       badge.title,
          //       style: TextStyle(
          //           color: R.color.mainTextColor,
          //           fontSize: 18.0,
          //           fontWeight: FontWeight.w500),
          //     ),
          //     const SizedBox(height: 20),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //       child: Text(
          //         '${K.personaldata_wear_condition}${badge.desc}',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             color: R.color.mainTextColor.withOpacity(0.6),
          //             fontSize: 13.0),
          //       ),
          //     ),
          //     const SizedBox(height: 20),
          //     Container(
          //       width: 140,
          //       height: 120,
          //       decoration: BoxDecoration(
          //         color: R.color.secondBgColor,
          //         borderRadius: BorderRadius.circular(12.0),
          //       ),
          //       child: Stack(
          //         alignment: AlignmentDirectional.center,
          //         children: [
          //           _buildStatusWidget(),
          //           Center(
          //             child: ColorFiltered(
          //               colorFilter: !badge.effective
          //                   ? const ColorFilter.matrix(
          //                       <double>[
          //                         0.2126,
          //                         0.7152,
          //                         0.0722,
          //                         0,
          //                         0,
          //                         0.2126,
          //                         0.7152,
          //                         0.0722,
          //                         0,
          //                         0,
          //                         0.2126,
          //                         0.7152,
          //                         0.0722,
          //                         0,
          //                         0,
          //                         0,
          //                         0,
          //                         0,
          //                         1,
          //                         0
          //                       ],
          //                     )
          //                   : const ColorFilter.mode(
          //                       Colors.transparent, BlendMode.color),
          //               child: Util.validStr(badge.icon) &&
          //                       Util.validStr(badge.additionName)
          //                   ? badge.giftBadgeType == 3
          //                       ? AppreciatorTagWidget(
          //                           icon: badge.icon,
          //                           label: badge.additionName,
          //                           scale: 1.3)
          //                       : GiftKingOrStarWithGiftNameTag(
          //                           name: badge.additionName,
          //                           icon: badge.icon,
          //                           color: Colors.white,
          //                           //(badge.badgeId == 119 || badge.giftBadgeType == 2) ? const Color(0xFFf8cf62) : Colors.white,
          //                           shadowColor: (badge.badgeId == 119 ||
          //                                   badge.giftBadgeType == 2)
          //                               ? const Color(0xffDD0020)
          //                               : null,
          //                           awakeGift: badge.awakeGift,
          //                         )
          //                   : ActivityBadgeWidget(
          //                       icon: badge.icon,
          //                       height: badgeType == 2 ? 26 : 44),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     if (Util.validStr(badge.allocateTime)) ...[
          //       const SizedBox(height: 12),
          //       Text(
          //         '${K.personaldata_allocate_time}${badge.allocateTime}',
          //         style: TextStyle(
          //             color: R.color.unionRankText1.withOpacity(0.4),
          //             fontSize: 11.0),
          //       ),
          //     ],
          //     if (Util.validStr(badge.wearConditionText)) ...[
          //       const SizedBox(height: 12),
          //       Text(
          //         '${K.personaldata_allocate_condition}${badge.wearConditionText}',
          //         style: TextStyle(
          //             color: R.color.unionRankText1.withOpacity(0.4),
          //             fontSize: 11.0),
          //       ),
          //     ],
          //     if (Util.validStr(badge.expireTime)) ...[
          //       const SizedBox(height: 8),
          //       Text(
          //         '${K.personaldata_adorn_expire_time}${badge.expireTime}',
          //         style: TextStyle(
          //             color: R.color.unionRankText1.withOpacity(0.4),
          //             fontSize: 11.0),
          //       ),
          //     ],
          //     if (uid == Session.uid && badge.effective) ...[
          //       const SizedBox(height: 20),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 40.0),
          //         child: GestureDetector(
          //           onTap: () {
          //             wearCallback?.call(badge.isWear);
          //           },
          //           child: Container(
          //             height: 48,
          //             alignment: AlignmentDirectional.center,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(24),
          //                 gradient: LinearGradient(
          //                   colors: R.color.mainBrandGradientColors,
          //                 )),
          //             child: Text(
          //               badge.isWear
          //                   ? K.personaldata_cancel_wear
          //                   : K.defend_wear,
          //               style: const TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 15.0,
          //                   fontWeight: FontWeight.w500),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //     const SizedBox(height: 24),
          //   ],
          // ),
          ,
          Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset(
                  Assets.iconInputCancel,
                  width: 30.dp,
                  height: 30.dp,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPreviewWidget() {
    return Container(
      width: 310.dp,
      height: 177.dp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.dp)),
          image: isEffective ? const DecorationImage(image: AssetImage(Assets.badgeGetBg), fit: BoxFit.fill) : null,
          color: isEffective ? Colors.transparent : const Color.fromRGBO(53, 53, 60, 1)),
      child: Center(
        child: Util.validStr(badge.icon) && Util.validStr(badge.additionName)
            ? badge.giftBadgeType == 3
                ? AppreciatorTagWidget(icon: badge.icon, label: badge.additionName, scale: 1.3)
                : GiftKingOrStarWithGiftNameTag(
                    name: badge.additionName,
                    icon: badge.icon,
                    color: Colors.white,
                    //(badge.badgeId == 119 || badge.giftBadgeType == 2) ? const Color(0xFFf8cf62) : Colors.white,
                    shadowColor: (badge.badgeId == 119 || badge.giftBadgeType == 2) ? const Color(0xffDD0020) : null,
                    awakeGift: badge.awakeGift,
                  )
            : ActivityBadgeWidget(icon: badge.icon, height: 75.dp).withColorFiltered(isEffective == false),
      ),
    );
  }

  Widget _buildDesc() {
    return Column(
      children: [
        _buildDescItem(true, K.getMethod, badge.desc),
        _buildDescItem(Util.validStr(badge.wearConditionText), K.personaldata_allocate_condition, badge.wearConditionText),
        _buildDescItem(Util.validStr(badge.expireTime), K.expireTime, badge.expireTime),
      ],
    );
  }

  Widget _buildDescItem(bool condition, String title, String content) {
    final textStyle = TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12.dp);
    return Visibility(
        visible: condition,
        child: Container(
          margin: EdgeInsets.only(bottom: 6.dp),
          child: Row(
            children: [
              Text(
                title,
                style: textStyle,
              ),
              Text(
                content,
                style: textStyle,
              )
            ],
          ),
        ));
  }

  Widget _buildWearBtn() {
    return Visibility(
        visible: isEffective,
        child: GestureDetector(
          onTap: () {
            if (!isEffective) return;
            wearCallback?.call(badge.isWear);
          },
          child: Container(
            height: 44.dp,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.dp),
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                )),
            child: Text(
              badge.isWear ? K.personaldata_cancel_wear : K.defend_wear,
              style: TextStyle(color: Colors.black, fontSize: 16.dp, fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }

  Widget _buildStatusWidget() {
    late Color textColor;
    late Color bgColor;
    String text = '';
    if (badgeType == 3) {
      //成就勋章没有过期时间
      text = '';
    } else {
      if (isEffective == false && Util.validStr(badge.expireTime)) {
        text = K.personal_has_expired;
        textColor = const Color.fromRGBO(252, 38, 115, 1);
        bgColor = const Color.fromRGBO(135, 16, 59, 0.40);
      } else if (isEffective) {
        text = badge.isWear ? K.personaldata_adoming : K.personaldata_allow_adom;
        textColor = const Color.fromRGBO(182, 254, 0, 1);
        bgColor = const Color.fromRGBO(60, 83, 0, 0.40);
      }
    }
    if (Util.validStr(text)) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: textColor, width: 1)),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 10),
        ),
      );
    }
    return Container();
  }
}
