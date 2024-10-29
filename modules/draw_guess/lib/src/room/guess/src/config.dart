import 'package:flutter/widgets.dart';

import 'base_painter.dart';

/// 画笔粗细
const Map<String, double> strokeWidths = {
  '1号': 4.0,
  '2号': 8.0,
  '3号': 12.0,
  '4号': 18.0,
};

/// 调色板
const List<Color> palette = [
  Color(0xFF212121),
  Color(0xFF757575),
  Color(0xFFBDBDBD),
  Color(0xFFEF5350),
  Color(0xFFEC407A),
  Color(0xFFAC47BD),
  Color(0xFF7E57C2),
  Color(0xFF3F51B5),
  Color(0xFF2296F3),
  Color(0xFF2AB6F6),
  Color(0xFF25C7DA),
  Color(0xFF26A69A),
  Color(0xFF66BB6B),
  Color(0xFF9CCC65),
  Color(0xFFFFEE58),
  Color(0xFFFFCB29),
  Color(0xFFFFA826),
  Color(0xFFFF7043),
];

class Config {
  final double strokeWidth;
  final Color paintColor;
  final Operation op;

  Config({
    required this.strokeWidth,
    required this.paintColor,
    this.op = Operation.draw,
  });

  Config copyWith({double? strokeWidth, Color? paintColor, Operation? op}) {
    return Config(
      strokeWidth: strokeWidth ?? this.strokeWidth,
      paintColor: paintColor ?? this.paintColor,
      op: op ?? this.op,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Config &&
          runtimeType == other.runtimeType &&
          strokeWidth == other.strokeWidth &&
          paintColor == other.paintColor &&
          op == other.op;

  @override
  int get hashCode => strokeWidth.hashCode ^ paintColor.hashCode ^ op.hashCode;

  @override
  String toString() {
    return 'Config{strokeWidth: $strokeWidth, paintColor: ${paintColor.toString()}, op: $op}';
  }
}

Config initialConfig = Config(
  strokeWidth: strokeWidths.values.first,
  paintColor: palette[0],
  op: Operation.draw,
);

/// 用于共享画笔配置的Widget
class ShareConfig extends InheritedWidget {
  final Config config;

  const ShareConfig({
    super.key,
    required this.config,
    required Widget child,
  }) : super(child: child);

  static ShareConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareConfig>();
  }

  @override
  bool updateShouldNotify(ShareConfig oldWidget) {
    return oldWidget.config != config;
  }
}

class EventNotification extends Notification {}

class UpdateConfigNotification extends EventNotification {
  final Config config;

  UpdateConfigNotification(this.config);
}

/// 撤销通知
class UndoNotification extends EventNotification {}
