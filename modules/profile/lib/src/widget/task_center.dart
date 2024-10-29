import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/model/task_center_bean.dart';
import 'package:profile/src/profile_page.dart'
    hide ProfilePage, ProfilePageState;

import '../../k.dart';

/// 任务中心
class TaskCenter extends StatefulWidget {
  final TaskCenterBean? bean;
  final OnReloadTypeChanged? changed;

  const TaskCenter({super.key, this.bean, this.changed});

  @override
  State<StatefulWidget> createState() {
    return _TaskCenterState();
  }

  static TaskCenterBean? getBean() {
    Map? map = Session.getMap("task_center");
    if (map.isEmpty) {
      return null;
    }

    return TaskCenterBean.fromJson(map as Map<String, dynamic>);
  }
}

class _TaskCenterState extends State<TaskCenter> {
  static const PROGRESS_TOTAL_WIDTH = 104.0;
  final GlobalKey _titleRowKey = GlobalKey();
  final GlobalKey _titleTextKey = GlobalKey();
  final GlobalKey _moreTextKey = GlobalKey();
  double tipsMaxWidth = 0.0;

  static const TITLE_IMG_WIDTH = 126.0;
  static const MARGIN_WIDTH = 4.0;
  static const ARROW_IMG_WIDTH = 16.0;

  @override
  void initState() {
    super.initState();

    if (widget.bean == null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((duration) {
      RenderBox? rowRenderBox =
          _titleRowKey.currentContext?.findRenderObject() as RenderBox?;
      RenderBox? moreRenderBox =
          _moreTextKey.currentContext?.findRenderObject() as RenderBox?;
      RenderBox? titleTextRenderBox =
          _titleTextKey.currentContext?.findRenderObject() as RenderBox?;
      double rowWidth = rowRenderBox?.size.width ?? 0;
      double moreTextWidth = moreRenderBox?.size.width ?? 0;
      double titleWidth =
          isZhLan() ? TITLE_IMG_WIDTH : (titleTextRenderBox?.size.width ?? 0);
      setState(() {
        tipsMaxWidth = rowWidth -
            moreTextWidth -
            titleWidth -
            ARROW_IMG_WIDTH -
            MARGIN_WIDTH * 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bean == null) {
      return const SizedBox.shrink();
    }

    double borderRadius = 12;

    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: R.colors.mainBgColor,
        // boxShadow: [
        //   BoxShadow(
        //     color: R.colors.dividerColor,
        //     blurRadius: 12,
        //     offset: const Offset(0, 4),
        //   )
        // ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 14, top: 9, bottom: 9),
            decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: AlignmentDirectional.centerEnd,
                  image: AssetImage(R.imagePath('profile_task_center_bg.png',
                      package: ComponentManager.MANAGER_PROFILE)),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(borderRadius),
                    topEnd: Radius.circular(borderRadius)),
                gradient: const LinearGradient(
                    colors: [Color(0xFFB38EFF), Color(0xFFA095FF)])),
            child: Column(
              children: [
                Row(
                  key: _titleRowKey,
                  children: [
                    _getTaskTitle(),
                    ..._getTaskTips(widget.bean!.tips),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 3),
                      child: Text(
                        K.profile_more_a_task,
                        style: TextStyle(
                            color: const Color(0x00ffffff).withOpacity(0.7),
                            fontSize: 13),
                        key: _moreTextKey,
                      ),
                    ),
                    R.img(
                      'icon_next_center.svg',
                      package: ComponentManager.MANAGER_BASE_CORE,
                      width: ARROW_IMG_WIDTH,
                      height: ARROW_IMG_WIDTH,
                      color: const Color(0x00ffffff).withOpacity(0.7),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      K.profile_level_prefix(
                          [widget.bean!.taskLevel.toString()]),
                      style: const TextStyle(
                          color: Color(0x00ffffff), fontSize: 13),
                    ),
                    const SizedBox(width: 4),
                    Stack(
                      children: [
                        Container(
                          width: PROGRESS_TOTAL_WIDTH,
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color(0x00ffffff).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        Container(
                          width: widget.bean!.progress > 1
                              ? 1
                              : widget.bean!.progress * PROGRESS_TOTAL_WIDTH,
                          height: 8,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFFF56F), Color(0xFFFFCF53)],
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 16, bottom: 16),
            child: Row(
              children: [
                R.img('profile_ic_will_task.png',
                    width: 48,
                    height: 48,
                    package: ComponentManager.MANAGER_PROFILE),
                const SizedBox(width: 8),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.bean!.taskName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: R.colors.mainTextColor, fontSize: 15),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.bean!.awardName,
                          style: TextStyle(
                              color: R.colors.secondTextColor, fontSize: 13),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '+${widget.bean!.awardCount}',
                          style: const TextStyle(
                              color: Color(0xFFFDA252), fontSize: 14),
                        )
                      ],
                    )
                  ],
                )),
                Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 16, end: 16, top: 7, bottom: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFB38EFF), Color(0xFFA095FF)]),
                  ),
                  child: Text(
                    K.profile_go_complete,
                    style: const TextStyle(
                        color: Color(0x00ffffff),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getTaskTitle() {
    if (isZhLan()) {
      return R.img('profile_task_title.png',
          width: TITLE_IMG_WIDTH,
          height: 22,
          package: ComponentManager.MANAGER_PROFILE);
    } else {
      return Text(
        K.profile_do_task,
        style: const TextStyle(
            color: Color(0x00ffffff),
            fontSize: 16,
            fontWeight: FontWeight.w600),
        key: _titleTextKey,
      );
    }
  }

  bool isZhLan() {
    Locale? local = Translations.currentLanguage;
    return local.languageCode == 'zh' && local.countryCode == 'CN';
  }

  List<Widget> _getTaskTips(String tips) {
    List<Widget> list = [];

    if (Util.isStringEmpty(tips)) {
      list.add(const Spacer());
    } else {
      list.add(Container(
        padding: const EdgeInsetsDirectional.only(start: 3, end: 4),
        margin: const EdgeInsetsDirectional.only(
            start: MARGIN_WIDTH, end: MARGIN_WIDTH),
        constraints: BoxConstraints(maxWidth: tipsMaxWidth),
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(8),
            topEnd: Radius.circular(8),
            bottomEnd: Radius.circular(8),
          ),
          gradient: LinearGradient(colors: [
            Color(0xFF7D2EE6),
            Color(0xFFFF6BB3),
            Color(0xFFE4FE7C)
          ]),
        ),
        child: Text(
          tips,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Color(0x00ffffff), fontSize: 10),
        ),
      ));

      list.add(const Spacer());
    }
    return list;
  }
}
