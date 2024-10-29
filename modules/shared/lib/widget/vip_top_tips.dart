import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../k.dart';

/// 礼物顶部提示栏
class VipTopTips extends StatelessWidget {
  final bool isTitle; // 是否爵位
  final bool isVip; // 是否VIP
  final bool isKa; // 是否为ka
  final String? tips;
  final String? icon;
  final String? jumpPage;
  final bool isInRoom;
  final int? rid;
  final String? btnName;
  final bool isKnightGift;
  final String? jumpPath;
  final String? ownerIcon; //礼物专属用户头像
  final int? ownerUid; //礼物专属用户

  const VipTopTips({
    super.key,
    this.isTitle = false,
    this.isVip = false,
    this.isKa = false,
    this.tips,
    this.icon,
    this.jumpPage,
    this.isInRoom = false,
    this.rid,
    this.btnName,
    this.isKnightGift = false,
    this.jumpPath,
    this.ownerIcon,
    this.ownerUid,
  });

  void _jumpToLevelScreen(
      BuildContext context, String traceTag, MyLevelTab tab) {
    if (isInRoom && rid != null) {
      Tracker.instance.track(TrackEvent.room_gift_control, properties: {
        'room_gift_click': traceTag,
        'rid': rid ?? 0,
      });
    }
    IVipManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    manager.showMyLevelScreen(context, initialTab: tab);
  }

  void jumpToChatService() {
    int serviceId;
    String title;
    if (Session.vipNew >= 10 && Util.isVerify == false) {
      serviceId = 100000022;
      title = base.K.vip_service;
    } else {
      serviceId = 100000016;
      title = base.K.advisory_service;
    }

    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(Constant.context,
        type: 'private', targetId: serviceId, title: title);
  }

  void _onOpenVipTaped(BuildContext context) {
    /// 先判断jumpPath
    if (jumpPath != null && jumpPath!.isNotEmpty) {
      Navigator.of(context).pop();
      SchemeUrlHelper.instance().checkSchemeUrlAndGo(System.context, jumpPath);
      if (jumpPath!.contains('page=constellation_clap')) {
        Tracker.instance.track(TrackEvent.unlock_botton_click,
            properties: {'uid': Session.uid, 'rid': rid});
      }
      return;
    }

    /// 再判断jumpPage
    if (jumpPage != null && jumpPage!.isNotEmpty) {
      SchemeUrlHelper.instance().jump(jumpPage);
      return;
    }

    Navigator.of(context).pop();
    if (isKa == true) {
      /// ka跳转客服
      jumpToChatService();
    } else if (isKnightGift) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openBuyKnightScreen(context);
    } else if (isTitle) {
      _jumpToLevelScreen(context, 'privilege_hook', MyLevelTab.Title);
    } else if (isVip) {
      if (Session.joinBroker) {
        _jumpToLevelScreen(context, 'popularity', MyLevelTab.Popularity);
      } else {
        _jumpToLevelScreen(context, 'vip', MyLevelTab.Vip);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String? displayText;
    if (btnName?.isNotEmpty == true) {
      displayText = btnName;
    } else {
      if (jumpPage?.isNotEmpty == true || jumpPath?.isNotEmpty == true) {
        displayText = K.base_jump_page;
      } else if (isTitle) {
        displayText = K.base_open_title;
      } else if (isVip) {
        displayText =
            Session.joinBroker ? K.base_upgrade_popularity : K.base_upgrade_vip;
      }
    }
    return GestureDetector(
      onTap: () => _onOpenVipTaped(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF93866D), Color(0xFF90725F)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 40,
          padding: const EdgeInsetsDirectional.only(end: 8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF372B2E), Color(0xFF271F21)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _renderLeftIcon(context),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  tips ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(color: Color(0XFFF5D3B9), fontSize: 11),
                ),
              ),
              if (displayText?.isNotEmpty == true)
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4E3B36),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsetsDirectional.only(start: 9, end: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        displayText!,
                        style: const TextStyle(
                            color: Color(0XFFF5D3B9), fontSize: 11),
                      ),
                      R.img(
                        'ic_arrow.svg',
                        width: 16,
                        height: 16,
                        package: ComponentManager.MANAGER_GIFT,
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderLeftIcon(BuildContext context) {
    if (ownerUid != null && ownerUid! > 0 && Util.validStr(ownerIcon)) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 2),
        child: CommonAvatar(
            path: ownerIcon,
            size: 36,
            shape: BoxShape.circle,
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, ownerUid!);
            }),
      );
    }
    if (icon != null && icon!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: icon,
        width: 40,
        height: 40,
        cachedHeight: 40.px,
        cachedWidth: 40.px,
      );
    }
    return const SizedBox.shrink();
  }
}

class TopDescribeTips extends StatefulWidget {
  final String? tips;
  final List<String>? icons;
  final String? jumpPage;

  /// 展示iOS免责声明：本活动与apple.inc无关
  final bool showAppleDisclaimer;

  const TopDescribeTips({
    super.key,
    this.tips,
    this.icons,
    this.jumpPage,
    this.showAppleDisclaimer = false,
  });

  @override
  State<StatefulWidget> createState() {
    return TopDescribeTipsState();
  }
}

class TopDescribeTipsState extends State<TopDescribeTips> {
  final SwiperController _controller = SwiperController();

  int? _timerKey;

  int _index = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startAnimate();
    });
  }

  @override
  void didUpdateWidget(covariant TopDescribeTips oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.icons?.length ?? 0) != (widget.icons?.length ?? 0)) {
      if (mounted) {
        if (_timerKey != null) {
          JsTimer.clearTimeout(_timerKey!);
        }
        _index = 0;
        _startAnimate();
        setState(() {});
      }
    }
  }

  void _onInfoTaped(BuildContext context) {
    if (widget.jumpPage != null) {
      BaseWebviewScreen.show(context, url: widget.jumpPage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.only(end: 8),
      margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFBC41FF), Color(0xFF5865FF)],
        ),
        border: Border.all(color: const Color(0x4AFFFFFF), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _getIcons(),
          const SizedBox(width: 4),
          ...buildTips(),
          if (!Util.isStringEmpty(widget.jumpPage))
            GestureDetector(
              onTap: () => _onInfoTaped(context),
              child: Container(
                child: R.img(
                  'ic_help.svg',
                  color: Colors.white.withOpacity(0.6),
                  width: 20,
                  height: 20,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            )
        ],
      ),
    );
  }

  List<Widget> buildTips() {
    if (widget.showAppleDisclaimer && Platform.isIOS) {
      /// 增加：本活动与Apple.lcn. 无关
      return [
        Text(
          widget.tips ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
        Text(
          '(${K.base_apple_isclaimer})',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Color(0xFFF5D3B9), fontSize: 9),
        ),
        const Spacer(),
      ];
    }
    return [
      Expanded(
        child: Text(
          widget.tips ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      )
    ];
  }

  Widget _getIcons() {
    List<String>? icons = widget.icons;
    if (Util.isCollectionEmpty(icons)) {
      return const SizedBox.shrink();
    }

    if (icons!.length == 1) {
      return _buildGiftItem(icons[0]);
    }

    return SizedBox(
      width: 40,
      height: 40,
      child: Swiper(
        itemCount: icons.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return _buildGiftItem(icons[index]);
        },
      ),
    );
  }

  Widget _buildGiftItem(String icon) {
    if (Util.isStringEmpty(icon)) {
      return const SizedBox.shrink();
    }

    return CachedNetworkImage(
      imageUrl: icon,
      width: 40,
      height: 40,
    );
  }

  _startAnimate() {
    if (!Util.isCollectionEmpty(widget.icons) && widget.icons!.length > 1) {
      int length = widget.icons!.length;
      const Duration duration = Duration(seconds: 3);
      _timerKey = JsTimer.setTimeout(() {
        if (!mounted) return;

        _index += 1;
        if (_index >= length) {
          _index = _index % length;
        }
        _controller.next(animation: true);
        _startAnimate();
      }, duration.inMilliseconds);
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    if (_timerKey != null) {
      JsTimer.clearTimeout(_timerKey!);
    }

    super.dispose();
  }
}
