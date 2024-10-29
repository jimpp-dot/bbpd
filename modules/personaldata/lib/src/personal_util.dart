import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/a.dart';

import '../k.dart';

class PersonalUtil {
  PersonalUtil._();

  /// 星座
  static String getConstellation(String birthday) {
    if (birthday.isEmpty) return '';
    List<String> array = birthday.split('-');
    if (array.length < 3) return '';

    int month = Util.parseInt(array[1]);
    int day = Util.parseInt(array[2]);

    List<int> arr = [20, 19, 21, 20, 21, 22, 23, 23, 23, 24, 23, 22];
    int start = day < arr[month - 1] ? (month - 1) : month;
    return A.constellation[start];
  }

  static Future<List<CommonTagData>> getTags(List<String> tags) async {
    List<CommonTagData> commonTags = [];

    /// 个人页标签List
    if (!Util.isCollectionEmpty(tags)) {
      for (int i = 0; i < tags.length; i++) {
        String tagString = tags[i];
        if (!Util.validStr(tagString)) {
          continue;
        }
        List<String> data = tagString.split(',');
        if (data.isEmpty) {
          continue;
        }

        int tagId = Util.parseInt(data[0], 0);
        if (tagId == 0) {
          continue;
        }
        String label = data.length > 1 ? data[1] : '';
        CommonTagData? tagData =
            await TagDataUtil.getCommonTagData(tagId, label);
        if (tagData != null) {
          commonTags.add(tagData);
        }
      }
    }
    return commonTags;
  }

  static List<Widget> generalTagList(bool front, List<CommonTagData> tags) {
    List<Widget> widgets = [];

    if (tags.isNotEmpty) {
      for (int i = 0; i < tags.length; i++) {
        if (front) {
          /// type==5， 纯文案的展示在所有标签最前面，且只展示一个
          if (tags[i].type == 5) {
            widgets.add(CommonTagWidget(
              data: tags[i],
              inProfilePage: true,
              needMarginEnd: false,
            ));
            return widgets;
          }
        } else {
          if (tags[i].type != 5) {
            widgets.add(CommonTagWidget(
              data: tags[i],
              inProfilePage: true,
              needMarginEnd: false,
            ));
          }
        }
      }
    }
    return widgets;
  }

  static String getAgeDecade(String birthday) {
    if (Util.isStringEmpty(birthday)) {
      return '';
    }

    List<String> array = birthday.split('-');
    if (array.length < 3) return '';

    int year = Util.parseInt(array[0]);

    if (year >= 2000 && year < 2010) {
      // 00 后
      return A.age_decades[0];
    } else if (year >= 1995 && year < 2000) {
      // 95后
      return A.age_decades[1];
    } else if (year >= 1990 && year < 1995) {
      // 90后
      return A.age_decades[2];
    } else if (year >= 1985 && year < 1990) {
      // 85后
      return A.age_decades[3];
    } else if (year >= 1980 && year < 1985) {
      // 80后
      return A.age_decades[4];
    }
    return '';
  }

  static void jumpRoom(BuildContext context, int rid, int uid,
      {String refer = 'UserPage', int giftId = 0}) {
    if (rid > 0) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, rid, refer: refer, uid: uid,
          onPageLoad: () {
        openRoomGiftPanel(System.context, uid,
            refer: refer, defaultGiftId: giftId, tabPage: DisplayPage.gift);
      });
    } else {
      IChatManager chatManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(
        context,
        type: 'private',
        targetId: uid,
        title: K.personal_mate_become_guardian,
        refer: refer,
        onPageLoad: () {
          IGiftManager giftManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          giftManager.showPrivateGiftPanel(context,
              uid: uid, defaultTab: DisplayPage.gift, defaultId: giftId);
        },
      );
    }
  }

  /// 打开房间的礼物面板，并跳转到相应tab下，默认tab DisplayPage.relationship
  static Future openRoomGiftPanel(BuildContext context, int uid,
      {DisplayPage tabPage = DisplayPage.relationship,
      String refer = 'UserPage',
      int defaultGiftId = 0}) async {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showRoomGiftPanel(context,
        room: ChatRoomData.getInstance(),
        uid: uid,
        defaultId: defaultGiftId,
        defaultTab: tabPage,
        refer: refer);
  }
}
