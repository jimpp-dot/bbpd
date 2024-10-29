import 'package:chat_room/k.dart';

import 'package:shared/shared.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/mic_anim/mic_relation_anim.dart';
import 'package:chat_room/src/base/widget/room_defend_at_mic.dart';
import 'package:chat_room/src/base/widget/user_icon_plugin.dart';
import 'package:chat_room/src/base/widget/user_icon_tap_handler.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/hat_play_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user_icon_throne_widget.dart';

class UserIcon extends StatefulWidget {
  final RoomPosition position;
  final ChatRoomData room;

  /// 头像大小
  final double size;

  /// 头像边框
  final BorderSide? border;

  /// 头像widget
  final Widget? icon;

  /// 头像的地址
  final String? iconPath;

  /// 头像widget的key
  final Key? iconKey;

  /// 头像框地址
  final String? frameUrl;

  /// 麦上光圈
  final String? ring;

  /// 麦上光圈大小
  final double? ringSize;

  /// 麦上光圈对齐方式，不设置的话，默认bottomCenter
  final Alignment? ringAlignment;

  /// 光圈颜色
  final Color? ringColor;

  /// 麦上倒计时
  final bool showCounter;

  /// 直播间铭牌
  final bool showFansLabel;

  /// 闭麦、禁麦icon
  final bool showMicIcon;

  /// 闭麦、禁麦icon背景色
  final Color? micIconBackgroundColor;

  /// 闭麦、禁麦icon颜色
  final Color? micIconColor;

  /// 禁麦按钮底部居中显示
  final bool isMicForbiddenBottomCenter;

  /// 显示离线浮层
  final bool showOffline;

  /// 麦上表情
  final bool showEmote;

  /// 打赏统计
  final bool showPackage;

  /// 显示麦上光圈
  final bool showSoundEffect;

  /// 额外要显示的组件，放在icon上面，各种小标签下面
  final List<Widget>? children;

  /// 麦位插件
  final List<UserIconPlugin>? plugins;

  /// 是否响应点击
  final bool canTap;

  /// 点击事件处理
  final UserIconTapHandler? tapHandler;

  /// 光圈渐变色外部颜色
  final Color? linearGradientFromColor;

  /// 光圈渐变色内部颜色
  final Color? linearGradientToColor;

  /// 上麦引导
  final bool showGuide;

  /// 角色
  final String? role;

  /// 电台守护-麦框
  final bool showDefend;

  /// 正下方麦位序号（包括role身份显示，麦上有人与否 都显示）
  final bool showPosition;

  /// 麦位无人时icon颜色是否纯白无透明
  final bool whiteIcon;

  final String? liveMicFrame; // 直播房麦位框

  /// 空麦位外部样式
  final WidgetBuilder? emptyMicBuilder;

  const UserIcon({
    Key? key,
    this.size = IconSize.normal,
    required this.room,
    required this.position,
    this.border,
    this.icon,
    this.iconPath,
    this.iconKey,
    this.frameUrl,
    this.ringColor,
    this.showCounter = true,
    this.showFansLabel = true,
    this.isMicForbiddenBottomCenter = false,
    this.showMicIcon = true,
    this.micIconColor,
    this.micIconBackgroundColor,
    this.showOffline = false,
    this.showEmote = true,
    this.showPackage = false,
    this.children,
    this.plugins,
    this.canTap = true,
    this.tapHandler,
    this.showGuide = false,
    this.role,
    this.ring,
    this.ringSize,
    this.ringAlignment,
    this.linearGradientFromColor,
    this.linearGradientToColor,
    this.showSoundEffect = true,
    this.showDefend = false,
    this.showPosition = false,
    this.emptyMicBuilder,
    this.whiteIcon = false,
    this.liveMicFrame,
  }) : super(key: key);

  @override
  _UserIconState createState() => _UserIconState();

  static final defaultBorder =
      BorderSide(color: Colors.white.withOpacity(0.2), width: 1);
  static const defaultSize = 60;
}

class _UserIconState extends State<UserIcon> {
  late UserIconTapHandler _tapHandler;
  List<UserIconPlugin> _plugins = [];
  List<UserIconPlugin> _innerPlugins = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant UserIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// 重新初始化
    if (_plugins.isNotEmpty) {
      for (var plugin in _plugins) {
        plugin.onDispose();
      }

      _plugins.clear();

      if (widget.plugins?.isNotEmpty ?? false) {
        _plugins.addAll(widget.plugins!);
        _initPluginData();

        for (var _ in _plugins) {
          _.onInitState();
        }
      }
    }

    /// 点击事件处理
    _tapHandler = widget.tapHandler ?? UserIconTapHandler();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _init() {
    _plugins = [
      if (widget.plugins?.isNotEmpty ?? false) ...widget.plugins!,
    ];
    _innerPlugins = [
      BombPlugin(),
      AwardTitlePlugin(),
      PigPunishPlugin(),
      HatPlayPlugin(),
      MicEffectPlugin(),
      ImpressTagPlugin(),
    ];

    /// 初始化插件数据
    _initPluginData();

    /// 插件监听生命周期
    if (plugins.isNotEmpty) {
      for (var _ in plugins) {
        _.onInitState();
      }
    }

    /// 点击事件处理
    _tapHandler = widget.tapHandler ?? UserIconTapHandler();
  }

  void _dispose() {
    if (plugins.isNotEmpty) {
      for (var _ in plugins) {
        _.onDispose();
      }
    }
  }

  /// 初始化plugin属性
  void _initPluginData() {
    if (plugins.isNotEmpty) {
      for (var _ in plugins) {
        _.init(
          context: context,
          size: widget.size,
          room: widget.room,
          roomPosition: widget.position,
          refresh: () => refresh(),
        );
      }
    }
  }

  void onIconTap() {
    if (!(widget.canTap)) return;

    /// 设置tapHandler属性，响应点击事件
    _tapHandler.init(
        context: context, room: widget.room, position: widget.position);
    _tapHandler.onIconTap();
  }

  bool get canTap => widget.canTap;

  double get size => widget.size;

  BorderSide get border => widget.border ?? UserIcon.defaultBorder;

  String? get frameUrl => widget.frameUrl ?? widget.position.getFrameImg();

  List<UserIconPlugin> get plugins => [
        ..._plugins,
        ..._innerPlugins,
      ];

  Widget _buildEmptyIcon() {
    if (widget.emptyMicBuilder != null) return widget.emptyMicBuilder!(context);
    double iconSize = 24;
    String iconName;
    if ((widget.room.isBusinessBirthday && widget.position.position > 6) ||
        (widget.room.config?.mode == RoomMode.Lock &&
            ChatRoomUtil.isBossChair(widget.position))) {
      return GradientBorder(
        borderGradient: const LinearGradient(
          colors: [Color(0xFFFFE46A), Color(0xFFFCC058)],
        ),
        borderRadius: size / 2,
        borderWidth: 1,
        child: Container(
          width: size,
          height: size,
          alignment: AlignmentDirectional.center,
          child: R.img(RoomAssets.chat_room$boss_svg,
              width: iconSize,
              height: iconSize,
              package: ComponentManager.MANAGER_BASE_ROOM),
        ),
      );
    }

    if (widget.room.config?.mode == RoomMode.Lock) {
      iconName = RoomAssets.chat_room$wait_svg;
    } else if (widget.position.lock) {
      iconName = RoomAssets.chat_room$empty_close_svg;
    } else {
      iconName = RoomAssets.chat_room$empty_join_svg;
    }

    /// 纯白无透明 icon
    if (widget.whiteIcon) {
      if (widget.room.config?.mode == RoomMode.Lock) {
        iconName = RoomAssets.chat_room$debate_pk_ic_pk_mic_wait_webp;
      } else if (widget.position.lock) {
        iconName = RoomAssets.chat_room$debate_pk_ic_pk_mic_empty_close_webp;
      } else {
        iconName = RoomAssets.chat_room$debate_pk_ic_pk_mic_empty_join_webp;
      }
    }

    if (widget.showGuide) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.fromBorderSide(border)),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CommonAvatar(
              path: Session.icon,
              size: size,
              shape: BoxShape.circle,
              color: const Color.fromRGBO(255, 255, 255, 0.5),
              colorBlendMode: BlendMode.modulate,
              loadingWidget: const CupertinoActivityIndicator(),
            ),
            Text(
              K.room_click_to_mic,
              style: TextStyle(fontSize: 11.dp, color: Colors.white),
            ),
          ],
        ),
      );
    }

    /// 婚礼房空麦位背景用黑色
    Color bg = ChatRoomUtil.isWedding(widget.room.config)
        ? Colors.black.withOpacity(0.2)
        : Colors.white.withOpacity(0.12);
    if (widget.room.isHeartRace) {
      bg = const Color(0xFF3A1473);
    } else if (widget.room.isBusinessWedding) {
      bg = const Color(0xCC8B81EC);
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bg,
        border: Border.fromBorderSide(border),
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(
        iconName,
        width: 18,
        height: 18,
        fit: BoxFit.contain,
        package: ComponentManager.MANAGER_BASE_ROOM,
      ),
    );
  }

  Widget _buildUserIcon() {
    double borderWidth = border.width;
    Widget? iconWidget;
    if (plugins.isNotEmpty) {
      plugins.firstWhereOrNull((plugin) {
        if (plugin.effect) {
          iconWidget = plugin.buildUserIcon(borderWidth: borderWidth);
        }
        return iconWidget != null;
      });
    }

    iconWidget ??= widget.icon ??
        CommonAvatar(
          path: widget.iconPath ?? widget.position.icon,
          size: size,
          shape: BoxShape.circle,
          loadingWidget: const CupertinoActivityIndicator(),
        );

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(border),
      ),
      alignment: Alignment.center,
      child: (!widget.showPosition && Util.validStr(widget.role))
          ? Stack(
              children: [
                iconWidget!,
                _buildRole(),
              ],
            )
          : iconWidget,
    );
  }

  Widget _buildPosition() {
    if (Util.validStr(widget.role)) {
      return Container(
        width: 28,
        height: 14,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.imagePath('ic_mic_role_bg_v2.webp',
                package: ComponentManager.MANAGER_BASE_ROOM)),
            fit: BoxFit.fill,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          widget.role ?? '',
          style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.1),
        ),
      );
    } else {
      return Container(
        width: 14,
        height: 14,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.white,
          shadows: [
            BoxShadow(
                offset: Offset(0, 1), blurRadius: 2, color: Color(0x1A000000))
          ],
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          '${widget.position.position}',
          style: const TextStyle(
              color: Color(0xFF8462FF),
              fontSize: 8,
              fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  Widget _buildRole() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (R.img(RoomAssets.chat_room$ic_mic_role_bg_webp,
              width: size, height: size) as Image).image,
          fit: BoxFit.fill,
        ),
      ),
      alignment: AlignmentDirectional.bottomCenter,
      padding: EdgeInsetsDirectional.only(bottom: 4 / 90 * size),
      child: Text(
        widget.role ?? '',
        style: TextStyle(
            fontSize: size / 10,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1.1),
      ),
    );
  }

  bool get empty => widget.position.uid <= 0;

  /// 是否展示房主位信息
  bool get showCreator =>
      (widget.room.config?.showOwnerSeat ?? false) && widget.position.isCreator;

  Widget _buildIcon() => (widget.showOffline || !empty || showCreator)
      ? _buildUserIcon()
      : _buildEmptyIcon();

  @override
  Widget build(BuildContext context) {
    _initPluginData();

    List<Widget> res = [];

    /// 麦上宝座
    if (Util.validStr(widget.position.throneImg) && !empty) {
      res.add(UserIconThroneWidget(widget.position, size: size));
    }

    ///麦上光圈
    res.add(ValueListenableBuilder(
      valueListenable: widget.room.speakers,
      builder: (context, speakers, child) {
        Widget ringWidget = SoundEffectWidget(
          isSpeaking: widget.showSoundEffect &&
              speakers.containsKey(widget.position.uid),
          width: widget.ringSize ?? size,
          aniColor: widget.ringColor,
          ring: widget.ring ?? widget.position.ring,
        );
        if (widget.ringAlignment != null) {
          return Align(alignment: widget.ringAlignment!, child: ringWidget);
        } else {
          return ringWidget;
        }
      },
    ));

    /// 麦位图像
    res.add(
      SizedBox(
        key: widget.iconKey ?? widget.position.key,
        width: size,
        child: InkWell(
          onTap: onIconTap,
          child: _buildIcon(),
        ),
      ),
    );

    /// 直播房主播麦位框
    if (widget.position.uid == widget.room.config?.uid &&
        widget.liveMicFrame != null &&
        widget.liveMicFrame!.isNotEmpty) {
      res.add(
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(width: size, height: size),
              PositionedDirectional(
                height: size * 1.1,
                child: IgnorePointer(
                  child: CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(widget.liveMicFrame!),
                    height: size * 1.1,
                    fit: BoxFit.fitHeight,
                    cachedWidth: (size * 1.1).px,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    /// 离线标识
    if (widget.showOffline) {
      res.add(IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: const ShapeDecoration(
              color: Colors.black45, shape: CircleBorder()),
          alignment: Alignment.center,
          child: Text(
            K.room_offline,
            style: const TextStyle(fontSize: 10, color: Color(0xFF9B9B9B)),
          ),
        ),
      ));
    } else if (widget.position.positionState > 0 && !empty) {
      // 离开标识
      res.add(IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: const ShapeDecoration(
              color: Colors.black54, shape: CircleBorder()),
          alignment: Alignment.center,
          child: R.img(RoomAssets.ic_leave_mic_webp,
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_BASE_ROOM),
        ),
      ));
    }

    /// 头像框
    String? frameImage = widget.frameUrl ?? widget.position.getFrameImg();
    if (!Util.isStringEmpty(widget.frameUrl)) {
      frameImage = widget.frameUrl;
    }

    if (frameImage != null &&
        frameImage.isNotEmpty &&
        widget.room.config != null &&
        (widget.room.config?.types != RoomTypes.RadioDefend ||
            (widget.room.config?.types == RoomTypes.RadioDefend &&
                widget.position.position == 0))) {
      // 所有头像框外边框和内边框按照1.1:1
      double headSize = size * 1.1;
      res.add(PositionedDirectional(
        top: -0.05 * size,
        start: -0.05 * size,
        child: IgnorePointer(
          child: UserIconFrame(
            size: headSize,
            frameUrl: frameImage,
          ),
        ),
      ));

      // 粉丝牌名
      double overflow = -(headSize - size) / 2;
      int liveOnly = widget.position.liveOnly;
      String liveLabel = widget.position.liveLabel ?? '';
      if (widget.showFansLabel == true &&
          liveOnly == 1 &&
          liveLabel.isNotEmpty) {
        res.add(UserLiveLabelWidget(liveLabel, UserLiveLabelType.frame,
            bgHeight: headSize, frameBottomOverflow: overflow));
      }
    }

    /// 活动的搞怪头像
    if (widget.position.uid > 0) {
      String? gamesTrickPunishImg =
          widget.room.config?.getGamesTrickPunishImg(widget.position.uid);
      if (gamesTrickPunishImg != null && gamesTrickPunishImg.isNotEmpty) {
        double overflow = -5.0;
        res.add(
          PositionedDirectional(
            start: overflow,
            end: overflow,
            top: overflow,
            bottom: overflow,
            child: IgnorePointer(
              child: CachedNetworkImage(
                imageUrl: gamesTrickPunishImg,
                errorWidget: const SizedBox.shrink(),
              ),
            ),
          ),
        );
      }
    }

    /// 添加的组件
    if (widget.children?.isNotEmpty ?? false) {
      res.addAll(widget.children!);
    }

    /// 插件添加的组件
    List<Widget> pluginWidgets = [];
    plugins.where((_) => _.effect).forEach((_) {
      pluginWidgets = _.buildWidgets();
      if (pluginWidgets.isNotEmpty) {
        res.addAll(pluginWidgets);
      }
    });

    /// 倒计时
    if ((widget.position.counter >= widget.room.timestamp) &&
        widget.showCounter) {
      res.add(MicCounter(
        counter: widget.position.counter,
        width: size,
        normalWidth: IconSize.normal,
        isGuess: widget.room.config?.game == Games.Guess,
      ));
    }

    /// 麦位角色信息（房主/接待/老板/序号）
    if (widget.showPosition) {
      res.add(PositionedDirectional(
        start: 0,
        end: 0,
        bottom: -6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPosition(),
          ],
        ),
      ));
    }

    ///闭麦、禁麦标识
    if (widget.showMicIcon && !empty) {
      res.add(
        MicForbidden(
          forbidden: widget.position.forbidden,
          micStatus: widget.position.micStatus,
          isBottomCenter: widget.isMicForbiddenBottomCenter,
          iconColor: widget.micIconColor,
          backgroundColor: widget.micIconBackgroundColor,
        ),
      );
    }

    if (widget.position.guessQueueIsFinish) {
      res.add(PositionedDirectional(
        bottom: size - 10,
        child: R.img(
          RoomAssets.guessgame_guess_game_round_check_webp,
          width: 20,
          height: 20,
          package: ComponentManager.MANAGER_BASE_ROOM,
        ),
      ));
    }

    if (widget.showDefend == true) {
      res.add(RoomDefendAtMic(position: widget.position));
    }

    /// 麦上表情
    if (widget.showEmote) {
      res.add(
        EmoteAtMic(
          uid: widget.position.uid,
          position: widget.position.position,
          width: size,
        ),
      );
    }

    /// 打赏统计
    if (widget.showPackage) {
      res.add(PackageAtMic(
        endNum: -10,
        room: widget.room,
        position: widget.position,
      ));
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: res,
    );
  }
}
