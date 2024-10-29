import 'package:flutter/material.dart';

abstract class BaseScheme {
  String jumpToPage(BuildContext context, Map<String, String> qps) =>
      "/${qps['page']}";
}
