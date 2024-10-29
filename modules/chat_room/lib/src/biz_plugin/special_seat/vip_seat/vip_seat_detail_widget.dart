import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/vap_animate_widget.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/special_seat/vip_seat/vip_seat_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets.dart';

class VipSeatDetailWidget extends StatefulWidget {
  final ChatRoomData room;

  const VipSeatDetailWidget(this.room, {super.key});

  @override
  State<StatefulWidget> createState() => VipSeatDetailState();

  static show(BuildContext context, {required ChatRoomData room}) async {
    return await displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1.0,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return VipSeatDetailWidget(room);
      },
    );
  }
}

class VipSeatDetailState extends State<VipSeatDetailWidget> {
  double frameSize = 112;
  double iconSize = 86;

  bool _error = false;
  bool _loading = true;

  VipMicConfigMessage? _data;
  List<CommonTagData> commonTags = [];

  Timer? timer;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _load() async {
    _loading = true;
    _error = false;
    refresh();
    ApiVipMicConfigResponse res =
        await VipSeatRepo.getVipSeatDetail(widget.room.realRid);
    _loading = false;
    if (res.success) {
      _data = res.data;
    } else {
      _error = true;
    }
    refresh();

    if (_data != null && _data!.vip.duration > 0) {
      startTimer();
    }
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_data!.vip.duration > 0) {
        _data!.vip.duration--;
        refresh();
      }
      if (_data!.vip.duration == 0) {
        timer.cancel();
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double top = frameSize * 0.5;
    double height = 420; // 有人在VIP卖座上
    if ((_data?.user.uid ?? 0) > 0) {
      height = 500; // 无人在VIP卖座上
    }
    if (_data != null &&
        _data?.annotation != null &&
        _data?.annotation.isNotEmpty == true &&
        _data?.coupon != null &&
        _data?.coupon.couponTips.isNotEmpty == true) {
      height += 30;
    }
    height -= 34;

    List<Widget> widgets = [];
    bool isLoadingOrError = _loading || _error;
    if (isLoadingOrError) {
      widgets = [_renderWait()];
    } else if (_data != null) {
      widgets.add(const SizedBox(height: 6));
      widgets.add(_buildTitle());
      if ((_data?.user.uid ?? 0) > 0) {
        widgets.add(_buildInfoName(_data?.user.name ?? ''));
        widgets.add(const SizedBox(height: 4));
        widgets.add(_buildInfoTags());
        widgets.add(const SizedBox(height: 8));
        widgets.add(_buildVipValue());
        widgets.add(const SizedBox(height: 12));
        widgets.add(_buildGiftItem());
        widgets.add(Expanded(child: _buildMountItem()));
      } else if (_data!.annotation.isNotEmpty) {
        widgets.add(_buildInfoName(K.room_vip_seat_empty_seat));
        widgets.add(const SizedBox(height: 25));
        for (int i = 0; i < _data!.annotation.length; i++) {
          String tip = _data!.annotation[i];
          widgets.add(_buildTipItem(tip, i));
          widgets.add(const SizedBox(height: 25));
        }
        if (_data?.coupon != null &&
            _data?.coupon.couponTips.isNotEmpty == true)
          widgets.add(_buildVipMic());
        widgets.add(_buildOpenGiftPane());
      }
    }

    return SizedBox(
      width: double.infinity,
      height: height + top + Util.iphoneXBottom,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: height + Util.iphoneXBottom,
            margin: EdgeInsetsDirectional.only(top: top),
            padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color(0xFF361C8E), Color(0xFF712FFF)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            ),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: top - 12,
            child: IgnorePointer(
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(
                    'static/room/ic_vip_seat_border_bg.webp'),
                width: Util.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: _buildIconWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String tip, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        tip,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildOpenGiftPane() {
    return InkWell(
      onTap: () async {
        Navigator.of(context).pop();
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomGiftPanel(context, room: widget.room);
      },
      child: Container(
        width: 269,
        height: 76,
        alignment: AlignmentDirectional.topCenter,
        padding: const EdgeInsetsDirectional.only(top: 18),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                RoomAssets.chat_room$vip_seat_ic_vip_seat_btn_bg_webp),
          ),
        ),
        child: Text(
          K.room_vip_seat_send_gift,
          style: const TextStyle(
            color: Color(0xFF3D0C98),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.centerEnd,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if ((_data?.user.uid ?? 0) > 0) ...[
            _buildTimer(),
          ],
          _buildHelp(),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Container(
      width: 76,
      height: 24,
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0.2),
        shape: const StadiumBorder(),
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            RoomAssets.chat_room$vip_seat_ic_vip_seat_timer_webp,
            width: 12,
            height: 12,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          const SizedBox(width: 2),
          RepaintBoundary(
            child: Text(
              Utility.formatTimeClockAll(_data!.vip.duration),
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelp() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        Navigator.of(context).pop();
        BaseWebviewScreen.show(context, url: Util.getHelpUrlWithQStr('k93'));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 8, end: 16, top: 18, bottom: 18),
        child: R.img(
          RoomAssets.chat_room$vip_seat_ic_vip_seat_help_webp,
          width: 24,
          height: 24,
          package: ComponentManager.MANAGER_BASE_ROOM,
        ),
      ),
    );
  }

  Widget _buildInfoName(String text) {
    return Container(
      alignment: AlignmentDirectional.center,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFFFD655),
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _buildInfoTags() {
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 4,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: _buildLabels(),
      ),
    );
  }

  List<Widget> _buildLabels() {
    List<Widget> labels = [];
    int sex = _data!.user.sex; //(sex == 1 ? '男' : '女')
    int age = _data!.user.age;
    int popularityLevel = _data!.user.popularityLevel;
    int vip = _data!.user.vip;

    /// 性别年龄
    labels.add(UserSexAndAgeWidget(sex: sex, age: age));

    /// 爵位
    labels.add(UserNobilityWidget(
      titleNew: _data!.user.title,
    ));

    /// 人气
    labels.add(UserPopularity(
      popularityLevel: popularityLevel,
    ));

    /// vip
    labels.add(UserVipWidget(
      vip: vip,
      isGrey: _data!.user.gray,
    ));

    /// 当前穿戴的运营活动勋章
    if (_data!.user.hasBadgeIconInUse() &&
        _data!.user.badgeIconInUse.isNotEmpty) {
      labels.add(ActivityBadgeWidget(
        icon: _data!.user.badgeIconInUse,
        height: 26,
      ));
    }

    return labels;
  }

  Widget _buildVipValue() {
    return GradientBorder(
      borderGradient: const LinearGradient(
        colors: [
          Color(0xFFFFE47A),
          Color(0xFFFFEFD5),
          Color(0xFFFFE47A),
        ],
      ),
      borderRadius: 18,
      borderWidth: 2,
      child: Container(
        height: 30,
        padding: const EdgeInsetsDirectional.only(start: 6, end: 6, top: 6),
        margin: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: const Color(0xFF1C004F).withOpacity(0.7),
          shape: const StadiumBorder(),
        ),
        child: Text(
          K.room_vip_seat_value(['${_data?.vip.value ?? 0}']),
          style: const TextStyle(
            color: Color(0xFFFFD655),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildGiftItem() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0x4DF693FC), Color(0x4D3AAFFF)],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.room_vip_seat_gift,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: _buildGiftAvatar()),
              ],
            ),
          ),
          Divider(
            color: Colors.white.withOpacity(0.2),
            height: 0.5,
          ),
          const SizedBox(height: 12),
          Container(
            height: 60,
            padding: const EdgeInsetsDirectional.only(start: 10, end: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: Colors.white.withOpacity(0.3), width: 0.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageUrl: Util.giftImgUrl(_data!.gift.id),
                  width: 60,
                  height: 60,
                  cachedWidth: 60.px,
                  cachedHeight: 60.px,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _data!.gift.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "x ${_data!.gift.num}",
                      style: const TextStyle(
                        color: Color(0xFFFFF056),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildGiftAvatar() {
    int length = _data!.gift.receiverIcons.length;
    List<Widget> result = [];
    if (length > 1) {
      _data!.gift.receiverIcons.forEachIndexed((i, e) {
        result.add(_buildAvatar(e));
        if (i < length - 1) {
          result.add(const SizedBox(width: 8));
        }
      });
    } else if (length == 1) {
      result.add(_buildAvatar(_data!.gift.receiverIcons[0]));
      result.add(const SizedBox(width: 8));
      result.add(
        Container(
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          child: Text(
            _data!.gift.firstReceiverName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: result,
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: CommonAvatar(
        path: url,
        size: 32,
        shape: BoxShape.circle,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildIconWidget() {
    return GestureDetector(
      onTap: () {
        if ((_data?.user.uid ?? 0) > 0) {
          Navigator.of(context).pop();
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, _data!.user.uid);
        }
      },
      child: SizedBox(
        width: frameSize,
        height: frameSize,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ((_data?.user.uid ?? 0) > 0) ? _buildUserIcon() : _buildEmptyIcon(),
            if (_data?.frame.isNotEmpty == true)
              CachedNetworkImage(
                imageUrl: Util.getImgUrl(_data?.frame ?? ''),
                width: frameSize,
                height: frameSize,
                cachedHeight: frameSize.px,
                cachedWidth: frameSize.px,
                fit: BoxFit.fill,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyIcon() {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF3D0B98),
        border: Border.all(
            width: 1, color: const Color(0xFFFFE46A).withOpacity(0.5)),
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(RoomAssets.chat_room$boss_svg,
          width: 30, height: 30, package: ComponentManager.MANAGER_BASE_ROOM),
    );
  }

  Widget _buildUserIcon() {
    return CommonAvatar(
      path: _data?.user.icon ?? '',
      size: iconSize,
      shape: BoxShape.circle,
      loadingWidget: const CupertinoActivityIndicator(),
    );
  }

  Widget _buildMountItem() {
    return GestureDetector(
      onTap: () {
        if ((_data?.user.mount.id ?? 0) <= 0) return;
        VapAnimateWidget.show(
            context, _data!.user.mount.id, _data!.user.mount.vapSize);
      },
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  K.room_vip_seat_mount,
                  style: const TextStyle(
                    color: Color(0xFFFFD655),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 1,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              height: 120,
              alignment: AlignmentDirectional.center,
              child: ((_data?.user.mount.id ?? 0) > 0)
                  ? _buildMountEffect()
                  : _buildMountEmpty(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMountEffect() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CachedNetworkImage(
          imageUrl: Util.getImgUrl(_data?.user.mountImage ?? ''),
          width: 120,
          height: 120,
          cachedWidth: 120.px,
          cachedHeight: 120.px,
          fit: BoxFit.cover,
        ),
        R.img(
          RoomAssets.chat_room$vip_seat_ic_vip_seat_mount_play_webp,
          width: 34,
          height: 34,
        ),
      ],
    );
  }

  Widget _buildMountEmpty() {
    return Text(
      K.room_vip_seat_empty_mount,
      style: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 13,
      ),
    );
  }

  Widget _renderWait() {
    return Container(
        constraints: const BoxConstraints(minHeight: 200),
        child: _renderWaitBody());
  }

  Widget _renderWaitBody() {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (_error) {
      return ErrorData(
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load();
        },
      );
    }
    return Container();
  }

  /// 你拥有VIP座位券：赠送礼物后额外增加520000身价
  Widget _buildVipMic() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
      child: Text(
        _data?.coupon.couponTips ?? '',
        style: const TextStyle(color: Color(0xFFFCD315), fontSize: 13),
      ),
    );
  }
}
