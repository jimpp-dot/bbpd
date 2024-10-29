import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 首充大礼包弹窗

class FirstChargePackage extends StatefulWidget {
  const FirstChargePackage({super.key});

  static Future show(BuildContext context) async {
    DialogTransition.scaleShow(
        context: context,
        barrierDismissible: false,
        duration: const Duration(milliseconds: 250),
        builder: (context) => const FirstChargePackage());
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<FirstChargePackage> {
  bool _loading = true;

  List? data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: Loading());
    }
    return FirstChargePackageDialog(data);
  }

  void _load() async {
    try {
      String url = '${System.domain}account/newPayPackage?v=1';
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (!mounted) return;
      Map res = response.value();
      if (response.error == null) {
        if (res['success'] == true) {
          setState(() {
            _loading = false;
            data = res['data'];
          });
        } else {
          Fluttertoast.showToast(msg: res['msg'] ?? '');
          Navigator.pop(context);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      Navigator.pop(context);
    }
  }
}

class FirstChargePackageDialog extends Dialog {
  final List? data;

  const FirstChargePackageDialog(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: EdgeInsets.only(top: Util.iphoneXBottom),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            R.img('box/first_charge_top.webp',
                height: 162.dp, package: ComponentManager.MANAGER_BASE_CORE),
            PositionedDirectional(
              top: 146.dp,
              child: R.img('box/first_charge_bg.webp',
                  height: 392.dp, package: ComponentManager.MANAGER_BASE_CORE),
            ),
            PositionedDirectional(
                start: 31.dp,
                end: 31.dp,
                top: 110.dp,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    R.img('box/first_charge_title_bg.webp',
                        width: 250.dp,
                        height: 76.dp,
                        package: ComponentManager.MANAGER_BASE_CORE),
                    Positioned(
                        bottom: 30.dp,
                        child: Text(
                          K.base_charge_package_title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                )),

            ///首充奖励
            PositionedDirectional(
                top: 188.dp,
                width: 279.dp,
                height: 246.dp,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    PositionedDirectional(
                        top: 13.dp,
                        start: 7.dp,
                        child: Container(
                            height: 233.dp,
                            width: 272.dp,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFB180FF),
                                      Color(0xFF77B4FF)
                                    ],
                                    begin: FractionalOffset(1, 0),
                                    end: FractionalOffset(0, 1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))))),
                    PositionedDirectional(
                      start: 10.dp,
                      top: 16.dp,
                      child: Container(
                          width: 266.dp,
                          height: 227.dp,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)))),
                    ),
                    PositionedDirectional(
                      top: 0,
                      start: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 26.dp,
                        constraints: BoxConstraints(minWidth: 140.dp),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(34),
                            bottomEnd: Radius.circular(34),
                          ),
                          gradient: LinearGradient(
                              colors: [Color(0xFFCF56FE), Color(0xFF2E86FC)],
                              begin: FractionalOffset(1, 0),
                              end: FractionalOffset(0, 1)),
                        ),
                        child: Text(
                          '${K.base_first_charge_notice_str}${MoneyConfig.moneyNum(10 * 100)}${MoneyConfig.moneyName}${K.base_first_charge_unlock}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                        top: 26.dp,
                        start: 0,
                        child: R.img('box/first_charge_rect.webp',
                            width: 7.dp,
                            height: 7.dp,
                            package: ComponentManager.MANAGER_BASE_CORE)),
                    PositionedDirectional(
                        start: 0.dp,
                        top: 27.dp,
                        child: Container(
                          width: 60.dp,
                          height: 50.dp,
                          padding: const EdgeInsets.all(15),
                          child: R.img('box/first_charge_left_coin.webp',
                              package: ComponentManager.MANAGER_BASE_CORE),
                        )),
                    PositionedDirectional(
                        top: 31.dp,
                        start: 10,
                        end: 10,
                        bottom: 10,
                        child: _renderGiftItems(GiveItem.parseList(data))),
                  ],
                )),

            ///充值满100奖励
            // PositionedDirectional(
            //     top: 322.dp,
            //     width: 279.dp,
            //     height: 186.dp,
            //     child: Stack(
            //       alignment: Alignment.center,
            //       children: <Widget>[
            //         PositionedDirectional(
            //             top: 13.dp,
            //             start: 7.dp,
            //             child: Container(
            //                 height: 112.dp,
            //                 width: 272.dp,
            //                 decoration: BoxDecoration(
            //                     gradient: LinearGradient(
            //                         colors: [
            //                           Color(0xFFB180FF),
            //                           Color(0xFF77B4FF)
            //                         ],
            //                         begin: FractionalOffset(1, 0),
            //                         end: FractionalOffset(0, 1)),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(16))))),
            //         PositionedDirectional(
            //           start: 10.dp,
            //           top: 16.dp,
            //           child: Container(
            //               width: 266.dp,
            //               height: 106.dp,
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(13)))),
            //         ),
            //         PositionedDirectional(
            //           top: 0,
            //           start: 0,
            //           child: Container(
            //               alignment: Alignment.center,
            //               height: 26.dp,
            //               constraints: BoxConstraints(minWidth: 176.dp),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadiusDirectional.only(
            //                   topEnd: Radius.circular(34),
            //                   bottomEnd: Radius.circular(34),
            //                 ),
            //                 gradient: LinearGradient(
            //                     colors: [Color(0xFFCF56FE), Color(0xFF2E86FC)],
            //                     begin: FractionalOffset(1, 0),
            //                     end: FractionalOffset(0, 1)),
            //               ),
            //               child: PriceWidget(
            //                 Util.parseInt(data['num']),
            //                 priceType: _genPriceType(),
            //                 priceTextStyle: TextStyle(
            //                     fontSize: 15,
            //                     color: Color(0xFFFFC845),
            //                     fontWeight: FontWeight.w500),
            //                 prefixWidget: Text(K.base_total_charge,
            //                     style: TextStyle(
            //                         fontSize: 15,
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.w500)),
            //                 suffixWidget: Text(
            //                   K.base_can_receive,
            //                   style: TextStyle(
            //                       fontSize: 15,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.w500),
            //                 ),
            //               )),
            //         ),
            //         PositionedDirectional(
            //             top: 26.dp,
            //             start: 0,
            //             child: R.img('box/first_charge_rect.webp',
            //                 width: 7,
            //                 height: 7,
            //                 package: ComponentManager.MANAGER_BASE)),
            //         PositionedDirectional(
            //             top: 31.dp,
            //             child:
            //                 _renderGiftItems(GiveItem.parseList(data['t2']))),
            //         PositionedDirectional(
            //           top: 138.dp,
            //           child: GestureDetector(
            //             onTap: () => _onChargeTap(context),
            //             child: Container(
            //                 width: 165.dp,
            //                 height: 48.dp,
            //                 alignment: Alignment.center,
            //                 decoration: BoxDecoration(
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(25)),
            //                   gradient: LinearGradient(
            //                       colors: [
            //                         Color(0xFFCF56FE),
            //                         Color(0xFF2E86FC)
            //                       ],
            //                       begin: FractionalOffset(1, 0),
            //                       end: FractionalOffset(0, 1)),
            //                 ),
            //                 child: Text(K.base_charge_now,
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontSize: 17,
            //                         fontWeight: FontWeight.w600))),
            //           ),
            //         )
            //       ],
            //     )),

            PositionedDirectional(
                top: 450.dp,
                child: HeartbeatButton(onTap: () => _onChargeTap(context))),

            Positioned(
              top: 558.dp,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: R.img('box/ic_close.svg',
                    width: 32.dp,
                    height: 32.dp,
                    package: ComponentManager.MANAGER_BASE_CORE),
              ),
            ),

            PositionedDirectional(
                end: 0,
                top: 246.dp,
                child: Container(
                  width: 126.dp,
                  height: 105.dp,
                  padding: const EdgeInsets.all(30),
                  child: R.img('box/first_charge_right_coin.webp',
                      package: ComponentManager.MANAGER_BASE_CORE),
                )),

            PositionedDirectional(
                start: 0,
                top: 377.dp,
                child: Container(
                  width: 123.dp,
                  height: 104.dp,
                  padding: const EdgeInsets.all(30),
                  child: R.img('box/first_charge_left_coin.webp',
                      package: ComponentManager.MANAGER_BASE_CORE),
                )),
          ],
        ),
      ),
    );
  }

  Widget _renderGiftItems(List<GiveItem> items) {
    List<Widget> widgets = items.map<Widget>((item) {
      return Container(
          margin: EdgeInsetsDirectional.only(start: 5.dp, end: 5.dp),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 60.dp,
                  height: 60.dp,
                  padding: EdgeInsets.all(5.dp),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    gradient: RadialGradient(
                        //背景径向渐变
                        colors: [
                          Color(0xFFFFFFFF),
                          Color(0xFFFDFDFD),
                          Color(0xFFE6F0FA)
                        ],
                        center: Alignment.center,
                        radius: .6),
                  ),
                  child: CachedNetworkImage(
                    width: 50.dp,
                    height: 50.dp,
                    imageUrl: "${System.imageDomain}${item.icon}",
                    placeholder: const CupertinoActivityIndicator(),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 4.dp),
                child: Text(
                  '${item.name} x${item.num}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 11,
                  ),
                ),
              )
            ],
          ));
    }).toList();

    return GridView.count(
      primary: false,
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 0.8,
      shrinkWrap: true,
      children: widgets,
    );
  }

  void _onChargeTap(BuildContext context) {
    Navigator.pop(context);
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.openRechargeScreen(context);
  }
}

class HeartbeatButton extends StatefulWidget {
  final VoidCallback? onTap;

  const HeartbeatButton({Key? key, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HeartbeatButtonState();
  }
}

class HeartbeatButtonState extends State<HeartbeatButton>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animController.addStatusListener(_onAniStatus);
    animation = Tween(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: animController, curve: Curves.easeIn),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animController.forward();
    });
  }

  void _onAniStatus(AnimationStatus status) {
//    Log.d(status);
    if (status == AnimationStatus.completed) {
      //AnimationStatus.completed 动画在结束时停止的状态
      animController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      //AnimationStatus.dismissed 表示动画在开始时就停止的状态
      animController.forward();
    }
  }

  @override
  void dispose() {
    animController.removeStatusListener(_onAniStatus);
    animController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      animController.stop();
    } else if (state == AppLifecycleState.resumed) {
      if (!animController.isAnimating) animController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
            width: 165.dp,
            height: 48.dp,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                  colors: [Color(0xFFCF56FE), Color(0xFF2E86FC)],
                  begin: FractionalOffset(1, 0),
                  end: FractionalOffset(0, 1)),
            ),
            child: Text(K.base_charge_now,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }
}

class GiveItem {
  String? icon;
  String? name;
  int num = 0;

  static List<GiveItem> parseList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map<GiveItem>((map) {
      GiveItem giveItem = GiveItem();
      giveItem.name = Util.parseStr(map['name']);
      giveItem.num = Util.parseInt(map['num']);
      giveItem.icon = Util.parseStr(map['image']);
      return giveItem;
    }).toList();
  }
}
