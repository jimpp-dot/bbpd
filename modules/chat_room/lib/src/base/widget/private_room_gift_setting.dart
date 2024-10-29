import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../protobuf/generated/nest.pb.dart';
import 'private_room_panel_item.dart';

class PrivateRoomGiftSetting extends StatefulWidget {
  final List<NestGsListItem>? gifts;
  final int rid;

  const PrivateRoomGiftSetting({super.key, this.gifts, required this.rid});

  @override
  PrivateRoomGiftSettingState createState() {
    return PrivateRoomGiftSettingState();
  }

  static Future<void> show(
      {required BuildContext context,
      List<NestGsListItem>? gifts,
      required int rid}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.5,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return PrivateRoomGiftSetting(gifts: gifts, rid: rid);
      },
    );
  }
}

class PrivateRoomGiftSettingState extends State<PrivateRoomGiftSetting> {
  List<NestGsListItem>? gifts;
  NestGiftCoupon? coupon;

  @override
  void initState() {
    super.initState();
    gifts = widget.gifts;
  }

  void loadData() async {
    String url = '${System.domain}go/room/nest/gsList?rid=${widget.rid}';
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
              toolbarHeight: 48,
              backgroundColor: Colors.transparent,
              backColor: Colors.white,
              title: Text(
                K.room_gift_setting,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: Util.fontFamily,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 20, end: 20, bottom: 5),
              height: 0.5,
              color: const Color(0x33F6F7F9),
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
                      childAspectRatio: 109 / 186,
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
        isGiftSetting: true,
        data: element,
        coupon: coupon,
        refresh: loadData,
        rid: widget.rid,
      ));
    });
    return widgets;
  }
}
