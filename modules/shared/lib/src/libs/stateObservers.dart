import 'package:flutter/material.dart';

ValueNotifier<int?> orientationObserver = ValueNotifier(null);
ValueNotifier<AppLifecycleState> appStateObserver =
    ValueNotifier(AppLifecycleState.resumed);
