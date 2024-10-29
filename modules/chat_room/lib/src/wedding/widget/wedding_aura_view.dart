import 'package:shared/shared.dart';
import 'package:shared/widget/gradient_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_repo.dart';
import 'package:chat_room/src/wedding/mode/wedding_combo_data.dart';
import 'dart:math' as math;

import 'wedding_aura_rule_dialog.dart';

class WeddingAuraView extends StatefulWidget {
  const WeddingAuraView({super.key, required this.rid, this.config});

  final int rid;
  final WeddingComboConfig? config;

  @override
  _WeddingAuraViewState createState() => _WeddingAuraViewState();
}

class _WeddingAuraViewState extends State<WeddingAuraView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String? _comboId; //连击id
  /// 正在请求pre
  bool _preComboLoading = false;

  /// 正在请求combo pay
  bool _comboLoading = false;
  int _comboEndTime = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(seconds: widget.config?.duration ?? 3),
        lowerBound: 0.0,
        upperBound: 1.0,
        vsync: this);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() => {});
      });
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onComboOver();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        // controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 连击结束
  _onComboOver() {
    if (_comboLoading == false) {
      _comboId = null;
      // int timeDistance = DateTime.now().millisecondsSinceEpoch - _comboEndTime;
      // if (timeDistance > 0) {
      //   _comboId = null;
      // } else {
      //   Future.delayed(Duration(milliseconds: -timeDistance)).then((value) {
      //     _comboId = null;
      //   });
      // }
    }
  }

  _onComboStart() async {
    if (_preComboLoading == true) return;

    var isStarted = _comboId == null;
    bool prepared = await _comboPre();
    if (prepared == false) return;

    _comboLoading = true;
    DataRsp<int> res = await RoomWeddingRepo.weddingCombo(
        rid: widget.rid, comboId: _comboId ?? '');
    _comboLoading = false;
    if (res.success == true) {
      if (isStarted) {
        _showRuleDialog();
      }
      _comboEndTime = res.data ?? 0;
      _controller.forward(from: 0);
    } else {
      _onComboOver();
      Fluttertoast.showToast(msg: res.msg ?? '', gravity: ToastGravity.CENTER);
    }
  }

  Future<bool> _comboPre() async {
    // 开始连击
    if (_comboId == null) {
      _preComboLoading = true;
      DataRsp<String> res =
          await RoomWeddingRepo.weddingComboPre(rid: widget.rid);
      _preComboLoading = false;
      final result = res.success == true;
      if (result) {
        _comboId = res.data;
      } else {
        Fluttertoast.showToast(
            msg: res.msg ?? '', gravity: ToastGravity.CENTER);
      }
      return result;
    } else {
      // 连击中
      return true;
    }
  }

  _showRuleDialog() {
    final check = WeddingAuraRuleModel.isCheck;
    if (check == true) return;

    String ruleDesc = widget.config?.notice ?? K.room_wedding_combo_rule;
    String priceStr =
        '${MoneyConfig.moneyNum(widget.config?.unitPrice ?? 100)}${MoneyConfig.moneyName}';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WeddingAuraRuleDialog(
          model: WeddingAuraRuleModel(
              check, ruleDesc.replaceFirst('%s', priceStr)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24.dp),
        onTap: _onComboStart,
        child: Container(
          width: 48.dp,
          height: 48.dp,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.dp),
            color: Colors.black.withOpacity(0.2),
          ),
          child: RepaintBoundary(
            child: Stack(
              children: [
                GradientCircularProgressIndicator(
                  colors: const [Color(0xFF64DAFD), Color(0xFF67FBC7)],
                  radius: 24.dp,
                  strokeCapRound: true,
                  stokeWidth: 4,
                  // stops: [0.2, 0.75],
                  value: _animation.status == AnimationStatus.forward
                      ? _animation.value
                      : 0,
                  rotate: 1.5 * math.pi,
                  backgroundColor: Colors.transparent,
                ),
                Center(
                  child: R.img('wedding/wedding_aura_icon.png',
                      width: 34.dp,
                      height: 34.dp,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
