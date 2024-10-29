// import 'dart:async';
// import 'dart:convert';
//
// import 'package:shared/shared.dart' hide MessageContent, MessageType;
// import 'package:shared/model/base_response.dart';
// import 'package:flutter/material.dart';
// import 'package:chat_room/k.dart';
// import 'package:chat_room/chat_room.dart';
// import 'package:chat_room/src/base/page/user_levelup_dialog.dart';
//
// import 'model/gift_combo_model.dart';
//
// /// 礼物连击状态
// bool isBigGiftComboDoing = false;
//
// /// 修改礼物连击状态
// void onBigGiftComboStatusChange(bool isCombo) {
//   isBigGiftComboDoing = isCombo;
//   UserLevelUpDialog.setLockDialog(isBigGiftComboDoing);
// }
//
// /// 大的礼物连击效果，同一房间同一时间只能有一个用户发起礼物连击
// class BigGiftComboWidget extends StatefulWidget {
//   final ChatRoomData room;
//   final bool topFloor; // 是否显示最顶层，避免连击礼物覆盖了全屏礼物，只有连击者显示在最顶层
//   const BigGiftComboWidget({Key key, this.room, this.topFloor = false}) : super(key: key);
//
//   @override
//   _BigGiftComboWidgetState createState() => _BigGiftComboWidgetState();
// }
//
// class _BigGiftComboWidgetState extends State<BigGiftComboWidget> {
//   GiftCombo _giftCombo;
//   GlobalKey _itemGlobalKey;
//
//   @override
//   void initState() {
//     super.initState();
//     widget.room.addListener(RoomConstant.Event_Message, _onMessageChanged);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     widget.room.removeListener(RoomConstant.Event_Message, _onMessageChanged);
//   }
//
//   /// 收到发送礼物消息，处理其中的连击消息
//   _onMessageChanged(String type, Object data) {
//     try {
//       MessageContent message = data;
//       if (message?.type == MessageType.Package && message.isBigGiftComboMessage()) {
//         if (widget.topFloor && message.extra['uid'] != Session.uid) return;
//         GiftCombo giftCombo = GiftCombo.fromJson(jsonDecode(jsonEncode(message.extra)));
//         if (giftCombo?.gift == null) return;
//         if (_giftCombo == null) {
//           setState(() {
//             _itemGlobalKey = GlobalKey();
//             _giftCombo = giftCombo;
//           });
//         } else if (_giftCombo != null && _giftCombo.uuid == giftCombo.uuid) {
//           setState(() {
//             _giftCombo = giftCombo;
//           });
//         } else {
//           // 同一时间只显示一个连击
//         }
//       }
//     } catch (e) {
//       Log.d(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget body;
//     if (_giftCombo == null) {
//       body = Container();
//     } else {
//       body = _BigGiftComboItem(
//         key: _itemGlobalKey,
//         room: widget.room,
//         giftCombo: _giftCombo,
//         completeCallback: _onGiftComboComplete,
//       );
//     }
//     return body;
//   }
//
//   /// 礼物连接完成
//   _onGiftComboComplete() {
//     setState(() {
//       _giftCombo = null;
//     });
//   }
// }
//
// class _BigGiftComboItem extends StatefulWidget {
//   final ChatRoomData room;
//   final GiftCombo giftCombo;
//   final VoidCallback completeCallback;
//
//   _BigGiftComboItem({Key key, this.room, this.giftCombo, this.completeCallback}) : super(key: key);
//
//   @override
//   _BigGiftComboItemState createState() => _BigGiftComboItemState();
// }
//
// class _BigGiftComboItemState extends State<_BigGiftComboItem> with TickerProviderStateMixin {
//   final int comboInterval = 2; //礼物连接间隔时间
//
//   final double giftSize = 180; // 礼物大小
//   final double numBgWidth = 164; // 文字背景宽度
//   final double btnSize = 80; // 连击按钮大小
//
//   GlobalKey<MultiframeImageState> _buttonAnimKey;
//   GlobalKey<MultiframeImageState> _numBgKey;
//
//   AnimationController _showAnimationController;
//   AnimationController _addAnimationController;
//   AnimationController _dismissAnimationController;
//
//   double _globalOpacity = 0; // 整个UI的透明度
//   double _btnAnimProgress = 1; // 按钮动画进度
//   double _numScale = 1; // 礼物数字大小缩放大小
//   double _giftScale = 1; // 礼物缩放大小
//   double _numBgTranslateX = 0; // 礼物数字背景平移大小
//   double _numBgOpacity = 1; // 礼物数字背景透明度
//   double _userInfoStart = 0; // 用户信息Widget X相对位置
//
//   int _hitNum = 0;
//
//   List<RoomPosition> _users; // 所有的麦上用户
//   Timer _dismissTimer; // 消失定时器
//   int _showTime = 0; // 显示时间
//
//   @override
//   void initState() {
//     super.initState();
//     IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
//     if (giftManager != null) {
//       _users = giftManager.getGiftUsers(widget.room) as List<RoomPosition>;
//     }
//     _buttonAnimKey = GlobalKey();
//     _numBgKey = GlobalKey();
//     _hitNum = widget.giftCombo.comboNum;
//     _onShowAnimation();
//     _dismissTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//       _showTime++;
//
//       /// 非连击发起者通过倒计时结束，连击发起者通过按钮动画时间结束
//       if (_showTime > comboInterval && widget.giftCombo.uid != Session.uid) {
//         _onDismissAnimate();
//       }
//     });
//
//     /// 礼物连击开始，更新连击状态
//     if (_isSelf()) {
//       onBigGiftComboStatusChange(true);
//     }
//   }
//
//   @override
//   void dispose() {
//     _showAnimationController?.dispose();
//     _addAnimationController?.dispose();
//     _dismissAnimationController?.dispose();
//     // 取消倒计时
//     _dismissTimer?.cancel();
//     // 修改礼物连击状态
//     if (_isSelf()) {
//       onBigGiftComboStatusChange(false);
//     }
//     super.dispose();
//   }
//
//   /// 初始显示动画：
//   /// 1. 连击按钮从底部弹出
//   /// 2. 礼物和数字放大和渐变从0到1
//   /// 3. 数字背景从左到右划出
//   void _onShowAnimation() {
//     if (_showAnimationController == null) {
//       _showAnimationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
//       Tween<double>(begin: 0.0, end: 1.0).animate(_showAnimationController)
//         ..addListener(() {
//           setState(() {
//             double value = _showAnimationController.value;
//             _globalOpacity = value;
//             _btnAnimProgress = value;
//             _numScale = value;
//             _giftScale = value;
//             _numBgOpacity = value;
//             _numBgTranslateX = 40 * (value - 1);
//             _userInfoStart = (Util.width / 2 + giftSize / 2) * (1 - value);
//           });
//         });
//     } else {
//       _showAnimationController.reset();
//     }
//     _showAnimationController.forward();
//   }
//
//   /// 礼物连击动画
//   /// 1. 礼物放大从1-1.2-1
//   /// 2. 数字放大从1-1.6-1
//   /// 3. 数字背景横移 右边移出-左边移入
//   void _onAddAnimate() {
//     if (_addAnimationController == null) {
//       _addAnimationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
//       Tween<double>(begin: 0.0, end: 1.0).animate(_addAnimationController)
//         ..addListener(() {
//           setState(() {
//             double value = _addAnimationController.value;
//             _globalOpacity = 1;
//             _btnAnimProgress = 1;
//             if (value < 0.5) {
//               _numScale = value * 1.2 + 1;
//               _giftScale = value * 0.4 + 1;
//               _numBgTranslateX = numBgWidth / 2 * value;
//               _numBgOpacity = value * -2 + 1;
//             } else {
//               _numScale = value * -1.2 + 2.2;
//               _giftScale = value * -0.4 + 1.2;
//               _numBgTranslateX = numBgWidth / 2 * (value - 1);
//               _numBgOpacity = (value - 0.5) * 2;
//             }
//           });
//         });
//     } else {
//       _addAnimationController.reset();
//     }
//     _addAnimationController.forward();
//   }
//
//   /// 连击结束
//   void _onDismissAnimate() {
//     if (_dismissAnimationController == null) {
//       _dismissAnimationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this)
//         ..addStatusListener((status) {
//           if (status == AnimationStatus.completed) {
//             widget.completeCallback();
//           }
//         });
//       Tween<double>(begin: 0.0, end: 1.0).animate(_dismissAnimationController)
//         ..addListener(() {
//           setState(() {
//             _globalOpacity = 1 - _dismissAnimationController.value;
//           });
//         });
//     } else {
//       _dismissAnimationController.reset();
//     }
//     _dismissAnimationController.forward();
//   }
//
//   /// 是否自己发起的连击
//   bool _isSelf() {
//     return widget.giftCombo.uid == Session.uid;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_hitNum != widget.giftCombo.comboNum) {
//       _hitNum = widget.giftCombo.comboNum;
//       _buttonAnimKey?.currentState?.replay();
//       _showTime = 0;
//       _onAddAnimate();
//     }
//     return GestureDetector(
//       behavior: _isSelf() ? HitTestBehavior.opaque : HitTestBehavior.translucent,
//       child: Padding(
//         padding: EdgeInsetsDirectional.only(top: 246 * Util.ratio),
//         child: Opacity(
//           opacity: _globalOpacity,
//           child: Stack(
//             alignment: AlignmentDirectional.topCenter,
//             children: [
//               _renderComboGift(),
//               if (_isSelf())
//                 PositionedDirectional(
//                   bottom: Util.iphoneXBottom + (btnSize + 58) * _btnAnimProgress - btnSize,
//                   child: _renderComboBtn(),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// 礼物及数量
//   Widget _renderComboGift() {
//     return Stack(
//       clipBehavior: Clip.none,
//       alignment: AlignmentDirectional.center,
//       children: [
//         SizedBox(
//           width: giftSize,
//           height: giftSize,
//         ),
//         PositionedDirectional(
//           start: -18,
//           end: -18,
//           top: -18,
//           bottom: -18,
//           child: Center(
//             child: Image.network(Util.giftImgUrl(widget.giftCombo.gift.id),
//                 fit: BoxFit.fill, width: giftSize * _giftScale, height: giftSize * _giftScale),
//           ),
//         ),
//         PositionedDirectional(
//           bottom: 22,
//           end: -34,
//           child: Stack(
//             clipBehavior: Clip.none,
//             alignment: AlignmentDirectional.center,
//             children: [
//               SizedBox(
//                 width: numBgWidth,
//                 height: 60,
//               ),
//               Opacity(
//                 opacity: _numBgOpacity,
//                 child: Container(
//                   width: numBgWidth,
//                   height: 60,
//                   transform: Matrix4.translationValues(_numBgTranslateX, 0, 0),
//                   child: MultiframeImage.asset(
//                     R.imagePath('big_gift_combo_num_bg.webp', package: ComponentManager.MANAGER_ROOM),
//                     loop: true,
//                     key: _numBgKey,
//                   ),
//                 ),
//               ),
//               PositionedDirectional(
//                 start: 47,
//                 top: 22,
//                 child: NumText('X',
//                     style: TextStyle(
//                         fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic)),
//               ),
//               PositionedDirectional(
//                   start: 66,
//                   bottom: 0,
//                   top: -5,
//                   child: Center(
//                     child: NumText('${widget.giftCombo.comboNum}',
//                         style: TextStyle(
//                             fontSize: 40 * _numScale,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.italic)),
//                   )),
//             ],
//           ),
//         ),
//         PositionedDirectional(start: -18 + _userInfoStart, bottom: -39, child: _renderUserInfo()),
//       ],
//     );
//   }
//
//   /// 用户信息
//   Widget _renderUserInfo() {
//     GiftCombo giftCombo = widget.giftCombo;
//     return Stack(
//       alignment: AlignmentDirectional.topCenter,
//       children: [
//         R.img(
//           'big_gift_combo_info_bg.png',
//           package: ComponentManager.MANAGER_ROOM,
//           width: 217,
//           height: 68,
//           fit: BoxFit.fill,
//         ),
//         PositionedDirectional(
//           start: 20,
//           end: 20,
//           top: 8,
//           child: Container(
//             height: 34,
//             width: 177,
//             padding: EdgeInsetsDirectional.only(start: 2, end: 22),
//             alignment: AlignmentDirectional.centerStart,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(17),
//               gradient: LinearGradient(colors: [Color(0xFF8C48DF), Color(0xFF6B59FF)]),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Stack(
//                   children: [
//                     CommonAvatar(path: giftCombo.icon, size: 30, shape: BoxShape.circle),
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white, width: 1)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 2),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           Flexible(
//                             child: Text(
//                               giftCombo.from,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             K.room_bidding_send_gift,
//                             style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Flexible(
//                             child: MarqueeText(
//                               text: giftCombo.toNames ?? '',
//                               speed: 20,
//                               style: TextStyle(
//                                   color: Colors.white.withOpacity(0.7), fontSize: 10, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   /// 连击按钮
//   Widget _renderComboBtn() {
//     return GestureDetector(
//       onTap: _pay,
//       behavior: HitTestBehavior.opaque,
//       child: Container(
//         width: 120,
//         height: btnSize,
//         alignment: AlignmentDirectional.center,
//         child: SizedBox(
//           width: btnSize,
//           height: btnSize,
//           child: MultiframeImage.asset(
//             R.imagePath('big_gift_combo_btn.webp', package: ComponentManager.MANAGER_ROOM),
//             key: _buttonAnimKey,
//             onComplete: _onDismissAnimate,
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// 支付
//   void _pay() async {
//     Gift gift = widget.giftCombo.gift;
//     GiftCombo giftCombo = widget.giftCombo;
//     int price = _getPrice(gift);
//     int totalPrice = price * giftCombo.uids.length;
//
//     BaseResponse baseResponse = await BigGiftComboApi.payCombo(
//         type: 'package', totalMoney: totalPrice.toString(), param: widget.giftCombo.params);
//     if (baseResponse.success) {
//       _onPayed();
//     } else {
//       _onPayError(baseResponse.msg);
//     }
//   }
//
//   /// 支付成功回调
//   void _onPayed() {
//     if (mounted) {
//       if (_buttonAnimKey.currentState != null) {
//         _buttonAnimKey.currentState.replay();
//       }
//     }
//     Gift gift = widget.giftCombo.gift;
//     GiftCombo giftCombo = widget.giftCombo;
//     int price = _getPrice(gift);
//     int totalPrice = price * giftCombo.uids.length;
//     Map properties = <String, dynamic>{
//       'scene': 'room',
//       'rid': widget.room?.rid,
//       'gift_name': gift.name,
//       'gift_id': gift.id,
//       'gift_price': price,
//       'gift_num': 1,
//       'user_num': giftCombo.uids.length,
//       'total_price': price,
//       'gift_type': gift.giftType,
//       'is_combo': 1,
//       'combo_num': (_hitNum + 1),
//       if (!Util.isNullOrEmpty(widget.room?.config?.typeName))
//         'type_label': widget.room?.config?.typeName,
//       if (!Util.isNullOrEmpty(widget.room?.config?.originalRFT))
//         'room_factory_type': widget.room?.config?.originalRFT,
//       if (!Util.isNullOrEmpty(widget.room?.config?.settlementChannel))
//         'settlement_channel': widget.room?.config?.settlementChannel,
//     };
//     if (widget.room.config != null) {
//       properties['chat_room_type'] = widget.room.config.type;
//       properties['chat_room_property'] = widget.room.config.property.toString();
//       properties['chat_room_types'] = widget.room.config.types.toString();
//     }
//
//     if (widget.room?.config?.game == Games.Wolf) {
//       IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
//       properties['game_type'] = wereWolfManager.getGameType();
//     }
//
//     giftCombo.uids.forEach((element) {
//       properties['to_uid'] = element;
//       Tracker.instance.track(TrackEvent.send_gift, properties: properties);
//     });
//
//   }
//
//   /// 支付失败回调
//   void _onPayError(String msg) async {
//     Log.d('big gift combo fail: $msg');
//     if (msg != null && msg.isNotEmpty) {
//       Fluttertoast.showToast(msg: msg);
//     }
//   }
//
//   int _getPrice(Gift gift) {
//     int giftPrice;
//     if (gift.giftType == 'coin') {
//       // 金币礼物以实际下发的为价格
//       giftPrice = gift.price.round();
//     } else {
//       giftPrice = (gift.price * 100).round();
//     }
//     return giftPrice;
//   }
// }
