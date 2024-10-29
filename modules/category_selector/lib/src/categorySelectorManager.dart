import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'page/searchConditionScreen.dart';

class CategorySelectorManager extends ICategorySelectorManager {
  static const String PKG_NAME = 'category_selector';

  @override
  Future openSearchCondition(BuildContext context) {
    return SearchConditionScreen.show(context);
  }
}
