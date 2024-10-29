import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/repo/room_options_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:image_picker/image_picker.dart';

/// 房间封面设置
class RoomCoverSheet extends StatefulWidget {
  final int rid;
  final String cover;
  final String roomCoverStatus;

  const RoomCoverSheet(
      {Key? key,
      required this.rid,
      required this.cover,
      required this.roomCoverStatus})
      : super(key: key);

  static void setCover(int rid, String cover, String roomCoverStatus) {
    if (Util.isStringEmpty(cover)) {
      _switchImage(rid);
    } else {
      displayModalBottomSheet(
        context: System.context,
        builder: (BuildContext context) {
          return RoomCoverSheet(
              rid: rid, cover: cover, roomCoverStatus: roomCoverStatus);
        },
      );
    }
  }

  static void _switchImage(int rid) async {
    CommonImageUpload imageUploadWithoutUI = CommonImageUpload(
      System.context,
      uploadUrl: '${System.domain}upload/image/',
      source: ImageSource.gallery,
      crop: false,
      minSize: Util.getUserUploadAvatarMinSize(),
      onComplete: (name, origin) {
        if (!Util.isStringEmpty(name)) {
          RoomOptionsRepo.saveRoomCover(rid, name);
        }
        return true;
      },
      onError: (msg) {
        Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
      },
    );
    imageUploadWithoutUI.switchImage();
  }

  @override
  _RoomCoverSheetState createState() => _RoomCoverSheetState(rid, cover);
}

class _RoomCoverSheetState extends State<RoomCoverSheet> {
  final int rid;
  String cover;

  _RoomCoverSheetState(this.rid, this.cover);

  @override
  Widget build(BuildContext context) {
    double imgWidth = Util.width - 20 * 2;
    double imgHeight = imgWidth * 188 / 335;
    double bottomH = 8 + Util.iphoneXBottom;
    double height = 64 + imgHeight + 76 + bottomH;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(18.0),
          topEnd: Radius.circular(18.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 44,
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_room_cover,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: Util.cover750(cover) ?? '',
                  width: imgWidth,
                  height: imgHeight,
                  fit: BoxFit.cover,
                ),
                if (Util.validStr(widget.roomCoverStatus))
                  Container(
                    height: 30,
                    padding: const EdgeInsetsDirectional.only(
                      start: 12,
                      end: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(20)),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.roomCoverStatus,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              RoomCoverSheet._switchImage(rid);
            },
            child: Container(
              height: 52,
              margin: const EdgeInsetsDirectional.only(
                start: 20,
                end: 20,
                top: 24,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.room_replace,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
