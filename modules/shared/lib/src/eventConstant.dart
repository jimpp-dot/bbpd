///events事件对应的常量汇总
class EventConstant {
  EventConstant._();

  static const String EventLogin = 'event.login'; //登陆事件
  static const String EventLogout = 'event.logout'; //登出事件
  static const String EventRegister = 'event.register'; //注册事件

  static const String EventLoginBeforeBoot = 'event.login.before.boot'; //前置登录事件

  static const String EventCancelLogin = 'event.cancel.login'; //取消登陆事件

  static const String ShowNewUserPackage = 'Show.New.User.Package'; // 新用户注册礼包

  static const String ShowNewUserPackageResult = 'Show.New.User.Package.Result'; // 新用户注册礼包，用户关闭弹窗，1:进入房间, 0:未进入

  static const String FootMarkChange = 'FootMark.Change'; //足迹变化

  static const String SessionChange = 'Session.Changed'; //session变化

  static const String WebsocketEventMessage = 'Websocket.Event.Message'; // ws消息

  static const String EventOpenSchemeUrl = 'event.open.schemeurl';

  static const String testSign = 'banban';

  static const String BrightnessEvent = 'brightness'; //brightness变化

  static const String SystemAppLifecycleState = "System.AppLifecycleState";

  static const String ShowPerformanceOverlay = "showPerformanceOverlay"; //

  static const String ChangeLan = 'event.change.lan'; //切换语言

  static const String FollowUid = 'event.follow.uid'; // 各页面关注通知

  static const String EventRoomInviteFriend = 'event.room.invite.friend'; //点击分享或邀请通知

  static const String EventCertifyChange = 'evnet.certify.chsnge'; // 防作弊认证成功通知

  static const String UpdateBottomSheet = 'event.update.bottomsheet';

  static const String roomChangeRid = 'event.room.change.rid'; //room根据rid做切换

  static const String EventRoomWolfTestPass = 'event.room.wolf.test.pass'; //狼人杀测试通过

  static const String EventWolfDialogClose = 'event.wolf.base.dialog.close'; //狼人杀房间关闭弹框

  static const String EventCaseMomentSubmitPass = 'event.case.moment.submit.pass'; //发表推理成功

  static const String EventUserMoneyChange = 'event.user.money.change'; //用户钱财有变化；充值成功/下单成功等

  static const String EventTopLiveClick = 'event.top.live.click'; //点击房间悬浮窗，进房间事件

  static const String EventNeedLogin = 'System.Need.Login'; //打开登录界面

  static const String RoomOptionsRefresh = 'event.room.options.refresh'; //房间设置面板选项发生变化

  static const String EventConnectivityChanged = 'event.connectivity.changed'; //设备网络连接状态变化

  static const String EventWelfareReplace = 'event.welfare.replace'; // 福利补领

  static const String EventLoveLetterSendSuccess = 'event.loveletter.send.success'; //情书发送成功

  static const String EventMarryDataChanged = 'event.marry.data.changed'; //结婚相关数据有变化

  static const String EventMarryReleaseRelationship = 'event.marry.release.relationship'; //结婚关系解除

  static const String EventPageChanged = 'event.page.changed'; //页面切换

  static const String EventLocationUpdated = 'event.location.update'; // 定位更新

  static const String EventRecommendRoom = 'event.recommend.room'; // 新厅流量推荐推荐

  static const String ShowNewUserGuide = 'Show.New.User.guide'; // 新手引导 //目前只killer使用

  static const String EventJoinFansGroupChanged = "event.join.fans.group.changed";

  /// 加入/退出粉丝团状态变化

  static const String UserFollow = "User.Follow"; // 用户关注事件改变

  static const String EventCurrentHeaderFrameChanged = "event.current.header.frame.changed"; // 当前穿戴的头像框变化

  static const String EventPersonalInfoInit = "event.personal.info.init"; // 初始化用户个人信息事件

  static const String EventQuickReply = "event.chat.quick.reply";

  /// chat中快速回复功能相关事件
  static const String EventOpenUnionBox = "event.vip.open.union.box";

  /// 打开宝箱

  static const String EventClickRoomMoreMenu = 'room.event.click.more.menu'; // 点击房间的右下角更多按钮

  static const String EventRouteChanged = 'event.route.changed';

  /// 页面切换
  static const String EventIapRecharge = 'event.iap.recharge';

  /// 内购充值
  static const String EventBeanExchange = 'event.bean.exchange';

  /// 兑换金豆
  static const String EventRoomCombo = 'event.room.combo';
  static const String EventRoomWelcome = 'event.room.welcome';

  static const String EventPubTimeIntervalChanged = 'room.pub.time.interval.changed'; // 夜店发送消息时间间隔（随vip等级升高而缩短）

  static const String EventGuessQueueWordDialogClose = 'room.guess.queue.word.dialog.close'; // 画猜接龙猜词弹框后未输入答案超时状态切换后关掉弹框
  static const String EventGuessQueueResultPageClose = 'room.guess.queue.result.page.close'; // 画猜接龙猜词结果排行榜在状态切换后关掉
  static const String EventGuessQueueEnd = 'room.guess.queue.end'; // 画猜接龙1号麦结束游戏
  static const String EventGuessQueueStart = 'room.guess.queue.start'; // 画猜接龙1号麦开始游戏

  static const String EventHomePageJumpToCurrentTab = 'HomePage.JumpToCurrentTab'; //跳转到房间指定tab
  static const String EventAppAnim = 'event.app.anim';

  static const String BagItemNumChanged = 'bag.item.num.changed';

  static const String EventAppSyncConfigSucc = 'app.sync.config.succ';

  static const String OnlineEarnCompleteDailyDuty = 'onlineearn.complete.daily.duty'; //网赚每日任务完成提醒

  static const String EventUserYearBeastKo = 'user.year.beast.ko'; // 打年兽ko
  static const String EventShowYearBeastWick = 'show.year.beast.wick'; // 年兽眩晕
  static const String EventKnightGroupExpire = 'knight.group.expire'; // 直播间守护到期提醒
  static const String EventSmallAccountUpdate = 'small.account.update'; // 小号列表变化
  static const String EventSmallAccountPull = 'small.account.pull'; // 小号拉取消息

  /// 自己主页下陪伴小屋下子Tab切换
  static const String EventAccompanyHouseBuilderTabDidChange = 'event.personal.home.accompany.house.builder.tab.change'; // 小号拉取消息

  /// 从消息页切换账号
  static const String EventSwitchAccount = 'event.switch.account';

  /// 修改头像之后，底部刷新
  static const String EventHomeFeedMeRefresh = 'EventHomeFeedMeRefresh';
  static const String EventAchieveWallDataChanged = 'event.achieve.wall.data.changed'; // 成就墙相关数据有变化
  static const String EventCpHouseDataChanged = 'event.cp_house_data_changed';
  static const String EventProfileBadgeDataChanged = 'event.profile.badge.data.changed';

  /// 充值返利弹窗消息
  static const String EventChargeBenefitNotice = 'charge.benefit.notice';

  /// 礼物面板数据（ResBbGiftPanel）刷新
  static const String EventGiftPanelDataDidRefreshNotice = 'gift.giftPanelData.notice';

  /// 打开房间活动Banner面板
  static const String EventOpenRoomBannerPanel = 'open.room.banner.panel';

  /// 主页变灰变化刷新
  static const String EventHomeGreyChange = 'home.grey.change';

  /// 主页底Tab发生变化
  static const String EventHomeTabChange = 'home.tab.change';

  /// 收到h5传递数据
  static const String EventReceiveH5Message = 'receive.h5.message';

  /// 发送给h5数据
  static const String EventSendH5Message = 'send.h5.message';

  static const String EventNavigatorPageRemove = 'navigator.page.remove';

  ///双十一，贵族，惺惺相惜活动购买成功
  static const String EventActivityBuySuccess = 'activity.buy.success';

  ///双十一，贵族，惺惺相惜弹出后刷新数据
  static const String EventActivityDataUpdate = 'activity.data.update';

  /// 图鉴系列切换
  static const String EventHandBookSwitch = 'event.handbook.series.switch';

  /// 全服喇叭
  static const String EventGlobalHorn = 'event.global.horn';

  /// 表情支付成功
  static const String EventEmojiPaySucess = 'event.emoji.pay_sucess';

  /// 通过IM透传H5消息
  static const String EventSyncToWebMessage = 'sync.to.web.message';

  ///成就墙皮肤预览
  static const String EventAchieveSkinChange = 'event.achieve.skin.change';

  ///VIP升级
  static const String EventVipLevelUp = 'event.im.vip.levelup'; // IM VIP升级

  /// 刷新等级信息
  static const String EventRefreshLevelInfo = 'event.refresh.level';

  /// 限时充值弹窗充值成功
  static const String EventRechargeActivitySuccess = 'event.recharge.activity.success';

  /// 限时充值弹窗关闭
  static const String EventRechargeActivityClose = 'event.recharge.activity.close';

  /// 显示生日小精灵
  static const String EventShowBirthdaySprite = 'event.show.birthday.sprite';

  /// 麦位发生变化
  static const String EventMicStatusChanged = 'event.mic.status.changed';

  /// 背包商品item
  static const String EventBagItemChanged = 'event.bag.item.changed';

  /// shop商品item
  static const String EventShopGoodItemChanged = 'event.shop.good.item.changed';

  /// 自己麦位音量变化
  static const String EventOnSelfVolumeChanged = 'event.self.volume.changed';
}
