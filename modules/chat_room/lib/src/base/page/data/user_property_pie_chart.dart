import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 用户属性饼图
class UserPropertyPieChart extends StatelessWidget {
  final List<PieChartBean> genderDataList;
  final List<PieChartBean> newDataList;

  const UserPropertyPieChart(
      {super.key, required this.genderDataList, required this.newDataList});

  @override
  Widget build(BuildContext context) {
    if (genderDataList.isEmpty || newDataList.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      width: Util.width - 20 - 20,
      height: 206,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: R.color.mainBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 7, start: 12),
            child: Text(
              K.room_user_property,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: R.color.mainTextColor,
              ),
            ),
          ),
          Container(
            width: Util.width - 20 - 20,
            height: 1,
            margin: const EdgeInsetsDirectional.only(top: 6, bottom: 8),
            color: R.color.secondBgColor,
          ),
          SizedBox(
            width: Util.width - 20 - 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPieChart(genderDataList),
                _buildPieChart(newDataList),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart(List<PieChartBean> data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PieChatWidget(
          dataList: data,
          width: 100,
        ),
        const SizedBox(height: 10),
        ..._buildDeclares(data),
      ],
    );
  }

  List<Widget> _buildDeclares(List<PieChartBean> data) {
    List<Widget> widgets = [];
    int total = 0;
    for (var element in data) {
      total = total + element.num;
    }

    int sum = 0;
    for (int i = 0; i < data.length; i++) {
      int per;
      if (total == 0) {
        per = 0;
      } else {
        if (i == data.length - 1) {
          per = 100 - sum;
        } else {
          per = (data[i].num / total * 100).floor();
          sum = sum + per;
        }
      }

      widgets.add(_buildDeclare(data[i], '$per%'));
    }

    return widgets;
  }

  Widget _buildDeclare(PieChartBean data, String per) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsetsDirectional.only(start: 10, end: 4),
          decoration: BoxDecoration(shape: BoxShape.circle, color: data.color),
        ),
        Text(
          data.title ?? '',
          style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
        ),
        const SizedBox(width: 8),
        NumText(
          per,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            color: R.color.mainTextColor,
          ),
        ),
      ],
    );
  }
}
