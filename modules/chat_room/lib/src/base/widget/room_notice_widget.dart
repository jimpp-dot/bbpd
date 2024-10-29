import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 房间公告
///
class RoomNoticeWidget extends StatefulWidget {
  final bool canEdit;
  final GlobalKey noticeKey;
  final int rid;

  const RoomNoticeWidget(this.canEdit, this.noticeKey, this.rid, {Key? key}) : super(key: key);

  @override
  _RoomNoticeWidgetState createState() => _RoomNoticeWidgetState();

  static Future show(BuildContext buildContext, bool canEdit, GlobalKey noticeKey, int rid) {
    return showDialog(
      context: buildContext,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (buildContext) {
        return RoomNoticeWidget(canEdit, noticeKey, rid);
      },
    );
  }
}

class _RoomNoticeWidgetState extends State<RoomNoticeWidget> with SingleTickerProviderStateMixin {
  String msg = '';
  late AnimationController _controller;
  late Animation<double> _animation;
  double _centerX = 0;
  double _centerY = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: const ElasticOutCurve(0.8))).animate(_controller);
    _updateMargin();

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.of(context).maybePop();
      }
    });
    _controller.forward();
    _loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {});
          _controller.reverse();
        }
      },
      child: Container(
        color: Colors.black.withOpacity(0.12),
        padding: EdgeInsetsDirectional.only(top: _centerY),
        child: ScaleTransition(
          scale: _animation,
          alignment: Alignment(-1 + (_centerX) * 2 / Util.width, -1),
          child: FadeTransition(
            opacity: _animation,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                PositionedDirectional(
                  top: 9,
                  start: 12,
                  width: 260,
                  height: 240,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: R.color.mainBgColor),
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: R.color.mainBrandColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                K.room_explain,
                                style: R.textStyle.medium16,
                              ),
                              const Spacer(),
                              if (widget.canEdit)
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: _editNotice,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      R.img(
                                        'ic_edit.svg',
                                        color: R.color.mainBrandColor,
                                        width: 16,
                                        height: 16,
                                        package: ComponentManager.MANAGER_BASE_ROOM,
                                      ),
                                      Text(
                                        K.room_edit,
                                        style: R.textStyle.regular12.copyWith(color: R.color.mainBrandColor),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            child: Scrollbar(
                              child: ListView(
                                padding: EdgeInsetsDirectional.zero,
                                children: [
                                  Text(
                                    msg,
                                    style: R.textStyle.regular12.copyWith(color: R.color.secondTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // PositionedDirectional(
                //   top: 0,
                //   start: _centerX - 8,
                //   child: R.img('ic_stick_out.webp', width: 20, height: 20, package: ComponentManager.MANAGER_BASE_ROOM),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _updateMargin() {
    if (widget.noticeKey.currentContext?.findRenderObject() == null) return;

    RenderBox renderBox = widget.noticeKey.currentContext!.findRenderObject() as RenderBox;
    Offset paintPosition = renderBox.localToGlobal(Offset.zero);
    Size size = renderBox.size;
    _centerX = paintPosition.dx + size.width / 2;
    _centerY = paintPosition.dy + size.height;
  }

  _loadData() async {
    ResRoomDataDesc des = await RoomApi.roomDescription(widget.rid);
    if (des.success && des.hasData() && mounted) {
      setState(() {
        msg = des.data;
      });
    }
  }

  _editNotice() async {
    Navigator.of(context).pop();
    int index = FormScreen.config(
      title: K.room_please_input_room_notice,
      value: msg,
      allowEmpty: false,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (Util.validStr(value) && value != msg) {
      BaseResponse baseResponse = await RoomApi.editRoomDesc(widget.rid, value!);
      if (baseResponse.success == true) {
        Fluttertoast.showCenter(msg: K.room_save_success);
      } else {
        Fluttertoast.showCenter(msg: baseResponse.msg);
      }
    }
  }
}
