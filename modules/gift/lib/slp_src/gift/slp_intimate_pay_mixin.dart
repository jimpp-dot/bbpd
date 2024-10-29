import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 亲密付
mixin SlpIntimatePayMixin<T extends StatefulWidget> on State<T> {
  bool get supportSlpIntimate;

  IntimateCardInfo? get intimateCardInfo =>
      supportSlpIntimate ? intimatePlayController.intimateCardInfo : null;

  bool get useIntimateCardPay =>
      supportSlpIntimate && intimatePlayController.intimateCardInfo != null;

  SlpIntimatePayController get intimatePlayController {
    SlpIntimatePayController payController;
    if (Get.isRegistered<SlpIntimatePayController>()) {
      payController = Get.find<SlpIntimatePayController>();
    } else {
      payController = Get.put(SlpIntimatePayController());
    }
    return payController;
  }

  /// 切换亲密卡
  void onIntimateCardChange(IntimateCardInfo? value) {
    if (value == null) return;
    intimatePlayController.onIntimateCardChange(value);
  }

  /// 赠送礼物后刷新亲密卡额度
  Future refreshIntimateCard() async {
    intimatePlayController.refreshIntimateCard();
  }
}

class SlpIntimatePayController extends GetxController {
  // 选择的亲密卡
  IntimateCardInfo? _intimateCardInfo;

  IntimateCardInfo? get intimateCardInfo => _intimateCardInfo;

  /// 切换亲密卡
  void onIntimateCardChange(IntimateCardInfo? value) {
    if (value == null) return;
    if (_intimateCardInfo != null &&
        _intimateCardInfo?.cardId == value.cardId) {
      _intimateCardInfo = null;
    } else {
      _intimateCardInfo = value;
    }
    update();
  }

  /// 重置亲密卡
  void resetIntimatePay() {
    _intimateCardInfo = null;
  }

  /// 赠送礼物后刷新亲密卡额度
  Future refreshIntimateCard() async {
    if (_intimateCardInfo == null) return;
    String url =
        '${System.domain}go/yy/intimate_card/detail?card_id=${_intimateCardInfo!.cardId}';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      ResIntimateCardDetail resp =
          ResIntimateCardDetail.fromBuffer(response.bodyBytes);
      if (resp.success) {
        if (_intimateCardInfo?.cardId == resp.data.card.cardId) {
          _intimateCardInfo?.leftMoney = resp.data.card.leftMoney;
          update();
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }
}
