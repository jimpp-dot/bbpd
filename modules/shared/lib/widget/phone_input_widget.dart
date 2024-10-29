import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../k.dart';

class PhoneInputWidget extends StatefulWidget {
  final bool enabled;
  final bool autoFocus;
  final bool enableAreaCode;
  final FocusNode? focusNode;
  final String? hintText;
  final String? areaCode;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Color? bgColor;
  final Color? textColor;
  final Color? hintTextColor;
  final Color? cursorColor;

  const PhoneInputWidget({
    super.key,
    this.hintText,
    this.enabled = true,
    this.autoFocus = true,
    this.enableAreaCode = false,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.areaCode,
    this.bgColor,
    this.textColor,
    this.hintTextColor,
    this.cursorColor,
  });

  @override
  PhoneInputWidgetState createState() => PhoneInputWidgetState();
}

class PhoneInputWidgetState extends State<PhoneInputWidget> {
  TextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!;

  late String _areaCode;

  String get areaCode => _areaCode;

  int get maxLength => 11;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) _controller = TextEditingController();
    _areaCode = widget.areaCode ?? '86';

    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_refresh);
    }
  }

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_refresh);
    }
    _controller?.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: widget.bgColor ?? R.color.secondBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          if (Util.isLocale)
            GestureDetector(
              onTap: _selectPhoneAreaCode,
              child: Row(
                children: <Widget>[
                  Text(
                    '＋$_areaCode',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: widget.enabled
                            ? R.color.mainTextColor
                            : R.color.thirdTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: widget.enabled
                        ? R.color.mainTextColor
                        : R.color.thirdTextColor,
                    size: 18,
                  ),
                ],
              ),
            ),
          Expanded(
            child: TextField(
              enabled: widget.enabled,
              textAlign: TextAlign.start,
              focusNode: widget.focusNode,
              controller: _effectiveController,
              style: TextStyle(
                color: widget.textColor ?? R.color.mainTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: widget.hintTextColor ?? R.color.thirdTextColor,
                  fontSize: 14,
                ),
                hintText: widget.hintText ?? K.setting_please_input_phone,
                contentPadding: const EdgeInsets.only(left: 10.0),
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              autocorrect: false,
              cursorColor: widget.cursorColor ?? R.colors.mainBrandColor,
              autofocus: widget.autoFocus,
              maxLength: maxLength,
              inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
            ),
          ),
          if (_effectiveController.text.isNotEmpty &&
              widget.focusNode?.hasFocus == true)
            _buildClear()
        ],
      ),
    );
  }

  Widget _buildClear() {
    return GestureDetector(
      onTap: _onClear,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 20.0),
        child: R.img('ic_delete_small.svg',
            width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
      ),
    );
  }

  _onClear() {
    setState(() {
      _effectiveController.text = '';
      if (widget.onChanged != null) {
        widget.onChanged!(_effectiveController.text);
      }
    });
  }

  void _selectPhoneAreaCode() async {
    if (!widget.enabled) return;
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    String? code = await loginManager.selectPhoneAreaCode(context);
    if (code != null && code != _areaCode) {
      setState(() {
        _areaCode = code;
      });
    }
  }
}
