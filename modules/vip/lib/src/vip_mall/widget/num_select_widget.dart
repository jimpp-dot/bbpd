import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vip/assets.dart';

/// 商城购买数量选择
///
class NumSelectWidget extends StatefulWidget {
  final ValueChanged<int> onValueChanged;
  final int initValue;
  final bool supportDark;

  const NumSelectWidget(this.onValueChanged,
      {super.key, this.initValue = 1, this.supportDark = false});

  @override
  State<NumSelectWidget> createState() => NumSelectWidgetState();
}

class NumSelectWidgetState extends State<NumSelectWidget> {
  double _lastKeyboardHeight = 0;

  int _num = 1;
  final FocusNode _numFocusNode = FocusNode();
  late TextEditingController _numController;

  @override
  void initState() {
    super.initState();
    _num = widget.initValue;
    _numController = TextEditingController(text: '$_num');
  }

  @override
  void dispose() {
    _numFocusNode.dispose();
    _numController.dispose();
    super.dispose();
  }

  void unFocus() {
    if (_numFocusNode.hasFocus) {
      _numFocusNode.unfocus();
    }
    if (Util.isStringEmpty(_numController.text)) {
      _numController.text = '1';
    }
  }

  @override
  void didUpdateWidget(NumSelectWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initValue != widget.initValue) {
      _num = widget.initValue;
    }
  }

  _onValueChanged() {
    widget.onValueChanged(_num);
  }

  void _onAdd() {
    if (_num >= 9999) {
      return;
    }
    _num++;
    _numController.text = _num.toString();
    _setNumInputCursor();
    _onValueChanged();
    setState(() {});
  }

  void _onMin() {
    if (_num > 1) {
      _num--;
      _numController.text = _num.toString();
      _setNumInputCursor();
      _onValueChanged();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).viewInsets.bottom;
    if (h == 0 && _lastKeyboardHeight > 0) {
      unFocus();
    }
    _lastKeyboardHeight = h;
    return Container(
      width: 102,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.supportDark
                ? R.colors.dividerColor
                : R.color.dividerColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _onMin,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Rext.autoStyleImg(
                Assets.ic_minus_no_border_webp,
                dark: widget.supportDark,
                width: 30,
                height: 30,
                package: ComponentManager.MANAGER_VIP,
              ),
            ),
          ),
          Container(
              width: 1,
              height: 30,
              color: widget.supportDark
                  ? R.colors.dividerColor
                  : R.color.dividerColor),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: _buildNumInput(),
            ),
          ),
          Container(
              width: 1,
              height: 30,
              color: widget.supportDark
                  ? R.colors.dividerColor
                  : R.color.dividerColor),
          InkWell(
            onTap: _onAdd,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Rext.autoStyleImg(
                Assets.ic_add_no_border_webp,
                dark: widget.supportDark,
                width: 30,
                height: 30,
                package: ComponentManager.MANAGER_VIP,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumInput() {
    return TextField(
      textAlign: TextAlign.center,
      style: TextStyle(
        color:
            widget.supportDark ? R.colors.mainTextColor : R.color.mainTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      focusNode: _numFocusNode,
      controller: _numController,
      autofocus: false,
      maxLines: 1,
      maxLength: 4,
      decoration: null,
      cursorColor:
          widget.supportDark ? R.colors.mainTextColor : R.color.mainTextColor,
      keyboardType: TextInputType.number,
      onChanged: (str) {
        if (Util.validStr(str)) {
          if (str.startsWith('0')) {
            int num = Util.parseInt(str);
            str = num > 0 ? num.toString() : '';
            _numController.text = str;
            _setNumInputCursor();
          }
          _num = Util.parseInt(str, 1);
        } else {
          _num = 1;
        }
        _onValueChanged();
        setState(() {});
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4)
      ],
    );
  }

  void _setNumInputCursor() {
    _numController.selection = TextSelection.fromPosition(
        TextPosition(offset: _numController.text.length));
  }
}
