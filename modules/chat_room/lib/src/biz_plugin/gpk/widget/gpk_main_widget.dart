import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:tuple/tuple.dart';

import '../gpk_constants.dart';
import '../gpk_helper.dart';
import '../model/gpk_model.dart';
import '../model/gpk_view_model.dart';
import '../widget/gpk_pos_widget.dart';
import '../widget/gpk_status_widget.dart';

/// 分组pk
///
class GPKMainWidget extends StatefulWidget {
  final ChatRoomData room;

  const GPKMainWidget({super.key, required this.room});

  @override
  _GPKMainWidgetState createState() {
    return _GPKMainWidgetState();
  }
}

class _GPKMainWidgetState extends State<GPKMainWidget> {
  late GPKViewModel _gpkViewModel;

  @override
  void initState() {
    super.initState();
    _gpkViewModel = GPKViewModel()..init(widget.room);
  }

  @override
  void didUpdateWidget(covariant GPKMainWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _gpkViewModel.refreshData(widget.room);
  }

  @override
  void dispose() {
    _gpkViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GPKViewModel>.value(
      value: _gpkViewModel,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTop(),
        _buildMain(),
      ],
    );
  }

  /// 顶部 魅力榜首、主持、贡献榜首
  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 主持位
          _buildHostIcon(),
          // 惩罚
          _buildPunish(),
          const Spacer(),
          // 魅力榜首
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 3),
            child: Selector<GPKViewModel, GPKUser?>(
              selector: (context, model) => model.data?.bestReceiver,
              shouldRebuild: (pre, next) => pre != next,
              builder: (context, user, child) {
                return _buildTopIcon(user, child);
              },
              child: Container(
                width: 34,
                height: 13,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA967F0), Color(0xFF9F60FF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(color: const Color(0xFFCF88FF)),
                  borderRadius: BorderRadius.circular(6.5),
                ),
                child: Text(
                  R.string('rank_config_charm'),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // 贡献榜首/MVP
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 3),
            child: Selector<GPKViewModel, GPKUser?>(
              selector: (context, model) => model.data?.bestSender,
              shouldRebuild: (pre, next) => pre != next,
              builder: (context, user, child) {
                return _buildTopIcon(user, child);
              },
              child: Container(
                width: 34,
                height: 13,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFDF8200), Color(0xFFE6A400)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(color: const Color(0xFFF3EA90)),
                  borderRadius: BorderRadius.circular(6.5),
                ),
                child: const Text(
                  'MVP',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 主持位的icon
  Widget _buildHostIcon() {
    RoomPosition user = widget.room.isEightPosition
        ? RoomPosition.fromCreator(widget.room.createor!)
        : widget.room.positions[0];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            UserIcon(
              size: IconSize.groupPK,
              room: widget.room,
              position: user,
              border: UserIcon.defaultBorder.copyWith(width: 2),
            ),
            PositionedDirectional(
              bottom: -3,
              child: Container(
                width: 34,
                height: 13,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFDF67F0), Color(0xFFFF60C8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(color: const Color(0xFFFF88CE)),
                  borderRadius: BorderRadius.circular(6.5),
                ),
                child: Text(
                  K.room_host,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 50),
          padding: const EdgeInsetsDirectional.only(top: 6),
          child: Text(
            user.name,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// 惩罚内容
  Widget _buildPunish() {
    return Selector<GPKViewModel, String?>(
      selector: (context, model) => model.data?.punishName,
      builder: (_, punish, child) {
        if (punish == null || punish.isEmpty) return const SizedBox.shrink();
        return Container(
          height: 48,
          width: 146,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  RoomAssets.chat_room$gpk_main_punish_content_bg_webp),
              fit: BoxFit.fill,
            ),
          ),
          margin: const EdgeInsetsDirectional.only(start: 4),
          padding: const EdgeInsetsDirectional.only(start: 13, end: 13),
          alignment: Alignment.center,
          child: Text(
            K.room_gpk_punish_content([punish]),
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }

  /// 顶部魅力位和mvp位的伪麦坑
  Widget _buildTopIcon(GPKUser? user, Widget? child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (user?.icon == null)
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: R.img(
                  RoomAssets.chat_room$boss_svg,
                  width: 26,
                  height: 26,
                ),
              )
            else ...[
              CommonAvatar(
                path: user!.icon,
                size: 40,
                shape: BoxShape.circle,
                onTap: () {
                  RoomNavUtil.goToImageScreenDialog(
                    context,
                    null,
                    widget.room,
                    userId: user.uid,
                  );
                },
              ),
              if (user.getFrameImg()?.isNotEmpty ?? false)
                PositionedDirectional(
                  start: -2,
                  end: -2,
                  top: -2,
                  bottom: -2,
                  child: IgnorePointer(
                    child: CachedNetworkImage(
                      imageUrl: user.getFrameImg(),
                      width: 44,
                      height: 44,
                      errorWidget: const SizedBox.shrink(),
                    ),
                  ),
                )
            ],
            if (child != null)
              PositionedDirectional(
                bottom: -1,
                child: child,
              ),
          ],
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 50),
          padding: const EdgeInsetsDirectional.only(top: 6),
          child: Text(
            user?.name ?? K.room_wait_for_seated,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildMain() {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        top: 16,
        bottom: 12,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),

          // 队伍
          PositionedDirectional(child: _buildTeams()),
          // PK条
          PositionedDirectional(
            top: 10.dp,
            start: 5,
            end: 5,
            child: _buildPKScoreBar(),
          ),
          // 进度/状态
          PositionedDirectional(
            top: 8.dp,
            child: _buildStatus(),
          ),
          // 团战logo
          PositionedDirectional(
            top: -40.dp,
            child: IgnorePointer(
              child: R.img(
                RoomAssets.chat_room$gpk_main_logo_webp,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // 结束按钮
          if (GPKHelper.isCreatorOrReception(widget.room))
            PositionedDirectional(
              top: 70.dp,
              child: _buildEndBtn(),
            ),
        ],
      ),
    );
  }

  Widget _buildTeams() {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Expanded(child: _buildRedTeam()),
          const SizedBox(width: 6),
          Expanded(child: _buildBlueTeam()),
        ],
      ),
    );
  }

  int _getPlayerPosition(int pos) {
    return widget.room.isEightPosition ? pos - 1 : pos;
  }

  /// 红队
  Widget _buildRedTeam() {
    return Selector<GPKViewModel, GPKSideData?>(
      selector: (context, model) => model.getLeftSideData(),
      shouldRebuild: (pre, next) => pre != next,
      builder: (context, user, child) {
        return LayoutBuilder(builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = width * 269 / 170;
          return Stack(
            alignment: Alignment.center,
            children: [
              R.img(
                RoomAssets.chat_room$gpk_main_red_bg_webp,
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
              if (child != null)
                PositionedDirectional(
                  start: 12,
                  top: 40,
                  child: child,
                ),
              PositionedDirectional(
                start: 24 / 170 * width,
                top: 64 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(1)),
                    _getPlayerPosition(1)),
              ),
              PositionedDirectional(
                end: 30 / 170 * width,
                top: 64 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(2)),
                    _getPlayerPosition(2)),
              ),
              PositionedDirectional(
                start: 24 / 170 * width,
                top: 160 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(5)),
                    _getPlayerPosition(5)),
              ),
              PositionedDirectional(
                end: 30 / 170 * width,
                top: 160 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(6)),
                    _getPlayerPosition(6)),
              ),
            ],
          );
        });
      },
      child: Text(
        K.room_gpk_red_team,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 蓝队
  Widget _buildBlueTeam() {
    return Selector<GPKViewModel, GPKSideData?>(
      selector: (context, model) => model.getRightSideData(),
      shouldRebuild: (pre, next) => pre != next,
      builder: (context, user, child) {
        return LayoutBuilder(builder: (_, constraints) {
          double width = constraints.maxWidth;
          double height = width * 269 / 170;
          return Stack(
            alignment: Alignment.center,
            children: [
              R.img(
                RoomAssets.chat_room$gpk_main_blue_bg_webp,
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
              if (child != null)
                PositionedDirectional(
                  end: 12,
                  top: 40,
                  child: child,
                ),
              PositionedDirectional(
                start: 28 / 170 * width,
                top: 64 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(3)),
                    _getPlayerPosition(3)),
              ),
              PositionedDirectional(
                end: 26 / 170 * width,
                top: 64 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(4)),
                    _getPlayerPosition(4)),
              ),
              PositionedDirectional(
                start: 28 / 170 * width,
                top: 160 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(7)),
                    _getPlayerPosition(7)),
              ),
              PositionedDirectional(
                end: 26 / 170 * width,
                top: 160 / 269 * height,
                child: _buildSinglePKUser(
                    user?.list.firstWhereOrNull(
                        (e) => e.position == _getPlayerPosition(8)),
                    _getPlayerPosition(8)),
              ),
            ],
          );
        });
      },
      child: Text(
        K.room_gpk_blue_team,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSinglePKUser(GPKPosModel? model, int pos) {
    return GPKPosWidget(
      room: widget.room,
      pos: pos,
      model: model,
      rule: _gpkViewModel.rule,
      gpkState: _gpkViewModel.state,
    );
  }

  Widget _buildPKScoreBar() {
    return Consumer<GPKViewModel>(
      builder: (_, model, child) {
        double leftScore = GPKHelper.getScoreValue(_gpkViewModel.rule ?? 0,
            _gpkViewModel.getLeftSideData()?.total ?? 0);
        double rightScore = GPKHelper.getScoreValue(_gpkViewModel.rule ?? 0,
            _gpkViewModel.getRightSideData()?.total ?? 0);
        return PkScoreWidget(
          leftScore,
          rightScore,
          height: 18.dp,
          marginLR: 18,
          roundCorner: true,
          showFlash: _gpkViewModel.state == GPKState.pk_ing,
          showDecimal: _gpkViewModel.rule == RULE_GIF_VALUE,
        );
      },
    );
  }

  /// 顶部状态栏、倒计时
  Widget _buildStatus() {
    return Selector<GPKViewModel, Tuple2<GPKState?, int>>(
      selector: (context, model) => Tuple2(model.state, model.remainingTime()),
      builder: (_, tuple, child) {
        return GPKStatusWidget(
          state: tuple.item1,
          remainingTime: tuple.item2,
          onTapCallback: () {
            _gpkViewModel.onClickPkStatusWidget(context);
          },
        );
      },
    );
  }

  /// 结束按钮
  Widget _buildEndBtn() {
    return Selector<GPKViewModel, GPKState?>(
      selector: (context, model) => model.state,
      builder: (_, state, child) {
        return GestureDetector(
          onTap: () {
            _gpkViewModel.endGPK(context);
          },
          child: Container(
            width: 52,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: state == GPKState.pk_ing
                    ? [
                        const Color(0xFF4801FF),
                        const Color(0xFF7918F2),
                        const Color(0xFFAC32F4),
                      ]
                    : [
                        const Color(0xFFF09819),
                        const Color(0xFFFF5858),
                      ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x52000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              K.end,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
