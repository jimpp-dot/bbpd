import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/widget/private_room_gift_setting.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/nest.pb.dart';
import 'private_room_panel_item.dart';

/// 私密房：童话飞船面板（给麦上GS送礼入口，管理员设置GS礼物入口）
class PrivateRoomPanel extends StatefulWidget {
  final ChatRoomData room;

  const PrivateRoomPanel({super.key, required this.room});

  @override
  PrivateRoomPanelState createState() {
    return PrivateRoomPanelState();
  }

  static Future<void> show(
      {required BuildContext context, required ChatRoomData room}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.5,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return PrivateRoomPanel(
          room: room,
        );
      },
    );
  }
}

class PrivateRoomPanelState extends State<PrivateRoomPanel> {
  List<NestGsListItem>? gifts;
  NestGiftCoupon? coupon;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    String url = '${System.domain}go/room/nest/gsList?rid=${widget.room.rid}';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      ApiNestGsListResponse nestGsListResponse =
          ApiNestGsListResponse.fromBuffer(response.bodyBytes);
      if (nestGsListResponse.success == true) {
        coupon = nestGsListResponse.data.coupon;
        gifts = nestGsListResponse.data.data;
      } else if (Util.validStr(nestGsListResponse.message)) {
        Fluttertoast.showCenter(msg: nestGsListResponse.message);
      }
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        height: 398,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              R.imagePath(
                'private_room_panel_bg.webp',
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            BaseAppBar.custom(
              showBack: false,
              toolbarHeight: 48,
              backgroundColor: Colors.transparent,
              title: Text(
                K.room_private_room_panel_title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: Util.fontFamily,
                ),
              ),
              actions: [
                if (widget.room.isCreator ||
                    widget.room.isReception ||
                    widget.room.isSuper)
                  GestureDetector(
                    onTap: () async {
                      await PrivateRoomGiftSetting.show(
                          context: context,
                          gifts: gifts,
                          rid: widget.room.realRid);
                      load();
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 14, bottom: 14, start: 5, end: 5),
                      child: R.img(
                        'ic_settings.svg',
                        width: 20,
                        height: 20,
                        color: Colors.white60,
                        package: ComponentManager.MANAGER_BASE_ROOM,
                      ),
                    ),
                  ),
                GestureDetector(
                  onTap: () {
                    String url = Util.getHelpUrlWithQStr('k92');
                    BaseWebviewScreen.show(System.context, url: url);
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 14, bottom: 14, start: 5, end: 16),
                    child: R.img(
                      'ic_help.webp',
                      width: 19,
                      height: 19,
                      color: Colors.white60,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 20, end: 20, bottom: 19),
              height: 0.5,
              color: const Color(0x33F6F7F9),
            ),
            Text(
              K.room_private_room_panel_subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Util.validList(gifts)
                  ? GridView.count(
                      padding: EdgeInsetsDirectional.only(
                          top: 15,
                          start: 16,
                          end: 16,
                          bottom: 20 + Util.iphoneXBottom),
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 109 / 170,
                      children: buildGrid(),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildGrid() {
    List<Widget> widgets = [];
    gifts?.forEach((element) {
      widgets.add(PrivateRoomPanelItem(
        ratio: (Util.width - 32 - 16) / 3 / 109,
        isGiftSetting: false,
        data: element,
        coupon: coupon,
        refresh: () async {
          if (mounted && (ModalRoute.of(context)?.isCurrent ?? false)) {
            Navigator.of(context).pop();
          }
        },
      ));
    });

    return widgets;
  }
}
