import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/off_mic_user_list.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';
import 'package:chat_room/src/wedding/widget/wedding_effects_widget.dart';
import 'package:chat_room/src/wedding/widget/wedding_header_widget.dart';

import 'mode/room_wedding_view_mode.dart';
import 'mode/wedding_combo_data.dart';
import 'widget/wedding_aura_view.dart';
import 'widget/wedding_combo_gift_list.dart';
import 'widget/wedding_combo_user_list.dart';
import 'widget/wedding_main_widget.dart';
import 'widget/wedding_next_dialog.dart';
import 'widget/wedding_screenshot.dart';

/// 房间婚礼房模板
class RoomWeddingWidget extends StatefulWidget {
  final ChatRoomData room;
  final ValueChanged<String> onLoadCallback;

  const RoomWeddingWidget(
      {super.key, required this.room, required this.onLoadCallback});

  @override
  _RoomWeddingWidgetState createState() => _RoomWeddingWidgetState();
}

class _RoomWeddingWidgetState extends State<RoomWeddingWidget>
    with RoomTemplateMixin {
  late RoomWeddingViewModel _viewModel;
  late ScreenshotController _screenshotController;
  final GlobalKey _screenshotKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _screenshotController = ScreenshotController();
    _viewModel = RoomWeddingViewModel(widget.room, widget.onLoadCallback);
    _viewModel.initState();
    widget.room
        .addListener(RoomConstant.Event_Wedding_Confirm, _onSocketMessage);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    widget.room
        .removeListener(RoomConstant.Event_Wedding_Confirm, _onSocketMessage);
    super.dispose();
  }

  dynamic _onSocketMessage(String name, dynamic data) async {
    if (data == null) return false;

    try {
      Map content = data;
      String type = Util.notNullStr(content['type']);
      String des = Util.notNullStr(content['content']);
      if (type == 'ask') {
        _showConfirmDialog(des);
      } else if (type == 'answer' && des.isNotEmpty) {
        Fluttertoast.showToast(msg: des, gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Log.d(e);
    }
  }

  _showConfirmDialog(String content) {
    WeddingNextDialog.show(
      context,
      onTapNo: () => _viewModel.onConfirmNext(false),
      onTapYes: () => _viewModel.onConfirmNext(true),
      content: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(R.imagePath('room_bg.png',
                    package: ComponentManager.MANAGER_BASE_ROOM)),
                fit: BoxFit.fill),
          ),
        ),
        ChangeNotifierProvider.value(
          value: _viewModel,
          builder: (context, child) {
            bool loading =
                context.select((RoomWeddingViewModel value) => value.loading);
            if (loading || _viewModel.weddingData == null) {
              return const SizedBox.shrink();
            }
            return ScreenShot(
                controller: _screenshotController, child: _renderBody());
          },
        ),
        ChangeNotifierProvider.value(
          value: _viewModel,
          builder: (context, child) {
            bool loading =
                context.select((RoomWeddingViewModel value) => value.loading);
            if (loading || _viewModel.weddingData == null) {
              return const SizedBox.shrink();
            }

            /// 氛围道具
            return _renderAura();
          },
        ),
        ...renderExtra(context, widget.room),
      ],
    );
  }

  /// 主UI
  Widget _renderBody() {
    final room = widget.room;

    List<Widget> res = [];

    res.add(WeddingHeader(room: room));

    res.add(WeddingMainWidget(room: widget.room));
    res.add(SizedBox(height: 8.dp));
    res.add(OffMicUserList(room: widget.room));
    res.add(SizedBox(height: 16.dp));

    // 公屏
    res.add(renderMessageList(widget.room));

    // 底部控制区
    res.add(RoomBottomController(room: room));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (RoomWeddingViewModel.getSelfRole(_viewModel.weddingData) ==
              WeddingRole.Bridegroom)
            WeddingScreenshot(
                key: _screenshotKey,
                weddingData: _viewModel.weddingData!,
                screenshotController: _screenshotController),
          // 背景
          SizedBox(
            width: width,
            height: height,
            child: _renderRoomBg(_viewModel.weddingData?.scene?.bg ?? ''),
          ),
          PositionedDirectional(
            start: 0.0,
            end: 0.0,
            top: 0.0,
            height: height - Util.iphoneXBottom,
            child: Column(
              children: res,
            ),
          ),
          Selector<RoomWeddingViewModel, WeddingState?>(
            selector: (context, model) => model.weddingData?.stage,
            shouldRebuild: (pre, next) => pre != next,
            builder: (context, stage, child) {
              if (_viewModel.isStartWeddingState ||
                  _viewModel.weddingEffect?.downUrl == null ||
                  _viewModel.weddingState == null) {
                Log.d('WeddingEffectsWidget return isStartWeddingState');
                return Container();
              }
              Log.d('WeddingEffectsWidget will build');
              return Positioned.fill(
                child: WeddingEffectsWidget(
                  key: ValueKey(_viewModel.weddingState),
                  vapUrl: _viewModel.weddingEffect!.downUrl,
                  vapSize: _viewModel.weddingEffect!.vapSize,
                ),
              );
            },
          ),
          //连接玩家列表
          Selector<RoomWeddingViewModel, List<WeddingComboUser>>(
            selector: (context, model) => model.comboTopList ?? [],
            shouldRebuild: (pre, next) => pre != next,
            builder: (context, comboUsers, child) {
              return Positioned.fill(
                top: MediaQuery.of(context).padding.top + 406.dp,
                bottom: MediaQuery.of(context).padding.bottom + 10.0,
                child: WeddingComboUserList(combos: comboUsers),
              );
            },
          ),
          //气球动画列表
          Selector<RoomWeddingViewModel, WeddingComboConfig?>(
            selector: (context, model) => model.weddingData?.comboConfig,
            shouldRebuild: (pre, next) => pre != next,
            builder: (context, config, child) {
              return Positioned.fill(
                child: WeddingComboGiftList(config: config),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 拍照按钮
  Widget _renderAura() {
    int? duration = _viewModel.weddingData?.comboConfig?.duration;
    if (duration == null) return Container();
    Widget body = PositionedDirectional(
      top: 440.dp + 48 + MediaQuery.of(context).padding.top,
      end: 10,
      child: WeddingAuraView(
          rid: widget.room.rid, config: _viewModel.weddingData?.comboConfig),
    );
    return body;
  }

  /// 房间背景
  Widget _renderRoomBg(String bg) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CachedNetworkImage(
      imageUrl: bg,
      fit: BoxFit.cover,
      width: width,
      height: height,
      fadeInDuration: const Duration(milliseconds: 0),
      fadeOutDuration: const Duration(milliseconds: 0),
      cachedWidth:
          (MediaQuery.of(context).size.width * Util.devicePixelRatio).toInt(),
      cachedHeight:
          (MediaQuery.of(context).size.height * Util.devicePixelRatio).toInt(),
    );
  }
}
