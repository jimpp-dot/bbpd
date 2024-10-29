import 'package:shared/shared.dart';

extension HomeProfileAction on HomeProfileData {
  // 获取展示名称，有备注名优先显示备注名
  String get displayName {
    if (Util.validStr(base.markName)) {
      return base.markName;
    } else {
      return base.name;
    }
  }

  String getOnlineMessage() {
    String msg = '';
    //距离
    /*
    if (Util.validStr(this.base.distance)) {
      msg = this.base.distance;
    }
    */

    //在线时间
    if (msg.isNotEmpty) {
      if (Util.parseInt(god.serviceBusy) > 0) {
        msg = '$msg · ${R.string('busing')}';
      } else if (Util.parseInt(base.onlineDateline) > 0) {
        if (Util.parseInt(base.onlineStatus) == 0) {
          msg = '$msg · ${R.string('online')}';
        } else if (Util.parseInt(base.onlineStatus) == 2) {
          msg = '$msg · ${R.string('core_invisible')}';
        } else if (base.onlineDatelineDiff.isNotEmpty) {
          msg = '$msg · ${base.onlineDatelineDiff}';
        }
      }
    } else {
      if (Util.parseInt(god.serviceBusy) > 0) {
        msg = R.string('busing');
      } else if (Util.parseInt(base.onlineDateline) > 0) {
        if (Util.parseInt(base.onlineStatus) == 0) {
          msg = R.string('online');
        } else if (Util.parseInt(base.onlineStatus) == 2) {
          msg = R.string('core_invisible');
        } else if (base.onlineDatelineDiff.isNotEmpty) {
          msg = base.onlineDatelineDiff;
        }
      }
    }

    //粉丝
    if (msg.isNotEmpty) {
      if (Util.parseInt(base.fansNum) > 0) {
        msg = '$msg · ${base.fansNum}${R.string('personal_fans_num')}';
      }
    } else {
      if (Util.parseInt(base.fansNum) > 0) {
        msg = '${base.fansNum}${R.string('personal_fans_num')}';
      }
    }

    //ip归属地
    if (msg.isNotEmpty) {
      if (base.ipLocation.isNotEmpty) {
        msg = '$msg · ${R.string('person_ip_location')}${base.ipLocation}';
      }
    } else {
      if (base.ipLocation.isNotEmpty) {
        msg = '${R.string('person_ip_location')}${base.ipLocation}';
      }
    }

    return msg;
  }

  bool get validAudio {
    return hasCard() &&
        Util.validStr(card.audio) &&
        Util.parseInt(card.duration) > 0;
  }

  void syncProfileData(HomeProfileSyncData syncData) {
    HomeProfileSyncBase syncBase = syncData.base;
    base.onlineStatus = syncBase.onlineStatus;
    base.onlineDateline = syncBase.onlineDateline;
    base.onlineDatelineDiff = syncBase.onlineDatelineDiff;
    base.title = syncBase.title;
    base.followRelation = syncBase.followRelation;
    base.fansNum = syncBase.fansNum;
    base.accompanyNum = syncBase.accompanyNum;
    base.defendCount = syncBase.defendCount;
    base.knightLevel = syncBase.knightLevel;
    if (syncData.hasRoom()) {
      room = syncData.room;
    } else {
      clearRoom();
    }
    if (syncData.hasKfgShow()) {
      kfgShow = syncData.kfgShow;
    } else {
      clearKfgShow();
    }
    if (syncData.hasFleet()) {
      fleet = syncData.fleet;
    } else {
      clearFleet();
    }
    mark.clear();
    mark.addAll(syncData.mark);
    if (syncData.hasGiftWall()) {
      giftWall = syncData.giftWall;
    } else {
      clearGiftWall();
    }
    if (syncData.hasLiveTagInfo()) {
      liveTagInfo = syncData.liveTagInfo;
    } else {
      clearLiveTagInfo();
    }
    if (syncData.hasCpkSummary()) {
      cpkSummary = syncData.cpkSummary;
    } else {
      clearCpkSummary();
    }
  }
}
