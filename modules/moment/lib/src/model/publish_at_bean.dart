import 'dart:ui';

import 'package:shared/shared.dart';

class PublishATBean extends ATTextRange {
  final String? name;
  final int uid;

  PublishATBean(
      {this.name, this.uid = 0, int? postPos = 0, TextRange? textRange}) {
    super.postPos = postPos;
    super.textRange = textRange;
  }

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
  PublishATBean copy() {
    return PublishATBean(
        name: name, uid: uid, postPos: postPos, textRange: textRange);
  }
}
