// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/widgets.dart';
import 'plugin_manager.dart';

abstract class Pluggable {
  String get name;
  String get displayName;
  // Widget get iconWidget;
  IconData get iconData;
  void onTrigger();
  // Widget? buildWidget(BuildContext? context);
  ImageProvider? get iconImageProvider;
}

typedef StreamFilter = bool Function(dynamic);

abstract class PluggableWithStream extends Pluggable {
  Stream get stream;
  StreamFilter get streamFilter;
}

abstract class PluggableWithNestedWidget extends Pluggable {
  Widget buildNestedWidget(Widget child);
}

mixin PluggableMixin implements Pluggable {
  void register() {
    PluginManager.instance.register(this);
  }
}
