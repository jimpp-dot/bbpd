import 'package:shared/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class TextLabelWidget extends StatelessWidget {
  /// 标签上要显示的文本
  final String? text;

  /// 标签背景icon图片本地路径
  final String? icon;

  final double itemW;

  const TextLabelWidget(this.text, this.icon, {super.key, this.itemW = 27});

  /// 优质标签
  static Widget get highQualityLabel =>
      TextLabelWidget(K.base_high_quality_label, 'ic_quality_user_label.webp');

  /// 回流标签
  static Widget reflowLabel(String? text) =>
      TextLabelWidget(text, 'ic_quality_user_label.webp');

  /// 小闹钟标签
  static Widget smallAlarmLabel(String? text) =>
      TextLabelWidget(text, 'ic_small_alarm_label.webp');

  ///消费标签
  static Widget get consumeLabel => TextLabelWidget(
        K.base_consume,
        'ic_consume_label.webp',
        itemW: 19,
      );

  ///充值标签
  static Widget get rechargeLabel => TextLabelWidget(
        K.base_recharge,
        'ic_recharge_label.webp',
        itemW: 19,
      );

  @override
  Widget build(BuildContext context) {
    if ((text?.isEmpty ?? true) || (icon?.isEmpty ?? true))
      return const SizedBox.shrink();
    return Container(
      width: itemW,
      height: 22,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              R.imagePath(icon!, package: ComponentManager.MANAGER_BASE_CORE)),
          fit: BoxFit.fill,
        ),
      ),
      child: YouSheText(
        text!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8,
        ),
      ),
    );
  }
}
