import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../chat_room.dart';
import '../wedding/mode/room_wedding_beans.dart';
import 'model/wedding_business_model.dart';
import 'package:provider/provider.dart' hide Selector;

/// 商业婚礼房：麦位列表
class WeddingBusinessUserList extends StatelessWidget {
  final ChatRoomData room;
  final WeddingBusinessModel model;

  const WeddingBusinessUserList(
      {required this.room, required this.model, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 296.dp,
      width: width,
      margin: EdgeInsetsDirectional.only(top: 20.dp),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 27.dp),
              // 司仪
              Padding(
                padding: EdgeInsetsDirectional.only(top: 39.dp),
                child: _renderUserMic(
                    50.dp, WeddingRole.Master, _getPositionByIndex(0), 2),
              ),
              const Spacer(),
              // 新郎
              _renderUserMic(
                  64.dp, WeddingRole.Bridegroom, _getPositionByIndex(9), 2),
              SizedBox(width: 28.dp),
              // 新娘
              _renderUserMic(
                  64.dp, WeddingRole.Bride, _getPositionByIndex(10), 2),
              const Spacer(),
              ChangeNotifierProvider<WeddingBusinessModel>.value(
                value: model,
                child:
                    Consumer<WeddingBusinessModel>(builder: (context, data, _) {
                  return _renderBlessNum(data.value.wedding.score.toInt());
                }),
              ),
              SizedBox(width: 26.dp),
            ],
          ),
          SizedBox(height: 18.dp),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 30.dp),
              _renderStartTopSeat(),
              const Spacer(),
              _renderEndTopSeat(),
              SizedBox(width: 24.dp),
            ],
          ),
          SizedBox(height: 14.dp - 1.5),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 12.dp),
              _renderStartBottomSeat(),
              const Spacer(),
              _renderEndBottomSeat(),
              SizedBox(width: 12.dp),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderStartTopSeat() {
    return SizedBox(
      width: 116.dp + 1.5,
      height: 73.dp + 1.5,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 19.dp + 1.5,
            child: R.img(
              'wedding/business_wedding_seat_start_top.webp',
              width: 114.dp,
              height: 54.dp,
              fit: BoxFit.fill,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          PositionedDirectional(
            start: 12.dp - 1.5,
            child: _renderUserMic(
                40.dp, WeddingRole.Groomsman, _getPositionByIndex(1), 1.5),
          ),
          PositionedDirectional(
            start: 76.dp - 1.5,
            child: _renderUserMic(
                40.dp, WeddingRole.Groomsman, _getPositionByIndex(2), 1.5),
          ),
        ],
      ),
    );
  }

  Widget _renderEndTopSeat() {
    return SizedBox(
      width: 122.dp + 1.5,
      height: 73.dp + 1.5,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 19.dp + 1.5,
            start: 8.dp + 1.5,
            child: R.img(
              'wedding/business_wedding_seat_top_end.webp',
              width: 114.dp,
              height: 54.dp,
              fit: BoxFit.fill,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          PositionedDirectional(
            start: 0,
            child: _renderUserMic(
                40.dp, WeddingRole.Bridesmaid, _getPositionByIndex(3), 1.5),
          ),
          PositionedDirectional(
            start: 64.dp - 1.5,
            child: _renderUserMic(
                40.dp, WeddingRole.Bridesmaid, _getPositionByIndex(4), 1.5),
          ),
        ],
      ),
    );
  }

  Widget _renderStartBottomSeat() {
    return SizedBox(
      width: 114.dp + 1.5,
      height: 66.dp + 1.5,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 12.dp + 1.5,
            child: R.img(
              'wedding/business_wedding_seat_start_bottom.webp',
              width: 114.dp,
              height: 54.dp,
              fit: BoxFit.fill,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          PositionedDirectional(
            start: 10.dp - 1.5,
            child: _renderUserMic(
                40.dp, WeddingRole.Groomsman, _getPositionByIndex(5), 1.5),
          ),
          PositionedDirectional(
            start: 74.dp - 1.5,
            child: _renderUserMic(
                40.dp, WeddingRole.Groomsman, _getPositionByIndex(6), 1.5),
          ),
        ],
      ),
    );
  }

  Widget _renderEndBottomSeat() {
    return SizedBox(
      width: 114.dp + 1.5,
      height: 66.dp + 1.5,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 12.dp + 1.5,
            start: 1.5,
            child: R.img(
              'wedding/business_wedding_seat_bottom_end.webp',
              width: 114.dp,
              height: 54.dp,
              fit: BoxFit.fill,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          PositionedDirectional(
            start: 0,
            child: _renderUserMic(
                40.dp, WeddingRole.Bridesmaid, _getPositionByIndex(7), 1.5),
          ),
          PositionedDirectional(
            start: 64.dp - 1.5,
            child: _renderUserMic(
                40.dp, WeddingRole.Bridesmaid, _getPositionByIndex(8), 1.5),
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
                room: room,
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
          child: _buildUserName(roomPosition),
        )
      ],
    );
  }

  Widget _buildUserName(RoomPosition? roomPosition) {
    List<Color>? colors = roomPosition?.colorfulName;
    if (colors == null || colors.isEmpty) {
      return Text(
        roomPosition?.name ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10.dp),
      );
    }
    return ColorfulNickName(
      colors: colors,
      textBuild: (bool show, {Key? key, Paint? paint}) {
        return Text(
          roomPosition?.name ?? '',
          key: key,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10.dp,
            foreground: paint,
          ),
        );
      },
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
  RoomPosition? _getPositionByIndex(int index) {
    List<RoomPosition> positions = room.positions;
    if (!Util.validList(positions)) return null;
    if (positions.length > index) {
      return positions[index];
    }
    return null;
  }
}
