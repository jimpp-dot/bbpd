import 'dart:ui';

import 'package:shared/shared.dart';

class ImAtBean extends ATTextRange {
  final String name;
  final int uid;
  @override
  int? postPos;

  @override
  TextRange? textRange;

  ImAtBean(
      {required this.name, required this.uid, this.postPos, this.textRange});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'uid': uid,
        'pos': postPos,
      };

  String atNameString() {
    return '＠$name ';
  }

  @override
  String actualText() {
    return atNameString();
  }

  @override
  int textLength() {
    return actualText().runes.length;
  }

  @override
  ImAtBean copy() {
    return ImAtBean(
        name: name, uid: uid, postPos: postPos, textRange: textRange);
  }
}
