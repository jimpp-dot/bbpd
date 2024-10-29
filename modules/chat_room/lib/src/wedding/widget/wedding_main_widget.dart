import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_view_mode.dart';
import 'package:provider/provider.dart' hide Selector;

/// 婚礼房主UI
class WeddingMainWidget extends StatefulWidget {
  final ChatRoomData room;

  const WeddingMainWidget({super.key, required this.room});

  @override
  _WeddingMainWidgetState createState() => _WeddingMainWidgetState();
}

class _WeddingMainWidgetState extends State<WeddingMainWidget> {
  @override
  Widget build(BuildContext context) {
    RoomWeddingViewModel viewModel = context.watch<RoomWeddingViewModel>();
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 296.dp,
      width: width,
      margin: EdgeInsetsDirectional.only(top: 20.dp),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 63.dp),
            child: CachedNetworkImage(
              imageUrl: viewModel.weddingData?.scene?.seatBg ?? '',
              width: width,
              height: 233.dp,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 27.dp),
                  // 司仪
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 39.dp),
                    child: _renderUserMic(50.dp, WeddingRole.Master,
                        _getPositionByIndex(0, viewModel), 2.dp),
                  ),
                  const Spacer(),
                  // 新郎
                  _renderUserMic(64.dp, WeddingRole.Bridegroom,
                      _getPositionByIndex(1, viewModel), 2.dp),
                  SizedBox(width: 28.dp),
                  // 新娘
                  _renderUserMic(64.dp, WeddingRole.Bride,
                      _getPositionByIndex(2, viewModel), 2.dp),
                  const Spacer(),
                  _renderBlessNum(viewModel.weddingData?.blessScore ?? 0),
                  SizedBox(width: 26.dp),
                ],
              ),
              SizedBox(height: 18.dp),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 20.5.dp),
                  // 伴郎
                  _renderUserMic(40.dp, WeddingRole.Groomsman,
                      _getPositionByIndex(3, viewModel), 1.5.dp),
                  SizedBox(width: 21.dp),
                  _renderUserMic(40.dp, WeddingRole.Groomsman,
                      _getPositionByIndex(4, viewModel), 1.5.dp),
                  const Spacer(),
                  _renderUserMic(40.dp, WeddingRole.Bridesmaid,
                      _getPositionByIndex(5, viewModel), 1.5.dp),
                  SizedBox(width: 21.dp),
                  _renderUserMic(40.dp, WeddingRole.Bridesmaid,
                      _getPositionByIndex(6, viewModel), 1.5.dp),
                  SizedBox(width: 20.5.dp),
                ],
              ),
              SizedBox(height: 22.5.dp),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 20.5.dp),
                  // 伴郎
                  _renderUserMic(40.dp, WeddingRole.Groomsman,
                      _getPositionByIndex(7, viewModel), 1.5.dp),
                  SizedBox(width: 21.dp),
                  _renderUserMic(40.dp, WeddingRole.Groomsman,
                      _getPositionByIndex(8, viewModel), 1.5.dp),
                  const Spacer(),
                  _renderUserMic(40.dp, WeddingRole.Bridesmaid,
                      _getPositionByIndex(9, viewModel), 1.5.dp),
                  SizedBox(width: 21.dp),
                  _renderUserMic(40.dp, WeddingRole.Bridesmaid,
                      _getPositionByIndex(10, viewModel), 1.5.dp),
                  SizedBox(width: 20.5.dp),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 单个伴郎伴娘
  _renderUserMic(double size, WeddingRole weddingRole,
      RoomPosition? roomPosition, double border) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: size + border * 2,
              height: size + border * 2,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size),
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: border),
              ),
              child: UserIcon(
                room: widget.room,
                size: size,
                position: roomPosition ?? RoomPosition(uid: 0),
              ),
            ),
            PositionedDirectional(
                bottom: -9.dp + border,
                child: _renderUserRole(weddingRole, getRoleName(weddingRole))),
          ],
        ),
        SizedBox(height: 9.dp - border),
        Container(
          width: size,
          height: 14.dp,
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            roomPosition?.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10.dp),
          ),
        )
      ],
    );
  }

  /// 用户角色标签
  _renderUserRole(WeddingRole weddingRole, String roleName) {
    Color? color;
    Gradient? gradient;

    if (weddingRole == WeddingRole.Master) {
      // 司仪
      color = const Color(0xFFFF5252);
    } else if (weddingRole == WeddingRole.Bridegroom ||
        weddingRole == WeddingRole.Bride) {
      // 新郎新娘
      gradient =
          const LinearGradient(colors: [Color(0xFF6328FE), Color(0xFFFD34FF)]);
    } else if (weddingRole == WeddingRole.Groomsman) {
      // 伴郎
      gradient =
          const LinearGradient(colors: [Color(0xFF98C7FF), Color(0xFF87BEFF)]);
    } else {
      // 伴娘
      color = const Color(0xFFE49696);
    }
    return Container(
      width: 32.dp,
      height: 16.dp,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.dp),
        border: Border.all(color: Colors.white.withOpacity(0.7), width: 0.5.dp),
        color: color,
        gradient: gradient,
      ),
      child: Text(
        roleName,
        style: TextStyle(
            color: Colors.white, fontSize: 10.dp, fontWeight: FontWeight.w500),
      ),
    );
  }

  /// 祝福值UI
  _renderBlessNum(int blessScore) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 42.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          R.img('wedding/room_wedding_ic_bless.png',
              width: 44.dp,
              height: 44.dp,
              package: ComponentManager.MANAGER_BASE_ROOM),
          Container(
            padding: EdgeInsetsDirectional.only(
                top: 1.dp, bottom: 1.dp, start: 6.dp, end: 6.dp),
            constraints: BoxConstraints(
              minWidth: 40.dp,
            ),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFF5252),
              border: Border.all(color: Colors.white, width: 0.5.dp),
              borderRadius: BorderRadius.circular(10.dp),
            ),
            child: Text(
              Util.numberToWString(blessScore),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 10.dp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  /// 根据角色麦位数据
  RoomPosition? _getPositionByIndex(int index, RoomWeddingViewModel viewModel) {
    List<RoomPosition> positions = widget.room.positions;
    if (positions.length > index) {
      RoomPosition position = positions[index];
      WeddingRole role = RoomWeddingViewModel.getWeddingRole(
          viewModel.weddingData, position.uid);
      String? headIcon; // 头像框地址
      switch (role) {
        case WeddingRole.Master:
          headIcon = viewModel.weddingData?.scene?.mcHeader;
          break;
        case WeddingRole.Bridegroom:
          headIcon = viewModel.weddingData?.scene?.bridegroomHeader;
          break;
        case WeddingRole.Bride:
          headIcon = viewModel.weddingData?.scene?.brideHeader;
          break;
        case WeddingRole.Bridesmaid:
          headIcon = viewModel.weddingData?.scene?.bridesmaidHeader;
          break;
        case WeddingRole.Groomsman:
          headIcon = viewModel.weddingData?.scene?.groomsmanHeader;
          break;
        default:
          break;
      }
      position.setFrame(Util.getRemoteImgUrl(headIcon ?? ''));
      return position;
    }
    return null;
  }
}
