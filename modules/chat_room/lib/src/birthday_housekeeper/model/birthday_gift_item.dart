import '../model/generated/gs_birthday.pb.dart';

class BirthdayGiftItem {
  GsBirthdayGiftInfo gift;
  bool selected;

  BirthdayGiftItem({required this.gift, this.selected = false});
}
