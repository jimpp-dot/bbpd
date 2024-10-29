import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';

///
/// 用户个人信息provider
/// 余额/金币/自己当前带的头像框
///
class PersonalInfoProvider extends ChangeNotifier {
  int _goldCoinIncome = 0; //金币
  int _money = 0; //余额
  String? _frame; //当前带的头像框

  int get goldCoinIncome => _goldCoinIncome;
  int get money => _money;
  String get frame => _frame ?? '';

  PersonalInfoProvider() {
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(EventConstant.EventPersonalInfoInit, _init);
    eventCenter.addListener(EventConstant.EventUserMoneyChange, _onMoneyChange);
    eventCenter.addListener(
        EventConstant.EventCurrentHeaderFrameChanged, _onFrameChange);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener(EventConstant.EventPersonalInfoInit, _init);
    eventCenter.removeListener(
        EventConstant.EventUserMoneyChange, _onMoneyChange);
    eventCenter.removeListener(
        EventConstant.EventCurrentHeaderFrameChanged, _onFrameChange);
  }

  ///app进入boot页面发送 EventConstant.EventPersonalInfoInit 事件来初始化
  void _init(String type, dynamic data) {
    int type = Util.parseInt(data, 0);

    ///初始化用户的前和头像框
    if (type != 2) {
      //type==2 已取账号信息
      syncData();
    }

    if (type == 1 || type == 2) {
      UserImageCacheHelper.instance().showLocalFrame = true; //显示本地头像框
      UserImageCacheHelper.instance().query(); //获取所有本地头像框
    }
  }

  void _onLogin(String type, dynamic data) {
    syncData();
  }

  void _onMoneyChange(String type, dynamic field) {
    syncMoney();
  }

  void _onFrameChange(String type, dynamic field) {
    syncFrame();
  }

  reloadData() {
    moneyData();
    frameData();
    notifyListeners();
  }

  syncData() async {
    // Log.d("PersonalInfoProvider syncData");
    if (!Session.isLogined) {
      return;
    }
    await Session.sync({
      'money': true,
      'frame': true,
    });
    moneyData();
    frameData();
    notifyListeners();
  }

  syncMoney() async {
    // Log.d("PersonalInfoProvider syncMoney");
    if (!Session.isLogined) {
      return;
    }
    await Session.sync({
      'money': true,
    });
    moneyData();
    notifyListeners();
  }

  syncFrame() async {
    // Log.d("PersonalInfoProvider syncFrame");
    if (!Session.isLogined) {
      return;
    }
    await Session.sync({
      'frame': true,
    });
    frameData();
    notifyListeners();
  }

  void moneyData() {
    Map money = Session.getMap('_money', {});
    _goldCoinIncome = Util.parseInt(money['gold_coin'], 0);
    _money = Session.money;
  }

  void frameData() {
    _frame = Session.getString('frame', '');
  }

  //获取完整的头像框路径
  String get fullFramePath {
    if (_frame?.isEmpty ?? true) {
      return '';
    }
    if (_frame!.endsWith('.png')) {
      return Util.getRemoteImgUrl(_frame);
    }

    if (!frame.endsWith('.webp')) {
      return '${System.imageDomain}static/effect/$_frame.png';
    } else {
      return '${System.imageDomain}static/effect/$_frame';
    }
  }
}
