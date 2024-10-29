import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

///room相关常量
class RoomConstant {
  /// 声网正式环境的key
  static const String agoraAppId = 'TO_BE_REPLACED';

  static const String Event_Prefix = 'Action.';
  static const String Event_Pb_Prefix = 'Action.pb.';
  static const String Event_Refresh = 'room.refresh';
  static const String Event_Message = 'room.message';
  static const String Event_Online = 'room.online';
  static const String Event_Viewer = 'room.viewer'; // 房间观众人数
  static const String Event_Joined = 'room.joined';
  static const String Event_Wait_Changed = 'room.wait.changed';
  static const String Event_Admin_Wait_Changed = 'room.admin.wait.changed';
  static const String Event_Auction_Wait_Changed = 'room.auction.wait.changed';
  static const String Event_Mic_Wait_Queue_Changed = '${Event_Prefix}room.mic.queue.refresh'; //排麦队列刷新
  static const String Event_Join_Mic_Close = 'joinmic.close.notify'; //被抱上麦 需要闭麦
  static const String Event_Config_Error = 'room.config.error';
  static const String Event_Socket_Error = 'room.socket.error';
  static const String Event_Active = 'room.active';
  static const String Event_Quite_From_Boss = 'room.quite.from.boss';
  static const String Event_Game_End = 'room.game.end';
  static const String Event_Self_Valid_Desc = 'room.self.valid_desc'; //自己的有效发言事件
  static const String Event_Auction_End = 'room.auction.end'; // 拍卖厅-拍卖结果
  static const String Event_Ktv_Info = 'room.ktv.info'; // K歌房状态刷新
  static const String Event_Room_Dispose = 'room.dispose'; // 房间退出
  static const String Event_Room_Position_Change = 'room.position.change'; // 房间退出
  static const String EVENT_CPLINK_HAND_RESULT = "event.room.cplink.hand.result"; //连连看牵手成功
  static const String Event_Cplink_Relation_Refresh = "${Event_Prefix}cplink.relation.refresh"; // 需要刷新关系列表
  static const String EVENT_Value_Change_Refresh = "event.value.change.refresh";
  static const String EVENT_Large_Welcome = "event.received.large.welcome";
  static const String Event_Accompany_Change = 'room.accompany.change'; //陪伴房亲密度更新
  static const String Event_Close_Room = "room.receive.close"; // 用户收到关闭房间
  static const String Event_Room_Send_Mode = "room.msg.send.mode"; // 发送消息的间隔模式
  static const String Event_Cloud_Game_Quit_Queue = "cloud.game.quit.queue"; // 云游戏房退出排队队列
  // static const String Event_Show_Floating_Queue = "show.cloud.game.floating.queue"; // 云游戏房是否显示排队浮窗
  static const String Event_Cloud_Game_Duration_Warning = "${Event_Prefix}cloud.game.duration.warning"; // 云游戏房时长不足提醒
  static const String Event_Cloud_Game_Duration_Over = "${Event_Prefix}cloud.game.duration.over"; // 云游戏房时长用尽提醒
  static const String Event_Cloud_Game_Duration = "${Event_Prefix}cloud.game.current.duration"; // 云游戏剩余时长提醒
  static const String Event_Cloud_Game_Max_Warning = "${Event_Prefix}cloud.game.max.duration.warning"; // 云游戏一次最多可玩的时间即将到提醒
  static const String Event_Cloud_Game_Max_Over = "${Event_Prefix}cloud.game.max.duration.over"; // 云游戏一次最多可玩的时间到提醒
  static const String Event_Cloud_Game_Need_Verify = "${Event_Prefix}cloud.game.need.verify"; // 房主给玩家授权玩游戏且玩家没有实名认证时，给玩家的通知
  static const String EVENT_Cloud_Game_Want_Play = '${Event_Prefix}cloud.game.notify.wantplay'; // 其他玩家请求游戏控制权
  static const String Event_Update_Can_Scroll = "room.update.can.scroll"; // 更新能否滑动切房
  static const String Event_Public_Screen_Get_New_Msg = "room.public.screen.get.new.msg"; // 公屏收到新消息
  static const String EVENT_JOIN_FANS_GROUP_SUCCESS = 'room.join.fans.group.success'; // 加入粉丝团成功
  static const String EVENT_MIC_REFRESH = '${Event_Prefix}mic.refresh'; // 单独麦位刷新消息
  static const String EVENT_SHOW_ROOM_SCREEN_ANIMATION = 'room.show.screen.animation'; // 房间屏幕动画，例如：加入粉丝团成功，开通守护成功
  static const String Event_Intimate_Interact_Task_Tip = "${Event_Prefix}intimate.change.status"; // 亲密互动任务提醒
  static const String EVENT_Defend_User_Off_Mic = "${Event_Prefix}defend.user.off.mic"; //有守护关系用户下麦
  static const String EVENT_Defend_Join_Mic_Banner = "${Event_Prefix}defend.join.mic.banner"; //有守护关系用户双人上麦
  static const String EVENT_Defend_Enter_Room_Banner = "${Event_Prefix}defend.enter.room.banner"; //有守护关系用户双人进房
  static const String EVENT_Go_To_Private_Room = "${Event_Prefix}go.to.private.room"; //情感频道，牵手成功，前往小窝横幅
  /// 情感房牵手成功，前往小窝,复用VAP礼物播放方式
  static const String Event_Go_Private_Gift = '${Event_Prefix}go.private.gift';

  static const String Event_Room_Common_Switch = 'room.common.switch';

  /// 数字炸弹游戏信息同步
  static const String Event_Digit_Bomb_Sync = 'digit.bombing.sync'; // 数字炸弹游戏信息同步
  /// 我是倒霉蛋游戏信息同步
  static const String Event_Suicide_Gaming_Sync = 'suicide.gaming.sync'; // 我是倒霉蛋游戏信息同步
  // 本地房间惩罚刷新消息
  static const String Event_Local_Punish_Refresh = 'Local.room.punish.refresh';

  /// 房间开始抽奖
  static const String Event_Room_Lottery_Start = 'room.lottery.start';

  /// 房间抽奖开奖
  static const String Event_Room_Lottery_Draw = 'room.lottery.draw';

  /// 房间抽奖结束
  static const String Event_Room_Lottery_End = 'room.lottery.end';

  /// 房间抽奖倒计时中
  static const String Event_Room_Lottery_Count_Down = 'room.lottery.count.down';

  /// 房间抽奖一键参与
  static const String Event_Room_Lottery_One_Key_Join = 'room.lottery.one.key.join';

  /// 房间猜拳游戏邀请
  static const String Event_Room_Guess_Game_Invite = 'finger.guess.room.invite';

  /// 房间猜拳悬浮窗入口打开
  static const String Event_Room_Guess_Game_Enter_Show = 'finger.guess.room.enter.show';

  /// 房间猜拳悬浮窗入口关闭
  static const String Event_Room_Guess_Game_Enter_Disappear = 'finger.guess.room.enter.disappear';

  /// 房间猜拳结果socket
  static const String Event_Room_Guess_Game_PK_Result = 'finger.guess.pk.result';

  ///派对游戏房消息
  static const String Event_Party_Game_Switch = '${Event_Prefix}party.game.switch'; //派对房-切换游戏
  static const String Event_Wheel_Rotate = '${Event_Prefix}party.wheel.rotate'; //转盘大师-旋转开始
  static const String Event_Wheel_Despin = '${Event_Prefix}party.wheel.despin'; //转盘大师-旋转结束
  static const String Event_Wheel_Refresh = '${Event_Prefix}party.wheel.refresh'; //转盘大师-转盘数据刷新
  static const String Event_Angry_Refresh = '${Event_Prefix}party.uncle.refresh'; // 愤怒的大叔刷新
  static const String Event_Angry_Bomb = '${Event_Prefix}party.uncle.bomb'; // 愤怒的大叔-抽到雷
  static const String Event_Privity_Refresh = '${Event_Prefix}party.privity.refresh'; // 默契考验-数据刷新
  static const String Event_Privity_Next = '${Event_Prefix}party.privity.next'; // 默契考验-下一题消息
  static const String Event_Privity_Select = '${Event_Prefix}party.privity.select'; // 默契考验-选择答案

  static const String EVENT_Tour_Mic_Change = "room.tour.mic.change"; //观光团时候麦位变化
  static const String EVENT_Tour_List_Add = "${Event_Prefix}tour.list.add"; //观光团团长进入房间
  static const String EVENT_Tour_List_Remove = "${Event_Prefix}tour.list.remove"; //观光团团长离开房间
  static const String EVENT_Tour_List_Update = "${Event_Prefix}tour.list.update"; //观光团用户退团/入团
  static const String EVENT_Tour_Group_Change = "${Event_Prefix}tour.member.group_id"; //当前观光团变更

  static const String EVENT_Quick_Propose = '${Event_Prefix}quick.propose'; //房间内快速求婚

  /// 婚礼房消息
  static const String Event_Wedding_Refresh = '${Event_Prefix}wedding.refresh'; // 婚礼房状态刷新
  static const String Event_Wedding_Role = '${Event_Prefix}wedding.role'; // 婚礼房麦位更新
  static const String Event_Wedding_Confirm = '${Event_Prefix}wedding.confirm'; // 婚礼房下一阶段的消息
  static const String Event_Wedding_Combo_Gift = '${Event_Prefix}wedding.combo.gift'; // 婚礼房礼物连击
  static const String Event_Wedding_Combo_top = '${Event_Prefix}wedding.combo.top'; // 婚礼房榜三消息

  static const String Event_Room_Display_Input = 'room.display.input'; //调起房间公屏输入框

  /// 抢唱消息
  static const String Event_Grab_Mic_Refresh = '${Event_Prefix}grabmic.refresh'; // 抢唱房-刷新
  static const String Event_Grab_Mic_Make_Score = '${Event_Prefix}grab.mic.make.score'; // 抢唱房-打分消息
  static const String Event_Grab_Mic_Sync_V3 = '${Event_Prefix}grab.mic.sync.v3'; // 抢唱三期
  static const String Event_Grab_Mic_Light = '${Event_Prefix}grab.mic.light'; // 抢唱三期爆灯

  /// 你说我猜socket消息
  static const String Event_Speak_Guess_refresh = '${Event_Prefix}speakguess.refresh'; // 你说我猜socket刷新
  static const String Event_Speak_Guess_Mic_Refresh = '${Event_Prefix}speakguess.mic.refresh'; // 你说我猜麦位变化

  /// 1+1陪伴房消息
  static const String Event_Accompany_Refresh = '${Event_Prefix}room.accompany.refresh';
  static const String Event_Accompany_Mystery_Gift = '${Event_Prefix}accompany.mystery.gift'; // 陪伴房 神秘礼物

  /// 心动闯关
  static const String Event_Heart_Pass_Refresh = '${Event_Prefix}lucky.refresh.ui'; // 心动闯关UI刷新
  static const String Event_Heart_Pass_Close = '${Event_Prefix}lucky.close'; // 关闭心动闯关
  static const String Event_Heart_Pass_Success = '${Event_Prefix}lucky.break.success'; // 心动闯关成功

  /// ktv pk 模式
  static const String Event_Ktv_Pk_Rank_Change = '${Event_Prefix}ktv.pkrank.rank.change'; // 排名发生变换
  static const String Event_Ktv_Pk_Score_Change = '${Event_Prefix}ktv.pkrank.score.change'; // 星光值发生变化
  static const String Event_Ktv_Pk_Config_Change = 'event.ktv.pkrank.config.change'; // 配置数据发生变化

  /// 投票插件
  static const String Event_Vote_Refresh = '${Event_Prefix}plugin.vote.refresh'; // 投票插件刷新
  static const String Event_Vote_Start = '${Event_Prefix}plugin.vote.start'; // 投票插件初始数据

  ///房间任务领取状态消息
  static const String Event_Room_Duty_Refresh = 'room.duty.refresh';

  /// 房间贵宾等级升级
  static const String Event_Room_Visitant_Upgrade = 'vipcard.level.upgrade';

  /// 弹toast提示
  static const String Event_Trans_Room_Toast = 'trans.room.toast';

  /// 服务端强制loadConfig
  static const String Event_Trans_Room_Reload = 'trans.room.reload';

  /// 情感房牵手成功，前往小窝，动效+横幅
  static const String Event_Nest_Created_Notify = 'nest.created.notify';

  /// 情感房牵手成功，前往小窝，
  static const String Event_Nest_Private_Invite = 'nest.private.invite';

  /// 即将转播麦序房倒计时
  static const String Event_Trans_Room_Start_Ready = 'trans.room.start.ready';

  /// 即结束将转播麦序房倒计时
  static const String Event_Trans_Room_End_Ready = 'trans.room.end.ready';

  /// 蒙面互动，数据刷新
  static const String Event_Mom_Refresh = '${Event_Pb_Prefix}mom.refresh';

  /// 蒙面互动，有奖励，先展示动效，再结果公布弹窗
  static const String Event_Mom_Award = '${Event_Pb_Prefix}mom.award';

  /// 蒙面互动，无奖励，展示动效
  static const String Event_Mom_Result = '${Event_Pb_Prefix}mom.result';

  /// 公屏拉消息开关
  static const String Event_Pull_Msg_Result = '${Event_Pb_Prefix}Room.DanmuPullMode';

  /// 潜水玩法消息
  static const String Event_Wave_Sync = '${Event_Pb_Prefix}room.wave.sync';

  /// 心跳竞速，数据刷新
  static const String Event_Heart_Race_Refresh = '${Event_Pb_Prefix}heartrace.refresh';

  /// 心跳竞速：选择关系
  static const String Event_Heart_Race_Notice = '${Event_Pb_Prefix}heartrace.notice';

  /// 心跳竞速：第一名变动
  static const String Event_Heart_Race_Top_Change = '${Event_Prefix}heartrace.top.change';

  /// 连连看V2：进度
  static const String Event_CpLink_V2_Sync = '${Event_Pb_Prefix}cplink.v2.sync';

  /// 商业婚礼房，数据刷新
  static const String Event_Wedding_Business_Refresh = '${Event_Pb_Prefix}room.wedding.sync';

  /// 欢迎弹窗
  static const String Event_Welcome_Dialog = '${Event_Pb_Prefix}screen.message.welcomepopup';

  /// 欢迎定向消息
  static const String Event_Welcome_To_Me = 'Event_Welcome_To_Me';

  /// 房间插件，刷新消息
  static const String Event_Room_Plugins_Refresh = 'room.plugins';

  /// 房间通用toast
  static const String Event_Room_Simple_Toast = '${Event_Pb_Prefix}room.simple.toast';

  /// 保护座驾
  static const String Event_Room_Parking_Protect_Beg = '${Event_Pb_Prefix}room.parking.protect.beg.sync';

  /// 最佳座驾
  static const String Event_Room_Parking_Best_Lot = '${Event_Pb_Prefix}room.parking.best.lot.sync';

  /// 1v1陪伴房间：默契问答消息
  static const String Event_ACCOMPANY_TACIT = '${Event_Pb_Prefix}accompany.tacit';

  /// 电竞队友榜首挂件
  static const String Event_ET_Rank_Top = '${Event_Pb_Prefix}room.et.rank.top';

  /// 礼物猜猜乐
  static const String Event_Guess_Gift_Receiver = '${Event_Pb_Prefix}room.guess.gift.receiver';

  ///ktv合唱消息
  static const String Event_Ktv_chorus_Info = '${Event_Pb_Prefix}ktv.chorus.config';

  /// 禁言后收到的消息
  static const String Event_Room_User_Mute = 'room.user.mute';

  /// 点唱厅演唱歌手变化
  static const String Event_Juke_Music_Change = 'room.refresh.music.order';

  static const int Queue_Join = -1;
  static const int Queue_Display = -2;
  static const int Queue_Quite = -3;

  /// room/config接口版本号
  ///
  /// 33: 新增房间红包 34: 模拟厅老版用户不能进厅 35：增加数字炸弹 36:增加倒霉蛋游戏、抢唱房 37：付费陪聊
  /// 38: unity强更 39: 同桌游戏玩法 40: 进直播间粉丝 新老客户端兼容 41: 即构支持 42: 陪伴房真心话/你说我猜
  /// 43: 才艺厅
  /// 44: 夜店厅
  /// 45: 支持才艺厅
  /// 46: 即构多房间支持（夜店连大厅）
  /// 47: 剧本-小剧场
  /// 48: 心动闯关插件、你说我猜优化
  /// 49: 升级即构2.6.0,修复灰度问题,即构支持说猜和抢唱
  /// 50: 画猜接龙
  /// 51: 新版拍卖房
  /// 52: 网赚房(新秀，海选，演艺)
  /// 53: 明星空降大厅
  /// 54: KTV房间快捷鼓掌礼物（猫爪）支持金豆、修复即构停止拉流问题
  /// 55: 约战
  /// 56: 抢唱三期
  /// 57：鉴定师
  /// 58: 嫌疑人，直播PKV3
  /// 59：投票插件
  /// 60：一起听切TRTC
  /// 61：视频教程支持多个
  /// 62: 心动速配房
  /// 64: 电台守护坑位升级 打年兽
  /// 65: 生日房
  /// 66: laya游戏房
  /// 67: ame虚拟房间
  /// 68: 麦序房
  /// 69: 房间socket支持pb
  /// 70: 蒙面互动
  /// 71: pb格式问题&车队接口修改
  /// 72: 疯狂猜歌
  /// 75：房间公屏消息 oss拉取
  /// 76：抢麦房
  /// 77：连连看V2 && 开黑组队
  /// 78: avatarKtv
  /// 79：business-boss 多老板位房间
  /// 80：avatarKtv 即构歌库 && 盛夏之恋(表白换肤版)
  /// 81：全民领唱
  /// 82：1v1陪伴房-默契问答
  /// 83：laya塔防PK
  /// 85: ktv chorus
  /// 86: 大哥房（my_house_room）
  /// 87: zego
  /// 88: zego 升级
  /// 89：五麦房连线麦位（废弃）
  /// 90：五麦房连线麦位
  /// 91 ktv zego 音集协
  /// 92 房间钻石红包（5.12.0）
  /// 93 新增派单厅(订单房)
  static const int configVersion = 93;

  /// room/create接口版本号
  ///
  /// 5：即构支持
  /// 6：新老版本拍卖房隔离
  /// 7: 抢唱三期
  /// 8: 一起听支持服务端推流
  /// 9：连连看V2
  static const int createClientVersion = 9;

  /// room/new接口版本号
  ///
  /// 4：即构支持
  /// 5: 抢唱三期
  /// 6: 一起听支持服务端推流
  static const int roomNewVersion = 6;

  /// option/save接口版本号
  ///
  /// 17: 即构支持
  /// 18: 抢唱三期
  /// 19: 一起听支持服务端推流
  /// 20: ame虚拟房间
  static const int optionSaveVersion = 21;

  /// 2: 支持海马云游戏
  /// 3：云游戏首页tab改版&增加免时长专区
  /// 4：腾讯云sdk建立连接时机优化
  static const int cloudGameVersion = 4;

  /// room/new && room/create && room/config && option/save && match/match
  ///
  /// 参数room_version： 上述五个接口版本保持一致
  /// 1：AME虚拟房
  /// 2：avatar歌房，新老版本兼容
  /// 4：zego
  /// 5: 1+1陪伴支持zego
  /// 6: zego ktv v2
  static const roomVersion = 6;

  /// 音乐房消息
  static const String Event_Music_Room_Song_Ctrl = '${Event_Prefix}song.ctrl'; // 流程控制消息
  static const String Event_Music_Room_Theme_Refresh = '${Event_Prefix}listensong.theme.refresh'; // 主题变更消息
  static const String Event_Music_Room_Song_List_Refresh = '${Event_Prefix}song.list.refresh'; // 刷新播放列表
  static const String Event_Music_Room_Robot_Refresh = '${Event_Prefix}listen.music.robot.sync'; // 服务端机器人信息更新

  ///付费陪聊房消息
  static const String Event_End_Remain_Time = '${Event_Prefix}end.remain.time'; // 结束聊天
  static const String Event_Refresh_Remain_Time = '${Event_Prefix}refresh.remain.time'; // 剩余时间刷新房间和弹窗同步显示
  static const String Event_Send_End_Mic_Msg = '${Event_Prefix}Send.end.mic.msg'; // 发送结束公屏消息

  static const String Event_Room_RiskWheel_Create = '${Event_Prefix}risk.wheel.create'; // 转盘创建
  static const String Event_Room_RiskWheel_Start = '${Event_Prefix}risk.wheel.start'; // 转盘旋转开始
  static const String Event_Room_RiskWheel_Edit = '${Event_Prefix}risk.wheel.edit'; // 转盘编辑
  static const String Event_Room_RiskWheel_Stop = '${Event_Prefix}risk.wheel.stop'; // 转盘旋转结束
  static const String Event_Room_RiskWheel_Disappear = '${Event_Prefix}risk.wheel.screen.disappear'; // 转盘结果展示消失
  static const String Event_Room_RiskWheel_Close = '${Event_Prefix}risk.wheel.close'; // 转盘关闭

  static const String Event_Room_Award_Title = '${Event_Prefix}award.title'; // 房间麦上头像框冠名动效
  static const String Event_Room_Mic_Punish = '${RoomConstant.Event_Prefix}room.mic.effects'; //麦位惩罚
  static const String Event_Room_Hat_Refresh = '${RoomConstant.Event_Prefix}room.hat.refresh'; // 抢帽子玩法刷新
  static const String Event_Room_Grab_Hat = '${RoomConstant.Event_Prefix}room.grab.hat'; // 抢帽子 新！

  /// 直播PK
  static const String LIVE_PK_EVENT = 'room.live.pk';
  static const String LIVE_PK_V2_SYNC_EVENT = '${Event_Prefix}live.pk.v2.sync';

  /// 直播PK 再来一局
  static const String LIVE_PK_ONEMORE_NOTIFY = '${Event_Prefix}live.pk.onemore.notify';

  /// 才艺直播厅消息
  /// 更换主播
  static const String Event_Room_Content_Programe = '${Event_Prefix}broadcaster.content.program';

  /// 达到停留时长，奖励星光值
  static const String Event_Room_Talent_Star_Get = '${Event_Prefix}broadcaster.star.get';

  /// 赠送星光值
  static const String Event_Room_Combo_Gift = '${Event_Prefix}broadcaster.content.star.combo.gift';

  /// 刷新星光值
  static const String Event_Room_Star_Refresh = '${Event_Prefix}broadcaster.content.star.refresh';

  /// 刷新夜店大厅表情tips
  static const String Event_Pub_Emote_Refresh = '${Event_Prefix}pub.emote.refresh';

  ///商业房接待位信息变化需要刷新自己与新接待的关系
  static const String Event_Reception_Follow_Refresh = '${Event_Prefix}reception.follow.refresh';

  /// 房间全屏动效，复用礼物播放方式
  static const String Event_Room_FullScreen_Effect = '${Event_Prefix}room.fullscreen.effect';

  static const String Event_Hot_Num_Add = '${Event_Prefix}room.hot.num.add'; // 房间热度增加
  ///显示麦位连线
  static const String EVENT_Show_Mic_Line = '${Event_Prefix}room.show.mic.line';

  /// 礼物心愿发生变化
  static const String Event_Refresh_Gift_Wish = '${Event_Prefix}room.gift.wish.refresh';

  /// 画猜接龙，数据发生变化(op)
  static const String Event_Refresh_GUESS_QUEUE = 'event.room.refresh.guess.queue';

  /// 画猜接龙，数据发生变化(RoomConfig)
  static const String EVENT_REFRESH_GUESS_QUEUE_CONFIG = 'event.room.refresh.guess.queue.config';

  /// 麦位数据发生变化
  static const String EVENT_REFRESH_MIC_LIST = 'event.room.refresh.mic.list';

  /// 限时礼包
  static const String Event_Room_Limit_Package = 'event.room.limit.package';

  /// AME下载进度更新
  static const String Event_AME_Music_Download = 'event.AME.music.download';

  /// 成就解锁弹窗
  static const String Event_Room_Achievement_Unlock = 'event.room.achievement.unlock';

  /// 福袋刷新
  static const String Event_Room_Lucky_bag_refresh = 'room.refresh.luckybag';

  /// 心动速配，新的一轮开始
  static const String EVENT_CP_HEART_NEW_TURN = 'event.cp.heart.new.turn';

  /// 剧本房版本号
  static const int boardGameConfigVersion = 2;

  /// 房间热度权益使用
  static const String Event_Room_Noble_Add_Hot = 'room.noble.add.hot';

  /// 房间底部输入框点击后发送消息
  static const String Event_Bottom_Send_Message = 'room.bottom.send.message';

  /// AGORA下载进度更新
  static const String Event_AGORA_Music_Download = 'event.AGORA.music.download';

  /// AGORA 获取歌词
  static const String Event_AGORA_Music_Lyric = 'event.AGORA.music.lyric';

  /// 网关协议切房
  /// 1 : laya切ktv支持ktv_source_type
  static const int Update_Room_RPC_Extend_Version = 1;

  /// 房间包厢消息
  static const String Event_Room_Cubicle_Message = '${RoomConstant.Event_Pb_Prefix}mate.cubicle.msg';

  /// 房间公屏Tab数据刷新
  static const String Event_Message_Tab_Change = 'room.message.tab.change';

  /// 进房引导数据更新
  static const String Event_Invite_Guide_Change = 'room.invite.guide.change';

  /// 房间红包消息
  static const String Event_Message_Red_Packet = 'room.message.red.packet';
}

/// UI 局部消息
class UIRefresh {
  static const String UI_Prefix = 'ui.';

  /// 房间插件，刷新消息
  static const String UI_Room_Plugins_Refresh = '${UI_Prefix}room.plugins';
}

const ImageVersion = 7;

final TextStyle messageTextStyle = TextStyle(
  color: Colors.white.withOpacity(0.6),
  fontSize: 13,
  inherit: true,
  fontFamily: Util.fontFamily,
);

const List<String> themeSwitchBackground = [
  'normal',
  'friend',
  'joy',
  'king',
  'lol',
  'music',
  'radio',
  'water',
  'pk',
  'order',
];

///显示麦下用户列表的个人房，房间类型
const Set<String> showOffMicUserList = {
  "friends", // 处对象,交友
  "chook", // 吃鸡
  "king", // 王者
  "game", // 游戏
  "chat", // 聊天
  "music", //个人房9麦音乐
  "pia", //9麦Pia戏,配合property
  "friend", //个人房交友
};

/// RoomTypes扩展
extension RoomTypesExt on RoomTypes {
  String toTypesString() {
    switch (this) {
      case RoomTypes.Normal:
        return 'normal';
      case RoomTypes.Radio:
        return 'radio';
      case RoomTypes.RadioDefend:
        return 'radio-defend';
      case RoomTypes.Order:
        return 'order';
      case RoomTypes.Auto:
        return 'auto';
      case RoomTypes.Joy:
        return 'joy';
      case RoomTypes.Cp:
        return 'cp';
      case RoomTypes.CpLove:
        return 'cp-love';
      case RoomTypes.Live:
        return 'live';
      case RoomTypes.Auction:
        return 'auction';
      case RoomTypes.Private:
        return 'private';
      case RoomTypes.CpLink:
        return 'cplink';
      case RoomTypes.Accompany:
        return 'accompany';
      case RoomTypes.PartyGame:
        return 'party-game';
      case RoomTypes.Wedding:
        return 'wedding';
      default:
        return describeEnum(this).toLowerCase();
    }
  }
}

/////房间类型相关enum
enum RoomMode {
  /// 自由上麦
  Auto,
  Lock,
}

/// 房间频道
enum RoomTypes {
  Normal,
  Radio,
  RadioDefend,
  Order, // 点单厅
  Auto,
  Joy,
  Cp,
  CpLove,
  Live,
  Auction,
  Private,
  CpLink, //心动连连看
  Accompany, //1对1陪伴房
  PartyGame, //派对游戏
  Wedding, // 婚礼房
  TheOne, //非诚勿扰
}

/// 房间类型唯一标识
enum RoomFactoryType {
  Normal,
  Accompany, //普通陪伴房
  BusinessPayVoice, //付费聊天
  Grabmic, // 抢唱房
  SpeakGuess, // 说猜
  BusinessContent, //直播才艺厅
  BusinessRadio, //电台守护
  GuessQueue, //画猜接龙
  BusinessMusic, //  点唱厅
  BusinessMusic8, //  点唱厅 8麦
  BusinessHeart, // 心动速配
  BusinessExpand, // 扩列
  BusinessBirthday, // 生日房
  BusinessArtcenter, // 麦序房
  BusinessNormal5, // 5麦房
  GuessSong, // 疯狂猜歌
  BusinessHeartrace, // 心跳竞速
  CpLinkV2, //心动连连看V2
  BusinessWedding, // 商业婚礼房
  BusinessCelebration, // 庆典房
  debate, // 情侣PK
  brother, // 大哥房
  businessSoundchat, // 直播
  businessConnectorBar, // 麦位连线
  dating, //约会吧
  BusinessBill, // 派单厅
  BusinessNormal8, //标准8麦
}

///房间模板标识，多个[RoomFactoryType]可能会对应同一个[RoomModuleType]
enum RoomModuleType {
  normal, //默认模板
  @Deprecated('not used')
  tableGame, //同桌游戏房
}

enum RoomProperty {
  Business,
  Vip,
  Fleet,
  @Deprecated('not used')
  Private, //现在大部分个人房是vip 不能只用这个判断
  Game,
  Meeting, // 婚礼房
  virtual, //模拟厅
  Nest, // 情感小窝
  Singer, // 歌友会房间
}

enum MessageType {
  Message,
  Notify, //系统欢迎
  System,
  Package, //有红包消息
  Box, //开箱子
  Local, //本地组装消息到公屏
  CloseNotify, //关闭房间消息通知
  Guess, // 画猜房
  Wolf, //狼人杀消息类型
  Match, //征召消息
  Piece, //集字符合成礼物消息
  AvatarGift, //头像礼物
  GiftMedia, //礼物图片、视频图片消息
  RedPackage, //房间红包消息
  VehicleTeam, // 创建免费车队公屏消息
  VehicleFeeTeam, // 创建付费车队公屏消息
  SendGift, //赠送礼物给房主or接待
  SendDecorate, // 赠送装扮公屏消息
  Puzzle, //海龟汤公屏消息
  PushRoom, //推送房间
  endOnMic, //付费陪伴连麦结束消息
  RiskWheel, //大冒险转盘
  AccompanyTruth, //陪伴房真心话消息
  Hit, //礼物连击消息 不包括结束消息
  DiceShow, // 骰子游戏开牌结果
  KnightExpire, //直播守护到期提醒
  AccompanyTacit, //1v1陪伴房：默契问答消息
  CpLink, //关系卡片
  CplinkMsg, //关系卡片文本消息
  CommonNotify, // 普通通知消息, 文本列表 支持配置文本颜色
  ZodiacMsg, //星座拍拍文本消息
  Unknown, // 未知类型
}

enum TopLiveStatus {
  Background, //处于后台，没有UI
  Top, //处于前台，可见
  Dispose, //已经销毁
}

enum CpLoveState {
  None,
  Wait, //等待上麦
  Reward, //刷钱，表白
  Switch, //选择对象
  Result, //揭晓
}

enum Games {
  None,
  Under, //谁是卧底
  Guess, // 你画我猜
  Wolf, //狼人杀
  Ludo, // 飞行棋
  Carrom, // 撞球
  Billiards, // 桌球/台球
}

/// 房间用户身份
enum Purview {
  /// 房主
  Createor,

  /// 接待管理
  SuperAdmin,

  /// 普通管理
  Admin,

  /// 普通用户
  Normal,
}

enum UserIconStyle {
  Big,
  Middle,
  Normal,
  Small, // 你画我猜/K歌
  Wolf, //狼人杀
  Live, // 直播间
  Captain, // 车队长
  VehicleMember, // 车队普通成员
  OffMic, //麦下用户列表
  TourGroup, // 观光团
  GroupPK, //分组Pk
  PubHomeDJ, //夜店大厅DJ位
  GuessQueue, // 画猜接龙
  SuperVoice, // 网赚厅
  Encounter, // 邂逅
}

enum DisplayGiftType {
  /// 传统礼物，lottie实现,LottieSubType决定是否为全屏
  Lottie,

  /// 全屏礼物，VAP
  Vap,

  /// 全屏礼物，webp动图实现
  Webp,

  /// 全屏礼物，unity
  @Deprecated('not used')
  Unity,

  /// Rive礼物，支持设状态
  Rive,
}

enum DisplayItemGiftStatus {
  Wait,
  In,
  Ani,
  Out_Ani,
  Out,
  Magic,
}

/// Lottie礼物的子类型
enum LottieSubType {
  /// lottie版本，非全屏，显示大小受displayNormalGiftRatio系数约束
  Small,

  /// lottie版本，全屏显示
  Big,
}

/// 房间玩法入口标签状态
enum GameListLabelStatus {
  /// 隐藏，所有人都不可见
  Disable,

  /// 所有人都可见
  All,

  /// 只有房主和接待可见
  OnlyAdmin,
}

/// 权限:后台可以给某些用户开一些特殊的权限：设置/取消管理的权限
const int AdminWriteOperation = 0x00000001;
