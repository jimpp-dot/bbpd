import 'package:shared/shared.dart';

class TagDataUtil {
  /// 根据tagId获取标签信息,此方法修改时,需注意是否需要修改RoomTagDataUtil的方法
  static Future<CommonTagData?> getCommonTagData(
      int tagId, String tagLabel) async {
    Map<String, dynamic>? data = await TagConfigDb.queryConfigById(tagId);

    if (Util.parseInt(data[TagConfigDb.columnProfileShow]) == 0) {
      /// 限定资料页不展示
      return null;
    }

    /// 个人页标签展示限制，限定为固定房间类型/用户类型都不展示
    String property = Util.notNullStr(data[TagConfigDb.columnProperty]);
    if (Util.validStr(property)) {
      /// 限定标签显示房间类型
      return null;
    }

    int onMicShow = Util.parseInt(data[TagConfigDb.columnOnMicShow]);
    if (onMicShow == 1) {
      /// 限定麦上用户才展示
      return null;
    }

    int showUserRole = Util.parseInt(data[TagConfigDb.columnShowUserRole]);
    if (showUserRole == 1) {
      /// 限定房主和接待才展示
      return null;
    } else if (showUserRole == 2) {
      /// 限定公会成员才展示
      if (!Session.joinBroker) {
        return null;
      }
    } else if (showUserRole == 3) {
      /// 限定官方账号才显示
      if (!Session.isOfficialAccount) {
        return null;
      }
    } else if (showUserRole > 0) {
      /// 其他限定条件的都默认不展示,方便后续添加其他限定条件时,老版本不展示
      return null;
    }

    String roomFactoryType =
        Util.notNullStr(data[TagConfigDb.columnRoomFactoryType]);
    if (Util.validStr(roomFactoryType)) {
      /// 限定factoryType房间类型才展示
      return null;
    }

    String channel = Util.notNullStr(data[TagConfigDb.columnChannel]);
    if (Util.validStr(channel)) {
      /// 限定结算频道才展示
      return null;
    }

    String whiteListRids =
        Util.notNullStr(data[TagConfigDb.columnWhiteListRids]);
    if (Util.validStr(whiteListRids)) {
      /// 限定白名单rid才展示
      return null;
    }

    CommonTagData? tag;

    try {
      tag = CommonTagData(
        type: Util.parseInt(data[TagConfigDb.columnType]),
        label: Util.validStr(tagLabel)
            ? tagLabel
            : (Util.validStr(data[TagConfigDb.columnLabel])
                ? Util.notNullStr(data[TagConfigDb.columnLabel])
                : ''),
        icon: Util.notNullStr(data[TagConfigDb.columnIcon]),
        textStartPx: Util.parseInt(data[TagConfigDb.columnTextStartPx]),
        fontStyle: Util.parseInt(data[TagConfigDb.columnFontStyle]),
        tagId: tagId,
        location: Util.parseInt(data[TagConfigDb.columnLocation]),
      );
    } catch (e) {
      Log.d('getCommonTagData error: $e');
    }

    return tag;
  }
}
