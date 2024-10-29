import 'dart:math';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';
import 'room_data_overview.dart';

/// 接待数据

class ReceptionDataBean {
  final ReceptionInfo receptionInfo;
  bool show;

  /// 是否展开
  ReceptionDataBean(this.receptionInfo, {this.show = false});
}

class ReceptionDataWidget extends StatefulWidget {
  final List<ReceptionDataBean> data;

  const ReceptionDataWidget({super.key, required this.data});

  @override
  ReceptionDataState createState() => ReceptionDataState();
}

class ReceptionDataState extends State<ReceptionDataWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.data.isNotEmpty) {
      /// 默认第一个数据展开
      widget.data[0].show = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) return const SizedBox.shrink();

    return Container(
      width: Util.width - 40,
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
              K.room_reception_data_title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor),
            ),
          ),
          Container(
            width: Util.width - 20 - 20,
            height: 1,
            margin: const EdgeInsetsDirectional.only(top: 6, bottom: 8),
            color: R.color.secondBgColor,
          ),
          ..._buildReceptions(),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 19, end: 19, top: 10, bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 1, color: R.color.mainTextColor.withOpacity(0.1)),
                ),
                const SizedBox(width: 4),
                Text(
                  K.reception_data_tips,
                  style: TextStyle(fontSize: 11, color: R.color.thirdTextColor),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                      height: 1, color: R.color.mainTextColor.withOpacity(0.1)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildReceptions() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.data.length; i++) {
      widgets.add(_buildReception(i, widget.data[i]));
    }

    return widgets;
  }

  Widget _buildReception(int index, ReceptionDataBean bean) {
    if (bean.show == true) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildReceptionInfo(index, bean),
          RoomDataOverview(info: bean.receptionInfo.currentStatistics),
        ],
      );
    }

    return _buildReceptionInfo(index, bean);
  }

  Widget _buildReceptionInfo(int index, ReceptionDataBean bean) {
    return GestureDetector(
      onTap: () {
        bean.show = !bean.show;
        refresh();
      },
      child: SizedBox(
        width: Util.width - 40,
        height: 60,
        child: Row(
          children: [
            const SizedBox(width: 14),
            _buildIndex(index),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                IPersonalDataManager? personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager?.openImageScreen(
                  context,
                  bean.receptionInfo.uid,
                  refer: const PageRefer('reception_data_widget'),
                );
              },
              child: CommonAvatar(
                path: bean.receptionInfo.icon,
                size: 40,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                bean.receptionInfo.name,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainTextColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, top: 12, bottom: 12),
              child: Transform.rotate(
                angle: bean.show ? 0 : pi,
                child: R.img(
                  RoomAssets.chat_room$ic_drop_up_svg,
                  width: 16,
                  height: 16,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndex(int index) {
    index++;
    String indexString;
    if (index < 10) {
      indexString = '0$index';
    } else {
      indexString = '$index';
    }

    return NumText(
      indexString,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
        color: index <= 3 ? const Color(0xFFFFD04B) : R.color.thirdTextColor,
      ),
    );
  }
}
