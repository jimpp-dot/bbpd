import 'package:flutter/material.dart';

class UnderDescToast extends StatelessWidget {
  final String msg;

  const UnderDescToast({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF22D0A5),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
      child: Text(
        msg,
        style: const TextStyle(color: Color(0xFF34294E)),
      ),
    );
  }

  static WidgetBuilder builder(msg) {
    return (context) {
      return UnderDescToast(msg: msg);
    };
  }
}
