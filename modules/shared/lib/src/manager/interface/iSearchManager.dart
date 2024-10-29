import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class ISearchManager extends IResourceLoader {
  Future<dynamic> showSearch(BuildContext context);

  Widget buildSearchBar(BuildContext context, bool suppDark);

  Future<List<Map<String, dynamic>>> apiSearchUser(String key);

  Widget getHiSongSearchBar(ValueChanged<String> onChanged);
}
