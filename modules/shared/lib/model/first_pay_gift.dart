import 'package:shared/src/util.dart';

class FirstPayGift {
  bool? firstPayEntryShow;
  String? firstPayEntryIcon;
  String? firstPayEntryDoc;
  bool? giftBoardEntryShow;
  String? giftBoardEntryDoc;
  String? giftBoardEntryIcon;
  String? giftBoardEntryUrl;
  bool? payBannerShow;
  String? payBannerUrl;
  String? payBannerImg;

  FirstPayGift.fromJson(Map json) {
    firstPayEntryShow = Util.parseBool(json['first_pay_entry_show']);
    firstPayEntryIcon = Util.parseStr(json['first_pay_entry_icon']);
    firstPayEntryDoc = Util.parseStr(json['first_pay_entry_doc']);
    giftBoardEntryShow = Util.parseBool(json['gift_board_entry_show']);
    giftBoardEntryDoc = Util.parseStr(json['gift_board_entry_doc']);
    giftBoardEntryIcon = Util.parseStr(json['gift_board_entry_icon']);
    giftBoardEntryUrl = Util.parseStr(json['gift_board_entry_url']);
    payBannerShow = Util.parseBool(json['pay_banner_show']);
    payBannerUrl = Util.parseStr(json['pay_banner_url']);
    payBannerImg = Util.parseStr(json['pay_banner_img']);
  }
}
