import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/gift_wall_v2/controller/gift_wall_controller.dart';
import 'package:personaldata/src/gift_wall_v2/widget/star_widget.dart';
import '../../../k.dart';
import '../../../assets.dart';
import '../../api/gift_wall_api.dart';
import '../../personal_util.dart';
import '../model/gift_util.dart';
import 'level_up_dialog.dart';
import 'package:get/get.dart';

enum BtnType {
  TYPE_UNAWAKE, // 未达到觉醒条件
  TYPE_AWAKE, // 可以觉醒，有动画
  TYPE_AWAKE_NO_ANIM, // 可以觉醒，无动画
  TYPE_AWOKEN, // 已觉醒
  TYPE_SEND, // 帮ta点亮
  TYPE_SEND_DISABLE, // 帮ta点亮(礼物未上架)
  TYPE_LIGHT, //去赠送
  TYPE_LIGHT_DISABLE, //去赠送(礼物未上架)
  NONE, //未知状态
}

extension BtnTypeExt on BtnType {
  String get name {
    switch (this) {
      case BtnType.TYPE_UNAWAKE:
      case BtnType.TYPE_AWAKE:
      case BtnType.TYPE_AWAKE_NO_ANIM:
        return K.gift_wall_awake_state_1;
      case BtnType.TYPE_AWOKEN:
        return K.gift_wall_awake_state_2;
      case BtnType.TYPE_SEND:
      case BtnType.TYPE_SEND_DISABLE:
        return K.gift_wall_dialog_btn_1;
      case BtnType.TYPE_LIGHT:
      case BtnType.TYPE_LIGHT_DISABLE:
        return K.gift_wall_dialog_btn_2;
      default:
        return "Confirm";
    }
  }
}

class GiftDetailDialog extends StatefulWidget {
  final GiftMeta? giftItem;
  final int jumpRid; // 跳转到用户的房间rid
  final int rid; // 送礼人的房间rid
  final int toUid;
  final GiftBookRuleInfo? rule;
  final String? roomType;
  final String? giftType;

  /// 是否是点亮模式
  final bool isChooseLightType;

  const GiftDetailDialog(
      {Key? key,
      this.giftItem,
      this.rid = 0,
      this.jumpRid = 0,
      this.toUid = 0,
      this.rule,
      this.roomType,
      this.giftType,
      this.isChooseLightType = false})
      : super(key: key);

  static Future<bool?> show(BuildContext context, GiftMeta? item, int toUid,
      GiftBookRuleInfo? ruleInfo, String giftType,
      {int rid = 0,
      int jumpRid = 0,
      String? roomType,
      bool isChooseLightType = false}) async {
    bool? result = await showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black45,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            insetPadding: EdgeInsets.zero,
            content: GiftDetailDialog(
              giftItem: item,
              jumpRid: jumpRid,
              rid: rid,
              toUid: toUid,
              rule: ruleInfo,
              roomType: roomType,
              giftType: giftType,
              isChooseLightType: isChooseLightType,
            ),
          );
        });
    return result;
  }

  @override
  State<StatefulWidget> createState() => GiftDetailDialogState();
}

class GiftDetailDialogState extends State<GiftDetailDialog>
    with TickerProviderStateMixin {
  static const String _tag = "GiftDetailDialogState";
  static bool showBtn = true;
  static bool isSelf = false;
  late AnimationController _animController;
  late Animation<double> _scale;
  late Animation<double> _rotate;
  static int _taskLevel = -1; // 觉醒之后, 该系列的等级[只有升级才会返回]
  static String _taskToast = ""; //觉醒之后，升级提示
  static bool _hasErased = false; // 是否已经擦除点亮信息
  @override
  void initState() {
    super.initState();
    isSelf = Session.uid == widget.toUid;
    Log.d(
        tag: "GiftDetailDialog",
        "show dialog: isSelf:$isSelf,toUid:$widget.toUid,self:${Session.uid},giftType:$widget.giftType");
    if (isSelf) {
      /// 主态（觉醒）（已觉醒和未点亮的不显示按钮）
      showBtn = (widget.giftItem?.isOn == true) &&
          (widget.giftItem?.awakeStatus != 2);
    } else {
      /// 客态(帮ta点亮，去赠送)
      showBtn = true;
    }

    ///点亮模式下不展示觉醒按钮
    if (widget.isChooseLightType) {
      showBtn = false;
    }

    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scale = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.linear));
    _rotate = Tween<double>(begin: pi, end: 0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.linear));
    _hasErased = widget.giftItem?.isErased ?? false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animController,
        builder: (context, widget) {
          var transform = Matrix4.identity();
          transform.rotateY(_rotate.value);
          transform.scale(_scale.value);
          return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: _buildDialog());
        });
  }

  Widget _buildDialog() {
    String bg = GiftUtil.getGiftBgInDialog(
        widget.giftItem?.qualityLevel ?? 0, showBtn ? true : false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            alignment: AlignmentDirectional.topCenter,
            width: 295.dp,
            height: showBtn ? 538.dp : 468.dp,
            padding: EdgeInsetsDirectional.only(
                top: 58.dp, bottom: 32.dp, start: 18.dp, end: 18.dp),
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(bg), fit: BoxFit.fitWidth),
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        R.img(Util.getRemoteImgUrl(widget.giftItem?.icon ?? ''),
                            width: 180.dp, height: 180.dp, fit: BoxFit.contain),
                        if (widget.giftItem?.awakeStatus == 2)
                          PositionedDirectional(
                              bottom: 0.dp,
                              child: R.img(
                                  Assets.personaldata$gift_wall_btn_awoken_webp,
                                  height: 43.dp)),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildContent(context),
                    ),
                    if (showBtn) _buildBtn(context),
                  ],
                ),
                if (!(widget.giftItem?.isOn ?? false))
                  PositionedDirectional(
                      top: 80.dp,
                      child: R.img(
                          Assets
                              .personaldata$gift_wall_gift_state_unlight_in_dialog_webp,
                          width: 160.dp,
                          height: 51.dp,
                          fit: BoxFit.contain,
                          package: ComponentManager.MANAGER_PERSONALDATA)),
              ],
            )),
        SizedBox(height: 20.dp),
        InkWell(
          child: R.img(Assets.personaldata$gift_wall_ic_close_svg,
              width: 32.dp,
              height: 32.dp,
              fit: BoxFit.contain,
              package: ComponentManager.MANAGER_PERSONALDATA),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.topStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.giftItem?.name ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16.dp)),
            SizedBox(height: 8.dp),

            ///礼物等级
            ///点亮模式下不展示礼物等级
            if (!widget.isChooseLightType)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(K.gift_wall_dialog_desc_1,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 14.dp)),
                  SizedBox(
                    width: 80.dp,
                    child: LightStarWidget(
                      totalNum: 5,
                      lightNum: widget.giftItem?.startNum ?? 0,
                      size: 15.dp,
                      fromGiftDetailDialog: true,
                    ),
                  ),
                  SizedBox(width: 5.dp),
                  if (widget.giftItem?.levelUpInfo.isNotEmpty == true)
                    Container(
                      constraints: BoxConstraints(maxWidth: 60.dp),
                      padding: EdgeInsetsDirectional.only(
                          start: 2.dp, end: 2.dp, top: 2.dp, bottom: 2.dp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(4.dp),
                          color: Colors.white.withOpacity(0.15)),
                      child: Text(widget.giftItem?.levelUpInfo ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 10.dp)),
                    ),
                  SizedBox(width: 2.dp),
                  InkWell(
                    child: R.img(
                      BaseAssets.titlebar_ic_titlebar_question_svg,
                      color: Colors.white,
                      width: 14.dp,
                      height: 14.dp,
                      package: ComponentManager.MANAGER_BASE_CORE,
                    ),
                    onTap: () {
                      showGiftLevelDescDialog(context);
                    },
                  ),
                ],
              ),
            if (!widget.isChooseLightType) SizedBox(height: 8.dp),

            ///礼物价值
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(K.gift_wall_dialog_desc_2,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14.dp)),
                R.img(MoneyConfig.moneyIcon, width: 18.dp),
                Text("${widget.giftItem?.price ?? ''}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 14.dp)),
              ],
            ),
            SizedBox(height: 8.dp),

            /// 冠名信息
            ///点亮模式下不展示冠名信息
            if (!widget.isChooseLightType)
              Row(
                children: [
                  Text(K.gift_wall_dialog_desc_4,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 14.dp)),
                  if ((widget.giftItem?.namingUser.uid ?? 0) > 0) ...[
                    CommonAvatar(
                      path: widget.giftItem?.namingUser.icon,
                      size: 20.dp,
                      shape: BoxShape.circle,
                    ),
                    SizedBox(width: 3.dp),
                  ],
                  Expanded(
                      child: Text(
                          (widget.giftItem?.namingUser.uid ?? 0) <= 0
                              ? K.gift_wall_absent
                              : widget.giftType == "send"
                                  ? K.gift_wall_dialog_send(
                                      [widget.giftItem?.namingUser.name ?? ''])
                                  : K.gift_wall_dialog_receive(
                                      [widget.giftItem?.namingUser.name ?? '']),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14.dp))),
                ],
              ),
            if (!widget.isChooseLightType) SizedBox(height: 8.dp),

            ///获取方式
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(K.gift_wall_dialog_desc_5,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14.dp)),
                Expanded(
                    flex: 1,
                    child: Text(
                        widget.giftItem?.sourceDesc.isNotEmpty == true
                            ? widget.giftItem!.sourceDesc
                            : K.gift_wall_absent,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14.dp))),
              ],
            ),
            SizedBox(height: 8.dp),

            /// 第一次点亮时间
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(K.gift_wall_dialog_desc_3,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14.dp)),
                Expanded(child: _buildLightTime())
              ],
            ),
          ],
        ));
  }

  Widget _buildLightTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.dp),
        Row(
          children: [
            widget.giftItem?.lightTime == 0
                ? Text(K.gift_wall_absent,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14.dp))
                : Text(Utility.formatDateToDay(widget.giftItem?.lightTime ?? 0),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 14.dp)),
            SizedBox(width: 6.dp),
            if (isSelf && (widget.giftItem?.lightTime ?? 0) > 0)
              GestureDetector(
                child: R.img(Assets.personaldata$gift_wall_ic_eraser_webp,
                    width: 21.dp, height: 21.dp),
                onTap: () async {
                  bool? res = await showEraserDialog(context);
                  if (res == true) {
                    widget.giftItem?.isErased =
                        !(widget.giftItem?.isErased == true);
                    _hasErased = !_hasErased;
                    refresh();
                    if (widget.isChooseLightType) {
                      try {
                        GiftWallController giftXController =
                            Get.find<GiftWallController>();
                        giftXController.updateGiftList();
                      } catch (e) {}
                    }
                  }
                },
              )
          ],
        ),
        SizedBox(height: 2.dp),
        if (widget.giftItem?.lightUser.name.isNotEmpty == true &&
            _hasErased == false)
          Row(
            children: [
              CommonAvatar(
                path: widget.giftItem?.lightUser.icon,
                size: 20.dp,
                shape: BoxShape.circle,
              ),
              SizedBox(width: 3.dp),
              Expanded(
                child: Text(widget.giftItem?.lightUser.name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 12.dp)),
              )
            ],
          )
      ],
    );
  }

  Widget _buildBtn(BuildContext context) {
    BtnType btnType = BtnType.NONE;
    if (isSelf) {
      switch (widget.giftItem?.awakeStatus ?? 0) {
        case 0:
          btnType = BtnType.TYPE_UNAWAKE;
          break;
        case 1:
          btnType = (widget.giftItem?.awakeVapSize ?? 0) <= 0
              ? BtnType.TYPE_AWAKE_NO_ANIM
              : BtnType.TYPE_AWAKE;
          break;
        case 2:
          btnType = BtnType.TYPE_AWOKEN;
          break;
      }
    } else {
      if (widget.giftItem?.isOn ?? false) {
        btnType = (widget.giftItem?.isCanSend ?? false)
            ? BtnType.TYPE_SEND
            : BtnType.TYPE_SEND_DISABLE;
      } else {
        btnType = (widget.giftItem?.isCanSend ?? false)
            ? BtnType.TYPE_LIGHT
            : BtnType.TYPE_LIGHT_DISABLE;
      }
    }

    bool btnDisabled = (btnType == BtnType.TYPE_UNAWAKE ||
        btnType == BtnType.TYPE_AWAKE_NO_ANIM ||
        btnType == BtnType.TYPE_SEND_DISABLE ||
        btnType == BtnType.TYPE_LIGHT_DISABLE);

    return InkWell(
      onTap: () async {
        ///觉醒
        int id = widget.giftItem?.id ?? 0;
        if (btnType == BtnType.TYPE_AWAKE) {
          EasyLoading.instance
            ..loadingStyle = EasyLoadingStyle.custom
            ..radius = 10.dp
            ..indicatorType = EasyLoadingIndicatorType.circle
            ..backgroundColor = Colors.black.withOpacity(0.5)
            ..indicatorColor = R.color.mainBrandColor
            ..textColor = Colors.white;
          EasyLoading.show(
              status: K.gift_wall_awake_loading, dismissOnTap: true);
          Future.delayed(const Duration(milliseconds: 8000), () {
            CommonLoading.dismiss();
          });
          IRoomManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          int startTime = DateTime.now().millisecondsSinceEpoch;
          manager.showAnimOverlay(
              vapUrl: "static/gift_big/$id.awake.mp4",
              vapSize: widget.giftItem?.awakeVapSize ?? 0,
              onlyShowInRoom: false,
              onStartPlay: () async {
                int endTime = DateTime.now().millisecondsSinceEpoch;
                Log.d(
                    tag: _tag,
                    "onStartPlay,time cost:${endTime - startTime} ms");
                CommonLoading.dismiss();

                ///上报觉醒成功
                GiftBookAwakeRsp rsp = await GiftWallApi.awakeGift(
                    id, widget.giftType ?? '',
                    rid: widget.rid ?? 0);
                if (rsp.success) {
                  if (Navigator.of(context).canPop())
                    Navigator.of(context).pop(true);
                  Log.d(tag: _tag, "awake succeed");
                  if (widget.giftType == 'send') {
                    AppConfig.saveAwakenedGifts(
                        Constant.awakenedGifts..add(id.toString()));
                  }
                  _taskLevel = rsp.data.levelNew;
                  _taskToast = rsp.data.toast;
                }
              },
              onComplete: () async {
                Log.d(tag: _tag, "onComplete: $_taskLevel,$_taskToast");
                if (_taskLevel <= 0 || _taskToast.isEmpty) {
                  return;
                }
                LevelUpDialog.show(System.context, _taskToast, () async {
                  NormalNull res = await GiftWallApi.getSingleAward(
                      widget.giftType ?? '',
                      widget.giftItem?.seriesType ?? '',
                      _taskLevel);
                  if (res.success) {
                    Fluttertoast.showCenter(msg: res.msg);
                    if (Navigator.of(System.context).canPop()) {
                      Navigator.pop(System.context);
                    }
                    IVipManager vipManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_VIP);
                    vipManager.showBagPage(System.context, tabType: "gift");
                  } else {
                    Fluttertoast.showCenter(msg: res.msg);
                  }
                });
              });
        } else if (btnType == BtnType.TYPE_UNAWAKE) {
          Toast.showCenter(context, K.gift_wall_awake_toast);
        } else if (btnType == BtnType.TYPE_AWAKE_NO_ANIM) {
          ///可以觉醒，无动效
          Toast.showCenter(context, K.gift_wall_awake_toast_1);
        } else if (btnType == BtnType.TYPE_SEND ||
            btnType == BtnType.TYPE_LIGHT) {
          /// 去赠送 or 帮ta点亮
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          Log.d(tag: _tag, "jump Room:${widget.jumpRid}");
          PersonalUtil.jumpRoom(System.context, widget.jumpRid, widget.toUid,
              refer: 'GiftBook', giftId: id);
        } else if (btnType == BtnType.TYPE_SEND_DISABLE ||
            btnType == BtnType.TYPE_LIGHT_DISABLE) {
          ///礼物下架，无法赠送
          Toast.showCenter(context, K.gift_wall_send_toast);
        }
        String actionType = widget.giftItem?.awakeStatus == 0
            ? ((widget.giftItem?.isOn ?? false)
                ? 'to_light_up'
                : 'help_light_up')
            : 'awaken';
        Tracker.instance
            .track(TrackEvent.gift_handbook_button_click, properties: {
          'target_uid': widget.toUid,
          'uid': Session.uid,
          'action_type': actionType,
          'rid': widget.rid,
          'room_type': widget.roomType,
        });
      },
      child: Container(
        width: 184.dp,
        height: 54.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              opacity: btnDisabled ? 0.5 : 1,
              image: AssetImage(btnDisabled
                  ? GiftUtil.getBtnBg(widget.giftItem?.qualityLevel ?? 0)
                  : GiftUtil.getBtnBg(widget.giftItem?.qualityLevel ?? 0))),
        ),
        child: Text(btnType.name,
            style: TextStyle(
                letterSpacing: 8.dp,
                fontWeight: FontWeight.w600,
                color:
                    btnDisabled ? Colors.white.withOpacity(0.5) : Colors.white,
                fontSize: 20.dp)),
      ),
    );
  }

  void showGiftLevelDescDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black45,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            alignment: AlignmentDirectional.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            insetPadding: EdgeInsets.zero,
            title: Container(
              alignment: AlignmentDirectional.center,
              child: Text(K.gift_wall_dialog_title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF313131),
                      fontSize: 16.dp)),
            ),
            content: _buildLevelDescContent(),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40.dp,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: R.color.mainBrandColor,
                    borderRadius: BorderRadiusDirectional.circular(50.dp),
                  ),
                  child: Text(K.personal_sure,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14.dp)),
                ),
              ),
            ],
          );
        });
  }

  /// 橡皮擦
  Future<bool?> showEraserDialog(BuildContext context) {
    return showDialog<bool>(
        barrierDismissible: true,
        barrierColor: Colors.black45,
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: K.gift_wall_eraser_title,
            content: _hasErased
                ? K.gift_wall_eraser_content_recover(
                    ["${widget.giftItem?.eraserRestoreMoney ?? 0}"])
                : K.gift_wall_eraser_content_use(
                    ["${widget.giftItem?.eraserRemoveMoney ?? 0}"]),
            contentTextColor: R.color.mainTextColor,
            positiveButton: PositiveButton(
              text: K.personal_sure,
              useGradientBg: true,
              gradientBg: R.color.mainBrandGradientColors,
              onPressed: () async {
                int? price = _hasErased
                    ? widget.giftItem?.eraserRestoreMoney
                    : widget.giftItem?.eraserRemoveMoney;

                /// 先判断是否余额不足
                final IPayManager payManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PAY);
                SheetCallback? result = await payManager.showRechargeSheet(
                    System.context, price ?? 0);
                if (result == null ||
                    result.reason == SheetCloseReason.Active) {
                  return;
                }
                payManager.pay(context,
                    key: 'gift_book_eraser',
                    type: result.value?.key ?? 'available',
                    refer: 'gift-book',
                    args: {
                      'money': price ?? 0,
                      'type': 'slp-consume',
                      'params': {
                        'consume_type': 'gift_book_eraser',
                        'eraser_type': _hasErased ? 'restore' : 'remove',
                        'gid': widget.giftItem?.id ?? 0,
                        'type': widget.giftType
                      }
                    },
                    showLoading: true, onPayed: () {
                  Navigator.of(context).pop(true);
                  Log.d(tag: _tag, "onPayed");
                }, onError: (isErrorCatch) {
                  Log.d(tag: _tag, "onError");
                }, onPayAppOpen: () {
                  Log.d(tag: _tag, "onPayAppOpen");
                });
              },
            ),
            negativeButton: NegativeButton(
              text: K.cancel,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          );
        });
  }

  Widget _buildLevelDescContent() {
    List res = [];
    if (widget.rule != null && widget.rule?.list.isNotEmpty == true) {
      for (var element in widget.rule!.list) {
        res.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(element.k,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.9),
                  fontSize: 14.dp)),
          Text(": ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.9),
                  fontSize: 14.dp)),
          Text(element.val,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.9),
                  fontSize: 14.dp))
        ]));
      }
    }
    return Container(
        padding: EdgeInsetsDirectional.only(top: 20.dp, bottom: 20.dp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.rule == null ? "" : widget.rule?.title ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.9),
                    fontSize: 14.dp)),
            ...res
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }
}
