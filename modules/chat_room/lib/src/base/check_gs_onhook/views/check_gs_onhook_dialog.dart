import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../chat_room.dart';
import '../../../../k.dart';
import '../../widget/topLive.dart';
import '../controllers/check_gs_onhook_controller.dart';
import '../controllers/check_gs_onhook_state.dart';

/// 检查GS排挡挂机页面
/// 需求文档：https://docs.google.com/document/d/1YNYGRrR-y6TUF86Yr8PkfythGbpKu4tRq5X8zkG-YRw/edit#
/// 测试rpc：http://192.168.11.46/test/sendHangupCheck?uid=131564927&rid=200075845&rpc=1
/// 测试rpc：http://192.168.11.46/test/sendHangupCheck?uid=131564927&rpc=1

class CheckGsOnHookDialog extends StatefulWidget {
  final Map<String, dynamic> data;

  const CheckGsOnHookDialog(this.data, {Key? key}) : super(key: key);

  /// 是否已经显示了弹框，默认未显示
  static bool get isDisplayed => Get.isRegistered<CheckGsOnHookController>();

  @override
  State<CheckGsOnHookDialog> createState() => _CheckGsOnHookDialogState();

  static Future<void> show(
      BuildContext context, Map<String, dynamic> data) async {
    showDialog(
      context: context,
      barrierColor: (ChatRoomData.exists() && !TopLiveTool.isShowing)
          ? Colors.transparent
          : Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: CheckGsOnHookDialog(data),
        );
      },
    );
  }
}

class _CheckGsOnHookDialogState extends State<CheckGsOnHookDialog> {
  final CheckGsOnHookController _logic = Get.put(CheckGsOnHookController());
  final CheckGsOnHookState _state = Get.find<CheckGsOnHookController>().state;

  @override
  void initState() {
    super.initState();
    _logic.fromJson(widget.data);
    _logic.gsCheckingPopExposure();
  }

  @override
  void dispose() {
    Get.delete<CheckGsOnHookController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Align(
                  alignment: Alignment.center,
                  child: GetBuilder<CheckGsOnHookController>(
                      id: 'text',
                      builder: (logic) {
                        return Text(
                          logic.state.title,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        );
                      }),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GetBuilder<CheckGsOnHookController>(
                    id: 'text',
                    builder: (logic) {
                      return Text(
                        logic.state.content,
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 16),
                        textAlign: TextAlign.center,
                      );
                    }),
              ),
              GetBuilder<CheckGsOnHookController>(
                  id: 'count_down',
                  builder: (logic) {
                    return logic.state.isShowCountDown
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16),
                              RichText(
                                text: TextSpan(
                                    style: const TextStyle(fontSize: 13),
                                    children: <InlineSpan>[
                                      TextSpan(
                                          text: '${logic.state.countDown}s ',
                                          style: const TextStyle(
                                              color: Color(0xFF2ECEFE),
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text: K.room_auto_close,
                                          style: TextStyle(
                                              color: R.color.mainTextColor
                                                  .withOpacity(0.4))),
                                    ]),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 26.0),
                child: GestureDetector(
                  onTap: _logic.onConfirmTapped,
                  child: Container(
                    height: 48,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors,
                        )),
                    child: GetBuilder<CheckGsOnHookController>(
                        id: 'text',
                        builder: (logic) {
                          return Text(
                            Util.validStr(logic.state.buttonText)
                                ? logic.state.buttonText
                                : K.room_known,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: IconButton(
              onPressed: _logic.onCloseTapped,
              icon: Icon(
                Icons.close,
                size: 24,
                color: R.color.thirdTextColor.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
