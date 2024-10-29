import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 进房来源饼图
class EnterRoomReferPieChart extends StatelessWidget {
  final List<PieChartBean> dataList;

  const EnterRoomReferPieChart(this.dataList, {super.key});

  @override
  Widget build(BuildContext context) {
    if (dataList.isEmpty) return const SizedBox.shrink();
    return Container(
      width: Util.width - 20 - 20,
      height: 172,
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
              K.room_enter_room_refer,
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
            height: 120,
            child: Row(
              children: [
                const Spacer(),
                PieChatWidget(dataList: dataList, width: 120, innerWidth: 62),
                const SizedBox(width: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildDeclares(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDeclares() {
    List<Widget> widgets = [];
    int total = 0;
    for (var element in dataList) {
      total = total + element.num;
    }

    int sum = 0;
    for (int i = 0; i < dataList.length; i++) {
      int per;
      if (total == 0) {
        per = 0;
      } else {
        if (i == dataList.length - 1) {
          per = 100 - sum;
        } else {
          per = (dataList[i].num / total * 100).floor();
          sum = sum + per;
        }
      }

      widgets.add(_buildDeclare(dataList[i], '$per%'));
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
          margin: const EdgeInsetsDirectional.only(end: 4),
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
