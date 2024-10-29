import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'widget/ktv_music_area.dart';
import 'widget/ktv_user_list.dart';
import 'model/ktv_music_model.dart';
import 'widget/ktv_music_control_bar.dart';
import 'ktv_music_controller.dart';

import 'room_task/ktv_task_widget.dart';
import 'package:provider/provider.dart' hide Selector;

/// ktv  房间主界面
///
class KtvRoomWidget extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback onSettingClick;

  const KtvRoomWidget(
      {super.key, required this.room, required this.onSettingClick});

  @override
  State<KtvRoomWidget> createState() => _KtvRoomWidgetState();
}

class _KtvRoomWidgetState extends State<KtvRoomWidget>
    with
        RoomTemplateMixin<KtvRoomWidget>,
        RoomFloatingBannerMixin<KtvRoomWidget> {
  late KtvMusicModel _model;

  @override
  void initState() {
    super.initState();
    AppConfig.sync(type: [AppConfig.song_domain]);
    _model = KtvMusicModel(widget.room);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.room.config?.ktvInfo == null) {
      return const SizedBox.shrink();
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _model),
      ],
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        renderBg(context, widget.room),
        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          top: 0.0,
          height: Util.height - Util.iphoneXBottom,
          child: _buildMain(),
        ),
        PositionedDirectional(
          end: 0,
          bottom: preMadeRecruitBottom,
          child: buildFloatingBanner(widget.room),
        ),
        ...renderExtra(context, widget.room),
      ],
    );
  }

  Widget _buildMain() {
    return Column(
      children: [
        renderRoomHeader(widget.room, widget.onSettingClick),
        _buildKtvMusicArea(),
        KtvUserList(room: widget.room),
        renderMessageList(widget.room),
        _buildBottomControlBar(),
        renderController(widget.room)
        // _buildSingOptBar(),
      ],
    );
  }

  Widget _buildKtvMusicArea() {
    return Stack(
      children: [
        KtvMusicArea(
            room: widget.room,
            ktvInfo: widget.room.config!.ktvInfo!,
            model: _model),

        /// KTV房间右下角的任务图标
        if (widget.room.showKtvTask) KtvTaskWidget(widget.room),
      ],
    );
  }

  /// ktv 底部调音区域
  Widget _buildBottomControlBar() {
    return Consumer<KtvMusicModel>(
      builder: (context, value, child) {
        return Visibility(
          visible: _showControlView(value),
          child: KtvMusicControlBar(room: widget.room),
        );
      },
    );
  }

  bool _showControlView(KtvMusicModel model) {
    bool isCreator = Session.uid == widget.room.createor?.uid;
    bool isSinger = KtvMusicController.isSinger;
    bool isChorus = KtvMusicController.isChorus;
    var show = ((model.singMode != KtvMusicSingMode.none) &&
            (isCreator || isSinger || isChorus)) &&
        KtvMusicController.singStatus;
    return show;
  }
}
