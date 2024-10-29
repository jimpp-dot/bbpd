import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class ICategorySelectorManager extends IResourceLoader {
  Future openSearchCondition(BuildContext context);
}
