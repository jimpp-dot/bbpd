import 'package:vip/k.dart';
import 'package:vip/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:extended_text/extended_text.dart';

class LevelTipDialog extends StatelessWidget {
  final int price;
  final String title;
  final String content;
  final String? tip;

  const LevelTipDialog({
    Key? key,
    required this.price,
    required this.title,
    required this.content,
    this.tip,
  }) : super(key: key);

  static Future<bool?> show({
    required BuildContext context,
    required int price,
    required String title,
    required String content,
    String? tip,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => LevelTipDialog(
          price: price, title: title, content: content, tip: tip),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 305,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            padding: const EdgeInsetsDirectional.only(
                start: 16, top: 24, end: 16, bottom: 20),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                if (!Util.isStringEmpty(tip))
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 6),
                    child: Text(
                      tip!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(true),
                  child: _buildPriceBtn(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child:
                R.img(Assets.vip$ic_dialog_close_webp, width: 40, height: 40),
          ),
        ],
      ),
    );
  }

  /// 带价格的确认按钮
  Widget _buildPriceBtn() {
    return Container(
      width: Util.width,
      height: 48,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: K.confirm,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const TextSpan(
              text: '（',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            ImageSpan(
              AssetImage(MoneyConfig.moneyIcon),
              imageWidth: 20,
              imageHeight: 20,
            ),
            TextSpan(
              text: '$price）',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: Util.numFontFamily,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
