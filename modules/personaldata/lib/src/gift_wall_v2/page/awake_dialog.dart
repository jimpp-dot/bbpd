import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../K.dart';
import '../../../assets.dart';
import '../widget/awake_img_anim.dart';

class AwakeDialog extends StatefulWidget {
  final int targetUid;
  final int giftId;
  final String? giftName;
  final String? roomType;
  final int rid;

  const AwakeDialog(
      {Key? key,
      this.targetUid = 0,
      this.giftId = 0,
      this.giftName,
      this.roomType,
      this.rid = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AwakeDialogState();

  static Future<void> show(
      BuildContext context, int targetUid, int giftId, String giftName,
      {String roomType = '', int rid = 0}) async {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    int index = mainManager.appNavigatorObserverGetIndex("AwakeDialog");
    Log.d("showAwakeDialog,$index");
    if (index > -1) {
      /// 栈中已存在此dialog
      Log.d('AwakeDialog has shown');
      return;
    }
    showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.8),
        context: context,
        routeSettings: const RouteSettings(name: 'AwakeDialog'),
        builder: (BuildContext context) {
          return AwakeDialog(
              targetUid: targetUid,
              giftId: giftId,
              giftName: giftName,
              roomType: roomType,
              rid: rid);
        });
  }
}

class AwakeDialogState extends State<AwakeDialog>
    with TickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        await Future.delayed(const Duration(milliseconds: 200));
        if (mounted) {
          _animController.forward();
        }
      } on TickerCanceled {
        Log.d("error");
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.only(start: 42.dp, end: 42.dp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animController,
              child: Text(
                  K.gift_wall_awake_dialog_content([widget.giftName ?? '']),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15.dp)),
            ),
            SizedBox(
              height: 12.dp,
            ),
            AwakeImgAnim(
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    R.img(Assets.personaldata$gift_wall_gift_halo_webp,
                        width: 200.dp, height: 200.dp),
                    AwakeImgAnim(
                        R.img(Util.giftImgUrl(widget.giftId),
                            width: 188.dp, height: 188.dp),
                        _animController),
                  ],
                ),
                _animController),
            SizedBox(
              height: 12.dp,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openGiftWallScreen(
                    context, widget.targetUid,
                    roomType: widget.roomType ?? '',
                    rid: widget.rid,
                    giftId: widget.giftId);
              },
              child: FadeTransition(
                  opacity: _animController,
                  child: Container(
                    height: 48.dp,
                    width: 160.dp,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFE5D196), Color(0xFFFbF1BB)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      borderRadius: BorderRadiusDirectional.circular(50.dp),
                    ),
                    child: Text(K.gift_wall_awake_dialog_btn,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF5A331A),
                            fontSize: 18.dp)),
                  )),
            ),
            SizedBox(
              height: 16.dp,
            ),
            InkWell(
              child: FadeTransition(
                  opacity: _animController,
                  child: R.img(Assets.personaldata$gift_wall_ic_close_svg,
                      width: 32.dp,
                      height: 32.dp,
                      fit: BoxFit.contain,
                      package: ComponentManager.MANAGER_PERSONALDATA)),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
