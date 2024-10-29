/// 福券记录
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/repo/gift_activity_repo.dart';
import 'package:gift/src/model/generated/slp_gift_pack.pb.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

class GiftPackDailyCouponRecordDialog extends StatefulWidget {
  const GiftPackDailyCouponRecordDialog({Key? key}) : super(key: key);

  @override
  State<GiftPackDailyCouponRecordDialog> createState() =>
      _GiftPackDailyCouponRecordDialogState();

  static Future<void> show(BuildContext context) async {
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
          content: const GiftPackDailyCouponRecordDialog(),
        );
      },
    );
  }
}

class _GiftPackDailyCouponRecordDialogState
    extends State<GiftPackDailyCouponRecordDialog> {
  List<GiftPackCouponLogItem> _couponRecordList = [];

  void _closeDialog() {
    Navigator.of(context, rootNavigator: true).pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadGiftPackDailyConfig();
  }

  void _loadGiftPackDailyConfig() async {
    ResGiftPackCouponLog resp = await GiftPackCenterRepo.getCouponRecords();
    if (resp.success) {
      if (mounted) {
        setState(() {
          _couponRecordList = resp.couponList;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_couponRecordList.isEmpty) {
      return Container(
        width: Util.width - 32 * 2,
        height: 341,
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        alignment: AlignmentDirectional.center,
        child: ErrorData(
          error: K.gift_no_data,
          bottom: 0,
        ),
      );
    }

    List<Widget> widgets = [];

    for (var element in _couponRecordList) {
      widgets.add(_buildCouponRecordItem(
          element.subject, element.createTime, element.num, element.type));
    }

    return SizedBox(
      width: Util.width - 32 * 2,
      height: 341,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsetsDirectional.only(top: 20),
                child: Text(
                  K.gift_pack_coupon_history,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 26),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding:
                        const EdgeInsetsDirectional.only(start: 20, end: 20),
                    children: widgets,
                  ),
                ),
              ),

              //_buildSureButton(context),
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

  Widget _buildCouponRecordItem(
      String content, int createTime, int num, int type) {
    return Container(
      height: 53,
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "${K.gift_pack_daily_gift_coupon}${type == 1 ? '+' : '-'}$num",
                style: const TextStyle(
                    color: Color(0xFF885AFF),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  Utility.formatDateToDay(createTime),
                  style: const TextStyle(
                      color: Color(0x99313131),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 1,
            //margin: EdgeInsetsDirectional.only(start: 20,end: 20),
            color: const Color(0x1A313131),
          ),
        ],
      ),
    );
  }
}
