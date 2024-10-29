import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 礼物连击按钮动效
///
class NormalComboGiftWidget extends StatefulWidget {
  final VoidCallback? comboFinishedCallBack;
  final VoidCallback? comboPayCallBack;

  const NormalComboGiftWidget(this.comboFinishedCallBack, this.comboPayCallBack, {super.key});

  @override
  NormalComboGiftWidgetState createState() {
    return NormalComboGiftWidgetState();
  }
}

class NormalComboGiftWidgetState extends State<NormalComboGiftWidget> {
  bool _isCombo = false;
  bool _isClick = false;
  GlobalKey<MultiframeImageState>? _buttonAnimKey;
  GlobalKey<MultiframeImageState>? _clickAnimKey;

  beginCombo() {
    _isCombo = true;
    _isClick = true;
    _buttonAnimKey?.currentState?.replay();
    _clickAnimKey?.currentState?.replay();
    if (mounted) {
      setState(() {});
    }
  }

  endCombo() {
    _isCombo = false;
    _isClick = false;
    if (widget.comboFinishedCallBack != null) {
      widget.comboFinishedCallBack!();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _buttonAnimKey = GlobalKey<MultiframeImageState>();
    _clickAnimKey = GlobalKey<MultiframeImageState>();
    beginCombo();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCombo) return const SizedBox.shrink();
    // Log.d('combo_gift_button:${Util.getImgUrl('combo_gift_button.webp', package: ComponentManager.MANAGER_BASE_ROOM)}');
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          children: <Widget>[
            MultiframeImage.network(
              Util.getImgUrl('combo_gift_button.webp', package: ComponentManager.MANAGER_BASE_ROOM),
              'room',
              key: _buttonAnimKey,
              onComplete: _onButtonAniComplete,
            ),
            if (_isClick)
              MultiframeImage.network(
                Util.getImgUrl('combo_gift_button_click.webp', package: ComponentManager.MANAGER_BASE_ROOM),
                'room',
                key: _clickAnimKey,
                onComplete: _onClickAniComplete,
              ),
          ],
        ),
      ),
    );
  }

  void onTap() async {
    Log.d('onTap:$_isCombo');
    if (_isCombo && mounted) {
      _buttonAnimKey?.currentState?.replay();
      if (_isClick && _clickAnimKey?.currentState != null) {
        _clickAnimKey!.currentState?.resetToPlay();
      } else {
        setState(() {
          _isClick = true;
        });
      }
    }
    if (widget.comboPayCallBack != null) {
      widget.comboPayCallBack!();
    }
  }

  void _onButtonAniComplete() {
    if (mounted) {
      endCombo();
      setState(() {});
    }
  }

  void _onClickAniComplete() {
    if (mounted) {
      setState(() {
        _isClick = false;
      });
    }
  }
}
