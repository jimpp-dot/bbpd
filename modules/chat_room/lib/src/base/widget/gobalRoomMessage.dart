import 'dart:io';
import 'dart:typed_data';

import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/auction/widget/auction_relation_tag.dart';
import 'package:chat_room/src/base/global_message/annual_event_message.dart';
import 'package:chat_room/src/base/global_message/autumn_act_message.dart';
import 'package:chat_room/src/base/global_message/five_star_challenge_global_message_widget.dart';
import 'package:chat_room/src/base/global_message/general_user_message.dart';
import 'package:chat_room/src/base/global_message/guess_gift_global_message_widget.dart';
import 'package:chat_room/src/base/global_message/national_act_message.dart';
import 'package:chat_room/src/base/global_message/star_wish_message.dart';
import 'package:chat_room/src/confess_v2/widgets/confess_v2_global_message_widget.dart';
import 'package:chat_room/src/protobuf/generated/accompany.house.unlock.pb.dart';
import 'package:chat_room/src/protobuf/generated/guess_gift.pb.dart';
import 'package:chat_room/src/protobuf/generated/room_user_pk.pb.dart';
import 'package:chat_room/src/protobuf/json_key/generated/common_full_screen.pb.dart';
import 'package:chat_room/src/vindicate/widgets/common_vindicate_global_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';

///  房间飘屏
///
class GlobalRoomMessage extends StatefulWidget {
  final ChatRoomData room;

  const GlobalRoomMessage({super.key, required this.room});

  @override
  _State createState() => _State();
}

class GlobalMessage {
  final int uVip;
  final String uName;
  final String uIcon;
  final int uTitle;
  final int uTitleNew;
  final int showTime;
  final int toVip;
  final int toTitle;
  final int toTitleNew;
  final String toName;
  final int money;
  final int rid;
  final String rName;
  final int giftNum;
  final int giftId;
  final String giftImage;
  final String type;
  final String boxName;
  final int num;

  final String word;
  final String toIcon;
  final String gloryNaming;

  final String icon;
  final String name;
  final String desc;
  final String btn;

  /// 飘屏背景
  final String bgImg;

  /// 跳转链接
  final String jumpPath;

  /// 名字前缀,恭喜***
  final String prefixTxt;

  /// 前缀，白色字体（成为***，达成***）
  final String frontTxt;

  //直播PK
  final int uRid;
  final int toRid;
  final int uPkScore;
  final int toPkScore;
  final String screenContent; //飘屏内容
  final String punishContend; //惩罚内容

  // 拍卖关系
  final int defendLevel;
  final String defendTitle;

  final String blessWords; // 生日房祝福语

  // 五星挑战等级
  final int level;

  /// 麦序房主播切换提示
  final String artCenterChangeAnchor;

  /// 陪伴小屋
  /// 建造者uid
  final int accompanyHouseBuilderUid;

  /// 目标用户uid
  final int accompanyHouseTargetUid;

  final String awardName;
  final String awardIcon;
  final String luckType;

  final int pkId;

  final GlobalUser? role1;
  final GlobalUser? role2;
  final int tacit;

  final String rIcon; // 收礼人Icon
  final String giftName;
  final int boxType; // 礼盒类型 1：甄选礼盒
  final Map awakeGiftInfo;
  final Map commonScreenContent; // 通用飘屏内部数据
  File? bgFile;

  static const TYPE_ACTIVITY = "activity";

  GlobalMessage.fromJson(Map data)
      : uVip = Util.parseInt(data['uvip']),
        uTitle = Util.parseInt(data['utitle']),
        uTitleNew = Util.parseInt(data['utitle_new']),
        showTime = Util.parseInt(data['show_time']),
        toVip = Util.parseInt(data['tovip']),
        toTitle = Util.parseInt(data['totitle']),
        toTitleNew = Util.parseInt(data['totitle_new']),
        money = Util.parseInt(data['money']),
        rid = Util.parseInt(data['rid']),
        uName = Util.notNullStr(data['uname']),
        toName = Util.notNullStr(data['toname']),
        uIcon = Util.notNullStr(data['uicon']),
        toIcon = Util.notNullStr(data['toicon']),
        gloryNaming = Util.notNullStr(data['glory_naming']),
        rName = Util.notNullStr(data['rname']),
        giftNum = Util.parseInt(data['giftNum']),
        giftId = Util.parseInt(data['giftId']),
        type = Util.notNullStr(data['type']),
        boxName = Util.notNullStr(data['boxName']),
        num = Util.parseInt(data['num']),
        giftImage = data['giftImage'] != null && data['giftImage'].toString().isNotEmpty
            ? Util.notNullStr(data['giftImage'])
            : 'static/$giftSubDir/${data['giftId'] != null ? data['giftId'].toString() : ""}.png',
        word = Util.notNullStr(data['word']),
        prefixTxt = Util.notNullStr(data['prefix_txt']),
        frontTxt = Util.notNullStr(data['front_txt']),
        icon = Util.notNullStr(data['icon']),
        name = Util.notNullStr(data['name']),
        desc = Util.notNullStr(data['desc']),
        btn = Util.notNullStr(data['btn']),
        bgImg = Util.parseIcon(data['back_img']),
        jumpPath = Util.notNullStr(data['jump_path']),
        //直播PK专用
        uRid = Util.parseInt(data['urid']),
        toRid = Util.parseInt(data['torid']),
        uPkScore = Util.parseInt(data['upk_score']),
        toPkScore = Util.parseInt(data['topk_score']),
        screenContent = Util.notNullStr(data['screen_content']),
        punishContend = Util.notNullStr(data['punish_content']),
        // 拍卖
        defendLevel = Util.parseInt(data['defendLevel']),
        defendTitle = Util.notNullStr(data['defendTitle']),
        blessWords = Util.notNullStr(data['bless_words']),
        level = Util.parseInt(data['level']),
        artCenterChangeAnchor = Util.notNullStr(data['artCenterChangeAnchor']),
        accompanyHouseBuilderUid = Util.parseInt(data['builderUid']),
        accompanyHouseTargetUid = Util.parseInt(data['targetUid']),
        awardName = Util.notNullStr(data['awardName']),
        luckType = Util.notNullStr(data['luckType']),
        awardIcon = Util.getRemoteImgUrl(data['awardIcon']),
        pkId = Util.parseInt(data['pkId']),
        role1 = data['role1'] == null ? null : GlobalUser.fromJson(data['role1']),
        role2 = data['role2'] == null ? null : GlobalUser.fromJson(data['role2']),
        tacit = Util.parseInt(data['tacit']),
        rIcon = Util.notNullStr(data['ricon']),
        giftName = Util.notNullStr(data['gift_name']),
        boxType = Util.parseInt(data['from_outstanding_box']),
        awakeGiftInfo = data['gift_awake_info'] ?? {},
        commonScreenContent = Util.parseMap(data['common_screen_extra']);

  //房间红包飘屏消息
  static const msgTypeRedPacket = 'red-packet';

  /// 成就达成
  bool get isAchievement => type == 'achievement';

  /// 圣诞活动
  /// 测试链接 https://dev.iambanban.com/test/christmasFly?uid=118433259&rid=193193157
  bool get isChristmas => type == 'christmas';

  /// 入场欢迎
  bool get isEnterGreet => type == 'enter.topuser';

  /// 是否为表白活动横幅消息
  bool get isVindicate => type == 'confess.together';

  /// 是否为表白活动恋爱旅行横幅消息
  bool get isConfessV2 => type == 'confess_v2.together';

  /// 是否为千里传音横幅消息
  bool get isTrumpet => type == 'trumpet';

  /// 是否为五星挑战横幅消息
  bool get isFiveStarChallenge => type == 'complete.challenge';

  /// 是否为陪伴小屋解锁
  bool get isAccompanyHouseUnlock => type == 'accompany_house_unlocked';

  /// 通用用户飘屏
  bool get isGeneralUser => type == GeneralUserMessage.generalUserMessage;

  /// 礼物猜猜乐
  bool get isGuessGift => type == 'guess_gift';

  /// 星语心愿
  bool get isStarWish => type == 'draw.star.wish.commodity';

  /// 中秋活动
  bool get isAutumnAct => type == 'draw.act.autumn.commodity';

  /// 国庆活动
  bool get isNationalAct => type == 'open.act.national.site';

  /// 甄选礼盒
  bool get isBoxGift => boxType == 1;

  /// 年度盛典普通
  bool get isAnnualNormal => type == 'annual.party.normal';

  /// 年度盛典宝箱
  bool get isAnnualBox => type == 'annual.party.box';
}

class GlobalUser {
  int uid;
  String icon;
  String name;

  GlobalUser.fromJson(Map data)
      : uid = Util.parseInt(data['uid']),
        icon = Util.notNullStr(data['icon']),
        name = Util.notNullStr(data['name']);
}

class _State extends State<GlobalRoomMessage> {
  final List<GlobalMessage> _list = []; //全房间通知
  GlobalMessage? _data;
  final ValueAnimation _trx = Animated.value(Util.width);
  Sequence? _sequenceBox;
  Sequence? _sequence;

  Widget? body;

  static const String accompanyHouseUnlockMessage = '${RoomConstant.Event_Pb_Prefix}accompany.house.unlock';

  static const String userPkFly = '${RoomConstant.Event_Pb_Prefix}user.pk.fly';

  @override
  void initState() {
    super.initState();
    _sequence = Animated.sequence([
      Animated.spring(_trx, toValue: 0.0, speed: 1.0, bounciness: 3.0),
      Animated.delay(const Duration(milliseconds: 2000)),
      Animated.spring(_trx, toValue: 0 - Util.width, speed: 3.0, bounciness: 3.0, overshootClamping: true),
    ], _onAniUpdate);

    _sequenceBox = Animated.sequence([
      Animated.spring(_trx, toValue: 0.0, speed: 1.0, bounciness: 3.0),
      Animated.delay(const Duration(milliseconds: 2000)),
      Animated.spring(_trx, toValue: 0 - Util.width, speed: 3.0, bounciness: 3.0, overshootClamping: true),
    ], _onAniUpdate);

    widget.room.addListeners([
      '${RoomConstant.Event_Prefix}room.livepk.screen.notice', // 直播PK
      '${RoomConstant.Event_Prefix}room.emperor.notice',
      '${RoomConstant.Event_Prefix}room.box.notice',
      '${RoomConstant.Event_Prefix}room.cp.match.notice',
      '${RoomConstant.Event_Prefix}room.piece.notice',
      '${RoomConstant.Event_Prefix}room.common.activity',
      '${RoomConstant.Event_Prefix}room.red.packet.notice',
      '${RoomConstant.Event_Prefix}room.auction.upgrade', // 拍卖关系升级
      '${RoomConstant.Event_Prefix}room.achievement.notice', // 成就解锁
      '${RoomConstant.Event_Prefix}room.activity.christmas.notice', // 圣诞活动
      '${RoomConstant.Event_Prefix}room.fly.newyear.topuser.enter', // 入场横幅
      '${RoomConstant.Event_Prefix}confess.together.fly', // 表白活动横幅
      '${RoomConstant.Event_Prefix}room.fly.trumpet', // 千里传音飘屏
      '${RoomConstant.Event_Prefix}room.live.fans.challenge', // 五星挑战横幅
      '${RoomConstant.Event_Prefix}room.art.center.change.anchor',
      '${RoomConstant.Event_Prefix}star.wish', //星语心愿
      '${RoomConstant.Event_Prefix}act.national', // 国庆活动
      '${RoomConstant.Event_Prefix}act.autumn', // 中秋活动
      '${RoomConstant.Event_Prefix}annual.party', // 年度盛典

      /// 麦序房主播切换提示
      'room.wave.win', // 潜水玩法胜利横幅
    ], _onAllRoomNotify);

    /// 陪伴小屋解锁
    widget.room.addListener(accompanyHouseUnlockMessage, _onAccompanyHouseUnlock);

    widget.room.addListener(userPkFly, _onUserPkFly);

    /// 礼物猜猜乐
    widget.room.addListener('${RoomConstant.Event_Pb_Prefix}room.screen.fly.guess.gift', _onGuessGiftMessage);

    widget.room.addListener('${RoomConstant.Event_Pb_Prefix}room.global.common.notify', _onCommonScreenMessage); // 通用飘屏
    eventCenter.addListener('im.room.global.common.notify', _onCommonScreenMessage); // 通用飘屏(从im通道来）
  }

  @override
  void dispose() {
    widget.room.removeListeners([
      '${RoomConstant.Event_Prefix}room.livepk.screen.notice', // 直播PK
      '${RoomConstant.Event_Prefix}room.emperor.notice',
      '${RoomConstant.Event_Prefix}room.box.notice',
      '${RoomConstant.Event_Prefix}room.cp.match.notice',
      '${RoomConstant.Event_Prefix}room.piece.notice',
      '${RoomConstant.Event_Prefix}room.common.activity',
      '${RoomConstant.Event_Prefix}room.red.packet.notice',
      '${RoomConstant.Event_Prefix}room.auction.upgrade', // 拍卖关系升级
      '${RoomConstant.Event_Prefix}room.achievement.notice',
      '${RoomConstant.Event_Prefix}room.activity.christmas.notice', // 圣诞活动
      '${RoomConstant.Event_Prefix}room.fly.newyear.topuser.enter', // 入场横幅
      '${RoomConstant.Event_Prefix}confess.together.fly', // 表白活动横幅
      '${RoomConstant.Event_Prefix}room.fly.trumpet', // 千里传音飘屏
      '${RoomConstant.Event_Prefix}room.live.fans.challenge', // 五星挑战横幅
      '${RoomConstant.Event_Prefix}room.art.center.change.anchor',
      '${RoomConstant.Event_Prefix}star.wish', //星语心愿
      '${RoomConstant.Event_Prefix}act.national', // 国庆活动
      '${RoomConstant.Event_Prefix}act.autumn', // 中秋活动
      '${RoomConstant.Event_Prefix}annual.party', // 年度盛典

      /// 麦序房主播切换提示
      'room.wave.win', // 潜水玩法胜利横幅
    ], _onAllRoomNotify);

    /// 陪伴小屋解锁
    widget.room.removeListener(accompanyHouseUnlockMessage, _onAccompanyHouseUnlock);
    widget.room.removeListener(userPkFly, _onUserPkFly);

    /// 礼物猜猜乐
    widget.room.removeListener('${RoomConstant.Event_Pb_Prefix}room.screen.fly.guess.gift', _onGuessGiftMessage);

    widget.room.removeListener('${RoomConstant.Event_Pb_Prefix}room.global.common.notify', _onCommonScreenMessage); // 通用飘屏
    eventCenter.removeListener('im.room.global.common.notify', _onCommonScreenMessage); // 通用飘屏(从im通道来）

    if (_sequence != null) {
      _sequence!.stop();
      _sequence = null;
    }
    if (_sequenceBox != null) {
      _sequenceBox!.stop();
      _sequenceBox = null;
    }
    super.dispose();
  }

  _onAniUpdate(bool complete) {
    if (complete) {
      _onComplete();
    } else {
      if (mounted) setState(() {});
    }
  }

  _addNewMessage(GlobalMessage message) {
    if (_data == null && mounted) {
      // 收到消息后可能需要下载完资源后才会加入到队列中,此时需要判断控件是否已经销毁
      setState(() {
        body = null;
        _data = message;
        _trx.reset();
        reportExposure();
      });
      if (_data?.type == 'box') {
        _sequenceBox?.start();
      } else {
        _sequence = Animated.sequence([
          Animated.spring(_trx, toValue: 0.0, speed: 1.0, bounciness: 3.0),
          Animated.delay(Duration(seconds: _data?.showTime ?? 2)),
          Animated.spring(_trx, toValue: 0 - Util.width, speed: 3.0, bounciness: 3.0, overshootClamping: true),
        ], _onAniUpdate);
        _sequence?.start();
      }
    } else {
      _list.add(message);
    }
  }

  void _onAllRoomNotify(String type, dynamic data) {
    Log.d('_onAllRoomNotify data = $data ');
    if (Util.appState != AppLifecycleState.resumed || !mounted) return;
    GlobalMessage? message;
    try {
      if (data is Map) {
        Map json = data;
        message = GlobalMessage.fromJson(json);
      } else if (data is Uint8List) {
        Log.d('data is pb');

        /// pb
        Uint8List charCodes = data;
        final str = String.fromCharCodes(charCodes);
        Log.d('str = $str');
      }
    } catch (e) {
      Log.d(e);
      return;
    }
    if (message != null) {
      _addNewMessage(message);
    }
  }

  /// 陪伴小屋解锁消息
  _onAccompanyHouseUnlock(String type, dynamic data) {
    if (data != null && data is Uint8List) {
      final buffer = data;
      final pbMsg = AccompanyHouseUnlock.fromBuffer(buffer);
      Log.d('pbmsg = ${pbMsg.toProto3Json()}');
      final pbMsgJsonMap = pbMsg.toProto3Json();
      final message = GlobalMessage.fromJson(pbMsgJsonMap as Map);
      _addNewMessage(message);
    }
  }

  _onUserPkFly(String type, dynamic data) {
    if (data != null && data is Uint8List) {
      final buffer = data;
      UserPkFly pbMsg = UserPkFly.fromBuffer(buffer);
      Log.d('pbmsg = ${pbMsg.toProto3Json()}');
      final Map pbMsgJsonMap = pbMsg.toProto3Json() as Map;
      pbMsgJsonMap['type'] = userPkFly;
      final message = GlobalMessage.fromJson(pbMsgJsonMap);
      _addNewMessage(message);
    }
  }

  _onGuessGiftMessage(String type, dynamic data) {
    if (data != null && data is Uint8List) {
      final buffer = data;
      final pbMsg = GuessGiftFlyMessage.fromBuffer(buffer);
      final Map pbMsgJsonMap = pbMsg.toProto3Json() as Map;
      Log.d('_onGuessGiftMessage: pbMsgJsonMap = $pbMsgJsonMap');
      final message = GlobalMessage.fromJson(pbMsgJsonMap);
      _addNewMessage(message);
    }
  }

  _onCommonScreenMessage(String type, dynamic data) async {
    GlobalMessage? message;
    if (data is Map) {
      List<int> rids = Util.parseIntList(data['rids']);
      int showScope = Util.parseInt(data['show_scope']);
      List<String> channels = Util.parseList(data['channels'], (e) => Util.parseStr(e) ?? '');
      if (showScope == 1 ||
          (showScope == 2 && rids.contains(widget.room.rid)) ||
          (showScope == 3 &&
              Util.validStr(widget.room.config?.settlementChannel) &&
              channels.contains(widget.room.config?.settlementChannel))) {
        if (!data.containsKey('type')) {
          data['type'] = data['msg_type'];
        }
        message = GlobalMessage.fromJson(data);
      }
    } else if (data is Uint8List) {
      final buffer = data;
      final pbMsg = SendCommonFullScreen.fromBuffer(buffer);
      final Map pbMsgJsonMap = pbMsg.toProto3Json() as Map;
      Log.d('_onCommonScreenMessage: pbMsgJsonMap = $pbMsgJsonMap');
      message = GlobalMessage.fromJson(pbMsgJsonMap);
    }

    if (message != null && Util.validStr(message.bgImg)) {
      String? bgFilePath = await cacheUrlWithTry(Util.getRemoteImgUrl(message.bgImg), 0, subDir: 'resource_screen');
      if (Util.validStr(bgFilePath)) {
        message.bgFile = File(bgFilePath!);
        _addNewMessage(message);
      }
    }
  }

  _onComplete() {
    if (!mounted) return;
    _sequence?.stop();
    _sequenceBox?.stop();
    setState(() {
      body = null;
      _data = null;
    });

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (mounted && _sequence != null && _sequenceBox != null && _data == null && _list.isNotEmpty) {
        setState(() {
          body = null;
          _data = _list.removeAt(0);
          _trx.reset();
          reportExposure();
        });
        if (_data?.type == 'box') {
          _sequenceBox?.start();
        } else {
          _sequence = Animated.sequence([
            Animated.spring(_trx, toValue: 0.0, speed: 1.0, bounciness: 3.0),
            Animated.delay(Duration(seconds: _data?.showTime ?? 2)),
            Animated.spring(_trx, toValue: 0 - Util.width, speed: 3.0, bounciness: 3.0, overshootClamping: true),
          ], _onAniUpdate);
          _sequence?.start();
        }
      }
    });
  }

  _onItemClick(int rid) async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'room_global_room_message_$rid',
    });
    if (rid > 0 && rid != widget.room.realRid) {
      if (ChatRoomUtil.isMic) {
        bool? result = await _showOnMicDialog();
        if (result != true) {
          return;
        }
      }
      // 房间内点击飘屏消息跳转到另一个房间
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, rid, from: RoomFrom.globalMsg, refer: 'gift_floating');
    } else if (!Util.isStringEmpty(_data?.jumpPath)) {
      SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, _data!.jumpPath, fromPage: 'RoomMarquee');
    } else if (_data?.type == 'box') {
      eventCenter.emit('BagPannel.Open');
    }
  }

  Future<bool?> _showOnMicDialog() async {
    bool? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(title: K.room_exit_to_new_room, negativeButton: NegativeButton(text: K.room_not_now));
        });
    return result;
  }

  /// 集字符
  Widget _renderPieceContent(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: K.room_rush_piece_collection,
        style: TextStyle(color: Colors.white, fontFamily: Util.fontFamily, fontSize: 14, fontWeight: FontWeight.w600),
      ),
      maxLines: 1,
    );
  }

  Widget _renderContent(BuildContext context) {
    TextStyle style = const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600);
    if (_data!.type == 'piece') {
      return _renderPieceContent(context);
    } else if (_data!.type == GlobalMessage.msgTypeRedPacket) {
      return Text(_data!.desc, style: style);
    } else if (_data!.isAccompanyHouseUnlock) {
      return Text(
        _data!.word,
        style: style,
      );
    } else {
      return Text.rich(
        TextSpan(
          text: _data!.type == 'box' ? K.room_open_boxs_get(['${_data!.num}', _data!.boxName]) : K.room_tab_item_package,
          style: style,
          children: <TextSpan>[
            TextSpan(
              text: _data!.type != 'box' ? _data!.toName : '',
              style: TextStyle(
                fontFamily: Util.fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(
                  Utility.getGlobalRoomColor(_data!.toVip),
                ),
              ),
            ),
            if (_data!.type != 'box')
              TextSpan(
                text: _data!.giftName,
                style: TextStyle(
                  fontFamily: Util.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFDAE32),
                ),
              ),
          ],
        ),
        maxLines: 1,
      );
    }
  }

  Widget _renderCenter(BuildContext context) {
    if (_isActivity()) {
      return _renderActivityCenter(context);
    }

    if (_data!.isAccompanyHouseUnlock) {
      return _renderAccompanyHouseUnlockCenter(context);
    }

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 26,
            child: MarqueeWidget(
              child: _buildMarqueeContent(),
            ),
          ),
          !Util.isStringEmpty(_data!.blessWords) ? _buildBlessWords() : _buildRoomName(),
        ],
      ),
    );
  }

  /// 直播PK，中间的内容
  Widget _livePkRenderCenter(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 22,
            child: MarqueeWidget(
              child: _buildMarqueeLivePKContent(),
            ),
          ),

          /// pk 分数
          PkScoreWidget(
            _data!.uPkScore.toDouble(),
            _data!.toPkScore.toDouble(),
            height: 5.0,
            displayScore: false,
          ),
          _buildPunishContend(),
        ],
      ),
    );
  }

  Widget _buildUserIcon(BuildContext context) {
    if (_data!.type == 'cp-match' || _data!.isVindicate) return _buildCpMatchIcon();
    if (_isActivity()) return AvatarWidget(_data!.icon, showGradient: false);
    return AvatarWidget(_data!.uIcon, isAwake: _data!.awakeGiftInfo.isNotEmpty);
  }

  Widget _buildCpMatchIcon() {
    return SizedBox(
      height: 38,
      width: 68,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          PositionedDirectional(
            start: 0.0,
            child: AvatarWidget(_data!.uIcon, size: 36),
          ),
          PositionedDirectional(
            start: 28.0,
            child: AvatarWidget(_data!.toIcon, size: 36),
          ),
        ],
      ),
    );
  }

  Widget _buildMarqueeLivePKContent() {
    TextStyle style = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 2),
        Text(_data!.screenContent, maxLines: 1, style: style),
        const SizedBox(width: 2),
      ],
    );
  }

  Widget _buildMarqueeContent() {
    TextStyle style = const TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
    );

    if (_data!.type == 'cp-match') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 2),
          Text(K.room_congratulations, maxLines: 1, style: style),
          const SizedBox(width: 2),
          _buildUserInfo(_data!.uName, _data!.uTitle, _data!.uVip, _data!.uTitleNew),
          Text(K.room_with, maxLines: 1, style: style),
          _buildUserInfo(_data!.toName, _data!.toTitle, _data!.toVip, _data!.toTitleNew),
          Text(_data!.word, maxLines: 1, style: style),
        ],
      );
    }
    return Row(
      children: <Widget>[
        const SizedBox(width: 2),
        _buildUserInfo(_data!.uName, _data!.uTitle, _data!.uVip, _data!.uTitleNew, isAwake: _data!.awakeGiftInfo.isNotEmpty),
        _renderContent(context),
      ],
    );
  }

  Widget _buildEnd(BuildContext context) {
    if (_data!.type == 'cp-match') return _buildPackageOrCpEnd('charm.png', '${_data!.num ~/ 100}');

    if (_isActivity()) return _buildActivityEnd(context);

    if (_data!.type == GlobalMessage.msgTypeRedPacket) return _buildBonusEnd();

    if (_data!.isAccompanyHouseUnlock) {
      /// 陪伴小屋解锁
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CachedNetworkImage(
          imageUrl: Util.parseIcon(_data!.icon),
          cachedWidth: 54.px,
          cachedHeight: 54.px,
        ),
      );
    }

    return _buildGiftEnd();
  }

  Widget _buildPackageOrCpEnd(String image, String text) {
    return Container(
      height: 54,
      margin: const EdgeInsetsDirectional.only(end: 17),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          R.img(image, width: 38.0, height: 38, package: ComponentManager.MANAGER_BASE_ROOM),
          PositionedDirectional(
            bottom: 0,
            child: NumText(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusEnd() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 5, end: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: '${System.imageDomain}${_data!.icon}',
            width: 40.0,
            height: 40.0,
          ),
          NumText(
            '${_data!.money ~/ MoneyConfig.multiple}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftEnd() {
    if (_data!.type == 'box' || _data!.giftId > 0) {
      return SizedBox(
        width: 74,
        height: 70,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 74,
              height: 70,
              alignment: AlignmentDirectional.center,
              child: CachedNetworkImage(
                imageUrl: Util.squareResize(_data!.type == 'box' ? _data!.giftImage : Util.giftImgUrl(_data!.giftId), 180),
                width: 60.0,
                height: 60.0,
              ),
            ),
            R.img('ic_gift_mask.png', width: 74, height: 70, package: ComponentManager.MANAGER_BASE_ROOM),
            if (_data!.giftNum > 1)
              PositionedDirectional(
                end: 6,
                top: 8,
                child: NumText(
                  'X${_data!.giftNum}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    shadows: [
                      Shadow(offset: Offset(0.0, 2.0), blurRadius: 4.0, color: Color(0xFFFDAE32)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    }
    return _buildPackageOrCpEnd(
        _data?.type == 'defend' ? 'ic_guard_heart.webp' : 'ic_package.png', Util.removeDecimalZeroFormat(_data!.money / 100));
  }

  final _commonStyle = const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400);

  /// 直播PK的飘屏
  Widget _getLivePK() {
    return Container(
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.identity()..translate(_trx.value),
      child: Transform.scale(
        scale: Util.ratio,
        child: Container(
          height: 80,
          width: 375,
          alignment: AlignmentDirectional.center,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              _buildBackground(),
              Container(
                width: 310,
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 3),
                    AvatarWidget(_data!.uIcon, onTap: () {
                      _onItemClick(_data!.uRid);
                    }),
                    _livePkRenderCenter(context),
                    AvatarWidget(_data!.toIcon, onTap: () {
                      _onItemClick(_data!.toRid);
                    }),
                  ],
                ),
              ),
              PositionedDirectional(
                end: 0,
                child: R.img('ic_room_arrow.webp', width: 40, height: 30, package: ComponentManager.MANAGER_BASE_ROOM),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_data == null) {
      return const SizedBox.shrink();
    }

    if (CommonFloatScreen.supportType(_data!.type)) {
      body = CommonFloatScreen(
        bg: _data!.bgFile!,
        scheme: _data!.jumpPath,
        info: CommonScreenContent.parseMap(_data!.commonScreenContent),
      );
    }

    if (_isLivePk()) return _getLivePK();
    if (_isAuctionUpgrade) {
      body = _buildAuctionUpgradeBody();
    }

    if (_isArtCenterChangeAnchor) {
      body = buildArtCenterChangeAnchor();
    }

    if (_data!.isStarWish) {
      body = GestureDetector(
        onTap: () => _onItemClick(_data!.rid),
        child: StarWishMessage(
          data: _data!,
        ),
      );
    }

    if (_data!.isAnnualNormal || _data!.isAnnualBox) {
      body = GestureDetector(
        onTap: () => _onItemClick(_data!.rid),
        child: AnnualEventMessage(
          data: _data,
        ),
      );
    }

    /// 中秋活动飘屏
    if (_data!.isAutumnAct) {
      body = AutumnActMessage(data: _data!);
    }

    /// 国庆活动飘屏
    if (_data!.isNationalAct) {
      body = NationalActMessage(data: _data!);
    }

    body ??= _buildBody(context);
    return RepaintBoundary(
      child: Container(
        width: MediaQuery.of(context).size.width,
        transform: Matrix4.identity()..translate(_trx.value),
        child: body,
      ),
    );
  }

  bool get _isShowRightArrow {
    if (_data!.isVindicate ||
        _data!.isConfessV2 ||
        _data!.isFiveStarChallenge ||
        _data!.isAccompanyHouseUnlock ||
        _data!.isGuessGift ||
        !Util.isNullOrEmpty(_data!.gloryNaming)) {
      return false;
    }

    return true;
  }

  Transform _buildBody(BuildContext context) {
    return Transform.scale(
      scale: Util.ratio,
      child: Container(
        height: 80,
        width: 375,
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            _buildBackground(),
            GestureDetector(
              onTap: () => _onItemClick(_data!.rid),
              child: Container(
                width: 310,
                alignment: AlignmentDirectional.center,
                child: _buildItem(),
              ),
            ),
            if (_isShowRightArrow)
              PositionedDirectional(
                end: 0,
                child: Builder(
                  builder: (context) {
                    return RepaintBoundary(
                        child: R.img('ic_room_arrow.webp', width: 40, height: 30, package: ComponentManager.MANAGER_BASE_ROOM));
                  },
                ),
              ),
            if (!Util.isNullOrEmpty(_data!.gloryNaming))
              //冠名飘屏的显示部分
              PositionedDirectional(
                end: Util.isIOS && _data!.awakeGiftInfo.isNotEmpty ? (Util.width - 375) / 2 + 20.dp : 12,
                bottom: 8,
                child: Container(
                    height: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF884DFF), width: 1),
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                        colors: [const Color(0xFF7123AA), const Color(0xFF440CB6).withOpacity(0.6)],
                      ),
                    ),
                    child: Text(_data!.gloryNaming,
                        style: TextStyle(fontSize: 9, color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.w500))),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildItem() {
    if (_data!.isBoxGift) return _buildBoxGift();

    if (_data!.isAchievement || _data!.isChristmas) return _AchievementWidget(data: _data!);

    if (_data!.isEnterGreet) return _EnterGreetWidget(data: _data!);

    /// 表白活动横幅内容
    if (_data!.isVindicate) {
      return CommonVindicateGlobalMessageWidget(data: _data!);
    }

    /// 恋爱旅行横幅内容
    if (_data!.isConfessV2) {
      return ConfessV2GlobalMessageWidget(data: _data!);
    }

    /// 直播间【五星挑战】飘屏
    if (_data!.isFiveStarChallenge) return FiveStarChallengeGlobalMessageWidget(data: _data!);

    /// 礼物猜猜乐
    if (_data!.isGuessGift) return GuessGiftGlobalMessageWidget(data: _data!);

    if (_data!.isTrumpet) return _buildTrumpet(_data!);

    if (_data!.isGeneralUser) return GeneralUserMessage(_data!);

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 2),
        _buildUserIcon(context),
        const SizedBox(width: 2),
        _renderCenter(context),
        if (_isActivity()) const SizedBox(width: 6),
        _buildEnd(context),
        if (_isActivity()) const SizedBox(width: 4),
      ],
    );
  }

  Widget _buildBoxGift() {
    Log.d('======>ricon=${_data!.rIcon}');
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 2),
        AvatarWidget(_data!.rIcon),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 26,
                child: MarqueeWidget(
                  child: RichText(
                    text: TextSpan(
                      text: K.guess_game_congratulations,
                      style: _commonStyle,
                      children: [
                        TextSpan(text: ' ${_data!.toName} ', style: _commonStyle.copyWith(color: const Color(0xFFFFF01F))),
                        TextSpan(text: K.room_box_gift_global_message_infix, style: _commonStyle),
                        TextSpan(
                          text: _data!.giftName,
                          style: _commonStyle.copyWith(color: const Color(0xFFFFF01F)),
                        ),
                        TextSpan(
                          text: ' x${_data!.giftNum}',
                          style: _commonStyle.copyWith(
                            color: const Color(0xFFFFF01F),
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              _buildRoomName(),
            ],
          ),
        ),
        _buildGiftEnd(),
      ],
    );
  }

  Widget _buildTrumpet(GlobalMessage data) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 2),
        AvatarWidget(data.uIcon),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 80,
                    ),
                    child: Text(
                      data.uName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    data.desc,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
                child: MarqueeWidget(
                  ratioOfBlankToScreen: 100,
                  child: Text(
                    data.word,
                    maxLines: 1,
                    style: const TextStyle(color: Color(0xFFFFF056), fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        CachedNetworkImage(
          imageUrl: Util.parseIcon(data.icon),
          width: 60,
          height: 60,
        ),
      ],
    );
  }

  Widget _buildBackground() {
    if (_isActivity()) {
      return R.img(
        RoomAssets.chat_room$auction_global_room_msg_bg_webp,
        fit: BoxFit.fill,
        width: 375,
        height: 80,
      );
    } else if (!Util.isStringEmpty(_data!.bgImg)) {
      return RepaintBoundary(
        child: CachedNetworkImage(
          height: 80,
          fit: BoxFit.fitHeight,
          imageUrl: Util.parseIcon(_data!.bgImg),
        ),
      );
    } else if (_data!.isFiveStarChallenge || _data!.isGuessGift) {
      return const SizedBox.shrink();
    } else if (_data!.awakeGiftInfo.isNotEmpty) {
      String bgUrl = _data?.awakeGiftInfo['awake_fly_url'] ?? '';
      return bgUrl.isNotEmpty
          ? RepaintBoundary(child: CachedNetworkImage(imageUrl: bgUrl, width: Util.width - 32.dp, fit: BoxFit.fitWidth))
          : R.img(BaseAssets.shared$horn_global_awake_float_screen_bg_webp, width: Util.width - 32.dp, fit: BoxFit.fitWidth);
    } else {
      return RepaintBoundary(
        child: CachedNetworkImage(
          height: 80,
          fit: BoxFit.fitHeight, //global_room_message.webp
          imageUrl: Util.isNullOrEmpty(_data!.gloryNaming)
              ? Util.getImgUrl('global_room_message.webp', package: ComponentManager.MANAGER_BASE_ROOM)
              : '202304/04/642bd7d6a5e2a1.44032681.webp',
        ),
      );
    }
  }

  bool _isActivity() {
    return _data != null && _data!.type == GlobalMessage.TYPE_ACTIVITY;
  }

  /// 是否是直播PK
  bool _isLivePk() {
    return _data != null && _data!.type == 'live_pk';
  }

  bool get _isAuctionUpgrade => _data!.type == 'room.auction.upgrade';

  bool get _isArtCenterChangeAnchor => Util.validStr(_data!.artCenterChangeAnchor);

  ///  房间名字
  Widget _buildRoomName() {
    return Row(
      children: <Widget>[
        if (_data!.rid > 0)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 3.0),
            child: R.img(
              "ic_little_room.svg",
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 16,
              height: 16,
            ),
          ),
        if (!Util.isStringEmpty(_data!.rName))
          Expanded(
            child: Text(
              _data!.rName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),
            ),
          )
      ],
    );
  }

  Widget _buildBlessWords() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 3.0),
          child: R.img(
            "ic_bless_msg.png",
            package: ComponentManager.MANAGER_BASE_ROOM,
            width: 16,
            height: 16,
          ),
        ),
        Expanded(
          child: Text(
            _data!.blessWords,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFFFFD42D), fontSize: 11.0, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  ///  直播PK 惩罚内容
  Widget _buildPunishContend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (!Util.isStringEmpty(_data!.punishContend))
          Expanded(
            child: Text(
              _data!.punishContend,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12.0, fontWeight: FontWeight.w600),
            ),
          )
      ],
    );
  }

  Widget _renderActivityCenter(BuildContext context) {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: <InlineSpan>[
            WidgetSpan(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 150),
                child: Text(
                  _data!.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFFFFEF60), fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            TextSpan(text: _data!.desc, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildActivityEnd(BuildContext context) {
    return Container(
      width: 58,
      height: 29,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(R.imagePath('room_activity_msg_btn.png', package: ComponentManager.MANAGER_BASE_ROOM)), fit: BoxFit.fill),
      ),
      child: Text(
        _data!.btn,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }

  void reportExposure() async {
    Tracker.instance.track(TrackEvent.gift_floating_exposure, properties: {'from_uid': _data?.rid, 'rid': widget.room.realRid});
  }

  /// 拍卖关系升级
  Widget _buildAuctionUpgradeBody() {
    return Transform.scale(
      scale: Util.ratio,
      child: Container(
        width: 375,
        height: 80,
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            R.img(
              RoomAssets.chat_room$auction_global_room_msg_bg_webp,
              fit: BoxFit.fill,
              width: 375,
              height: 80,
            ),
            GestureDetector(
              onTap: () => _onItemClick(_data!.rid),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 44, end: 52),
                child: Row(
                  children: [
                    _buildCombineIcons(),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  _data!.toName,
                                  style: const TextStyle(
                                    color: Color(0xFFF9FF16),
                                    height: 1,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                K.room_with,
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  _data!.uName,
                                  style: const TextStyle(
                                    color: Color(0xFFF9FF16),
                                    height: 1,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '🎉🎉🎉${K.room_already_reached}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                                maxLines: 1,
                              ),
                              AuctionRelationTag(
                                name: _data!.defendTitle,
                                level: _data!.defendLevel,
                                width: 60,
                                height: 16,
                              ),
                              Text(
                                K.room_relationship_exclamation_mark,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCombineIcons() {
    Widget buildSingleIcon(String icon) {
      return GradientBorder(
        borderGradient: const LinearGradient(
          colors: [
            Color(0xFF9EC1FE),
            Color(0xFFF58CF9),
          ],
        ),
        borderWidth: 2,
        borderRadius: 20,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: CommonAvatar(
            path: icon,
            size: 36,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        PositionedDirectional(
          start: 0,
          child: buildSingleIcon(_data!.toIcon),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 30),
          child: buildSingleIcon(_data!.uIcon),
        ),
      ],
    );
  }

  /// 麦序房换挡公告
  Widget buildArtCenterChangeAnchor() {
    return Container(
      height: 28,
      width: Util.width - 24,
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 12),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: const LinearGradient(
          colors: [Color(0xFF8185FF), Color(0xFF81D8FF)],
        ),
      ),
      child: Row(
        children: [
          R.img(
            'ic_art_center_change_anchor.webp',
            width: 26,
            height: 20,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            _data!.artCenterChangeAnchor,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.2,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// 陪伴小屋解锁飘屏Center内容
  Widget _renderAccompanyHouseUnlockCenter(BuildContext context) {
    TextStyle textStyle = R.textStyle.regular12.copyWith(color: Colors.white);

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 26,
            child: MarqueeWidget(
              child: _buildMarqueeContent(),
            ),
          ),
          Row(
            children: [
              Text(
                '为 ',
                style: textStyle,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 60,
                ),
                child: Text(
                  _data!.toName,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Text(
                  ' ${_data!.desc}',
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 成就、活动飘屏
///
class _AchievementWidget extends StatelessWidget {
  final GlobalMessage data;

  const _AchievementWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 2),
        AvatarWidget(data.uIcon),
        const SizedBox(width: 2),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 26,
                child: MarqueeWidget(
                  ratioOfBlankToScreen: 100,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 2),
                      if (!Util.isStringEmpty(data.prefixTxt))
                        Text(
                          data.prefixTxt,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
                        ),
                      _buildUserInfo(data.uName, data.uTitle, data.uVip, data.uTitleNew),
                      if (!Util.isStringEmpty(data.frontTxt))
                        Text(
                          data.frontTxt,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
                        )
                      else if (data.isAchievement)
                        Text(
                          K.room_achievement_unlock_tip,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
                        ),
                      Text(
                        data.word,
                        maxLines: 1,
                        style: const TextStyle(color: Color(0xFFFFF056), fontSize: 14.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  if (data.rid > 0)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 3.0),
                      child: R.img(
                        "ic_little_room.svg",
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        width: 16,
                        height: 16,
                      ),
                    ),
                  if (!Util.isStringEmpty(data.rName))
                    Expanded(
                      child: Text(
                        data.rName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

/// 入场欢迎
class _EnterGreetWidget extends StatelessWidget {
  final GlobalMessage data;

  const _EnterGreetWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 2),
        AvatarWidget(data.uIcon),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 26,
                child: MarqueeWidget(
                  ratioOfBlankToScreen: 100,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 2),
                      Text(
                        K.room_year_god,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.prefixTxt,
                        maxLines: 1,
                        style: const TextStyle(color: Color(0xFFFFF056), fontSize: 14.0, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 2),
                      _buildUserInfo(data.uName, data.uTitle, data.uVip, data.uTitleNew),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    K.room_god_in,
                    style: const TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 2, end: 2.0),
                    child: R.img(
                      "ic_little_room.svg",
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      K.room_god_of_year_enter([(data.rName)]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final String url;
  final bool isAwake;
  final bool showGradient;
  final double size;
  final VoidCallback? onTap; // 点击事件回调

  const AvatarWidget(this.url, {super.key, this.isAwake = false, this.showGradient = true, this.size = 44, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: EdgeInsets.only(left: isAwake ? 40.dp : 0.dp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((size + 4) / 2),
        gradient: showGradient == false
            ? null
            : const LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color(0xFFA08AFF), Color(0xFF3EFFE2)],
              ),
      ),
      child: CommonAvatar(path: url, size: isAwake ? 38 : size, shape: BoxShape.circle, onTap: onTap),
    );
  }
}

Widget _buildUserInfo(String name, int title, int vip, int titleNew, {bool isAwake = false}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      UserNobilityWidget(
        titleNew: titleNew,
        height: 22.0,
        padding: const EdgeInsetsDirectional.only(end: 2.0),
      ),
      if (vip > 0)
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 2.0),
          child: UserVipWidget(vip: vip, height: 22),
        ),
      Text(
        name,
        maxLines: 1,
        style: TextStyle(
          color: isAwake ? const Color(0xFFFFE674) : Color(Utility.getGlobalRoomColor(vip)),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
