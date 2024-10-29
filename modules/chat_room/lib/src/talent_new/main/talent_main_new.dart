import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/chat_room_bg_screen.dart';
import 'package:chat_room/src/talent_new/main/talent_position_widget_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 房间-麦序房主页面
class RoomTalentMainNewWidget extends StatefulWidget {
  final ChatRoomData room;
  final ValueChanged<String>? onLoadCallback;
  final VoidCallback onSettingClick;

  const RoomTalentMainNewWidget({
    super.key,
    required this.room,
    this.onLoadCallback,
    required this.onSettingClick,
  });

  @override
  _RoomTalentMainNewWidgetState createState() =>
      _RoomTalentMainNewWidgetState();
}

class _RoomTalentMainNewWidgetState extends State<RoomTalentMainNewWidget>
    with
        RoomTemplateMixin<RoomTalentMainNewWidget>,
        SingleTickerProviderStateMixin,
        RoomFloatingBannerMixin<RoomTalentMainNewWidget> {
  final Color _blankColor = const Color(0xFF1F1758);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(color: _blankColor),

          _buildBackground(context),

          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部标题栏区域
              _buildHeader(),
              SizedBox(height: 60.dp),
              // 中间麦位
              TalentPositionNewWidget(room: widget.room),
              // 公屏消息
              renderMessageList(widget.room),
              //底部操作栏
              RoomBottomController(room: widget.room),
              SizedBox(height: Util.iphoneXBottom),
            ],
          ),

          PositionedDirectional(
            end: 0,
            bottom: preMadeRecruitBottom,
            child: buildFloatingBanner(widget.room),
          ),

          // 飘屏礼物等
          ...renderExtra(context, widget.room),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return RoomHeaderNormal(
      room: widget.room,
      onSettingClick: widget.onSettingClick,
    );
  }

  Widget _buildBackground(BuildContext context) {
    return PositionedDirectional(
      start: 0.0,
      end: 0.0,
      top: 0.0,
      height: MediaQuery.of(context).size.height,
      child: ChatRoomBgScreen(
        roomBackGroundInfo: widget.room.config?.roomBackground,
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
      ),
    );
  }
}
