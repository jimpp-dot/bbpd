import 'package:shared/shared.dart';

class IntimateCardApi {
  /// 亲密卡赠送
  /// [cardId] 亲密卡id，>0就是在给点，=0赠送亲密卡
  /// [toUid] 要赠送的对象uid
  /// [money] 亲密卡额度
  /// [cycle] 周期：1/天，2/星期，3/月
  /// [message] 留言
  /// [relationId] 守护关系
  static Future<NormalNull> sendIntimacyCard(
      {int cardId = 0,
      required int toUid,
      required String money,
      required int cycle,
      required String message,
      required int relationId}) async {
    String url = '${System.domain}go/yy/intimate_card/send';
    try {
      Map<String, String> params = {
        'card_id': '$cardId',
        'uid': '$toUid',
        'money': money,
        'cycle': '$cycle',
        'message': message,
        'relation_id': '$relationId',
      };
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  ///亲密卡列表 type //0没解绑亲密卡列表，1已解绑亲密卡
  ///cate_id //0我赠送的亲密卡列表，1我收到的亲密卡列表
  ///cursor    //分页游标，第一页传0
  static Future<ResIntimateCardList> getIntimacyCardList(int cursor,
      {bool isSend = false, bool isUnbind = false}) async {
    String url = '${System.domain}go/yy/intimate_card/list';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'type': isUnbind ? '1' : '0',
            'cursor': cursor.toString(),
            'cate_id': isSend ? '0' : '1'
          },
          pb: true,
          throwOnError: true);
      return ResIntimateCardList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResIntimateCardList(msg: e.toString(), success: false);
    }
  }

  ///赠送关系列表
  static Future<ResIntimateCardRelation> getIntimacyCardRelationList() async {
    String url = '${System.domain}go/yy/intimate_card/relationList';
    try {
      XhrResponse response =
          await Xhr.post(url, null, pb: true, throwOnError: true);
      return ResIntimateCardRelation.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResIntimateCardRelation(msg: e.toString(), success: false);
    }
  }

  /// 赠送关系用户列表 /go/yy/intimate_card/relationUserList
  static Future<ResCardRelationUserList> getIntimacyCardRelationUserList(
      int id) async {
    String url = '${System.domain}go/yy/intimate_card/relationUserList';
    try {
      Map<String, String> params = {'relation_id': id.toString()};
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return ResCardRelationUserList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResCardRelationUserList(msg: e.toString(), success: false);
    }
  }

  /// 亲密卡操作 /go/yy/intimate_card/operation
  /// card_id
  /// operation 操作，1领取，2解绑，3还想要
  static Future<NormalNull> intimateCardOperation(int id, int operation) async {
    String url = '${System.domain}go/yy/intimate_card/operation';
    try {
      Map<String, String> params = {
        'card_id': id.toString(),
        'operation': operation.toString()
      };
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 亲密卡卡片详情 /go/yy/intimate_card/detail
  static Future<ResIntimateCardDetail> intimateCardDetailPage(int id) async {
    String url = '${System.domain}go/yy/intimate_card/detail?card_id=$id';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return ResIntimateCardDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResIntimateCardDetail(msg: e.toString(), success: false);
    }
  }

  /// 获得一个拍卖房 /go/yy/intimate_card/auctionRoom
  static Future<ResIntimateCardAuctionRoom> getIntimateCardAuctionRoom() async {
    String url = '${System.domain}go/yy/intimate_card/auctionRoom';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return ResIntimateCardAuctionRoom.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResIntimateCardAuctionRoom(msg: e.toString(), success: false);
    }
  }
}
