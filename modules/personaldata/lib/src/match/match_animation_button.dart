import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

class MatchAnimationButton extends StatefulWidget {
  final double size;
  const MatchAnimationButton({
    Key? key,
    this.size = 134,
  }) : super(key: key);
  @override
  MatchAnimationButtonState createState() => MatchAnimationButtonState();
}

class MatchAnimationButtonState extends State<MatchAnimationButton>
    with TickerProviderStateMixin {
  late AnimationController _repeatController;
  late Animation<double> _repeatAni;
  late AnimationController _clickController;
  late Animation<double> _clickAni;
  bool executeClickAni = false;
  int _residueNum = 0;

  @override
  void initState() {
    super.initState();
    _repeatController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _repeatController.repeat(reverse: true);
    _repeatAni = Tween<double>(
      begin: 1,
      end: 0.9,
    ).animate(_repeatController);
    _clickController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..addListener(() {
        if (_clickController.isCompleted) {
          if (mounted) {
            setState(() {
              executeClickAni = false;
            });
          }
          _clickController.reset();
          _repeatController.repeat(reverse: true);
        }
      });
    _clickAni = Tween<double>(
      begin: 0,
      end: 400,
    ).animate(_clickController);
  }

  @override
  void dispose() {
    _repeatController.dispose();
    _clickController.dispose();
    super.dispose();
  }

  startMatchAni() {
    if (mounted) {
      setState(() {
        executeClickAni = true;
      });
    }
    _repeatController.reset();
    _clickController.forward();
  }

  //一次点击流程
  _getButtonSize() {
    if (_clickAni.value < 100) {
      //前100ms
      return (1 - (_clickAni.value / 100) * 0.5) * widget.size;
    } else {
      //100-400
      return (((_clickAni.value - 100) / 600) + 0.5) * widget.size;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (executeClickAni) {
      return AnimatedBuilder(
        animation: _clickController,
        builder: (context, child) {
          return Container(
            constraints: BoxConstraints.tight(
              Size.square(_getButtonSize()),
            ),
            child: child,
          );
        },
        child: _buildButton(),
      );
    } else {
      return AnimatedBuilder(
        animation: _repeatController,
        builder: (context, child) {
          return Container(
            constraints: BoxConstraints.tight(
              Size.square(_repeatAni.value * widget.size),
            ),
            child: _buildButton(),
          );
        },
      );
    }
  }

  _buildButton() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(R.imagePath(
          'match/match_button.webp',
          package: ComponentManager.MANAGER_PERSONALDATA,
        )),
        fit: BoxFit.fill,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
                child: const Text(
                  '',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )),
          const SizedBox(
            height: 4,
          ),
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 42, end: 42),
                child: Text(
                  '${K.personal_match_reside}$_residueNum${K.personal_match_number}',
                  style:
                      const TextStyle(color: Color(0xFF540EB9), fontSize: 11),
                ),
              )),
        ],
      ),
    );
  }

  changeResidueNumber(int residueNumber) {
    _residueNum = residueNumber;
    if (mounted) {
      setState(() {});
    }
  }
}
