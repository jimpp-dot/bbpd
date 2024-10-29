import 'package:shared/shared.dart';
import 'package:chat/src/msg/config.dart';
import 'package:flutter/material.dart';

abstract class MessageWidgetBuilder {
  Widget buildMsg(BuildContext context, MessageContent message,
      {Key? key, MessageDisplayDirection? direction});
}
