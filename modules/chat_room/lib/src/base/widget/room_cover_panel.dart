import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/model/report_type.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/services.dart';

///房间封面弹窗
class RoomCoverPanel extends StatefulWidget {
  final ChatRoomData roomData;
  const RoomCoverPanel({super.key, required this.roomData});

  @override
  State<RoomCoverPanel> createState() => _RoomCoverPanelState();

  static Future show(BuildContext context, ChatRoomData roomData) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 0.8,
      builder: (BuildContext context) {
        return RoomCoverPanel(roomData: roomData);
      },
    );
  }
}

class _RoomCoverPanelState extends State<RoomCoverPanel> {
  String? roomMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(16.dp), topEnd: Radius.circular(16.dp))),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopWidget(),
        _buildCreatorWidget(),
        _buildAnnouncementWidget(),
        const SizedBox(
          height: 27,
        ),
        _buildBottomWidget(),
        SizedBox(
          height: Util.bottomMargin,
        ),
      ],
    );
  }

  Widget _buildTopWidget() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.dp),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(widget.roomData.config?.icon ?? ''),
            width: 60,
            height: 60,
            suffix: Util.squareResizeSuffix(180),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
            height: 61,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.roomData.config?.name ?? '',
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.roomData.config?.subtitle ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    int prettyRid = widget.roomData.prettyRid ?? 0;
                    if (prettyRid <= 0) {
                      prettyRid = widget.roomData.rid;
                    }
                    Clipboard.setData(ClipboardData(text: prettyRid.toString()));
                    Fluttertoast.showToast(msg: K.room_msg_copy + K.success);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildRid(),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        K.room_msg_copy,
                        style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreatorWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 0.5,
          color: Colors.black.withOpacity(0.06),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          K.room_owner,
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (widget.roomData.createor?.uid != null && widget.roomData.createor!.uid > 0) {
              IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, widget.roomData.createor!.uid);
            }
          },
          child: Row(
            children: [
              CommonAvatar(path: Util.getRemoteImgUrl(widget.roomData.createor?.icon), size: 32, shape: BoxShape.circle),
              const SizedBox(
                width: 6,
              ),
              Text(
                widget.roomData.createor?.name ?? '',
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              R.img(RoomAssets.chat_room$ic_next_small_svg, width: 14, height: 14, color: Colors.black.withOpacity(0.5))
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Widget _buildAnnouncementWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          K.room_placard,
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          roomMessage ?? '',
          style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildBottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            _onReport(widget.roomData);
          },
          child: Column(
            children: [
              R.img(RoomAssets.chat_room$ic_report_webp, width: 28, height: 28),
              Text(
                K.room_report_room,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            _onShare(widget.roomData);
          },
          child: Column(
            children: [
              R.img(RoomAssets.chat_room$ic_share_webp, width: 28, height: 28),
              Text(
                K.share_room,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
            giftManager.showRoomGiftPanel(context, room: widget.roomData, uid: widget.roomData.createor?.uid ?? 0);
          },
          child: Column(
            children: [
              R.img(RoomAssets.chat_room$ic_reward_webp, width: 28, height: 28),
              Text(
                K.room_tab_item_package + K.room_owner,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRid() {
    int prettyRid = widget.roomData.prettyRid ?? 0;
    if (prettyRid > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(BaseAssets.shared$ic_pretty_tag_webp, width: 11, height: 11),
          const SizedBox(width: 3),
          ColorfulNickName(
            isPrettyId: true,
            textBuild: (bool show, {Key? key, Paint? paint}) {
              return NumText(
                prettyRid.toString(),
                key: key,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, foreground: paint),
              );
            },
          ),
          const SizedBox(width: 5),
        ],
      );
    }

    return Flexible(
      child: NumText(
        'ID:${widget.roomData.rid}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: R.textStyle.regular10.copyWith(color: Colors.black.withOpacity(0.5), fontSize: 12),
      ),
    );
  }

  void _onShare(ChatRoomData room) async {
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(context, room.realRid,
        tp: 1, needInApp: true, newShareInRoom: true, rid: room.realRid, title: K.room_invite_friend);
  }

  void _onReport(ChatRoomData room) {
    // 举报房间
    IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openReportScreen(context,
        uid: room.createor != null ? room.createor!.uid : 0, reportType: ReportType.Room, reportId: room.realRid);
  }

  ///获取公告
  _loadData() async {
    ResRoomDataDesc des = await RoomApi.roomDescription(widget.roomData.rid);
    if (des.success && des.hasData() && mounted) {
      setState(() {
        roomMessage = des.data;
      });
    }
  }
}
