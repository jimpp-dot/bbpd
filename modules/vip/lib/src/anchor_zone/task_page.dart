import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/anchor_zone/welfare_model.dart';
import '../../k.dart';
import 'package:shared/util/color_constant.dart';

/// 主播专区任务页面
class TaskPage extends StatefulWidget {
  final List<Task>? tasks;

  const TaskPage(this.tasks, {super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return _buildTaskList();
  }

  Widget _buildTaskList() {
    SizedBox separator = const SizedBox(height: 32);
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return separator;
        },
        padding: const EdgeInsetsDirectional.only(
            start: 12, top: 16, end: 12, bottom: 0),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.tasks?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return _TaskItem(widget.tasks![index]);
        });
  }
}

class _TaskItem extends StatelessWidget {
  final Task item;

  const _TaskItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.todayPoint.toString(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: ColorConstant.welfareContributeTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: Util.numFontFamily),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ]),
          const SizedBox(height: 3),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  item.desc,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  K.vip_welfare_today_obtained_integrate,
                  style: TextStyle(
                    color: ColorConstant.welfareContributeTextColor
                        .withOpacity(0.6),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ])
        ]);
  }
}
