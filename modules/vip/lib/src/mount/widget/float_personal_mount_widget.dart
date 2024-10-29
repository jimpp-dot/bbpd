import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';
import 'package:vip/src/mount/page/my_mount_page.dart';
import 'package:vip/src/mount/widget/personal_mount_widget.dart';

class FloatPersonalMountWidget extends StatelessWidget {
  final int uid;
  final List<MountSerialProfile> mountSerialData;

  const FloatPersonalMountWidget(
      {super.key, required this.uid, required this.mountSerialData});

  @override
  Widget build(BuildContext context) {
    MountSerialProfile serial = mountSerialData[0];
    List<MountSerialProfileItem> list = serial.items;
    bool serialLight = serial.inUse;
    int totalCount = list.length;
    int ownCount = 0;
    for (var element in list) {
      if (element.unlock) {
        ownCount++;
      }
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
      height: 96,
      child: Row(
        children: [
          Container(
            width: 55,
            height: 84,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              K.vip_mount_series,
              style: TextStyle(
                  fontSize: 13,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                MyMountPage.show(context, uid,
                    serialId: serial.serialId, refer: '个人资料页');
              },
              child: Container(
                height: 84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF6F7F9),
                ),
                child: ListView.separated(
                  padding: const EdgeInsetsDirectional.only(
                      start: 12, end: 12, top: 6),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String icon;
                    bool light;
                    String text;
                    if (index == 0) {
                      icon = serial.icon;
                      light = serialLight;
                      text = '${serial.title} $ownCount/$totalCount';
                    } else {
                      MountSerialProfileItem item = list[index - 1];
                      icon = item.icon;
                      light = serialLight && item.unlock;
                      text = item.name;
                    }
                    Widget mount = CachedNetworkImage(
                        imageUrl: icon, width: 54, height: 54);
                    return Column(
                      children: [
                        light
                            ? mount
                            : ColorFiltered(
                                colorFilter: greyscale, child: mount),
                        const SizedBox(height: 2),
                        Text(text,
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xFF7A7A7A))),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: list.length + 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
