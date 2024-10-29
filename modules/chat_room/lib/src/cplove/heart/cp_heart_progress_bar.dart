import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:flutter/material.dart';

/// 心动速配阶段进度条： @see [CpLoveState]
class CpHeartProgressBar extends StatelessWidget {
  final CpLoveState? cpLoveState;

  const CpHeartProgressBar({Key? key, this.cpLoveState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
      height: 48,
      child: Row(
        children: [
          Flexible(
              flex: 60,
              child: R.img('cplove/cp_heart_line1.png',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  fit: BoxFit.cover)),
          _buildProgressText(
              CpLoveState.Reward, cpLoveState == CpLoveState.Reward),
          Flexible(
              flex: 80,
              child: R.img('cplove/cp_heart_line2.png',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  fit: BoxFit.cover)),
          _buildProgressText(
              CpLoveState.Switch, cpLoveState == CpLoveState.Switch),
          Flexible(
              flex: 78,
              child: R.img('cplove/cp_heart_line3.png',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  fit: BoxFit.cover)),
          _buildProgressText(
              CpLoveState.Result, cpLoveState == CpLoveState.Result),
          Flexible(
              flex: 60,
              child: R.img('cplove/cp_heart_line4.png',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  fit: BoxFit.cover))
        ],
      ),
    );
  }

  Widget _buildProgressText(CpLoveState cpLoveState, bool selected) {
    String text = _getStateText(cpLoveState);
    String img =
        selected ? 'cplove/cp_heart_p_selected.png' : _getStateImg(cpLoveState);

    return Flexible(
      flex: 136,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          R.imagePath(img, package: ComponentManager.MANAGER_BASE_ROOM),
        ))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  String _getStateText(CpLoveState cpLoveState) {
    switch (cpLoveState) {
      case CpLoveState.Reward:
        return K.room_cpheart_reward;
      case CpLoveState.Switch:
        return K.room_cpheart_switch;
      case CpLoveState.Result:
        return K.room_cpheart_result;
      default:
        return K.room_cpheart_reward;
    }
  }

  String _getStateImg(CpLoveState cpLoveState) {
    switch (cpLoveState) {
      case CpLoveState.Reward:
        return 'cplove/cp_heart_p1.png';
      case CpLoveState.Switch:
        return 'cplove/cp_heart_p2.png';
      case CpLoveState.Result:
        return 'cplove/cp_heart_p3.png';
      default:
        return 'cplove/cp_heart_p1.png';
    }
  }
}
