import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 根据FlutterSwiper插件扩展的一个自定义Swiper组件,目前暂时只支持横向滚动。
/// [itemCount] item 数量
/// [itemBuilder] 自定义item
/// [itemHeight] item高度
/// [itemWidth] item宽度
/// [loop] 是否循环滚动，默认true
/// [itemScales] item的缩放比例，默认无缩放,  注意：itemScales的第一个值不是最中间的item，而是其两边的item的缩放值
/// [onIndexChanged] index切换回调
/// [startIndex] 初始展示位置,默认从0开始
/// [stateCount] 显示出来的item数量
/// [itemSpace] item之间的间隔，默认4px
/// [itemAlign] item的对其方式(top/center/bottom)，默认剧中对齐
/// [itemOpacities] item的透明度递进关系，从itemOpacities.index == 0 表示从中间一个item向外扩散
/// [itemRotates] item的旋转角度，
class CommonCustomLayoutSwiper extends StatefulWidget {
  // -----item 设置------
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double itemWidth;
  final double itemHeight;
  final bool loop;
  final List<double> itemScales;
  // ------ layout option
  final int startIndex;
  final int stateCount;
  final double itemSpace;
  final AlignmentDirectional itemAlign;
  final List<double> itemOpacities;
  final List<double> itemRotates;

  /// 如果 customItemTranslates 不为null,则itemSpace无效
  final List<Offset>? customItemTranslates;

  final ValueChanged<int>? onIndexChanged;

  final SwiperPlugin? pagination;

  const CommonCustomLayoutSwiper({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.itemHeight,
    required this.itemWidth,
    this.loop = true,
    this.itemScales = const [1.0],
    this.startIndex = 0,
    this.stateCount = 3,
    this.onIndexChanged,
    this.itemSpace = 4.0,
    this.itemAlign = AlignmentDirectional.center,
    this.itemOpacities = const [1.0, 1.0],
    this.itemRotates = const [0.0, 0, 0],
    this.customItemTranslates,
    this.pagination,
  }) : super(key: key);

  @override
  State<CommonCustomLayoutSwiper> createState() =>
      _CommonCustomLayoutSwiperState();
}

class _CommonCustomLayoutSwiperState extends State<CommonCustomLayoutSwiper> {
  int _initStartIndex = 0;

  @override
  initState() {
    _initStartIndex = widget.startIndex - _getIndexOffset();

    super.initState();
  }

  int _getIndexOffset() => (_getRealStateCount() - 1) ~/ 2;

  /// 判断真实用来展示出来的Item数量，如果是循环滚动，则多出来的两个是用来处理循环滚动的
  int _getRealStateCount() {
    if (widget.loop) return widget.stateCount + 2;
    return widget.stateCount;
  }

  /// 转换后的缩放值
  List<double> _getLayoutScaleOptions() {
    List<double> convertedList = [1.0];

    List<double> scales = widget.itemScales.toList();
    if (widget.loop) {
      scales.add(scales.last);
    }

    for (var element in scales) {
      convertedList.insert(0, element);
      convertedList.add(element);
    }

    return convertedList;
  }

  /// item旋转角度
  List<double> _getLayoutRotateOptions() {
    List<double> convertedList = [];

    List<double> rotates = widget.itemRotates.toList();
    if (widget.loop) {
      rotates.add(rotates.last);
    }
    convertedList.add(rotates.first);
    rotates.removeAt(0);

    for (var element in rotates) {
      convertedList.insert(0, element);
      convertedList.add(element);
    }

    return convertedList;
  }

  /// item的透明度
  List<double> _getLayoutOpacityOptions() {
    List<double> convertedList = [];

    List<double> opacities = widget.itemOpacities.toList();
    if (widget.loop) {
      opacities.add(opacities.last);
    }

    convertedList.add(opacities.first);
    opacities.removeAt(0);
    for (var element in opacities) {
      convertedList.insert(0, element);
      convertedList.add(element);
    }

    return convertedList;
  }

  /// item 的偏移量,暂时只支持横向滚动的情况
  List<Offset> _getLayoutTranslateOptions() {
    List<Offset> convertedList = [Offset.zero];

    final realItemCount = _getRealStateCount();

    /// 需要进行计算的次数
    var needProcessCount = (realItemCount - 1) / 2;

    if (needProcessCount > 0) {
      for (int i = 1; i <= needProcessCount; i++) {
        double scale = 1.0;
        var scaleIndex = i - 1;
        if (scaleIndex < 0) {
          scaleIndex = 0;
        }
        if (scaleIndex < widget.itemScales.length) {
          scale = widget.itemScales[i - 1];
        } else {
          scale = widget.itemScales.last;
        }

        /// 根据item的对齐方式计算dy
        var dyOffset = (widget.itemHeight - widget.itemHeight * scale);
        if (widget.itemAlign == AlignmentDirectional.topCenter) {
          /// 顶部对齐
          dyOffset = -dyOffset / 2.0;
        } else if (widget.itemAlign == AlignmentDirectional.bottomCenter) {
          /// 底部对齐
          dyOffset = dyOffset / 2.0;
        } else {
          /// 剧中对齐
          dyOffset = 0;
        }

        /// 中间item的左边一个item,dx偏移量是负值
        convertedList.insert(0,
            Offset(-(widget.itemWidth + 2 * widget.itemSpace) * i, dyOffset));

        /// 中间item的右边一个item,dx偏移量是正值
        convertedList.add(
            Offset((widget.itemWidth + 2 * widget.itemSpace) * i, dyOffset));
      }
    }

    return convertedList;
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: widget.itemCount,
      layout: SwiperLayout.CUSTOM,
      loop: widget.loop,
      itemWidth: widget.itemWidth,
      itemHeight: widget.itemHeight,
      itemBuilder: widget.itemBuilder,
      onIndexChanged: widget.onIndexChanged,
      pagination: widget.pagination,
      customLayoutOption: CustomLayoutOption(
        startIndex: _initStartIndex,
        stateCount: _getRealStateCount(),
        startIndexOffset: _getIndexOffset(),
      )
          .addScale(
            _getLayoutScaleOptions(),
            Alignment.center,
          )
          .addRotate(
            _getLayoutRotateOptions(),
          )
          .addOpacity(
            _getLayoutOpacityOptions(),
          )
          .addTranslate(
            widget.customItemTranslates != null
                ? widget.customItemTranslates!
                : _getLayoutTranslateOptions(),
          ),
    );
  }
}
