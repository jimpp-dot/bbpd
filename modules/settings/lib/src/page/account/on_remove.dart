import 'package:flutter/cupertino.dart';

abstract class OnRemove {
  BuildContext get context;

  Future<void> onRemove(int id, int dateline);
}
