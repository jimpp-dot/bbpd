import '../../k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/brother_room.pb.dart';
import 'package:get/get.dart';

enum RoomMyHouseUpdate { background, menu, decorate, all }

class MyHouseController extends GetxController {
  final ChatRoomData room;
  final Function(String s)? levelUpAlertFunc;

  bool needShowFirstGuide = false;
  bool headerMenuFold = false;
  int firstGuideIndex = 0;
  ApiBrotherConfigResponse? myHouseRes;
  ApiBrotherPreferencesResponse? decorateRes;
  BrotherUpgradeMessage? levelUpMessage;

  List<BrotherDecorateLayoutItem>? get layouts {
    return myHouseRes?.data.layout;
  }

  List<BrotherDecorateItem>? get decorates {
    return decorateRes?.data.decorates;
  }

  BrotherUserInfo? get ownerInfo {
    return myHouseRes?.data.master;
  }

  BrotherRoomBase? get myHouseInfo {
    return myHouseRes?.data.room;
  }

  MyHouseController(this.room, {this.levelUpAlertFunc});

  @override
  void onInit() {
    super.onInit();

    loadData();
    loadDecorates();
    room.addListener(
        '${RoomConstant.Event_Pb_Prefix}room.myHouse.sync', socketSync);
  }

  @override
  void onClose() {
    room.removeListener(
        '${RoomConstant.Event_Pb_Prefix}room.myHouse.sync', socketSync);

    super.onClose();
  }

  void foldMenu(bool fold) {
    headerMenuFold = fold;
    update([RoomMyHouseUpdate.menu]);
  }

  void guideNext() {
    firstGuideIndex++;
    if (firstGuideIndex >= 3) {
      Config.setBool('guide_room_mh_use', true);
      needShowFirstGuide = false;
      firstGuideIndex = 0;
    }
    update([RoomMyHouseUpdate.all]);
  }

  Future loadData() async {
    String url = "${System.domain}go/room/brother/config";
    try {
      XhrResponse response =
          await Xhr.get(url, queryParameters: {'rid': room.rid}, pb: true);
      myHouseRes = ApiBrotherConfigResponse.fromBuffer(response.bodyBytes);

      needShowFirstGuide = myHouseRes!.success &&
          room.isCreator &&
          !Config.getBool('guide_room_mh_use');
    } catch (e) {
      myHouseRes =
          ApiBrotherConfigResponse(success: false, message: e.toString());
    }
    update([RoomMyHouseUpdate.background, RoomMyHouseUpdate.all]);
  }

  Future loadDecorates() async {
    String url = "${System.domain}go/room/brother/preferences";
    try {
      XhrResponse response =
          await Xhr.get(url, queryParameters: {'rid': room.rid}, pb: true);
      decorateRes =
          ApiBrotherPreferencesResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      decorateRes =
          ApiBrotherPreferencesResponse(success: false, message: e.toString());
    }
    update([RoomMyHouseUpdate.decorate]);
  }

  Future<NormalNull> setDecorate(int eid, bool show) async {
    String url = "${System.domain}go/room/brother/setting";
    try {
      XhrResponse response = await Xhr.post(
        url,
        {
          'rid': room.rid.toString(),
          'element': eid.toString(),
          'option': '1',
          'value': (show ? 0 : 1).toString()
        },
        pb: true,
      );
      NormalNull res = NormalNull.fromBuffer(response.bodyBytes);
      if (res.success) {
        decorates?.where((element) => element.elementId == eid).first.display =
            show ? 1 : 0;
        update([RoomMyHouseUpdate.decorate]);
      }
      return res;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  void socketSync(String type, dynamic value) {
    if (myHouseRes == null) {
      return;
    }

    BrotherConfigMessage data = BrotherConfigMessage.fromBuffer(value);
    if (data.option & 1 > 0) {
      myHouseRes!.data.master = data.master;
      update([RoomMyHouseUpdate.all]);
    }
    if (data.option & 1 << 1 > 0) {
      myHouseRes!.data.room = data.room;
      update([RoomMyHouseUpdate.all]);
    }
    if (data.option & 1 << 2 > 0) {
      myHouseRes!.data.layout
        ..clear()
        ..addAll(data.layout);
      update([RoomMyHouseUpdate.background]);
    }
    if (data.option & 1 << 3 > 0) {
      myHouseRes!.data.message = data.message;
      if (levelUpAlertFunc == null) {
        return;
      }

      String text;
      if (room.isCreator) {
        text = K.room_mh_level_up_owner([
          myHouseRes!.data.message.newLevel.toString(),
          myHouseRes!.data.message.decorateName,
        ]);
      } else {
        text = K.room_mh_level_up_other([
          myHouseRes!.data.message.newLevel.toString(),
          myHouseRes!.data.message.decorateName,
        ]);
      }
      levelUpAlertFunc!(text);
    }
  }
}
