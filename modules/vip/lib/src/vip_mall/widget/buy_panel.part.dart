part of 'buy_panel.dart';

/// 优惠角标文案
class _DiscountCornerText extends StatelessWidget {
  final String? text;

  const _DiscountCornerText({this.text});

  @override
  Widget build(BuildContext context) {
    return _buildDiscountCorner(text);
  }

  /// 优惠角标
  Widget _buildDiscountCorner(String? text) {
    if (text == null || text.isEmpty) return const SizedBox.shrink();
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFD7493), Color(0xFFFF8441)],
        ),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10),
          bottomEnd: Radius.circular(10),
          topEnd: Radius.circular(10),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _ActivityBtn extends StatelessWidget {
  final String? jumpPage;

  const _ActivityBtn({this.jumpPage});

  void _gotoActivityPage(BuildContext context) {
    Navigator.of(context).pop();
    BaseWebviewScreen.show(System.context, url: jumpPage!);
  }

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(jumpPage)) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _gotoActivityPage(context),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.5),
          gradient: LinearGradient(
            colors: R.colors.mainBrandGradientColors,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          K.vip_go_and_get,
          style: TextStyle(
              color: R.colors.brightTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _CouponTips extends StatelessWidget {
  final Item? currentItem;

  const _CouponTips(this.currentItem);

  @override
  Widget build(BuildContext context) {
    if (currentItem == null) return const SizedBox.shrink();
    return Container(
      height: 30,
      color: const Color(0xFF69D1FF).withOpacity(0.2),
      child: Row(
        children: [
          const SizedBox(width: 20),
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(currentItem!.couponIcon),
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              _couponsText(),
              style: const TextStyle(fontSize: 12, color: Color(0xFF369CFF)),
            ),
          ),
        ],
      ),
    );
  }

  String _couponsText() {
    String result = currentItem!.ductionIconCouponDesc;
    if (currentItem!.couponId > 0 && currentItem!.ductionRate > 0) {
      result += K.vip_duction_rate_dsc(['${currentItem!.ductionRate ~/ 10}']);
    }
    return result;
  }
}
