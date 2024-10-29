import 'package:chat_room/assets.dart';
import 'package:gift/k.dart';
import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gift/src/intimate_interact/intimate_constant.dart';
import '../../assets.dart';
import 'custom_pagination.dart';
import 'model/intimate_interact_task_data.dart';
import 'repo/intimate_interact_repo.dart';

/// 亲密互动接收邀请（包括新收到跟已接受）
class IntimateInteractReceiveDialog extends StatefulWidget {
  final List<IntimateInteractTaskData> taskList;

  const IntimateInteractReceiveDialog({Key? key, required this.taskList})
      : super(key: key);

  @override
  _IntimateInteractReceiveDialogState createState() =>
      _IntimateInteractReceiveDialogState(taskList);

  static Future<bool> show(
      BuildContext context, List<IntimateInteractTaskData> taskList) async {
    return await DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return IntimateInteractReceiveDialog(taskList: taskList);
      },
    );
  }
}

class _IntimateInteractReceiveDialogState
    extends State<IntimateInteractReceiveDialog> {
  final List<IntimateInteractTaskData> taskList;
  int _taskIndex = 0;
  final SwiperController _controller = SwiperController();

  _IntimateInteractReceiveDialogState(this.taskList);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            end: 0,
            top: -94,
            child: R.img(
              Assets.intimate_interact_dialog_top_bg_png,
              width: 312,
              height: 156,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 312,
                child: _buildMainContent(),
              ),
              const SizedBox(height: 20),
              _buildClose(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    IntimateInteractTaskData task = taskList[_taskIndex];
    bool received = task.status == IntimateInteractTaskData.STATUS_RECEIVE;
    return Container(
      height: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF79A7C),
            Color(0xFFF122B0),
            Color(0xFFC233FF),
          ],
          begin: AlignmentDirectional.topEnd,
          end: AlignmentDirectional.bottomStart,
        ),
      ),
      padding: const EdgeInsetsDirectional.only(top: 11, start: 12, end: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          const SizedBox(height: 8),
          Container(
            height: 192,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: _buildTaskSwiper(),
          ),
          const SizedBox(
            height: 12,
          ),
          received
              ? _buildReceivedBtn()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLeftBtn(task),
                    _buildRightBtn(task),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildTaskSwiper() {
    return SizedBox(
      width: 288,
      height: 192,
      child: Swiper(
        key: ValueKey(taskList.length),
        controller: _controller,
        itemCount: taskList.length,
        index: _taskIndex,
        pagination: taskList.length > 1
            ? SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 6),
                builder: CustomPaginationBuilder(),
              )
            : null,
        autoplay: false,
        loop: taskList.length > 1,
        autoplayDelay: 3000,
        autoplayDisableOnInteraction: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                const EdgeInsetsDirectional.only(top: 21, start: 12, end: 12),
            child: _buildTaskPage(taskList[index]),
          );
        },
        onIndexChanged: (index) {
          setState(() {
            _taskIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildTaskPage(IntimateInteractTaskData task) {
    int giftNum = task.giftNum;
    return Column(
      children: [
        Row(
          children: [
            Text(
              '${K.gift_task_initiator}：',
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            SizedBox(
              width: 160,
              child: Text(
                task.name,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF222222),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 26,
        ),
        Row(
          children: [
            Text(
              '${K.gift_interact_task}：',
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            SizedBox(
              width: 160,
              child: Text(
                task.taskName,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF222222),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 19,
        ),
        Row(
          children: [
            Text(
              '${K.gift}：',
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            CachedNetworkImage(
              imageUrl: task.gift.icon,
              width: 32,
              height: 32,
            ),
            Text(
              task.gift.name,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF222222),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'X$giftNum',
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              '${K.gift_total_price}：',
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Image.asset(MoneyConfig.moneyIcon, width: 16, height: 16),
            const SizedBox(
              width: 4,
            ),
            Text(
              MoneyConfig.moneyNum(task.gift.price * task.giftNum),
              style: const TextStyle(
                color: Color(0xFF202020),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: 312,
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          R.img(
            Assets.intimate_interact_dialog_title_peach_left_png,
            width: 32,
            height: 22,
            package: ComponentManager.MANAGER_GIFT,
          ),
          const SizedBox(width: 4),
          R.img(
            Assets.intimate_interact_dialog_title_text_png,
            width: 130,
            height: 35,
            package: ComponentManager.MANAGER_GIFT,
          ),
          const SizedBox(width: 4),
          R.img(
            Assets.intimate_interact_dialog_title_peach_right_png,
            width: 32,
            height: 22,
            package: ComponentManager.MANAGER_GIFT,
          ),
          Expanded(
            child: Row(
              children: [
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    BaseWebviewScreen.show(context,
                        url: IntimateConstant.helpUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: R.img(
                      RoomAssets.info_svg,
                      width: 20,
                      height: 20,
                      color: Colors.white.withOpacity(0.7),
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ),
                // SizedBox(width: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftBtn(IntimateInteractTaskData task) {
    String btnText;
    GestureTapCallback? onTap;
    double textOpacity = 1;
    if (task.status == IntimateInteractTaskData.STATUS_REFUND) {
      btnText = K.gift_appeal;
      onTap = _onTapRefundRefuse;
    } else if (task.status == IntimateInteractTaskData.STATUS_REFUND_REFUSE) {
      btnText = K.gift_platform_appeal;
      onTap = null;
      textOpacity = 0.7;
    } else {
      btnText = K.gift_refuse;
      onTap = _onTapRefuse;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 138,
        height: 48,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFFF8888), Color(0xFFFF285C)]),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white.withOpacity(textOpacity),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildRightBtn(IntimateInteractTaskData task) {
    String btnText;
    GestureTapCallback? onTap;
    double textOpacity = 1;
    if (task.status == IntimateInteractTaskData.STATUS_REFUND) {
      btnText = K.gift_agree_refund;
      onTap = _onTapRefundAgree;
    } else if (task.status == IntimateInteractTaskData.STATUS_REFUND_REFUSE) {
      btnText = K.gift_agree_refund;
      textOpacity = 0.7;
      onTap = null;
    } else {
      btnText = K.gift_accept;
      onTap = _onTapReceive;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 138,
        height: 48,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFFFC659), Color(0xFFFF8000)]),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          btnText,
          style: TextStyle(
              color: Colors.white.withOpacity(textOpacity),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildReceivedBtn() {
    return Container(
      width: 224,
      height: 48,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient:
            LinearGradient(colors: [Color(0xFFFFC659), Color(0xFFFF8000)]),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        K.gift_has_accept,
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildClose() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: R.img(
        Assets.intimate_interact_dialog_close_svg,
        width: 47,
        height: 47,
        package: ComponentManager.MANAGER_GIFT,
      ),
    );
  }

  void _onTapRefuse() async {
    IntimateInteractTaskData task = taskList[_taskIndex];
    BaseResponse rsp = await IntimateInteractRepo.changeTaskStatus(
        IntimateInteractTaskData.STATUS_REFUSE, task.taskId);
    if (rsp.success == true) {
      taskList.removeAt(_taskIndex);
      if (taskList.isEmpty) {
        Navigator.pop(context);
        return;
      }
      setState(() {
        if (_taskIndex >= taskList.length && _taskIndex > 0) {
          _taskIndex--;
        }
      });
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
    }
  }

  Future<void> _onTapReceive() async {
    IntimateInteractTaskData task = taskList[_taskIndex];
    BaseResponse rsp = await IntimateInteractRepo.changeTaskStatus(
        IntimateInteractTaskData.STATUS_RECEIVE, task.taskId);
    if (rsp.success == true) {
      setState(() {
        task.status = IntimateInteractTaskData.STATUS_RECEIVE;
      });
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
    }
  }

  Future<void> _onTapRefundRefuse() async {
    IntimateInteractTaskData task = taskList[_taskIndex];
    BaseResponse rsp = await IntimateInteractRepo.changeTaskStatus(
        IntimateInteractTaskData.STATUS_REFUND_REFUSE, task.taskId);
    if (rsp.success == true) {
      setState(() {
        task.status = IntimateInteractTaskData.STATUS_REFUND_REFUSE;
      });
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
    }
  }

  Future<void> _onTapRefundAgree() async {
    IntimateInteractTaskData task = taskList[_taskIndex];
    BaseResponse rsp = await IntimateInteractRepo.changeTaskStatus(
        IntimateInteractTaskData.STATUS_REFUND_AGREE, task.taskId);
    if (rsp.success == true) {
      taskList.removeAt(_taskIndex);
      if (taskList.isEmpty) {
        Navigator.pop(context);
        return;
      }
      setState(() {
        if (_taskIndex >= taskList.length && _taskIndex > 0) {
          _taskIndex--;
        }
      });
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
    }
  }
}
