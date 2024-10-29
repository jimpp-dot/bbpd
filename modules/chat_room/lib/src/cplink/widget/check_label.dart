import 'package:flutter/material.dart';

class CheckLabel extends StatefulWidget {
  final String? text;
  final bool initChecked;
  final OnCheckChanged? onCheckChanged;

  const CheckLabel(
      {Key? key,
      @required this.text,
      this.initChecked = false,
      this.onCheckChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CheckLabelState();
  }
}

typedef OnCheckChanged = Function(bool checked);

class _CheckLabelState extends State<CheckLabel> {
  @override
  Widget build(BuildContext context) {
    bool c = widget.initChecked;

    return InkWell(
      onTap: () {
        if (widget.onCheckChanged != null) {
          widget.onCheckChanged!(c);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 0.5,
            ),
            gradient: LinearGradient(
                colors: c
                    ? [const Color(0xFFFF96F4), const Color(0xFFFF61D6)]
                    : [Colors.transparent, Colors.transparent])),
        padding: const EdgeInsetsDirectional.only(
            top: 3, bottom: 3, start: 7, end: 7),
        child: Text(
          widget.text ?? '',
          style: const TextStyle(color: Colors.white, fontSize: 9),
        ),
      ),
    );
  }
}
