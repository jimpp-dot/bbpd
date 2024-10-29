import 'package:flutter/foundation.dart';
import 'wedding_combo_data.dart';

class WeddingComboManager extends ChangeNotifier {
  final List<WeddingComboGiftItem> _normalGifts = [];
  final List<WeddingComboGiftItem> _bigGifts = [];

  /// 当前的礼物动画 规则-总随机频率，至少间隔300毫秒；每个点出气球间隔1500毫秒
  WeddingComboGiftItem? animateGift;

  addGifts(List<WeddingComboGiftItem>? giftLists) {
    if (giftLists == null || giftLists.isEmpty || contains(giftLists.first))
      return;

    for (var element in giftLists) {
      if (!contains(element)) {
        if (giftLists.first.type == 'big') {
          _bigGifts.add(element);
        } else {
          if (_normalGifts.length < 50 || element.type == 'medium') {
            _normalGifts.add(element);
          }
        }
      }
    }
  }

  contains(WeddingComboGiftItem object) {
    return _normalGifts.contains(object) || _bigGifts.contains(object);
  }

  /// 让礼物队列的第一个礼物开始动画
  updateGiftAnimate() {
    _updateGiftAnimate(_normalGifts);
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      _updateGiftAnimate(_bigGifts);
    });
  }

  _updateGiftAnimate(List<WeddingComboGiftItem> giftList) {
    if (giftList.isEmpty) {
      animateGift = null;
    } else {
      animateGift = giftList.removeAt(0);
    }

    notifyListeners();
  }

  bool get isEmpty {
    return _normalGifts.isEmpty && _bigGifts.isEmpty;
  }
}
