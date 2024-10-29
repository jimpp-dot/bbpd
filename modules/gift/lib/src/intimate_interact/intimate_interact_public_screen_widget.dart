import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/intimate_interact/intimate_interact_receive_dialog.dart';
import 'package:gift/src/intimate_interact/intimate_interact_sent_dialog.dart';
import 'package:gift/src/intimate_interact/repo/intimate_interact_repo.dart';
import '../../assets.dart';
import 'model/intimate_interact_task_data.dart';

class IntimateInteractPublicScreenWidget extends StatelessWidget {
  final int status;
  final String? name;

  const IntimateInteractPublicScreenWidget(
      {Key? key, required this.status, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tip;
    String listEmptyToast = K.gift_no_interact_task_now;
    int viewType = 2;
    if (status == IntimateInteractTaskData.STATUS_IDLE) {
      tip = K.gift_invite_do_interact_task;
      viewType = 2;
    } else if (status == IntimateInteractTaskData.STATUS_RECEIVE) {
      tip = K.gift_has_receive_task_invite;
      viewType = 1;
    } else if (status == IntimateInteractTaskData.STATUS_REFUND) {
      tip = K.gift_launch_intimate_refund;
      viewType = 2;
    } else {
      return const SizedBox.shrink();
    }

    bool requesting = false;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, top: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            height: 28,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFC233FF),
                  Color(0xFFF122B0),
                  Color(0xFFF79A7C),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                PositionedDirectional(
                  start: -1,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsetsDirectional.only(top: 9),
                        child: R.img(
                          Assets.intimate_interact_public_screen_peach_1_png,
                          width: 35,
                          height: 18,
                          package: ComponentManager.MANAGER_GIFT,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(bottom: 12),
                        child: R.img(
                          Assets.intimate_interact_public_screen_peach_2_png,
                          width: 30,
                          height: 15,
                          package: ComponentManager.MANAGER_GIFT,
                        ),
                      ),
                      const SizedBox(
                        width: 26,
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(top: 13),
                        child: R.img(
                          Assets.intimate_interact_public_screen_peach_3_png,
                          width: 32,
                          height: 14,
                          package: ComponentManager.MANAGER_GIFT,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 28,
                  padding: const EdgeInsetsDirectional.only(start: 12, end: 4),
                  child: Row(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 100),
                        child: Text(
                          name ?? '',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        tip,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (requesting) {
                            return;
                          }
                          requesting = true;
                          DataRsp<List<IntimateInteractTaskData>> rsp =
                              await IntimateInteractRepo.taskList(viewType);
                          requesting = false;

                          if (rsp.success == true) {
                            if (rsp.data == null || rsp.data!.isEmpty) {
                              Fluttertoast.showToast(msg: listEmptyToast);
                            } else {
                              if (viewType == 1) {
                                IntimateInteractSentDialog.show(
                                    context, rsp.data!);
                              } else {
                                IntimateInteractReceiveDialog.show(
                                    context, rsp.data!);
                              }
                            }
                          } else {
                            Fluttertoast.showToast(msg: rsp.msg ?? '');
                          }
                        },
                        child: Container(
                          width: 60,
                          height: 20,
                          alignment: AlignmentDirectional.center,
                          decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFF8000),
                                Color(0xFFFFC659),
                              ],
                            ),
                            shadows: [
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(0, 0.5),
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                offset: const Offset(0, -0.5),
                              ),
                            ],
                          ),
                          child: Text(
                            K.gift_view_now,
                            style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
