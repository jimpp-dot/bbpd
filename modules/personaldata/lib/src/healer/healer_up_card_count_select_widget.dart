import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// 聊愈师UP card数量选择控件
class HealerUpCardCountSelectWidget extends StatefulWidget {
  const HealerUpCardCountSelectWidget({super.key});

  @override
  State<HealerUpCardCountSelectWidget> createState() =>
      HealerUpCardCountSelectWidgetState();
}

class HealerUpCardCountSelectWidgetState
    extends State<HealerUpCardCountSelectWidget> {
  int _count = 1; // 服务数量

  late TextEditingController _numEditingController;

  int get count => _count;

  @override
  void initState() {
    super.initState();
    _numEditingController = TextEditingController();
    _numEditingController.addListener(() {
      int num = Util.parseInt(_numEditingController.text.trim());
      int finalNum = _changeNum(num);
      if (finalNum != num) {
        String value = finalNum.toString();
        _numEditingController.value = TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length));
      }
      setState(() {});
    });
    _setEditValue(1);
  }

  int _changeNum(int num) {
    if (num == _count) return _count;
    _count = num;
    if (_count <= 1) _count = 1;
    return _count;
  }

  void _setEditValue(int num) {
    int finalNum = _changeNum(num);
    String value = finalNum.toString();
    _numEditingController.value = TextEditingValue(
        text: value, selection: TextSelection.collapsed(offset: value.length));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _setEditValue(_count - 1);
          },
          child: Container(
            width: 28,
            height: 28,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: _count == 1
                  ? const Color(0xFFF5F5F5).withOpacity(0.3)
                  : const Color(0xFFF5F5F5),
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(8),
                  bottomStart: Radius.circular(8)),
            ),
            child: R.img(BaseAssets.shared$ic_reduce_png,
                width: 12,
                height: 12,
                color: _count == 1 ? Colors.black.withOpacity(0.3) : null),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 44,
          height: 28,
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AutoSizeText(
                '$_count',
                minFontSize: 6,
                maxFontSize: 15,
                maxLines: 1,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: Util.numFontFamily,
                ),
              ),
              Opacity(
                opacity: 0,
                child: TextField(
                  controller: _numEditingController,
                  style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: Util.numFontFamily),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '$_count',
                    hintStyle: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: Util.numFontFamily),
                    border: InputBorder.none,
                  ),
                  showCursor: true,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 2),
        GestureDetector(
          onTap: () {
            _setEditValue(_count + 1);
          },
          child: Container(
            width: 28,
            height: 28,
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(8), bottomEnd: Radius.circular(8)),
            ),
            child: R.img(BaseAssets.shared$ic_add_png, width: 12, height: 12),
          ),
        ),
      ],
    );
  }
}
