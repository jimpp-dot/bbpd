import '../model/birthday_gift_item.dart';
import '../model/generated/gs_birthday.pb.dart';

/// 生日送祝福状态
class BirthdaySendBlessingsState {
  /// 生日详情数据
  GsBirthdayPreferencesData? data;

  /// 记录生日备注值
  String textFieldValue = '';

  /// 是否定时发送
  bool isTimeSend = false;

  /// 生日礼物
  List<BirthdayGiftItem> gifts = [];

  /// 选中的生日礼物
  BirthdayGiftItem? selectedGiftItem;

  BirthdaySendBlessingsState() {
    ///Initialize variables
  }
}
