import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

class LuckyBagWidget extends StatefulWidget {
  const LuckyBagWidget({super.key});

  @override
  _LuckyBagWidgetState createState() => _LuckyBagWidgetState();
}

class _LuckyBagWidgetState extends State<LuckyBagWidget> {
  bool _lock = false;

  Widget successWidget(List datas, String desc) {
    Map item = datas.first;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 357,
        height: 397,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(Util.getImgUrl(
                'luck_bag_dialog_bg.webp',
                package: ComponentManager.MANAGER_BASE_ROOM)),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsetsDirectional.only(top: 54, bottom: 61),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              K.room_congratulation,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              K.room_get_lucky_bag,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: 130,
              height: 130,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  color: const Color(0xFF630627),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: const Color(0xFFFFCB97))),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(item['image']),
                width: 130,
                height: 130,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              desc,
              style: R.textStyle.regular14.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 160,
                height: 48,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFFDFAC), Color(0xFF9F511C)],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  K.live_pk_submit,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget failedWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 357,
        height: 397,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(Util.getImgUrl(
                'luck_bag_dialog_bg.webp',
                package: ComponentManager.MANAGER_BASE_ROOM)),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsetsDirectional.only(top: 145, bottom: 61),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              K.room_miss_lucky_bag,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              K.room_lucky_bag_miss_tips,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 78,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 160,
                height: 48,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFFDFAC), Color(0xFF9F511C)],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  K.live_pk_submit,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showResultDialog(List datas, String desc) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: datas.isNotEmpty ? successWidget(datas, desc) : failedWidget(),
        ),
      ),
    );
  }

  void luckyBagClick() async {
    if (_lock) {
      return;
    }
    _lock = true;
    try {
      Map<String, String> body = {};
      XhrResponse response = await Xhr.getJson('${System.domain}luckbag/open',
          params: body, throwOnError: true);
      Map json = response.value();
      bool success = json['success'];
      if (success) {
        showResultDialog(Util.parseList(json['data'], (e) => e),
            Util.notNullStr(json['desc']));
      } else {
        if (response.error != null) {
          Fluttertoast.toastException(
              exp: response.error, gravity: ToastGravity.CENTER);
        }
      }
    } catch (exception) {
      Fluttertoast.toastException(exp: exception, gravity: ToastGravity.CENTER);
    }
    _lock = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: luckyBagClick,
      child: CachedNetworkImage(
          imageUrl: Util.getImgUrl('ic_lucky_bag.webp',
              package: ComponentManager.MANAGER_BASE_ROOM),
          width: 80,
          height: 80),
    );
  }
}
