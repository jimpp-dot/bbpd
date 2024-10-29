import 'package:shared/shared.dart';

class BranchTrackUtils {
  static bool? _isRegister;
  static IMainManager? _mainmanger;

  static bool get isRegister {
    if (_isRegister == null) {
      int regTime = Config.getInt('${Session.uid}.reg.time', 0);
      _isRegister = regTime > 0;
    }
    return _isRegister!;
  }

  static IMainManager get mainmanger {
    return _mainmanger ??=
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
  }

  static void firstClickFollow() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.follow', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_follow_count');
      Config.setBool('$uid.bh.click.follow', true);
    }
  }

  static void firstClickProfileChat() {
    // if(!isRegister) return;
    // int uid = Session.uid;
    // bool click = Config.getBool('$uid.bh.click.profile.chat',false);
    // if(!click){
    //   mainmanger.trackEvent('bb_new_v3_register_hi_count_2');
    //   Config.setBool('$uid.bh.click.profile.chat',true);
    // }
  }

  static void firstClickFloatChat() {
    // if(!isRegister) return;
    // int uid = Session.uid;
    // bool click = Config.getBool('$uid.bh.click.float.chat',false);
    // if(!click){
    //   mainmanger.trackEvent('bb_new_v3_register_hi_count_3');
    //   Config.setBool('$uid.bh.click.float.chat',true);
    // }
  }

  static void firstClickJoinParty() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.join.party', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_party_count_1');
      Config.setBool('$uid.bh.click.join.party', true);
    }
  }

  static void firstClickStartParty() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.start.party', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_party_count_2');
      Config.setBool('$uid.bh.click.start.party', true);
    }
  }

  static void firstSucUpMic() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.suc.up.mic', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_mic_count_1');
      Config.setBool('$uid.bh.suc.up.mic', true);
    }
  }

  static void sign2Times() {
    // if(!isRegister) return;
    // int uid = Session.uid;
    // int lastTime = Config.getInt('$uid.bh.sign.lasttime',0);
    // if(lastTime < 0) return;
    // Duration duration = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(lastTime));
    // if(duration.inDays == 1){
    //   mainmanger.trackEvent('bb_new_v3_register_signin_count_2');
    //   Config.set('$uid.bh.sign.lasttime','-1');
    // }else{
    //   Config.set('$uid.bh.sign.lasttime','${DateTime.now().millisecondsSinceEpoch}');
    // }
  }

  static void firstMomentLike() {
    // if(!isRegister) return;
    // int uid = Session.uid;
    // bool click = Config.getBool('$uid.bh.moment.like',false);
    // if(!click){
    //   mainmanger.trackEvent('bb_new_v3_register_feed_count_1');
    //   Config.setBool('$uid.bh.moment.like',true);
    // }
  }

  static void firstMomentComment() {
    // if(!isRegister) return;
    // int uid = Session.uid;
    // bool click = Config.getBool('$uid.bh.moment.comment',false);
    // if(!click){
    //   mainmanger.trackEvent('bb_new_v3_register_feed_count_2');
    //   Config.setBool('$uid.bh.moment.comment',true);
    // }
  }

  static void firstMomentChat() {
    // if(!isRegister) return;
    // int uid = Session.uid;
    // bool click = Config.getBool('$uid.bh.moment.chat',false);
    // if(!click){
    //   mainmanger.trackEvent('bb_new_v3_register_feed_count_3');
    //   Config.setBool('$uid.bh.moment.chat',true);
    // }
  }

  static void firstClickPackage() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.frpack', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_first_count_1');
      Config.setBool('$uid.bh.click.frpack', true);
    }
  }

  static void firstClickPackageRecharge() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.frpack.recge', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_first_count_2');
      Config.setBool('$uid.bh.click.frpack.recge', true);
    }
  }

  static void firstClickGiftRecharge() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.gift.recge', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_first_count_3');
      Config.setBool('$uid.bh.click.gift.recge', true);
    }
  }

  static void firstClickFloatSend() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.float.sendgift', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_gift_count_1');
      Config.setBool('$uid.bh.click.float.sendgift', true);
    }
  }

  static void firstClickChatSendGF() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.chat.sendgift', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_gift_count_3');
      Config.setBool('$uid.bh.click.chat.sendgift', true);
    }
  }

  static void firstClickRoomSendGF() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.room.sendgift', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_gift_count_4');
      Config.setBool('$uid.bh.click.room.sendgift', true);
    }
  }

  static void firstClickGreedy() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.greedy', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_greedy_count_1');
      Config.setBool('$uid.bh.click.greedy', true);
    }
  }

  static void firstLike() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.greedy', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v3_register_greedy_count_1');
      Config.setBool('$uid.bh.click.greedy', true);
    }
  }

  static void firstClickMeetHeart() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool click = Config.getBool('$uid.bh.click.meetheart', false);
    if (!click) {
      mainmanger.trackEvent('bb_new_v4_heart_click_count_1');
      Config.setBool('$uid.bh.click.meetheart', true);
    }
  }

  static void trackSelectGender() {
    mainmanger.trackEvent('bb_new_v4_gender_count_1');
  }

  static void firstSendMessage() {
    if (!isRegister) return;
    int uid = Session.uid;
    bool send = Config.getBool('$uid.bh.send.message', false);
    if (!send) {
      mainmanger.trackEvent('bb_send_message_first');
      Config.setBool('$uid.bh.send.message', true);
    }
  }
}
