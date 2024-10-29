import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/accompany/model/accompany_invite_model.dart';
import 'package:chat_room/src/accompany/model/accompany_repository.dart';

/// 陪伴房邀请弹窗
class AccompanyInviteDialog extends StatelessWidget {
  final AccompanyInviteSocketData data;

  const AccompanyInviteDialog({super.key, required this.data});

  static void show(BuildContext context, Map<String, dynamic>? json) async {
    // 在房间不弹窗
    if (ChatRoomData.exists()) {
      return;
    }
    if (json != null) {
      AccompanyInviteSocketData data = AccompanyInviteSocketData.fromJson(json);
      if (data.rid > 0 && data.from != null && data.to != null) {
        _showDialog(context, data);
      }
    }
  }

  static Future<bool?> _showDialog(
      BuildContext context, AccompanyInviteSocketData data) async {
    return await DialogQueue.root.enqueue(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AccompanyInviteDialog(data: data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 312.dp,
        height: 341.dp,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: 312.dp,
              height: 341.dp,
              decoration: BoxDecoration(
                color: R.color.mainBgColor,
                borderRadius: BorderRadius.circular(20.dp),
              ),
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Container(
            //       width: 312.dp,
            //       height: 107.dp,
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            //         borderRadius: BorderRadius.vertical(top: Radius.circular(20.dp)),
            //       ),
            //     ),
            //     Container(
            //       width: 312.dp,
            //       height: 234.dp,
            //       decoration: BoxDecoration(
            //         color: R.color.mainBgColor,
            //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.dp)),
            //       ),
            //     )
            //   ],
            // ),
            PositionedDirectional(
              top: 69.dp,
              start: 0,
              end: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 176.dp,
                    height: 96.dp,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        PositionedDirectional(
                          top: 0,
                          end: 0,
                          child: Container(
                            width: 96.dp,
                            height: 96.dp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.dp),
                              border:
                                  Border.all(color: Colors.white, width: 4.dp),
                            ),
                            child: CommonAvatar(
                              path: data.to?.iconUrl,
                              shape: BoxShape.circle,
                              size: 88.dp,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          start: 0,
                          top: 0,
                          child: Container(
                            width: 96.dp,
                            height: 96.dp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.dp),
                              border:
                                  Border.all(color: Colors.white, width: 4.dp),
                            ),
                            child: CommonAvatar(
                              path: data.from?.iconUrl,
                              shape: BoxShape.circle,
                              size: 88.dp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.dp),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
                    child: Text(data.from?.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.dp)),
                  ),
                  SizedBox(height: 8.dp),
                  Text(K.room_invite_you_to_join,
                      style: TextStyle(
                          color: R.color.mainTextColor, fontSize: 15.dp)),
                  SizedBox(height: 24.dp),
                  GestureDetector(
                    onTap: () {
                      _goToRoom(context);
                    },
                    child: Container(
                      width: 248.dp,
                      height: 56.dp,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                        borderRadius: BorderRadius.circular(28.dp),
                      ),
                      child: Text(K.room_vehicle_join,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.dp,
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
            ),
            PositionedDirectional(
              end: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8.dp),
                  child: R.img(RoomAssets.chat_room$accompany_ic_close_webp,
                      width: 24.dp, height: 24.dp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 进房
  _goToRoom(BuildContext context) async {
    bool result = await AccompanyRepository.acceptInvite(data.rid);
    Navigator.pop(context);
    if (result) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, data.rid);
    }
  }
}
