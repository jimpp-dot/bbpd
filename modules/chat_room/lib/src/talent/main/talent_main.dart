import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/chat_room_bg_screen.dart';
import 'package:chat_room/src/base/widget/room_background_info.dart';
import 'package:chat_room/src/talent/add/talent_edit_panel.dart';
import 'package:chat_room/src/talent/data/talent_main_view_model.dart';
import 'package:chat_room/src/talent/list/talent_programme_widget.dart';
import 'package:chat_room/src/talent/talent_helper.dart';

import '../talent_constants.dart';
import 'talent_banner_widget.dart';
import 'talent_position_widget.dart';
import 'talent_rank_widget.dart';
import 'talent_star_award_ani_widget.dart';
import 'talent_starlight_combo_widget.dart';

/// 房间-才艺厅主页面
///
class RoomTalentMainWidget extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback? onSettingClick;

  const RoomTalentMainWidget({
    super.key,
    required this.room,
    this.onSettingClick,
  });

  @override
  State createState() => _RoomTalentMainWidgetState();
}

class _RoomTalentMainWidgetState extends State<RoomTalentMainWidget>
    with
        RoomTemplateMixin<RoomTalentMainWidget>,
        SingleTickerProviderStateMixin<RoomTalentMainWidget>,
        RoomFloatingBannerMixin<RoomTalentMainWidget> {
  final TalentMainViewModel _viewModel = TalentMainViewModel();

  final GlobalKey _roomControllerKey = GlobalKey();

  Offset _menuStarPosition = Offset.zero;
  Size? _menuStarSize;

  @override
  void initState() {
    super.initState();
    _viewModel.initState(widget.room);
    _viewModel.loadBroadcasterInfo();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getMenuStarRenderPos());
  }

  _getMenuStarRenderPos() {
    if (!mounted) return;
    var state = _roomControllerKey.currentState;
    // if (state is RoomBottomControllerState) {
    //   if (state.talentStarKey.currentContext?.findRenderObject() == null) {
    //     return;
    //   }
    //
    //   RenderBox renderBox =
    //       state.talentStarKey.currentContext?.findRenderObject() as RenderBox;
    //   _menuStarSize = renderBox.size;
    //   _menuStarPosition = renderBox.localToGlobal(const Offset(0, 0));
    //   Future.delayed(Duration.zero).then((value) => refresh());
    //   Log.d(tag: TAG, 'menuStarPos->$_menuStarPosition');
    // }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  final Color _blankColor = const Color(0xFF1F1758);

  @override
  void didUpdateWidget(covariant RoomTalentMainWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _viewModel.updateRoom(widget.room);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(color: _blankColor),

          _buildBackground(context),

          Positioned.fill(
            top: 0.0,
            bottom: Util.iphoneXBottom,
            child: Column(
              children: [
                RoomHeaderNormal(room: widget.room, onSettingClick: widget.onSettingClick),
                SizedBox(height: 60.dp),
                // 中间麦位
                TalentPositionWidget(room: widget.room),
                // 中间banner
                TalentBannerWidget(onBannerClick: _onBannerClick),
                renderMessageList(widget.room),
                RoomBottomController(key: _roomControllerKey, room: widget.room),
              ],
            ),
          ),

          PositionedDirectional(
            end: 0,
            bottom: preMadeRecruitBottom,
            child: buildFloatingBanner(widget.room),
          ),

          // 左上角的排行入口
          PositionedDirectional(
            top: 44.dp + MediaQuery.of(context).padding.top,
            start: 12.dp,
            child: TalentRankWidget(room: widget.room),
          ),

          // 星光+1
          if (_menuStarSize != null)
            PositionedDirectional(
              bottom: Util.iphoneXBottom + 10,
              start: _menuStarPosition.dx,
              child: Consumer<TalentMainViewModel>(
                builder: (context, value, child) {
                  Log.d(tag: TAG, 'award star ani widget,showAni=${value.showAwardStarAni},menuSize=$_menuStarSize');
                  if (value.showAwardStarAni && _menuStarSize != null) {
                    String? iconUrl = value.data?.rewardStarIconUrl;
                    if (Util.isStringEmpty(iconUrl, trim: true)) {
                      Log.d(tag: TAG, 'award star icon url is null.');
                      return const SizedBox.shrink();
                    }
                    return TalentStarAwardAniWidget(
                      imageUrl: iconUrl!,
                      size: Size(_menuStarSize!.width, _menuStarSize!.height * 2),
                      onEnd: () {
                        _viewModel.showAwardStarAni = false;
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),

          // 星光礼物连击
          PositionedDirectional(
            top: 428.dp,
            bottom: 0,
            start: 0,
            end: 0,
            child: StarlightComboWidget(room: widget.room),
          ),

          // 飘屏礼物等
          ...renderExtra(context, widget.room),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    // 小屏幕高度偏移适配
    double mediaTop = MediaQuery.of(context).padding.top;
    double uiTop = 40.dp;
    double top;
    if (mediaTop < uiTop) {
      top = mediaTop - uiTop;
    } else {
      top = 0;
    }
    double bgHeight = 1624 / 750 * Util.width;
    return PositionedDirectional(
      start: 0.0,
      end: 0.0,
      top: top,
      height: bgHeight,
      child: Selector<TalentMainViewModel, String?>(
        selector: (ctx, model) {
          return model.data?.theme?.bg;
        },
        builder: (context, value, child) {
          String? bg = value;
          if (bg == null || bg.trim().isEmpty) {
            return const SizedBox.shrink();
          } else {
            return ChatRoomBgScreen(
              roomBackGroundInfo: RoomBackGroundInfo(type: RoomBackGroundType.jpg, url: bg),
              size: Size(Util.width, bgHeight),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            );
          }
        },
      ),
    );
  }

  bool get _hasEditPermission => TalentHelper.hasEditPermission(widget.room);

  _onBannerClick() async {
    if (true == _viewModel.data?.hasProgram || !_hasEditPermission) {
      // 侧边模式
      await TalentProgrammeListWidget.showOptionsPanel(context, widget.room, _viewModel);
      _viewModel.loadBroadcasterInfo();
    } else {
      bool? refresh = await TalentEditPanel.show(context, room: widget.room);
      Log.d(tag: TAG, 'add panel need refresh->$refresh');
      if (refresh == true) {
        _viewModel.loadBroadcasterInfo();
      }
    }
  }
}
