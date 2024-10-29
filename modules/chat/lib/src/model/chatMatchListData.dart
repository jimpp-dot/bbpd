import 'package:shared/shared.dart';

class ChatMatchListData {
  int more = 0; // 是否有下一页（1：有， 0：没有）
  int fcard = 0; // 是否已经添加了交友卡（1：有， 0：没有），是否弹添加交友卡引导
  List<String>? icons;
  List<ChatMatchItem>? list;

  ChatMatchListData.fromJson(jsonRes) {
    more = Util.parseInt(jsonRes['more']);
    fcard = Util.parseInt(jsonRes['fcard']);
    icons = jsonRes['icons'];

    list = [];
    for (var item in jsonRes['list']) {
      list!.add(ChatMatchItem.fromJson(item));
    }
  }
}
