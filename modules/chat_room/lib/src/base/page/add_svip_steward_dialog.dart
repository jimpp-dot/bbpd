import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluwx/fluwx.dart' as FlutterWx;

import '../../../assets.dart';

/// 解锁SVIP管家（当用户达到15级且为老板角色时，弹窗显示KA权益和添加SVIP客服操作）

class AddSVipStewardDialog extends StatefulWidget {
  /// 数据
  final FriendKAStewardData data;

  /// 仅展示一次
  final bool oneOnly;

  /// 始终展示
  final bool alwaysShow;

  /// 点击去微信按钮
  final VoidCallback? confirmCallback;

  /// 点击关闭按钮
  final VoidCallback? closeCallback;

  const AddSVipStewardDialog(this.data,
      {Key? key,
      this.oneOnly = false,
      this.alwaysShow = false,
      this.confirmCallback,
      this.closeCallback})
      : super(key: key);

  @override
  State<AddSVipStewardDialog> createState() => _AddSVipStewardDialogState();

  static Future<void> show(BuildContext context, Map extra,
      {bool oneOnly = false, bool alwaysShow = false}) async {
    if (extra.isNotEmpty) {
      if (Util.validStr(extra['ref']) && extra['ref'] == 'profile_page') {
        // 【我的】页面常驻气泡提示显示条件：在KA名单中，但未在建联名单的用户
        // 入口消失条件：用户已经进入到“已建联名单”，入口消失  或  15天后消失
        FriendKAStewardData kaStewardData = FriendKAStewardData()
          ..title = Util.parseStr(extra['title']) ?? ''
          ..desc = Util.parseStr(extra['desc']) ?? ''
          ..stewardId = Util.parseInt(extra['stewardId'])
          ..qrUrl = Util.parseStr(extra['qrUrl']) ?? ''
          ..programPath = Util.parseStr(extra['programPath']) ?? ''
          ..programName = Util.parseStr(extra['programName']) ?? '';
        Tracker.instance.track(
          TrackEvent.click,
          properties: {'click_page': 'KApopEntrance'},
        );

        String curName = appNavigatorObserver.getLast();
        if (curName != '/') {
          //收到通知，不在首页不弹
          return;
        }

        AddSVipStewardDialog._show(context, kaStewardData,
            oneOnly: oneOnly, alwaysShow: alwaysShow, confirmCallback: () {
          Tracker.instance.track(
            TrackEvent.click,
            properties: {'click_page': 'KApopEntrance_housekeeper_button'},
          );
        }, closeCallback: () {
          Tracker.instance.track(
            TrackEvent.click,
            properties: {'click_page': 'KApopEntrance_housekeeper_close'},
          );
        });
      } else {
        // extra代表存量用户数据，如果有则优先走存量用户KA建联
        FriendKAStewardData kaStewardData = FriendKAStewardData()
          ..title = Util.parseStr(extra['title']) ?? ''
          ..desc = Util.parseStr(extra['desc']) ?? ''
          ..stewardId = Util.parseInt(extra['stewardId'])
          ..qrUrl = Util.parseStr(extra['qrUrl']) ?? ''
          ..programPath = Util.parseStr(extra['programPath']) ?? ''
          ..programName = Util.parseStr(extra['programName']) ?? '';
        Tracker.instance.track(TrackEvent.view_housekeeper_pop, properties: {
          'gs_id': kaStewardData.stewardId.toString(),
          'pop_state': 'stock_user_show'
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AddSVipStewardDialog._show(context, kaStewardData,
              oneOnly: oneOnly, alwaysShow: alwaysShow);
        });
        Config.setBool(
            '${Session.uid}_stock_user_show_svip_steward_dialog', false);
      }
      return;
    }
    // 2、当回到一级页面的时候，会检查是否SVIP管家弹框
    ResFriendKASteward resp = await RelationshipApi.getFriendsSteward();
    if (resp.success && resp.hasData() && resp.data.qrUrl.isNotEmpty == true) {
      if (alwaysShow) {
        // 数据上报
        if (resp.data.hasStewardId()) {
          Tracker.instance.track(TrackEvent.view_housekeeper_pop, properties: {
            'gs_id': resp.data.stewardId.toString(),
            'pop_state': 'vip_privilege_show'
          });
        }
        AddSVipStewardDialog._show(System.context, resp.data,
            oneOnly: oneOnly, alwaysShow: alwaysShow);
      } else {
        // 第一次需要记录显示svip管家弹框，第二次则直接设置为false，后面就不会弹框了
        Config.setBool('${Session.uid}_show_svip_steward_dialog', !oneOnly);
        // 数据上报
        if (resp.data.hasStewardId()) {
          Tracker.instance.track(TrackEvent.view_housekeeper_pop, properties: {
            'gs_id': resp.data.stewardId.toString(),
            'pop_state': oneOnly ? 'show' : 'load'
          });
        }
        // 是否弹框
        if (oneOnly) {
          AddSVipStewardDialog._show(System.context, resp.data,
              oneOnly: oneOnly);
        }
      }
    }
  }

  static Future<void> _show(BuildContext context, FriendKAStewardData data,
      {bool oneOnly = false,
      bool alwaysShow = false,
      VoidCallback? confirmCallback,
      VoidCallback? closeCallback}) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: AddSVipStewardDialog(
            data,
            oneOnly: oneOnly,
            alwaysShow: alwaysShow,
            confirmCallback: confirmCallback,
            closeCallback: closeCallback,
          ),
        );
      },
    );
  }
}

class _AddSVipStewardDialogState extends State<AddSVipStewardDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 297.0,
          height: 564,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                scale: 2,
                centerSlice: const Rect.fromLTWH(100, 200, 2, 2),
                image: AssetImage(R.imagePath(
                    RoomAssets.svip_steward_svip_steward_dialog_bg_png,
                    package: ComponentManager.MANAGER_BASE_ROOM)),
              )),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              PositionedDirectional(
                top: 33,
                start: 30,
                child: Text(
                  widget.data.title,
                  style: const TextStyle(
                      color: Color(0xff773608),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              PositionedDirectional(
                top: 55,
                start: 30,
                child: Text(
                  widget.data.desc,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(color: Color(0xff75541F), fontSize: 10),
                ),
              ),
              PositionedDirectional(
                bottom: 50 + 20 + 10,
                child: SizedBox(
                  width: 295,
                  height: 351,
                  child: CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(widget.data.qrUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              PositionedDirectional(
                bottom: 20,
                start: 0,
                end: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      bool installed = false;
                      // try {
                      //   installed = await FlutterWx.isWeChatInstalled;
                      // } catch (e) {
                      //   installed = false;
                      // }
                      if (!installed) {
                        Fluttertoast.showCenter(
                            msg: K.room_check_is_install_wechat);
                        return;
                      }
                      // if (widget.data.hasProgramName() &&
                      //     widget.data.programName.isNotEmpty &&
                      //     widget.data.hasProgramPath() &&
                      //     widget.data.programPath.isNotEmpty) {
                      //   if (widget.confirmCallback != null) {
                      //     widget.confirmCallback?.call();
                      //   }
                      //   Tracker.instance.track(TrackEvent.click, properties: {
                      //     'click_page': widget.alwaysShow
                      //         ? 'vip_privilege_housekeeper_follow_button'
                      //         : 'housekeeper_follow_button',
                      //   });
                      //   if (!widget.alwaysShow) {
                      //     Config.setBool('${Session.uid}_again_show_svip_steward_dialog', false);
                      //   }
                      //   FlutterWx.launchWeChatMiniProgram(
                      //       username: widget.data.programName, path: widget.data.programPath);
                      //   Navigator.of(context).pop();
                      // }
                    },
                    child: Container(
                      height: 50,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFFFB168), Color(0xFFFDF696)]),
                      ),
                      child: Text(
                        K.room_add_enterprise_wechat_friends,
                        style: const TextStyle(
                            color: Color(0xFF954B17),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            if (widget.closeCallback != null) {
              widget.closeCallback?.call();
            }
            Tracker.instance.track(TrackEvent.click, properties: {
              'click_page': widget.alwaysShow
                  ? 'vip_privilege_housekeeper_follow_close'
                  : 'housekeeper_follow_close',
            });
            if (!widget.alwaysShow) {
              if (againShowSVipStewardDialog) {
                Config.setBool(
                    '${Session.uid}_again_show_svip_steward_dialog', false);
              } else {
                Config.setBool(
                    '${Session.uid}_again_show_svip_steward_dialog', true);
                AddSVipStewardSingleton.trigger();
              }
            }
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.clear_circled,
            size: 32,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

/// 处理解锁SVIP管家逻辑

var sVipInstance = AddSVipStewardSingleton.instance;
const int _hour = 3600;

bool get againShowSVipStewardDialog =>
    Config.getBool('${Session.uid}_again_show_svip_steward_dialog', false) &&
    Config.getInt('${Session.uid}_svip_steward_countdown', 0) > _hour;

class AddSVipStewardSingleton {
  static AddSVipStewardSingleton? _instance;

  static AddSVipStewardSingleton? get instance {
    _instance ??= AddSVipStewardSingleton._internal();
    return _instance;
  }

  AddSVipStewardSingleton._internal();

  /// 倒计时的时间
  int _countDown = 0;

  /// 定时器
  Timer? _timer;

  /// 触发倒计时
  static void trigger() {
    // 如果缓存里面已经>1小时，也不用处理了
    int countdown = Config.getInt('${Session.uid}_svip_steward_countdown', 0);
    // Log.d('AddSVipStewardSingleton.trigger------------------countdown1:$countdown');
    if (countdown > _hour) return;

    // 如果不用展示了，也不用处理了【这里主要是为了防止没有弹过框，但是在从后台进入前台/从退出登录到登录成功时，触发倒计时操作】
    if (Config.getBool(
            '${Session.uid}_again_show_svip_steward_dialog', false) ==
        false) return;

    // 如果已经在倒计时了，就不用处理了
    if (sVipInstance?._timer != null) return;

    sVipInstance?._countDown = countdown;

    // 进行倒计时
    sVipInstance?._timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      sVipInstance?._countDown += 1;
      // Log.d('AddSVipStewardSingleton.trigger------------------countdown2:${sVipInstance?._countDown ?? 0}');
      if ((sVipInstance?._countDown ?? 0) > _hour) {
        // 当>1小时，则取消定时任务，需要再次弹添加专属管家弹框
        if (sVipInstance?._timer == null) return;
        if (sVipInstance?._timer?.isActive == true)
          sVipInstance?._timer?.cancel();
        sVipInstance?._timer = null;
        Config.set('${Session.uid}_svip_steward_countdown',
            sVipInstance?._countDown.toString());
        // Log.d('AddSVipStewardSingleton.trigger------------------countdown3:${sVipInstance?._countDown ?? 0}');
      }
    });
  }

  /// 取消倒计时
  static void cancel() {
    // 如果缓存里面已经>1小时，不用处理了
    int countdown = Config.getInt('${Session.uid}_svip_steward_countdown', 0);
    if (countdown > _hour) return;

    // 如果定时器没了，就不用处理了；如果还在则先取消定时器，然后更新倒计时的缓存数据
    if (sVipInstance?._timer == null) return;
    if (sVipInstance?._timer?.isActive == true) {
      sVipInstance?._timer?.cancel();
      Config.set('${Session.uid}_svip_steward_countdown',
          (sVipInstance?._countDown ?? 0).toString());
    }
    sVipInstance?._timer = null;
  }
}
