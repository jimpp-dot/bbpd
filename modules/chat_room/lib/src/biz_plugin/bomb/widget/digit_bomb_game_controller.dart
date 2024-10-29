import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/bomb/model/digit_bomb_info_model.dart';
import 'package:chat_room/src/biz_plugin/bomb/widget/digit_bomb_edit_widget.dart';
import 'package:chat_room/src/biz_plugin/bomb/widget/digit_bomb_mixin.dart';
import 'package:chat_room/src/biz_plugin/bomb/widget/digit_bomb_set_range_widget.dart';

enum EditWidgetType {
  rule, //数字炸弹 规则描述
  setNum, //数字炸弹 设置数字
}

abstract class BaseDigitBombController extends StatefulWidget {
  final ChatRoomData room;

  const BaseDigitBombController({super.key, required this.room});
}

class DigitBombGameController extends BaseDigitBombController {
  const DigitBombGameController({super.key, required super.room});

  @override
  _DigitBombGameControllerState createState() =>
      _DigitBombGameControllerState();
}

class _DigitBombGameControllerState extends State<DigitBombGameController>
    with DigitBombMixin {
  @override
  Widget build(BuildContext context) {
    if (bombData == null || bombData!.status == DigitBombStatus.over) {
      return Container();
    }
    if (isOpen) {
      return Container(
          padding: const EdgeInsetsDirectional.only(top: 12),
          child: openContent());
    }
    return Container(
        padding: const EdgeInsetsDirectional.only(top: 12),
        child: closeContent());
  }

  /// 展开状态
  Widget openContent() {
    return Container(
      height: 90,
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2B006C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
        child: Column(
          children: [
            getTopWidget(),

            /// 分割线
            Container(
              margin: const EdgeInsetsDirectional.only(
                start: 12,
                end: 12,
              ),
              height: 1,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.07),
              ),
            ),

            getBottomWidget()
          ],
        ),
      ),
    );
  }

  /// 关闭状态
  Widget closeContent() {
    return Container(
      height: 34,
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2B006C),
        borderRadius: BorderRadius.circular(34),
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
        child: getTopWidget(),
      ),
    );
  }

  /// 顶部
  Widget getTopWidget() {
    return Container(
      height: 34,
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: Row(
        children: [
          R.img('bomb/digit_bomb.webp',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 22,
              height: 22),
          const SizedBox(
            width: 3,
          ),
          if (isOpen)
            Text(
              K.digit_bomb,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          if (!isOpen)
            Container(
              constraints: const BoxConstraints(maxWidth: 80),
              child: Text(
                Util.isStringEmpty(bombData!.playerName)
                    ? K.digit_bomb
                    : bombData!.playerName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          if (!isOpen)
            Text(
              K.room_wheel_operating,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          Expanded(
            child: Container(),
          ),

          /// 放大缩小图标
          narrowOrEnlarge(),

          if (isOpen) ...[
            InkWell(
              onTap: () {
                DigitBombEditWidget.show(
                    context, bombData!, EditWidgetType.rule);
              },
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: R.img('bomb/bomb_controller_explain.webp',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: 22,
                    height: 22),
              ),
            ),
            if (hasAuthority)
              InkWell(
                onTap: () {
                  closeDigitBombGame();
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 6),
                  child: R.img('bomb/bomb_controller_over.webp',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      width: 22,
                      height: 22),
                ),
              ),
          ]
        ],
      ),
    );
  }

  /// 底部widget
  Widget getBottomWidget() {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 12),
      child: Row(
        children: [
          bottomLeft(),
          Expanded(child: bottomMid()),
          Container(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: bottomRight()),
        ],
      ),
    );
  }

  /// 放大缩小图标
  Widget narrowOrEnlarge() {
    String imagePath = 'bomb/bomb_controller_narrow.webp';
    if (isOpen == false) {
      imagePath = 'bomb/bomb_controller_enlarge.webp';
    }
    return InkWell(
      onTap: () {
        isOpen = !isOpen;
        if (mounted) setState(() {});
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 6),
        child: R.img(imagePath,
            package: ComponentManager.MANAGER_BASE_ROOM, width: 22, height: 22),
      ),
    );
  }

  /// 底部左边
  Widget bottomLeft() {
    String str = '';
    if (bombData!.status == DigitBombStatus.playing) {
      str = K.room_player_is_typing;
    } else {
      if (hasAuthority) {
        str = K.default_random_number;
      } else {
        str = K.waiting_for_homeowner_to_set;
      }
    }

    /// 普通玩家视角 轮到别人
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsetsDirectional.only(start: 14, end: 20),
      child: Row(
        children: [
          if (bombData!.status == DigitBombStatus.playing &&
              bombData!.playerIcon.isNotEmpty)
            Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CommonAvatar(
                    path: bombData!.playerIcon,
                    shape: BoxShape.circle,
                    size: 32,
                  ),
                )),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 4),
            child: Text(
              str,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  /// 底部中间
  Widget bottomMid() {
    return Container(
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${bombData!.cmin}~${bombData!.cmax}',
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
          if (bombData!.status != DigitBombStatus.playing && hasAuthority)
            InkWell(
              onTap: () {
                DigitBombSetRangeWidget.show(context, bombData!);
              },
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Text(
                  K.set_bomb,
                  style: const TextStyle(
                      color: Color(0xFF6CD5FF),
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// 底部右边
  Widget bottomRight() {
    String text = K.room_privity_game_start_creator;
    bool canTap = true;

    /// 管理员视角
    if (hasAuthority) {
      if (bombData!.status == DigitBombStatus.playing) {
        //如果没人在麦上，按钮置灰
        canTap = false;
        for (int i = 0; i < widget.room.positions.length; i++) {
          if (widget.room.positions[i].uid > 0) {
            canTap = true;
            break;
          }
        }
        text = K.next_step;
      }

      /// 管理员轮到自己
      if (bombData!.player == Session.uid &&
          bombData!.status == DigitBombStatus.playing) {
        canTap = widget.room.isMic;
        text = K.input_number;
      }

      return GestureDetector(
        onTap: () {
          if (!canTap) return;
          // 防重复提交
          if (lastBottomRightTapTime == null ||
              DateTime.now().difference(lastBottomRightTapTime!) >
                  const Duration(seconds: 1)) {
            lastBottomRightTapTime = DateTime.now();
            onTapButton(context);
          } else {
            Fluttertoast.showCenter(msg: K.busy_operation_please_wait);
          }
        },
        child: Opacity(
          opacity: canTap ? 1.0 : 0.6,
          child: Container(
            width: 78,
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors)),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }

    /// 玩家视角
    canTap = (bombData!.player == Session.uid &&
        bombData!.status == DigitBombStatus.playing &&
        widget.room.isMic);

    text = K.input_number;
    return GestureDetector(
      onTap: () {
        if (canTap) {
          onTapButton(context);
        }
      },
      child: Opacity(
        opacity: canTap ? 1.0 : 0.6,
        child: Container(
          width: 78,
          height: 28,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient:
                  LinearGradient(colors: R.color.mainBrandGradientColors)),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
