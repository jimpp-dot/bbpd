import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/model/generated/slp_gift_pack.pb.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

class GiftPackBlessGetDialog extends StatefulWidget {
  final GiftPackGetPrayAward? data;
  const GiftPackBlessGetDialog({Key? key, this.data}) : super(key: key);

  @override
  State<GiftPackBlessGetDialog> createState() => _GiftPackBlessGetDialogState();

  static Future<void> show(
      BuildContext context, GiftPackGetPrayAward data) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: GiftPackBlessGetDialog(
            data: data,
          ),
        );
      },
    );
  }
}

class _GiftPackBlessGetDialogState extends State<GiftPackBlessGetDialog> {
  void _closeDialog() {
    Navigator.of(context, rootNavigator: true).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width - 32 * 2,
      height: 315,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsetsDirectional.only(top: 20),
                child: Text(
                  K.git_pack_congratulation_get,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(top: 20, bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if ((widget.data?.commodityIcon.length ?? 0) > 0)
                      _buildPrayAwardItem(widget.data?.commodityIcon ?? '',
                          widget.data?.commodityName ?? ''),
                    if ((widget.data?.badgeIcon.length ?? 0) > 0)
                      _buildPrayAwardItem((widget.data?.badgeIcon ?? ''),
                          (widget.data?.badgeName ?? '')),
                  ],
                ),
              ),
              _buildSureButton(context),
            ],
          ),
          PositionedDirectional(
            end: 4,
            child: IconButton(
              onPressed: _closeDialog,
              icon: R.img(
                Assets.gift_pack_gift_pack_daily_coupon_close_webp,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_GIFT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayAwardItem(String image, String name) {
    //_prayAwardList
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          alignment: AlignmentDirectional.center,
          child: CachedNetworkImage(
            width: 80,
            imageUrl: System.imageDomain + image,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          name,
          style: TextStyle(
              color: R.color.unionRankText1,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildSureButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop(context);
      },
      child: Container(
        margin:
            const EdgeInsetsDirectional.only(start: 60, end: 60, bottom: 30),
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(27)),
        ),
        child: Text(
          K.gift_confirm,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
