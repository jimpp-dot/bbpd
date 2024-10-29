/// 上报事件类型
/// 建议页面浏览事件以"view"开头，不得随意新增事件，新增必须知会产品、数据，且有文档记录
class TrackEvent {
  // 事件的名称，需要以字母开头，可以包括数字、字母及“_”，最大为50个字符
  final String name;

  const TrackEvent(this.name);

  const TrackEvent._(this.name);

  // -------------------- 登录注册 --------------------

  // 登录
  static const login = TrackEvent._('login');

  // 登出
  static const logout = TrackEvent._('logout');

  // 注册（完善资料）
  // properties:
  //    step: 区分是注册的哪一步
  //        entrance   注册的第一步，头像昵称页面
  //        gender     注册第二步 选择性别
  //        birthday   注册第三步 输入生日
  //        interest   注册第四步  选择兴趣爱好
  //        finish     注册完成
  static const register = TrackEvent._('register');

  // 注册(头像昵称页面)上点击下一步事件
  static const registerEntranceNextClick =
      TrackEvent._('register_entrance_next_click');

  // 注册(性别生日)上点击下一步事件
  static const registerGenderNextClick =
      TrackEvent._('register_gender_next_click');

  //注册性别或生日跳过
  static const registerGenderSkip = TrackEvent._('register_gender_skip');

  //性别生日补填
  static const genderFillPop = TrackEvent._('gender_fill_pop');

  //第三方登录后弹页面绑定手机号成功
  static const mobileBind = TrackEvent._('mobile_binded');

  //第三方登录后弹页面绑定手机号页面展示
  static const mobileBindEntrance = TrackEvent._('mobile_binded_entrance');

  //第三方登录后弹页面绑定手机号页面点击跳过按钮
  static const mobileBindSkip = TrackEvent._('mobile_binded_skip');

  //第三方登录后弹页面绑定手机号页面点击绑定
  static const mobileBindConfirm = TrackEvent._('mobile_binded_confirm');

  //权限弹窗弹出
  static const permissionPopup = TrackEvent._('permission_popup');

  //权限弹窗点击
  static const permissionPopupClick = TrackEvent._('permission_popup_click');

  //隐私协议弹窗弹出
  static const privacyAgreementPopup = TrackEvent._('privacy_agreement_popup');

  //隐私协议弹窗点击
  static const privacyAgreementPopupClick =
      TrackEvent._('privacy_agreement_popup_click');

  //进入登录页
  static const loginPageView = TrackEvent._('login_page_view');

  //获取验证码
  static const getVerificationCode = TrackEvent._('get_verification_code');

  //安全手机号绑定弹窗弹出
  static const safePopup = TrackEvent._('safe_popup');

  //安全手机号弹窗绑定成功
  static const safePopupBinded = TrackEvent._('safe_popup_binded');

  // -------------------- 下单 --------------------

  // 陪陪卡片浏览
  static const view_ppcard = TrackEvent._('view_ppcard');

  // 浏览技能页面
  static const view_skill_page = TrackEvent._('view_skill_page');

  // 浏览邀约页面
  static const view_order_page = TrackEvent._('view_order_page');

  // 立即邀约，点击下单按钮触发
  static const order_now = TrackEvent._('order_now');

  // 完成下单，支付成功触发
  static const order_success = TrackEvent._('order_success');

  // 取消下单
  static const order_cancel = TrackEvent._('order_cancel');

  // -------------------- 互动行为 --------------------

  // 关注
  static const follow = TrackEvent._('follow');

  // 聊天
  static const chat = TrackEvent._('chat');

  // 叮咚消息
  static const dingdong = TrackEvent._('dingdong');

  // 进入聊天主页
  static const view_chat_page = TrackEvent._('view_chat_page');

  // 浏览个人主页
  static const view_user_homepage = TrackEvent._('view_user_homepage');

  // 首页点击
  static const homepage = TrackEvent._('homepage');

  // 私聊页面快捷送金币礼物
  static const quickly_send_gift = TrackEvent._('quickly_send_gift');

  // 送礼物成功触发
  static const send_gift = TrackEvent._('send_gift');

  // 发送动态
  static const send_moment = TrackEvent._('send_moment');

  // 发送评论
  static const comment = TrackEvent._('comment');

  // 点赞
  static const like = TrackEvent._('like');

  // 交友卡页面填写
  static const write_dating_card = TrackEvent._('write_dating_card');

  // 交友卡填写成功
  static const wrote_dating_card = TrackEvent._('wrote_dating_card');

  // 冲鸭上传游戏卡
  static const wrote_game_card = TrackEvent._('wrote_game_card');

  // 信息流曝光
  static const view_flow = TrackEvent._('view_flow');

  // 信息流点击
  static const click_flow = TrackEvent._('click_flow');

  // 信息流媒体播放时长
  static const flow_media_time = TrackEvent._('flow_media_time');

  // -------------------- 游戏匹配 --------------------

  // 匹配，点击匹配时触发
  static const game_match = TrackEvent._('game_match');

  // 匹配成功
  static const game_match_success = TrackEvent._('game_match_success');

  // 冲鸭开黑匹配开始
  static const game_match_start = TrackEvent._('game_match_start');

  // 冲鸭开黑匹配结束
  static const game_match_end = TrackEvent._('game_match_end');

  // 冲鸭约玩开始
  static const hang_up_start = TrackEvent._('hang_up_start');

  // 冲鸭约玩结束
  static const hang_up_end = TrackEvent._('hang_up_end');

  // 冲鸭约玩push
  static const hang_up_push = TrackEvent._('hang_up_push');

  // 冲鸭约玩邀请弹窗
  static const hang_up_invite = TrackEvent._('hang_up_invite');

  // 冲鸭约玩弹窗
  static const play_invite = TrackEvent._('datewindow');

  // 开黑列表页
  static const game_userlist = TrackEvent._('game_userlist');

  //////////冲鸭1.0.3.0数据上报
  // 弹窗出现
  static const pop_show = TrackEvent._('pop_show');

  // 弹窗点击
  static const click_in_pop = TrackEvent._('click_in_pop');

  // 弹窗关闭
  static const pop_close = TrackEvent._('pop_close');

  // 快速开黑页点击
  static const game_match_click = TrackEvent._('game_match_click');

  // 开启约玩按钮出现
  static const enable_game_play_show = TrackEvent._('enable_game_play_show');

  // 开启约玩
  static const enable_game_play_click = TrackEvent._('enable_game_play_click');

  // 取消约玩
  static const game_play_cancel = TrackEvent._('game_play_cancel');

  // 私信页展示
  static const chat_view = TrackEvent._('chat_view');

  // 聊天匹配展现页
  static const chat_match_page_show = TrackEvent._('chat_match_page_show');

  // 聊天匹配页点击汇总
  static const click_in_chat_match_page =
      TrackEvent._('click_in_chat_match_page');

  // 聊天匹配页滑动操作
  static const slide_in_chat_match_page =
      TrackEvent._('slide_in_chat_match_page');

  // 交友卡页面展现
  static const enter_dating_card = TrackEvent._('enter_dating_card');

  // 私信页交友卡填写提示
  static const msg_dating_card_notice = TrackEvent._('msg_dating_card_notice');

  // 创建交友卡点击
  static const create_dating_card_click =
      TrackEvent._('create_dating_card_click');

  // -------------------- 房间 --------------------

  // 进房
  static const enter_room = TrackEvent._('enter_room');

  // 退出房间
  static const exit_room = TrackEvent._('exit_room');

  // 切换房间
  static const switch_room = TrackEvent._('switch_room');

  // 房间发消息
  static const room_message = TrackEvent._('room_message');

  /// 征召
  /// 发起征召时上报
  /// rid	房间id
  /// room_type	房间类型
  /// game_type	如果room_type=wolf, 上报
  static const room_invite = TrackEvent._('room_invite');

  // 房间上麦
  static const room_onmic = TrackEvent._('room_onmic');

  /// 上麦
  /// 成功上麦时上报
  /// rid	房间id
  /// time	时间戳
  /// room_type	房间类型
  /// game_type	如果room_type=wolf, 上报
  static const on_mic = TrackEvent._('on_mic');

  /// 房间内点击
  /// 房间内点击时上报
  /// share	分享
  /// profile	头像
  static const room_click = TrackEvent._('room_click');

  /// 充值成功
  /// 充值成功时上报
  /// dateline	充值时间
  /// p_t	支付方式: wechat=微信 ali=zhi++++fu++++bao iap=apple_pay
  /// recharge_money	充值金额（分）
  /// uid	用户id
  /// refer	上级页面: homepage=首页 gift=送礼 snap=抢身份 shop=商城 coin=金币兑换 title=贵族充值
  static const recharge_success = TrackEvent._('recharge_success');

  /// 浏览充值页面
  /// 进入充值页面时
  /// refer	上级页面: homepage=首页 gift=送礼 snap=抢身份 shop=商城 coin=金币兑换 title=贵族充值
  static const view_recharge_page = TrackEvent._('view_recharge_page');

  /// 点击房间搜索
  static const room_search_click = TrackEvent._('room_search_click');

  /// 点击房间搜索出来的房间
  /// index	点击位置
  static const recall_click = TrackEvent._('recall_click');

  /// 浏览商城页
  /// 进入浏览商城页，遍历每种道具跟券，每种都上报一次
  /// bp_item/bp_coupon: 道具用前面的key，券用后面的，值为道具或券的id
  /// num: 道具或券的个数
  static const view_shop_page = TrackEvent._('view_shop_page');

  static const report = TrackEvent._('report');

  // 房间氛围使用
  static const room_atmosphere_used = TrackEvent._('room_atmosphere_used');

  // -------------------- 点击事件 --------------------

  // properties:
  //    click_page: 点击进入到哪新页面
  static const click = TrackEvent._('click');

  // 新点击事件
  //    page: 点击进入到哪新页面
  static const new_conversion_click = TrackEvent._('new_conversion_click');

  // 首页点击
  static const firstpage_click = TrackEvent._('firstpage_click');

  // 首页浏览
  static const firstpage_view = TrackEvent._('firstpage_view');

  // 发现页点击
  static const discover_click = TrackEvent._('discover_click');

  // 发现页浏览
  static const discover_view = TrackEvent._('discover_view');

  // 底部tab点击
  static const guide_click = TrackEvent._('guide_click');

  // 我的页面点击
  static const mine_page = TrackEvent._('mine_page');

  // 背包页面点击
  static const backpack_page = TrackEvent._('backpack_page');

  // PK点击
  static const pk_entry_click = TrackEvent._('pk_entry_click');

  // 福袋点击
  static const luckybag_entry_click = TrackEvent._('luckybag_entry_click');

  // 点击活跃等级跳转按钮
  static const activity_level_click_mission =
      TrackEvent._('activity_level_click_mission');
  // -------------------- 凶手相关事件 --------------------
  /// 新用户分级
  /// 新用户注册后选择自己是萌新 or 老司机
  /// is_new 是否萌新 布尔
  static const new_grade = TrackEvent._('new_grade');

  /// banner曝光
  /// adid 广告id string
  /// position banner位置 String，区分直播/活动/房间
  static const banner_expose = TrackEvent._('banner_expose');

  /// banner点击
  /// adid 广告id string
  /// position banner位置 String
  static const banner_click = TrackEvent._('banner_click');

  /// 首页展示
  /// 用户从首页切至其他页面，或离开app时上报（即一次可见生命周期结束时上报）
  /// dur	事件时长,单位s
  static const juben_home_pv = TrackEvent._('juben_home_pv');

  /// socket推陪陪房间
  /// 客户端收到新用户厅推荐消息展示时上报
  /// rid 房间ID 数值
  /// type 推送原因 string
  /// room_type 厅类型 string
  /// room_propery 房间属性 string
  static const new_room_push = TrackEvent._('new_room_push');

  /// socket推陪陪房间点击
  /// 客户端收到新用户厅推荐消息点击或者自动消息时上报
  /// rid 房间ID 数值
  /// type 推送原因 string
  /// room_type 厅类型 string
  /// room_propery 房间属性 string
  /// action 用户行为，点【接受】or点【拒绝】or 6秒自动消失 string
  static const new_room_push_action = TrackEvent._('new_room_push_action');

  /// 派对页
  static const party_page = TrackEvent._('party_page');

  /// 创建房间
  static const create_room = TrackEvent._('create_room');

  // 圈子展示
  static const net_view = TrackEvent._('net_view');

  // 圈子活动卡片
  static const net_event_card = TrackEvent._('net_event_card');

  // 圈子活动列表
  static const net_event_list = TrackEvent._('net_event_list');

  // 圈友在玩卡片
  static const net_play_card = TrackEvent._('net_play_card');

  // 圈友在玩列表
  static const net_play_list = TrackEvent._('net_play_list');

  // 我的圈子
  static const net_me = TrackEvent._('net_me');

  // 推荐圈子
  static const net_recommend = TrackEvent._('net_recommend');

  // 圈子详情页
  static const net_detail_page = TrackEvent._('net_detail_page');

  //话题详情页
  static const topic_detail_page = TrackEvent._('topic_detail_page');

  //分享
  static const repost = TrackEvent._('repost');

  //新用户进房引导弹窗显示
  static const new_pop_show = TrackEvent._('new_pop_show');

  //新用户进房引导弹窗button点击
  static const new_pop_click = TrackEvent._('new_pop_click');

  //收到进房欢迎弹窗
  static const welcome_popup_exposure = TrackEvent._('welcome_popup_exposure');

  //点击进房欢迎弹窗
  static const welcome_popup_click = TrackEvent._('welcome_popup_click');

  //点击欢迎-私聊ta按钮
  static const welcome_private_click = TrackEvent._('welcome_private_click');

  //修改房间欢迎语
  static const welcome_click = TrackEvent._('welcome_click');

  //邀邀请弹窗展示
  static const invite_pop_show = TrackEvent._('invite_pop_show');

  //邀请弹窗点击
  static const invite_pop_click = TrackEvent._('invite_pop_click');

  //嗨歌歌友房弹窗展示
  static const singer_club_room_pop_show = TrackEvent._('funsclub_pop');

  //嗨歌歌友房弹窗点击
  static const singer_club_room_pop_click = TrackEvent._('funsclub_pop_click');

  //嗨歌新手引导
  static const newer_guide_click = TrackEvent._('new_user_guide');

  // 客户端打开push
  static const push_click = TrackEvent._('push_click');

  // 首页列表曝光
  static const flow_exposure = TrackEvent._('flow_exposure');

  // 首页列表点击
  static const flow_click = TrackEvent._('flow_click');

  // 打开礼物图鉴
  static const view_gift_handbook = TrackEvent._('view_gift_handbook');

  // 礼物卡牌上赠送按钮点击
  static const gift_handbook_button_click =
      TrackEvent._('gift_handbook_button_click');

  // 房间公屏发言，emoji&文字
  static const room_public_chat = TrackEvent._('room_public_chat');

  // ktv 点歌 用户点歌成功
  static const chose_song = TrackEvent._("chose_song");

  // ktv 演唱 歌曲进入演唱
  static const sing_song = TrackEvent._("sing_song");

  // ktv 中途切歌 房主或演唱者演唱中切歌时上报
  static const skip_song = TrackEvent._("skip_song");

  // ktv 删除歌曲 房主或演唱者删除等待中歌曲时上报
  static const delete_song = TrackEvent._("delete_song");

  // ktv 申请上麦 房内其他成员申请上麦时上报
  static const apply_on_mic = TrackEvent._("apply_on_mic");

  /// ktv 加入合唱
  static const join_sing = TrackEvent._("join_sing");

  // 能力卡片筛选
  static const ability_card_filter = TrackEvent._('abilitycard_filter');

  // 能力卡片弹窗
  static const ability_card_window = TrackEvent._('abilitycard_window');

  // 个人资料页点击
  static const profile = TrackEvent._('profile');

  // 游戏卡状态
  static const gamecard = TrackEvent._('gamecard');

  // 个人资料页点击（主态）
  static const profile_click = TrackEvent._('profile_click');

  // 游戏卡点击（主态）
  static const gamecard_change = TrackEvent._('gamecard_change');

  // 游戏卡点击（客态）
  static const gamecard_click = TrackEvent._('gamecard_click');

  // 主播游戏弹窗 当游戏弹窗出现时
  static const gamepopup_show = TrackEvent._('gamepopup_show');

  // 主播游戏弹窗 点击游戏弹窗时
  static const gamepopup_click = TrackEvent._('gamepopup_click');

  // 心愿送礼 通过心愿调起礼物面板送礼成功时
  static const send_gift_game = TrackEvent._('send_gift_game');

  // 创建能力卡片
  static const create_ability = TrackEvent._('create_ability');

  // 能力卡被发送
  static const ability_card_sent = TrackEvent._('abilitycard_sent');

  // 私聊页能力订单banner展现
  static const order_statusbanner = TrackEvent._('order_statusbanner');

  // 私聊页能力订单详情弹窗
  static const order_window = TrackEvent._('order_window');

  // 开黑厅
  static const game_room = TrackEvent._('game_room');

  // 开黑厅进房引导弹窗显示
  static const popup_game_show = TrackEvent._('popup_game_show');

  // 点击开黑厅进房引导弹窗
  static const popup_game_click = TrackEvent._('popup_game_click');

  // 新人榜点击聊天
  static const newface_rank_chat = TrackEvent._('newface_rank_chat');

  //礼物墙打开
  static const view_giftwall = TrackEvent._('view_giftwall');

  //礼物墙上赠送按钮点击
  static const giftwall_button_click = TrackEvent._('giftwall_button_click');

  //发送房间照片及视频
  static const room_photo_send = TrackEvent._('room_photo_send');

  //查看房间照片及视频
  static const room_photo_view = TrackEvent._('room_photo_view');

  //房间照片打赏
  static const room_photo_reward = TrackEvent._('room_photo_reward');

  //房间相册打开
  static const room_album_view = TrackEvent._('room_album_view');

  //房间内上传照片
  static const room_photo_upload = TrackEvent._('room_photo_upload');

  //开启房间红包活动
  static const room_redpacket_start = TrackEvent._('room_redpacket_start');

  //获得房间内抢红包机会
  static const room_redpacket_join = TrackEvent._('room_redpacket_join');

  //房间内抢红包
  static const room_redpacket_get = TrackEvent._('room_redpacket_get');

  //房间内棒棒糖赠送引导展示
  static const room_lollipop_tips = TrackEvent._('room_lollipop_tips');

  //房间内棒棒糖引导点击
  static const room_lollipop_tips_click =
      TrackEvent._('room_lollipop_tips_click');

  // 公屏增强互动引导曝光
  static const room_public_guide_show = TrackEvent._('room_public_guide_show');

  //  公屏增强互动引导点击
  static const room_public_guide_click =
      TrackEvent._('room_public_guide_click');

  // 公屏增强关闭招呼引导
  static const say_hi_close = TrackEvent._('say_hi_close');

  //礼物连击
  static const gift_combo = TrackEvent._('gift_combo');

  //触发连击特殊效果
  static const gift_combo_effects = TrackEvent._('gift_combo_effects');

  //充值页面 确认按钮点击
  static const click_btn_recharge = TrackEvent._('click_btn_recharge');

  // 找人玩
  static const findmore_userlist = TrackEvent._('findmore_userlist');

  //-------------------狼人--------------------------------
  //狼人banner和系统通知点击
  static const click_page = TrackEvent._('click_page');

  // 游戏分类推荐用户列表
  static const rec_userlist = TrackEvent._('rec_userlist');

  static const moment_picture_click = TrackEvent._('momentpicture_click');

  //注册时上传头像
  static const upload_picture = TrackEvent._('upload_picture');

  //高危账号认证弹窗
  static const dialog_spam_identity = TrackEvent._('dialog_spam_identity');

  //访问陪伴榜
  static const view_user_companionlist =
      TrackEvent._('view_user_companionlist');

  //打开房间任务面板
  static const view_room_mission = TrackEvent._('view_room_mission');

  //房间签到
  static const room_signin = TrackEvent._('room_signin');

  //房间特权页访问
  static const view_room_rightpage = TrackEvent._('view_room_rightpage');

  //访问人气等级页
  static const view_popularitypage = TrackEvent._('view_popularitypage');

  //首页好友在玩入口点击
  static const index_friends_playing_click =
      TrackEvent._('index_friends_playing_click');

  ///狼人ai进入埋点
  static const wolf_ai_entrance = TrackEvent._('wolf_ai_entrance');

  ///狼人ai获取身份点击
  /// op: 1为购买身份点击 2为确认身份点击
  static const wolf_ai_role_click = TrackEvent._('wolf_ai_role_click');

  ///狼人ai游戏操作
  /// op 1.刀人 2.放逐
  /// day 第几天 从1开始(第一天黑夜/第二天白天,第二天黑夜/第三天白天)
  /// isConfirm 0选中但还未最终确认,1最终确认
  static const wolf_ai_game_operate_click =
      TrackEvent._('wolf_ai_game_operate_click');

  ///狼人ai发言点击
  /// op 1.点击开麦 2.点击关麦 3.点击过麦
  static const wolf_ai_game_mute_click =
      TrackEvent._('wolf_ai_game_mute_click');

  ///狼人ai游戏结束继续点击
  static const wolf_ai_game_end_continue_click =
      TrackEvent._('wolf_ai_game_end_continue_click');

  /// 商城一级界面
  static const shop_firstpage = TrackEvent._('shop_firstpage');

  /// 商城二级界面
  static const shop_secondpage = TrackEvent._('shop_secondpage');

  /// 我的等级
  static const level_click = TrackEvent._('level_click');

  /// 购买面板
  static const item_card = TrackEvent._('item_card');

  /// 礼物面板
  static const room_gift_control = TrackEvent._('room_gift_control');

  ///点击搜索按钮
  static const search_button_click = TrackEvent._('search_button_click');

  ///点击搜索页技能筛选项
  static const search_hot_click = TrackEvent._('search_hot_click');

  ///搜索结果曝光
  static const search_result_exposure = TrackEvent._('search_result_exposure');

  ///搜索结果点击
  static const search_result_click = TrackEvent._('search_result_click');

  ///搜索无结果
  static const search_not_result = TrackEvent._('search_not_result');

  /// 话题关注
  static const topic_follow = TrackEvent._('topic_follow');

  /// 话题点击
  static const topic_click = TrackEvent._('topic_click');

  /// 话题曝光
  static const topic_expo = TrackEvent._('topic_expo');

  /// 互动消息
  static const interaction_message = TrackEvent._('interaction_message');

  /// 启动获取push token的结果
  static const push_token_result = TrackEvent._('push_token_result');

  /// push在线到达
  static const push_online = TrackEvent._("push_online");

  // -------------------- 联盟扭蛋 --------------------

  // 免费扭蛋
  static const gashapon_free = TrackEvent._('gashapon_free');

  // 付费扭蛋
  static const gashapon_pay = TrackEvent._('gashapon_pay');

  // 银币买扭蛋
  static const gashapon_buy_yin = TrackEvent._('gashapon_buy_yin');

  // 扭蛋次数购买
  static const union_gashapon_buy = TrackEvent._('union_gashapon_buy');

  // -------------------- 联盟房间 --------------------

  // 送勋章
  static const gift_send_xunzhang = TrackEvent._('gift_send_xunzhang');

  // 送金砖
  static const gift_send_jinzhuan = TrackEvent._('gift_send_jinzhuan');

  // -------------------- 福利 --------------------

  // 领取福利
  static const get_welfare = TrackEvent._('get_welfare');

  // 补领福利
  static const make_up_welfare = TrackEvent._('make_up_welfare');

  // 续费福利卡
  static const renew_card = TrackEvent._('renew_card');

  /// 弹窗展示
  static const popup_show = TrackEvent._('popup_show');

  /// 弹窗点击
  static const popup_click = TrackEvent._('popup_click');

  // 签到弹窗点击进任务中心
  static const sign_popup_task_click = TrackEvent._('sign_popup_task_click');

  /// 创建群组入口点击
  static const create_group_click = TrackEvent._('create_group_click');

  /// 成功创建群组
  static const created_group = TrackEvent._('created_group');

  /// 邀请用户进群
  static const invite_in_group = TrackEvent._('invite_in_group');

  /// 接受群组邀请
  static const accept_group_invitation =
      TrackEvent._('accept_group_invitation');

  /// 房间资料卡群入口点击
  static const room_card_group_click = TrackEvent._('room_card_group_click');

  /// 个人主页群入口点击
  static const profile_group_click = TrackEvent._('profile_group_click');

  /// 申请加群
  static const apply_in_group = TrackEvent._('apply_in_group');

  /// 群主处理进群申请
  static const deal_with_group_apply = TrackEvent._('deal_with_group_apply');

  /// 完成身份认证
  static const identity_finish = TrackEvent._('identity_finish');

  /// 手机不支持unity，进入游戏房失败
  static const unity_enter_unsupport = TrackEvent._('unity_enter_unsupport');

  /// 启动unity游戏房间开始
  static const unity_enter_start = TrackEvent._('unity_enter_start');

  /// unity引擎初始化完成
  static const unity_enter_created = TrackEvent._('unity_enter_created');

  /// unity引擎切换场景
  static const unity_switch_scene = TrackEvent._('unity_switch_scene');

  /// unity引擎初始化超时
  static const unity_enter_timeout = TrackEvent._('unity_enter_timeout');

  /// 启动unity游戏房间成功
  static const unity_enter_succeed = TrackEvent._('unity_enter_succeed');

  /// unity主动退出房间
  static const unity_quit_room = TrackEvent._('unity_quit_room');

  /// unity向flutter打点
  static const trace_unity_event = TrackEvent._('trace_unity_event');

  /// 匹配弹窗
  static const people_match_pop = TrackEvent._('people_match_pop');

  /// 厅内轮播榜单点击
  static const click_list = TrackEvent._('click_list');

  /// 头像点击
  static const click_list_tx = TrackEvent._('click_list_tx');

  /// 首页-最近活跃二级弹窗选项点击
  static const recentlyactive_pop_click =
      TrackEvent._('recentlyactive_pop_click');

  /// 打招呼匹配曝光
  static const match_exposure = TrackEvent._('match_exposure');

  /// 打招呼匹配点击
  static const match_click = TrackEvent._('match_click');

  /// 接收匹配
  static const match_accept = TrackEvent._('match_accept');

  /// 发起派对
  static const start_party = TrackEvent._('gathering');

  /// 加入派对
  static const join_party = TrackEvent._('join_party');

  /// 匹配附近的人弹窗展示
  static const match_nearby_show = TrackEvent._('match_nearby_show');

  /// 附近在玩点击
  static const nearby_playing_click = TrackEvent._('nearby_playing_click');

  /// 发起语音通话
  static const voice_call = TrackEvent._('voice_call');

  /// 首页发起派对入口点击
  static const friend_partytype_click = TrackEvent._('friend_partytype_click');

  /// 朋友页-最近活跃点击
  static const recentlyactive_click = TrackEvent._('recentlyactive_click');

  /// 朋友页-好友在玩点击
  static const friendplaying_click = TrackEvent._('friendplaying_click');

  ///在赛季详情页点击时
  static const competition_season = TrackEvent._('competition_season');

  ///在赛事详情页点击时
  static const competition_single = TrackEvent._('competition_single');

  /// 我的赛事页面点击
  static const mine_competition = TrackEvent._('mine_competition');

  /// 战队状态
  static const team_status = TrackEvent._('team_status');

  /// 赛事状态
  static const competition_status = TrackEvent._('mine_competition');

  /// 直播banner
  static const live_game_banner_swipe = TrackEvent._('live_game_banner_swipe');

  /// 语音匹配
  static const voice_match = TrackEvent._('voice_match');

  /// 皮队友首页顶部tab切换
  static const home_tab_switch = TrackEvent._('home_tab_switch');

  /// 婚礼喜帖页面发送动态
  static const send_news = TrackEvent._('send_news');

  /// 婚礼喜帖勾选仅持有喜帖的人可以参加
  static const without_strangers = TrackEvent._('without_strangers');

  ///添加好友页打开
  static const friendaddscreen_view = TrackEvent._('friendaddscreen_view');

  ///能参加的赛事页面曝光
  static const competition_matchpage_show =
      TrackEvent._('competition_matchpage_show');

  ///能参加的赛事页面-点击单条赛事
  static const competition_single_click =
      TrackEvent._('competition_single_click');

  ///能参加的赛事页面-点击单条赛事-报名
  static const matchpage_register = TrackEvent._('matchpage_register');

  ///能参加的赛事页面-点击”查看更多赛事”按钮
  static const matchpage_morecompetition_click =
      TrackEvent._('matchpage_morecompetition_click');

  ///赛事详情页-获取门票弹窗曝光
  static const competition_single_ticket_show =
      TrackEvent._('competition_single_ticket_show');

  ///赛事详情页-点击获取门票
  static const competition_single_ticket_gain =
      TrackEvent._('competition_single_ticket_gain');

  ///房间推荐入口点击
  static const room_recommend_click = TrackEvent._('room_recommend_click');

  ///GS发送推荐房间
  static const room_recommend = TrackEvent._('room_recommend');

  /// 首页陪陪点击
  static const home_peiban_click = TrackEvent._('home_peiban_click');

  /// 报名成功 未绑定手机号曝光
  static const register_success_bind_phonenumber_show =
      TrackEvent._('register_success_bind_phonenumber_show');

  /// 报名成功页面-操作点击
  static const register_success_click = TrackEvent._('register_success_click');

  /// 作战室-曝光
  static const war_room_show = TrackEvent._('war_room_show');

  /// 作战室-说明弹窗曝光
  static const war_room_pop_show = TrackEvent._('war_room_pop_show');

  /// 游戏账号管理页-点击
  static const game_account_manager_click =
      TrackEvent._('game_account_manager_click');

  /// 游戏账号绑定页-默认账号状态变动
  static const default_game_account_change =
      TrackEvent._('default_game_account_change');

  /// 创建战队成功页-点击
  static const create_team_success_click =
      TrackEvent._('create_team_success_click');

  /// 分享
  static const share = TrackEvent._('share');

  /// 赛事中心页-快速参加赛事模块-曝光
  static const competition_center_fast_show =
      TrackEvent._('competition_center_fast_show');

  /// 赛事中心页-快速参加赛事-单个赛事-点击
  static const competition_center_fast_single_click =
      TrackEvent._('competition_center_fast_single_click');

  /// 赛事中心页-快速参加赛事-更多按钮-点击
  static const competition_center_fast_more_click =
      TrackEvent._('competition_center_fast_more_click');

  /// 赛事中心页-赛事分组-点击
  static const competition_center_group_click =
      TrackEvent._('competition_center_group_click');

  /// 赛事详情页-曝光
  static const competition_details_show =
      TrackEvent._('competition_details_show');

  /// 赛事详情页-角色绑定状态展示
  static const competition_details_role_state =
      TrackEvent._('competition_details_role_state');

  /// 赛事详情页- toast-曝光
  static const competition_single_toast_show =
      TrackEvent._('competition_single_toast_show');

  /// 赛事详情页- toast-点击
  static const competition_single_toast_click =
      TrackEvent._('competition_single_toast_click');

  /// 赛事详情页-弹窗-曝光
  static const competition_single_pop_show =
      TrackEvent._('competition_single_pop_show');

  /// 赛事详情页-弹窗-按钮点击
  static const competition_single_pop_button_click =
      TrackEvent._('competition_single_pop_button_click');

  /// 赛事结果排名页-点击
  static const competition_result_page_click =
      TrackEvent._('competition_result_page_click');

  /// 赛事结果排名页- toast-曝光
  static const competition_result_page_toast_show =
      TrackEvent._('competition_result_page_toast_show');

  /// 赛事结果排名页-邀请入队状态
  static const competition_result_page_invite =
      TrackEvent._('competition_result_page_invite');

  /// 赛事结果排名页-申请入队状态
  static const competition_result_page_apply =
      TrackEvent._('competition_result_page_apply');

  /// 赛事排行榜-点击
  static const competition_ranking_list_click =
      TrackEvent._('competition_ranking_list_click');

  /// 门票明细页-点击
  static const competition_ticket_details_page_click =
      TrackEvent._('competition_ticket_details_page_click');

  /// 抢唱
  /// 抢唱按钮点击
  static const voice_press = TrackEvent._('voice_press');

  /// 抢唱-上传按钮
  static const voice_up = TrackEvent._('voice_up');

  /// 抢唱-点击静音
  static const voice_off = TrackEvent._('voice_off');

  /// 抢唱-结果排行榜 关注/回关
  static const voice_follow = TrackEvent._('voice_follow');

  /// 抢唱-哼唱时打赏金币
  static const voice_gold = TrackEvent._('voice_gold');

  /// 抢唱-哼唱时打赏币
  static const voice_money = TrackEvent._('voice_money');

  /// 抢唱-领唱点赞
  static const voice_like = TrackEvent._('voice_like');

  /// 抢唱-领唱踩
  static const voice_unlinke = TrackEvent._('voice_unlinke');

  /// 直播间挂机
  static const live_room_on_hook = TrackEvent._('live_room_on_hook');

  ///购买粉丝礼包
  static const buy_fans_privilege_pack =
      TrackEvent._('buy_fans_privilege_pack');

  /// 加入直播粉丝团
  static const join_fans_group = TrackEvent._('join_fans_group');

  /// 飘屏曝光上报
  static const gift_floating_exposure = TrackEvent._('gift_floating_exposure');

  /// 皮队友新人礼包弹窗曝光
  static const new_users_gift_show = TrackEvent._('new_users_gift_show');

  /// 皮队友新人礼包弹窗礼物点击
  static const new_users_gift_click = TrackEvent._('new_users_gift_click');

  /// 皮队友关闭新人礼包弹窗
  static const new_users_gift_close = TrackEvent._('new_users_gift_close');

  /// 投屏设置当前片名
  static const touping_set_current_video_name =
      TrackEvent._('touping_set_current_video_name');

  /// 投屏设置待播列表
  static const touping_set_future_video_name =
      TrackEvent._('touping_set_future_video_name');

  /// 投屏切换私密模式
  static const touping_change_private_mode =
      TrackEvent._('touping_change_private_mode');

  /// 投屏成功时
  static const touping_cast_start = TrackEvent._('touping_cast_start');

  /// 快进快退
  static const touping_action_change_progress =
      TrackEvent._('touping_action_change_progress');

  /// 取消匹配
  static const game_match_quit = TrackEvent("game_match_quit");

  /// 点击最小化匹配浮窗并返回了匹配界面
  static const reenter_matchmaking = TrackEvent("reenter_matchmaking");

  /// 选择多游戏匹配
  static const select_multi_matchmaking =
      TrackEvent("select_multi_matchmaking");

  /// 在游戏匹配界面选择最小化
  static const minimize_matchmaking = TrackEvent("minimize_matchmaking");

  /// 多游戏匹配选择游戏
  static const multi_matchmaking_select =
      TrackEvent("multi_matchmaking_select");

  /// 多游戏匹配取消游戏
  static const multi_matchmaking_quit = TrackEvent("multi_matchmaking_quit");

  static const create_group_start = TrackEvent('create_group_start'); // 点击发起群组
  static const create_group_complete =
      TrackEvent('create_group_complete'); //建立群组成功

  /// kol专区打开
  static const kol_exposure = TrackEvent._('kol_exposure');

  /// kol专区点击
  static const kol_button_click = TrackEvent('kol_button_click');

  /// 开宝箱
  static const summer_holiday_open_rewardbox =
      TrackEvent._('summer_holiday_open_rewardbox');

  /// 开启房间防打扰
  static const open_room_push = TrackEvent._('open_room_push');

  /// 每日弹窗的进房uv
  static const new_room_enter = TrackEvent._('new_room_enter');

  /// 推荐用户页关闭
  static const suggested_follow_page_close =
      TrackEvent._('suggested_follow_page_close');

  /// 推荐关注用户页曝光
  static const suggested_follow_page_show =
      TrackEvent._('suggested_follow_page_show');

  /// 房主任务弹窗曝光
  static const homeowner_task_pop_show =
      TrackEvent._('homeowner_task_pop_show');

  /// 房主任务完成
  static const homeowner_task_finish = TrackEvent._('homeowner_task_finish');

  /// 房主任务成功领取奖励
  static const homeowner_get_reward = TrackEvent._('homeowner_get_reward');

  /// 萌新打招呼成功
  static const new_user_say_hi = TrackEvent._('new_user_say_hi');

  /// “更多游戏”页点击顶部匹配
  static const more_game_page_match = TrackEvent._('more_game_page_match');

  /// “更多游戏”页点击游戏入口
  static const more_game_page_enter_game =
      TrackEvent._('more_game_page_enter_game');

  /// “更多游戏”页点击房间入口
  static const more_game_page_enter_room =
      TrackEvent._('more_game_page_enter_room');

  /// 房间任务入口曝光
  static const room_task_entrance_show =
      TrackEvent._('room_task_entrance_show');

  /// 消息列表点击一起玩过的用户
  static const message_list_played_together_click =
      TrackEvent._('message_list_played_together_click');

  /// 点击邀请发动态
  static const invite_produce_trend = TrackEvent._('invite_produce_trend');

  /// 发动态引导气泡曝光
  static const guide_produce_trend_bubble_show =
      TrackEvent._('guide_produce_trend_bubble_show');

  /// 小剧场播放语音
  static const theater_choice_recording =
      TrackEvent._('theater_choice_recording');

  /// 小剧场埋点自己演
  static const theater_choice_perform = TrackEvent._('theater_choice_perform');

  /// 触发小剧场选择页面
  static const theater_choice = TrackEvent._('theater_choice');

  /// 私聊页资料卡卡片曝光
  static const information_card_show = TrackEvent._('information_card_show');

  /// 私聊页资料卡卡片操作
  static const information_card_operate =
      TrackEvent._('information_card_operate');

  /// 邀请进房弹窗曝光
  static const invite_enter_room_pop_show =
      TrackEvent._('invite_enter_room_pop_show');

  /// 红人主页教程Banner点击
  static const celeb_homepage_banner_click =
      TrackEvent._('celeb_homepage_banner_click');

  /// 商品详情页展示
  static const jiaocheng_buy_page_show =
      TrackEvent._('jiaocheng_buy_page_show');

  /// 商品详情页点击
  static const jiaocheng_buy_page_click =
      TrackEvent._('jiaocheng_buy_page_click');

  /// 商品购买成功
  static const jiaocheng_buy_success = TrackEvent._('jiaocheng_buy_success');

  /// 画猜接龙复盘送礼1
  static const draw_gift1 = TrackEvent._('draw_gift1');

  /// 画猜接龙复盘送礼2
  static const draw_gift2 = TrackEvent._('draw_gift2');

  /// 陪伴tab功能点击统计
  static const accompany_tab_click = TrackEvent._('accompany_tab_click');

  /// 云游戏tab进入游戏时的点击统计
  static const enter_cloud_game = TrackEvent._('enter_cloud_game');

  /// 全部游戏中一级分类筛选点击统计
  static const all_cloud_game_click = TrackEvent._('all_cloud_game_click');

  /// 皮队友首页tab访问统计
  static const app_tab_show = TrackEvent._('app_tab_show');

  /// 云游戏插队
  static const cloud_game_cut_in = TrackEvent._('cloud_game_cut_in');

  /// 云游戏房间内banner点击
  static const cloud_game_room_banner_click =
      TrackEvent._('cloud_game_room_banner_click');

  /// 云游戏实人认证弹窗
  static const cloud_game_verify_dialog =
      TrackEvent._('cloud_game_verify_dialog');

// -------------------- 网赚房间 --------------------
  /// 进入排麦队列
  static const mic_queue = TrackEvent._('mic_queue');

  /// 成功出价
  static const offer_price = TrackEvent._('offer_price');

  /// 任务开启
  static const task_startup = TrackEvent._('task_startup');

  /// 弹窗
  static const pop_up_page = TrackEvent._('pop_up_page');

  /// 领取奖励
  static const achive_award = TrackEvent._('achive_award');

  /// 完成任务
  static const task_complete = TrackEvent._('task_complete');

  /// 首页：快速加入滑动上报
  static const page_slide = TrackEvent._('page_slide');

  /// 云游戏排队进入围观
  static const cloud_game_play_other = TrackEvent._('cloud_game_play_other');

  /// 防沉迷认证弹窗
  static const fangchenmi_dialog = TrackEvent._('fangchenmi_dialog');

  /// 开启接力
  static const cloud_game_relay_mode_open =
      TrackEvent._('cloud_game_relay_mode_open');

  /// 建联弹窗展示
  static const jianlian_dialog = TrackEvent._('jianlian_dialog');

  /// 导游卡页面
  static const tripcard_exposure = TrackEvent._('tripcard_exposure');

  /// 夺宝活动页
  static const treasure_exposure = TrackEvent._('treasure_exposure');

  /// app 内打开URL
  static const open_webview_in_app = TrackEvent._('open_webview_in_app');

  /// app 内打开半屏URL
  static const open_half_webview_in_app =
      TrackEvent._('open_half_webview_in_app');

  /// 首页自定义弹窗
  static const home_customize_pop = TrackEvent._('home_customize_pop');

  /// 私聊成功查看照片
  static const get_photo_success = TrackEvent._('get_photo_success');

  /// 私聊成功获得礼物
  static const get_gift_success = TrackEvent._('get_gift_success');

  /// 发送名片模卡统计
  static const visit_card_send = TrackEvent._('visit_card_send');

  /// 查看名片模卡统计
  static const visit_card_check = TrackEvent._('visit_card_check');

  /// 模卡流失召回弹窗的展示统计
  static const pdy_commonwd_popoup = TrackEvent._('pdy_commonwd_popoup');

  /// 名片模卡流失召回弹窗的操作统计
  static const pdy_commonwd_click = TrackEvent._('pdy_commonwd_click');

  /// 预置发言区曝光
  static const public_area_guide_show = TrackEvent._('public_area_guide_show');

  /// 预置发言区关闭按钮点击
  static const public_area_guide_close =
      TrackEvent._('public_area_guide_close');

  /// 二级tab点击
  static const second_tabname_click = TrackEvent._('second_tabname_click');

  /// （非房主，非接待）普通用户点击入口时
  static const play_guide_entrance = TrackEvent._('play_guide_entrance');

  /// （非房主，非接待）普通用户点击列表中的栏目时
  static const play_guide_list = TrackEvent._('play_guide_list');

  /// （非房主，非接待）普通用户点击【我要玩】时
  static const play_guide_join = TrackEvent._('play_guide_join');

  // -------------------------8分钟邂逅---------------------------------
  /// 用户发起邂逅邀请
  static const send_encounter_match = TrackEvent._('send_one_service');

  /// 用户取消了邂逅邀请
  static const cancel_encounter_match = TrackEvent._('giveup_one_service');

  /// 主播接受邂逅邀请
  static const accept_encounter_match = TrackEvent._('accept_service');

  /// 主播拒绝邂逅邀请
  static const refuse_encounter_match = TrackEvent._('cancel_service');

  /// 邂逅Tab页面点击遇见里的GS进入私聊页面
  static const xiehou_tab_meet_click = TrackEvent._('xiehou_tab_meet_click');

  /// 用户听GS内心独白
  static const xiehou_listen_secret_audio = TrackEvent._('listen_secret_audio');

  /// 用户提前结束服务
  static const pre_end_order = TrackEvent._('pre_end_order');

  // -------------------- 消息页顶部通知 --------------------
  /// 顶部通知曝光时
  static const im_toppush_pv = TrackEvent._('IM_toppush_pv');

  /// 点击顶部通知时
  static const im_toppush_click = TrackEvent._('IM_toppush_click');

  // -------------------- 子频道banner功能 --------------------
  /// 频道banner曝光时
  static const channel_banner_pv = TrackEvent._('channel_banner_pv');

  /// 点击频道banner
  static const channel_banner_click = TrackEvent._('channel_banner_click');

  ///小号管理工具 相关弹窗展现
  static const account_popup_window_show =
      TrackEvent._('account_popup_window_show');

  ///小号管理工具 相关弹窗点击
  static const account_popup_window_click =
      TrackEvent._('account_popup_window_click');

  ///用户添加小号
  static const add_small_account = TrackEvent._('add_small_account');

  ///用户切换账号
  static const change_small_account = TrackEvent._('change_small_account');

  ///邂逅页面加载完成
  static const xiehou_page_load = TrackEvent._('xiehou_page_load');

  ///邂逅页面用户点击3个不同模块
  static const xiehou_module_click = TrackEvent._('xiehou_module_click');

  ///邂逅GS查看用户提示信息统计
  static const user_info_read = TrackEvent._('user_info_read');

  /// 视频缓冲所需时间
  static const video_buffer_time = TrackEvent._('video_buffer_time');

  /// feed流视频播放时长埋点
  static const feed_video_play = TrackEvent._('video_feed_view');

  /// feed页播放错误埋点
  static const feed_video_error = TrackEvent._('video_feed_error');

  /// 用户录制弹幕
  static const record_bullet_screen = TrackEvent._('record_bullet_screen');

  /// 用户发送语音弹幕
  static const send_bullet_screen = TrackEvent._('send_bullet_screen');

  /// up主精选语音弹幕
  static const pick_bullet_screen = TrackEvent._('pick_bullet_screen');

  /// 用户给语音弹幕点赞
  static const like_bullet_screen = TrackEvent._('like_bullet_screen');

  /// 房间内功能抽屉点击
  static const room_container_click = TrackEvent._('room_container_click');

  /// 拍卖房送欧气按钮点击
  static const auction_lucky_click = TrackEvent._('auction_lucky_click');

  /// 点击VIP麦座
  static const vip_seat_click = TrackEvent._('vip_seat_click');

  /// 资料卡直播内容标签曝光
  static const live_content_pv = TrackEvent._('live_content_pv');

  /// 资料卡直播内容标签点击
  static const live_content_click = TrackEvent._('live_content_click');

  /// 内容标签弹窗点击
  static const live_content_pop_click = TrackEvent._('live_content_pop_click');

  /// 在线匹配入口点击
  static const mystery_match_click = TrackEvent._('mystery_match_click');

  /// 匹配到用户后首次发送消息
  static const mystery_match_hi = TrackEvent._('mystery_match_hi');

  /// 匹配通知曝光
  static const match_notification_exposure = TrackEvent._('love_bell_exposure');

  /// 匹配通知点击
  static const match_notification_click = TrackEvent._('love_bell_click');

  /// 未打招呼点击退出触发打招呼提示后上报
  static const mystery_match_touch_tips =
      TrackEvent._('mystery_match_touch_tips');

  /// 加载房间游戏
  static const load_room_game = TrackEvent._('load_room_game');

  /// 主播任务(用户侧) - 点击进入页面情况统计
  static const user_center_task_click = TrackEvent._('user_center_task_click');

  /// 访问主播任务中心页面
  static const gs_center_page_load = TrackEvent._('gs_center_page_load');

  /// 房间热度购买
  static const room_hot_buy = TrackEvent._('room_hot_buy');

  /// 陪伴小屋-进入"立即装扮"界面上报
  static const accompany_house_upgrade_load =
      TrackEvent._('xiaowu_upgrade_load');

  /// 陪伴小屋-完成装扮后统计
  static const accompany_house_upgrade_success =
      TrackEvent._('xiaowu_upgrade_success');

  /// 录音棚页面浏览
  static const studio_view = TrackEvent._('studio_view');

  /// 进入演唱界面
  static const studio_sing_view = TrackEvent._('studio_sing_view');

  /// 开始录音
  static const studio_start_recording = TrackEvent._('studio_start_recording');

  /// 进入作品编辑
  static const studio_edit_view = TrackEvent._('studio_edit_view');

  /// 切换模板
  static const studio_change_template = TrackEvent._('studio_change_template');

  /// 切换混响
  static const studio_change_reverb = TrackEvent._('studio_change_reverb');

  /// 调整人声
  static const studio_set_recordingvoice =
      TrackEvent._('studio_set_recordingvoice');

  /// 调整伴奏
  static const studio_set_bgmvoice = TrackEvent._('studio_set_bgmvoice');

  /// 进入视频编辑
  static const studio_video_edit = TrackEvent._('studio_video_edit');

  /// 调整视频截取片段
  static const studio_set_schedule = TrackEvent._('studio_set_schedule');

  /// 切换字体
  static const studio_change_font = TrackEvent._('studio_change_font');

  /// 生成作品
  static const studio_create_work = TrackEvent._('studio_create_work');

  /// 提交作品
  static const studio_submit_work = TrackEvent._('studio_submit_work');

  /// 蒙面互动，点击麦位
  static const masked_mic_click = TrackEvent._('masked_mic_click');

  /// 成功发布“找队友”需求时上报
  static const publish_teammate_requirement =
      TrackEvent._('publish_teammate_requirement');

  /// 开黑组队页面访问统计
  static const teammate_requirement_use =
      TrackEvent._('teammate_requirement_use');

  /// 主播发出pick邀请时上报
  static const teammate_requirement_pick =
      TrackEvent._('teammate_requirement_pick');

  /// 用户接受邀请进房时上报
  static const teammate_requirement_accept =
      TrackEvent._('teammate_requirement_accept');

  /// 一对一房间邀请统计
  static const one_room_invite = TrackEvent._('one_room_invite');

  /// 用户接受一对一房间邀请统计
  static const one_room_invite_accept = TrackEvent._('one_room_invite_accept');

  /// 开黑组队玩法开启时上报统计
  static const teammate_requirement_load =
      TrackEvent._('teammate_requirement_load');

  /// 开黑组队结束时上报统计
  static const teammate_requirement_finish =
      TrackEvent._('teammate_requirement_finish');

  /// 主播任务中心-完成任务领取到奖励时上报
  static const anchor_task_success = TrackEvent._('anchor_task_success');

  /// cp 麦位
  static const cp_maiwei_opetate = TrackEvent._('cp_maiwei_opetate');

  /// 进入收藏室页面上报
  static const collect_room_use = TrackEvent._('collect_room_use');

  /// CP旅行 点击页面加载完成后上报/（切换旅行头像时上报）
  static const cp_travel_page_load = TrackEvent._('cp_travel_page_load');

  /// CP旅行 投掷骰子上报
  static const cp_travel_success = TrackEvent._('cp_travel_success');

  /// avatar弹窗提示展示
  static const avatar_pop_exposure = TrackEvent._('avatar_pop_exposure');

  /// avatar弹窗点击
  static const avatar_pop_click = TrackEvent._('avatar_pop_click');

  /// 进入捏脸界面
  static const enter_avatar_editor = TrackEvent._('enter_avatar_editor');

  /// 编辑avatar
  static const edit_avatar = TrackEvent._('edit_avatar');

  /// avatar资源下载失败
  static const avatar_res_load_fail = TrackEvent._('avatar_source_defeated');

  // -------------------- 成就墙 --------------------

  /// 直播个人信息卡片—成就墙入口
  static const achievement_click_room_entrance =
      TrackEvent._("achievement_click_room_entrance");

  /// 个人主页-成就勋章展示
  static const achievement_view_personal_entrance =
      TrackEvent._("achievement_view_personal_entrance");

  /// 个人主页-点击成就墙入口
  static const achievement_click_personal_entrance =
      TrackEvent._("achievement_click_personal_entrance");

  /// 成就墙-点击马上解锁
  static const achievement_click_goto_unlock =
      TrackEvent._("achievement_click_goto_unlock");

  /// 成就墙-点击在个人主页展示
  static const achievement_click_show_medal =
      TrackEvent._("achievement_click_show_medal");

  /// 成就墙-点击【立即佩戴】按钮
  static const achievement_click_wear_btn = TrackEvent._("wear_button_click");

  /// 成就墙-点击某勋章
  static const achievement_click_medal =
      TrackEvent._("achievement_click_medal");

  /// 成就墙-页面曝光
  static const achievement_page_show = TrackEvent._("view_achieve_wall");

  // -------------------- 陪伴记 --------------------

  /// 陪伴记-点击用户主页中的入口
  static const accompany_click_personal_page_entrance =
      TrackEvent._("accompany_click_personal_page_entrance");

  /// 陪伴记-点击直播间个人卡片中的入口
  static const accompany_click_room_card_entrance =
      TrackEvent._("accompany_click_room_card_entrance");

  /// 陪伴记-列表曝光
  static const accompany_view_list = TrackEvent._("accompany_view_list");

  /// 陪伴记-点击列表入口
  static const accompany_click_list = TrackEvent._("accompany_click_list");

  /// 陪伴记-点击列表每周/总计
  static const accompany_click_list_tab =
      TrackEvent._("accompany_click_list_tab");

  /// 陪伴记-点击说明页
  static const accompany_click_help = TrackEvent._("accompany_click_help");

  /// 陪伴记-点击单个灯
  static const accompany_click_item = TrackEvent._("accompany_click_item");

  /// 充值活动-领取祈福奖励
  static const package_center_lucky_prize =
      TrackEvent._("package_center_lucky_prize");

  /// 充值活动-开启宝箱
  static const package_center_rewards = TrackEvent._("package_center_rewards");

  /// 充值活动-页面加载
  static const package_center_view = TrackEvent._("package_center_view");

  /// 今日缘分页面展现统计
  static const window_show_yuanfen = TrackEvent._("window_show_yuanfen");

  /// 今日缘分打招呼统计
  static const window_click_yuanfen = TrackEvent._("window_click_yuanfen");

  /// 为Ta寻宝 - 页面打开统计
  static const lucky_mine_page_load = TrackEvent._("new_play_load");

  /// 为Ta寻宝 - 用户成功挖矿统计
  static const lucky_mine_dig_ok = TrackEvent._("dig_ok");

  /// 进入恋爱人格首页
  static const enter_love_personality = TrackEvent._('enter_love_personality');

  /// 恋爱人格测试获得结果时上报
  static const love_personality_get_result =
      TrackEvent._('love_personality_get_result');

  /// 恋爱人格活动页点击
  static const love_personality_click = TrackEvent._('love_personality_click');

  /// 主播快捷更换私聊礼物
  static const gift_change_custom = TrackEvent._("gs_change-gifts");

  /// 默契问答入口点击
  static const questions_click_entrance =
      TrackEvent._("questions_click_entrance");

  /// 默契问答页面操作
  static const questions_page_view_list =
      TrackEvent._("questions_page_view_list");

  /// 点亮星座页面访问
  static const light_star_show = TrackEvent._("light_star_show");

  /// 成功点亮星座的统计
  static const light_star_success = TrackEvent._("light_star_success");

  /// 领取星座奖励的统计
  static const get_star_success_reward =
      TrackEvent._("get_star_success_reward");

  /// 关系玩法-用户点击升级页面“立即升级”的按钮时上报
  static const relation_shengji_success =
      TrackEvent._('relation_shengji_success');

  /// 关系玩法-访问关系页面时上报（含我的关系、全部关系、关系升级等页面均上报）
  static const relation_total_user = TrackEvent._('relation_total_user');

  /// 进入歌友会广场页
  static const funsclub_square_view = TrackEvent._('funsclub_square_view');

  /// 进入歌友会主页
  static const funsclub_view = TrackEvent._('funsclub_view');

  /// 歌友会签到
  static const funsclub_signin = TrackEvent._('funsclub_signin');

  /// 申请加入歌友会
  static const funsclub_apply = TrackEvent._('funsclub_apply');

  /// 退出歌友会
  static const funsclub_quit = TrackEvent._('funsclub_quit');

  /// 歌友会入口点击
  static const funsclub_entrance = TrackEvent._('funsclub_entrance');

  /// 歌友会主页申请地域歌友会
  static const funsclub_apply_area = TrackEvent._('funsclub_apply_area');

  /// 歌友会主页申请排名歌友会
  static const funsclub_apply_rank = TrackEvent._('funsclub_apply_rank');

  /// 歌友会群聊问题点击
  static const funsclub_chat_problem = TrackEvent._('funsclub_chat_problem');

  /// 歌友会积分礼物点击
  static const funsclub_integral_gift = TrackEvent._('funsclub_integral_gift');

  /// 歌友会积分礼物兑换成功
  static const funsclub_integral_gift_success =
      TrackEvent._('funsclub_integral_gift_success');

  /// 歌友会邀请成员加入按钮点击
  static const funsclub_invite_members =
      TrackEvent._('funsclub_invite_members');

  /// 歌友会邀请成员同意按钮点击
  static const funsclub_consent = TrackEvent._('funsclub_consent');

  /// 回归任务中心-领取奖励上报
  static const recall_task_success = TrackEvent._('recall_task_success');

  /// 浏览vip管家弹窗
  static const view_housekeeper_pop = TrackEvent._("view_housekeeper_pop");

  /// 今日缘分：点击事件
  static const luck_click = TrackEvent._("luck_click");

  /// 今日缘分：曝光
  static const luck_exposure = TrackEvent._("luck_exposure");

  /// 今日缘分：卡片滑动时上报
  static const luck_enter = TrackEvent._("luck_enter");

  /// 今日缘分：开场白
  static const prologue_click_entrance =
      TrackEvent._("prologue_click_entrance");

  /// 环游热气球-页面打开
  static const pop_load_success = TrackEvent._("pop_load_success");

  /// 环游热气球-热气球启动统计
  static const pop_start_success = TrackEvent._("pop_start_success");

  /// 环游热气球-热气球启动统计
  static const add_fuel_success = TrackEvent._("add_fuel_success");

  /// 物品使用
  static const item_use_success = TrackEvent._("item_use_success");

  /// 物品赠送
  static const item_send_success = TrackEvent._("item_send_success");

  /// 房间收藏
  static const collect_room = TrackEvent._("collect_room");

  /// CP小屋页面访问统计
  static const house_build_show = TrackEvent._("house_build_show");

  /// CP小屋创建小屋页面曝光的统计
  static const create_house_show = TrackEvent._("create_house_show");

  /// CP小屋发出邀请建立小屋的统计
  static const send_house_together_build =
      TrackEvent._("send_house_together_build");

  /// CP小屋成功组建甜蜜小屋的统计
  static const success_house_togethe_build =
      TrackEvent._("success_house_togethe_build");

  /// 购买靓号成功统计
  static const pretty_id_buy_success = TrackEvent._("pretty_id_buy_success");

  /// 升级座驾
  static const permanent_car_upgrade = TrackEvent._("permanent_car_upgrade");

  /// 魔法消息
  static const magic_message_click = TrackEvent._("magic_message_click");

  /// 翻牌子开启玩法
  static const flipboard_start = TrackEvent._("card_flip_start");

  /// 翻牌子结束玩法
  static const flipboard_end = TrackEvent._("card_flip_end");

  /// 牌子编辑统计
  static const card_edit = TrackEvent._("card_edit");

  /// 翻牌成功上报
  static const flipboard_flip_card_success = TrackEvent._("card_flip");

  /// 发布好友印象成功上报
  static const send_friend_memory_success =
      TrackEvent._('send_friend_memory_success');

  /// VIP分层礼物---兑换奖励成功上报
  static const change_vip_gift_pack = TrackEvent._('change_vip_gift_pack');

  /// 小心情页面点击
  static const small_mood_click = TrackEvent._("small_mood_click");

  /// 通用页面操作统计
  static const page_common_operete = TrackEvent._("page_common_operete");

  /// 打地鼠-页面加载
  static const happy_mouse_load = TrackEvent._("happy_mouse_load");

  /// 打地鼠-选择坑洞成功play后
  static const happy_mouse_hit = TrackEvent._("happy_mouse_hit");

  /// 发送PK邀请时上报
  static const send_person_pk_invitation =
      TrackEvent._("send_person_pk_invitation");

  /// 活动页面访问曝光统计
  static const holiday_h5_load = TrackEvent._("holiday_h5_load");

  /// 房间打开右上角包厢特殊麦位上报
  static const room_cubicle_special_mic =
      TrackEvent._('baoxiang_maiwei_opetate');

  /// 智能 招呼
  static const smart_reply = TrackEvent._('smart_reply');

  /// 动态 招呼
  static const dynamic_reply = TrackEvent._('dynamic_reply');

  /// 自动招呼 弹框曝光
  static const sayhi_pop_display = TrackEvent._('sayhi_pop_display');

  /// 自动招呼 开关 状态
  static const sayhi_open = TrackEvent._('sayhi_open');

  /// 房间背景音乐播放
  static const play_room_bg_music = TrackEvent._('play_room_bg_music');

  /// gs考勤弹窗曝光
  static const gs_checking_pop_exposure =
      TrackEvent._('gs_checking_pop_exposure');

  /// gs考勤弹窗点击
  static const gs_checking_pop_click = TrackEvent._('gs_checking_pop_click');

  /// GS个性标签填写弹窗
  static const tag_pop_display = TrackEvent._('tag_pop_display');

  /// 个性标签匹配GS弹窗（惊喜男神女神）
  static const jingxi_pop_display = TrackEvent._('jingxi_pop_display');

  /// 优质用户入口曝光
  static const quality_user_entry_exposure =
      TrackEvent._('quality_user_entry_exposure');

  /// 优质用户入口点击
  static const quality_user_entry_click =
      TrackEvent._('quality_user_entry_click');

  /// 优质用户列表曝光
  static const quality_user_list_exposure =
      TrackEvent._('quality_user_list_exposure');

  /// 优质用户列表打招呼点击
  static const quality_user_item_sayhi_click =
      TrackEvent._('quality_user_item_sayhi_click');

  /// 优质用户列表私信点击
  static const quality_user_item_private_msg_click =
      TrackEvent._('quality_user_item_private_msg_click');

  /// 心动问答 回答结果
  static const answer_gift = TrackEvent._('answer_gift');

  /// 互动礼物弹窗打开
  static const interact_combine_gift_popup =
      TrackEvent._('interact_combine_gift_popup');

  /// PK厅曝光
  static const rank_cross_pk_living = TrackEvent._('rank_cross_pk_living');

  /// 人脸识别弹窗点击
  static const scanface_pop_click = TrackEvent._('scanface_pop_click');

  /// im消息通用跳转
  static const im_click = TrackEvent._('IM_click');

  /// 荣耀时刻入口点击
  static const rank_hours_click = TrackEvent._('glory_evening_ranking_click');

  /// iOS点击灵动岛
  static const live_iOS_activity_click =
      TrackEvent._('iOS_live_activity_click');

  /// 首页列表切换/背景切换
  static const common_operate = TrackEvent._('common_operate');

  /// 房间-帽子玩法-开启
  static const room_grab_hat_start = TrackEvent._('click_mao');

  /// 房间-帽子玩法-浮窗点击
  static const room_grab_hat_float_open = TrackEvent._('mao_pop_click');

  /// 房间-帽子玩法-帮TA抢
  static const room_grab_hat_help_ta = TrackEvent._('mao_button_click');

  /// 到达我的座驾页面
  static const enter_my_mounts = TrackEvent._('enter_my_mounts');

  /// 兑换座驾
  static const exchange_mounts = TrackEvent._('exchange_mounts');

  /// 兑换碎片
  static const exchange_mounts_piece = TrackEvent._('exchange_mounts_piece');

  /// 进入座驾榜单
  static const enter_mount_rank = TrackEvent._('enter_mount_rank');

  /// 进入恋爱旅行主页
  static const love_users_enter = TrackEvent._('love_users_enter');

  /// 首页底部tab中间活动点击
  static const click_home_tab_center = TrackEvent._('click_home_tab_center');

  /// 年度盛典左侧挂件点击展开
  static const left_sidebar_click = TrackEvent._('left_sidebar_click');

  /// 点击左侧挂件进入房间
  static const left_pendant_click_enter_room =
      TrackEvent._('left_pendant_click_enter_room');

  /// 点击左侧挂件进入年度盛典
  static const left_pendant_click_year_party =
      TrackEvent._('left_pendant_click_year_party');

  /// 房间活动宝箱
  static const room_act_box_show = TrackEvent._('box_show');

  /// 房间活动宝箱点击
  static const room_act_box_click = TrackEvent._('box_click');

  /// 宝箱跳转活动详情
  static const room_act_box_to_detail =
      TrackEvent._('box_click_enter_year_party');

  /// 进入甜蜜相册半弹层
  static const sweet_photo_layer_enter =
      TrackEvent._('sweet_photo_layer_enter');

  /// 进入甜蜜相册半弹层
  static const sweet_photo_enter = TrackEvent._('sweet_photo_enter');

  /// 进入启动音
  static const open_tone_enter = TrackEvent._('open_tone_enter');

  /// 选择某条音频作为启动音
  static const settle_open_tone = TrackEvent._('settle_open_tone');

  /// 启动音开屏页曝光
  static const start_open_tone = TrackEvent._('start_open_tone');

  /// 点击启动开屏页面进入个人主页
  static const open_tone_click = TrackEvent._('open_tone_click');

  /// 开屏广告曝光
  static const open_exposure = TrackEvent._('open_exposure');

  /// 星座拍拍ta-弹窗曝光
  static const paipai_exposure = TrackEvent._('paipai_exposure');

  /// 星座拍拍ta-点击撩一下按钮
  static const flip_botton_click = TrackEvent._('flip_botton_click');

  /// 星座拍拍ta-在特权礼物栏中点击活动解锁按钮
  static const unlock_botton_click = TrackEvent._('unlock_botton_click');

  /// 开黑按钮点击
  static const order_button_click = TrackEvent._('order_button_click');

  /// 礼物图鉴里面选择点亮模式
  static const lighten_exposure = TrackEvent._('lighten_exposure');

  /// 礼物图鉴里面选择觉醒模式
  static const awaken_exposere = TrackEvent._('awaken_exposere');

  /// 技能取消
  static const quit_skill = TrackEvent._('quit_skill');

  /// 限时充值大礼包打开
  static const recharge_pop_exposure = TrackEvent._('recharge_pop_exposure');

  /// 限时充值大礼包关闭
  static const close_float_window = TrackEvent._('close_float_window');

  /// 关联房间-挂件进入小房
  static const click_small_room = TrackEvent._('click_small_room');

  /// 关联房间-弹框进入小房
  static const click_pop_room = TrackEvent._('click_pop_room');

  /// 关联房间-返回大房
  static const click_big_room = TrackEvent._('click_big_room');

  /// 全服喇叭曝光
  static const global_horn_exposure = TrackEvent._('trumpet_layer_enter');

  /// 点击亲密卡入口
  static const click_intimate_card = TrackEvent._('click_card');

  /// 点击“再给点”按钮
  static const click_intimate_card_give_more = TrackEvent._('click_give_more');

  /// 点击“还想要”按钮
  static const click_intimate_card_want_more = TrackEvent._('click_want_more');

  /// 亲密卡解绑成功
  static const untie_intimate_card_success = TrackEvent._('untie_card_success');

  /// 亲密卡领取成功
  static const receive_card_sucess = TrackEvent._('receive_card_sucess');

  /// 亲密卡赠送成功
  static const send_card_success = TrackEvent._('send_card_success');
}

/// 信息流数据上报，哪个界面的动态
enum MomentFlowPage {
  Follow, // 首页关注子页面
  Recommend, // 首页推荐子页面
  NetDetail, // 圈子详情页
  TopicDetail, // 话题详情页
  MomentDetail, // 动态详情页
  User, // 个人资料页
  FollowToDetail,
  RecommendToDetail,
  UserToDetail,
  NetDetailToDetail,
  TopicDetailToDetail,
  WebView, // 外链
  InteractionMessage, // 互动消息
  Album, // 相册
  GlobalMoment, //全局动态
  Chat, //聊天
  SingerClub, // 歌友会
  WorkSquare, // 作品广场
  SmallMood, // 小心情
  weekStatistic,
}

String getFlowPage(MomentFlowPage? page) {
  switch (page) {
    case MomentFlowPage.Follow:
      return 'follow';
    case MomentFlowPage.Recommend:
      return 'recommend';
    case MomentFlowPage.NetDetail:
      return 'net_detail';
    case MomentFlowPage.TopicDetail:
      return 'topic_detail';
    case MomentFlowPage.MomentDetail:
      return 'moment_detail';
    case MomentFlowPage.User:
      return 'user';
    case MomentFlowPage.FollowToDetail:
      return 'follow_to_detail';
    case MomentFlowPage.RecommendToDetail:
      return 'recommend_to_detail';
    case MomentFlowPage.UserToDetail:
      return 'net_detail_to_detail';
    case MomentFlowPage.NetDetailToDetail:
      return 'topic_detail_to_detail';
    case MomentFlowPage.TopicDetailToDetail:
      return 'moment_detail_to_detail';
    case MomentFlowPage.WebView:
      return 'webView';
    case MomentFlowPage.InteractionMessage:
      return 'InteractionMessage';
    case MomentFlowPage.Album:
      return 'album';
    case MomentFlowPage.SingerClub:
      return 'singer_club';
    case MomentFlowPage.SmallMood:
      return 'small_mood';
    default:
      return '';
  }
}
