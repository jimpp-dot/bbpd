import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/k.dart';

/// cdk兑换弹窗
///
class CouponDialog extends StatefulWidget {
  final ShopMailCommodity bean;

  const CouponDialog({super.key, required this.bean});

  static Future show(BuildContext context, ShopMailCommodity bean) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CouponDialog(bean: bean);
        });
  }

  @override
  _CouponDialogState createState() => _CouponDialogState();
}

class _CouponDialogState extends State<CouponDialog> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildContent() {
    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    double ratio = 150 / 104;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            K.profile_exchange_success,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FC),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: vipManager.getCommodityListItemTop(
                ratio: ratio, commodity: widget.bean),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.bean.name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: R.color.secondTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w500),
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
        height: 348,
        contentBuilder: (context) {
          return _buildContent();
        },
        positiveButton: PositiveButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            SchemeUrlHelper.instance()
                .checkSchemeUrlAndGo(context, widget.bean.jumpPath);
          },
          text: K.profile_goto_use,
          width: 264,
          height: 48,
          useGradientBg: true,
          gradientBg: R.color.mainBrandGradientColors,
        ),
        closeWidget: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: R.img(
              'ic_close.svg',
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 16,
              height: 16,
              color: R.color.secondTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
