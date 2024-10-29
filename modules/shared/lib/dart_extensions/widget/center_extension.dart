import 'package:flutter/cupertino.dart';

extension CenterExtension on Widget {
  Center toCenter() {
    return Center(
      child: this,
    );
  }
}
