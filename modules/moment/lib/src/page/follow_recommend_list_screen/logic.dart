import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/k.dart';
import 'package:moment/src/api/api.dart';
import 'package:moment/src/model/recommend_follow_item_bean.dart';

class MomentFollowRecommendListScreenLogic extends GetxController {
  var checkedItems = [].obs;

  var followedItems = [].obs;

  var items = [].obs;

  void checkOrNotItem(RecommendFollowItem item) {
    if (checkedItems.contains(item.uid)) {
      checkedItems.remove(item.uid);
    } else {
      checkedItems.add(item.uid);
    }
  }

  void followAllChecked({bool isNewUser = false, String? fromRefer}) async {
    List<String> uids = checkedItems.value.map((e) => e as String).toList();
    NormalNull response = await BaseRequestManager.followAll(uids);
    if (response.success) {
      String refer = '';
      if (isNewUser) {
        refer = fromRefer ?? 'register';

        gotoBoot(refer);
      } else {
        refer = fromRefer ?? 'moment';
        Fluttertoast.showToast(
            msg: K.moment_follow_success, gravity: ToastGravity.CENTER);
        eventCenter.emit(EventRefreshFollowList, null);
        Navigator.of(Constant.context).pop();
      }
      //埋点
      for (var uid in uids) {
        Tracker.instance.track(TrackEvent.follow, properties: {
          'target_uid': uid,
          'rid': 0,
          'juben_id': 0,
          'refer': refer,
          'room_type': '',
          'game_type': '',
          'search_content': '',
        });
      }
    } else {
      Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
    }
  }

  void gotoBoot(String refer) {
    Tracker.instance.track(
      TrackEvent.suggested_follow_page_close,
      properties: {
        'refer': refer,
      },
    );
    eventCenter.emit(EventConstant.EventLoginBeforeBoot, Constant.context);

    Future.delayed(const Duration(milliseconds: 250), () {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      // 弹新用户礼包
      if (loginManager.isNoviceGuide) {
        eventCenter.emit(EventConstant.ShowNewUserGuide);
      } else {
        eventCenter.emit(EventConstant.ShowNewUserPackage);
      }
    });
  }

  void followItem(RecommendFollowItem item, String? refer) async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(Constant.context);
      return;
    }

    if (!followedItems.contains(item.uid)) {
      NormalNull response = await BaseRequestManager.onFollow(
          item.uid.toString(),
          refer: refer ?? '');
      if (response.success) {
        followedItems.add(item.uid);
        eventCenter.emit(EventRefreshFollowList, null);
        Fluttertoast.showToast(
            msg: K.moment_follow_success, gravity: ToastGravity.CENTER);
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
      }
    }
  }

  void loadData() async {
    DataRsp<List<RecommendFollowItem>> response =
        await Api.getRecommendFollow();
    if (response.success == true && response.data != null) {
      items.addAll(response.data!);
      checkedItems.addAll(items
          .map((element) => (element as RecommendFollowItem).uid)
          .toList());
    }
  }
}
