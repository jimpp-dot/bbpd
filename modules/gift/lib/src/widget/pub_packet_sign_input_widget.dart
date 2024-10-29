import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gift/k.dart';

class PubPacketSignInputWidget extends StatefulWidget {
  final String? sign;
  final ValueChanged<String>? onChanged;

  const PubPacketSignInputWidget({Key? key, this.sign, this.onChanged})
      : super(key: key);

  @override
  _PubPacketSignInputWidgetState createState() =>
      _PubPacketSignInputWidgetState();
}

class _PubPacketSignInputWidgetState extends State<PubPacketSignInputWidget> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.sign ?? '');
  }

  void onTextChange(String value) {
    if (widget.onChanged != null) widget.onChanged!(value);

    var cursorPos = _controller?.selection;
    if ((cursorPos?.start ?? 0) > (_controller?.text.length ?? 0)) {
      cursorPos = TextSelection.fromPosition(
          TextPosition(offset: _controller!.text.length));
    }
    if (cursorPos != null && _controller != null) {
      _controller!.selection = cursorPos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.dp,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 13.dp, vertical: 10.dp),
      child: Column(
        children: [
          Text(
            K.gift_pub_packet_sign_tips,
            style: TextStyle(fontSize: 12, color: R.color.mainTextColor),
          ),
          SizedBox(
            height: 12.dp,
          ),
          Row(
            children: [
              Text(
                K.gift_pub_packet_sign,
                style: TextStyle(fontSize: 12, color: R.color.secondTextColor),
              ),
              SizedBox(
                width: 9.dp,
              ),
              Container(
                width: 160.dp,
                height: 36.dp,
                alignment: AlignmentDirectional.centerStart,
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: R.color.secondBgColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.dp),
                child: TextField(
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  controller: _controller,
                  cursorColor: R.color.mainTextColor,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 12),
                  decoration: InputDecoration(
                    hintText: K.gift_pub_packet_sign_hint,
                    hintStyle:
                        TextStyle(fontSize: 12, color: R.color.secondTextColor),
                    border: InputBorder.none,
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(16)],
                  onChanged: onTextChange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
