import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import '../../shared.dart';

abstract class BarChartBean<T> {
  final String time;
  final T num;

  BarChartBean({required this.time, required this.num});
}

class IntBarChartBean extends BarChartBean<int> {
  IntBarChartBean({required String time, required int num})
      : super(time: time, num: num);
}

class DoubleBarChartBean extends BarChartBean<double> {
  DoubleBarChartBean({required String time, required double num})
      : super(time: time, num: num);
}

class BarChartWidget extends StatelessWidget {
  final List<BarChartBean>? data;

  /// 选中时间，柱状条颜色有区分,可不传
  final String selectTime;

  /// 数据超过一屏时，可以定义一个默认最左侧展示的时间，默认为第一个时可不传
  final String? firstShowTime;

  /// 一屏展示几个时间
  final int? showNumPerScreen;

  const BarChartWidget(
      {super.key,
      this.data,
      this.selectTime = '',
      this.firstShowTime,
      this.showNumPerScreen = 7});

  @override
  Widget build(BuildContext context) {
    if (data == null || data!.isEmpty) {
      return const SizedBox.shrink();
    }
    var seriesList = [
      charts.Series<BarChartBean, String>(
        id: 'bar_chart_${data![0].time}_$selectTime',
        colorFn: (BarChartBean bean, _) {
          return bean.time == selectTime
              ? toChartsColor(R.color.mainBrandColor)
              : charts.Color.fromHex(code: '#7585A2');
        },
        domainFn: (BarChartBean bean, _) => bean.time,
        measureFn: (BarChartBean bean, _) => bean.num,
        labelAccessorFn: (BarChartBean bean, _) {
          if (bean.num < 1000) {
            return '${bean.num}';
          }

          /// 最多保留小数点后一位
          return '${Util.removeDecimalZeroFormat(bean.num ~/ 100 * 100 / 1000)}k';
        },
        outsideLabelStyleAccessorFn: (BarChartBean bean, _) {
          return charts.TextStyleSpec(
            fontSize: (9 * Util.ratio).floor(),
            color: bean.time == selectTime
                ? toChartsColor(R.color.mainTextColor)
                : toChartsColor(R.color.secondTextColor),
          );
        },
        data: data!,
      )
    ];

    return charts.BarChart(
      seriesList,
      animate: false,
      behaviors: [
        charts.SlidingViewport(),
        charts.PanAndZoomBehavior(),
      ],
      barRendererDecorator: charts.BarLabelDecorator<String>(
        /// 柱头文本显示
        labelPosition: charts.BarLabelPosition.outside,
      ),
      selectionModels: const [],

      /// 纵轴绘制配置
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: false,
        renderSpec: charts.GridlineRendererSpec(
          tickLengthPx: 0,

          /// 刻度文字样式
          labelStyle: charts.TextStyleSpec(
            fontSize: 9,
            color: toChartsColor(R.color.secondTextColor),
          ),

          /// 平行于横轴的刻度线样式
          lineStyle: charts.LineStyleSpec(
            color: toChartsColor(R.color.mainTextColor.withOpacity(0.04)),
          ),
        ),
      ),

      /// 横轴绘制配置
      domainAxis: charts.OrdinalAxisSpec(
        /// 窗口位置/大小
        viewport: charts.OrdinalViewport(
            firstShowTime ?? data![0].time, showNumPerScreen ?? 7),
        renderSpec: charts.SmallTickRendererSpec(
          /// 横轴刻度标识突出长度（不展示）
          tickLengthPx: 0,

          /// 刻度文字样式
          labelStyle: charts.TextStyleSpec(
            fontSize: 11,
            color: toChartsColor(R.color.mainTextColor),
          ),

          /// 轴线的样式
          axisLineStyle: charts.LineStyleSpec(
            color: toChartsColor(R.color.mainTextColor.withOpacity(0.2)),
          ),
        ),
      ),
    );
  }

  charts.Color toChartsColor(Color color) {
    return charts.Color(
      r: color.red,
      g: color.green,
      b: color.blue,
      a: color.alpha,
    );
  }
}
