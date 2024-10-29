import 'dart:async';
import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
// import 'package:fluwx/fluwx.dart' as FlutterWx;
import '../../assets.dart';

/// KA用户弹窗

class KAUserDialog extends StatefulWidget {
  /// 数据
  final FriendKAStewardData data;

  const KAUserDialog(this.data, {Key? key}) : super(key: key);

  @override
  State<KAUserDialog> createState() => _KAUserDialogState();

  static Future<void> show(BuildContext context, Map extra) async {
    String curName = appNavigatorObserver.getLast();
    if (curName != '/') {
      //收到通知，不在首页不弹
      return;
    }

    if (extra.isNotEmpty) {
      FriendKAStewardData kaStewardData = FriendKAStewardData()
        ..title = Util.parseStr(extra['title']) ?? ''
        ..desc = Util.parseStr(extra['desc']) ?? ''
        ..stewardId = Util.parseInt(extra['stewardId'])
        ..qrUrl = Util.parseStr(extra['qrUrl']) ?? ''
        ..programPath = Util.parseStr(extra['programPath']) ?? ''
        ..programName = Util.parseStr(extra['programName']) ?? ''
        ..type = Util.parseInt(extra['type']);

      if (Util.validStr(extra['ref']) && extra['ref'] == 'profile_page') {
        Tracker.instance.track(
          TrackEvent.click,
          properties: {'click_page': 'KAUser_profile_page'},
        );
        KAUserDialog._show(context, kaStewardData);
      } else {
        Tracker.instance.track(TrackEvent.view_housekeeper_pop, properties: {
          'gs_id': kaStewardData.stewardId.toString(),
          'pop_state': 'stock_user_show',
          'kauser_type': kaStewardData.type.toString()
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          KAUserDialog._show(context, kaStewardData);
        });
      }
    } else {
      KAUserDialog._show(context, FriendKAStewardData());
    }
  }

  static Future<void> _show(
      BuildContext context, FriendKAStewardData data) async {
    DialogQueue.root.enqueue(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        barrierDismissible: false,
        builder: (context) {
          return KAUserDialog(data);
        });
  }
}

class _KAUserDialogState extends State<KAUserDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 297.0,
                height: 476,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(R.imagePath(widget.data.type == 1
                      ? BaseAssets.shared$ka_user_dialog_bg_two_webp
                      : BaseAssets.shared$ka_user_dialog_bg_one_webp)),
                )),
                child: _contentWidget(),
              ),
              PositionedDirectional(
                  bottom: 28,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      bool installed = false;
                      // try {
                      //   installed = await FlutterWx.isWeChatInstalled;
                      // } catch (e) {
                      //   installed = false;
                      // }
                      if (!installed) {
                        Fluttertoast.showCenter(msg: K.check_is_install_wechat);
                        return;
                      }

                      // if (widget.data.hasProgramName() &&
                      //     widget.data.programName.isNotEmpty &&
                      //     widget.data.hasProgramPath() &&
                      //     widget.data.programPath.isNotEmpty) {
                      //   Tracker.instance.track(
                      //     TrackEvent.click,
                      //     properties: {'click_page': 'KAUser_click_wechat'},
                      //   );

                      //   FlutterWx.launchWeChatMiniProgram(
                      //       username: widget.data.programName, path: widget.data.programPath);
                      //   Navigator.of(context).pop();
                      // }
                    },
                    child: const SizedBox(
                      width: 210,
                      height: 44,
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                Tracker.instance.track(
                  TrackEvent.click,
                  properties: {'click_page': 'KAUser_click_close'},
                );
                Navigator.of(context).pop();
              },
              child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg,
                  width: 48, height: 48)),
        ],
      ),
    );
  }

  Widget _contentWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 21, end: 21),
      child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(widget.data.qrUrl),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 82,
          ),
        ],
      ),
    );
  }
}
