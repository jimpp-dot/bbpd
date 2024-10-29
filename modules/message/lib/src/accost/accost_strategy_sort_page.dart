import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:message/src/model/accost_msg_item.dart';

/// 搭讪策略排序页
class AccostStrategySortPage extends StatefulWidget {
  final List<AccostMsgItem> msgList;

  const AccostStrategySortPage({super.key, required this.msgList});

  static Future openAccostStrategySortPage(
      BuildContext context, List<AccostMsgItem> msgList) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return AccostStrategySortPage(
            msgList: msgList,
          );
        },
        settings: const RouteSettings(name: 'AccostStrategySortPage'),
      ),
    );
  }

  @override
  _AccostStrategySortPageState createState() =>
      _AccostStrategySortPageState(msgList);
}

class _AccostStrategySortPageState extends State<AccostStrategySortPage> {
  final List<AccostMsgItem> msgList;
  final List<GlobalKey> _keyList = [];

  _AccostStrategySortPageState(this.msgList);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < msgList.length; i++) {
      _keyList.add(GlobalKey());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.msg_accost_strategy_sort,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        onPressed: () {
          Navigator.pop(context, msgList);
        },
        actionTitle: BaseK.K.finish,
        actionColor: R.color.mainBrandColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildMenuRow(),
        Expanded(
          child: ReorderableListView.builder(
            itemBuilder: (ctx, index) => _buildMsgItem(index),
            itemCount: msgList.length,
            onReorder: (oldIndex, newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              var child = msgList.removeAt(oldIndex);
              msgList.insert(newIndex, child);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuRow() {
    return Container(
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text(
            K.msg_strategy,
            style: TextStyle(
                fontSize: 11,
                color: R.color.thirdTextColor,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Container(
            width: 52,
            alignment: AlignmentDirectional.center,
            child: Text(
              K.msg_set_top,
              style: TextStyle(
                  fontSize: 11,
                  color: R.color.thirdTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: 52,
            alignment: AlignmentDirectional.center,
            child: Text(
              K.msg_drag,
              style: TextStyle(
                  fontSize: 11,
                  color: R.color.thirdTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 6,
            height: 46,
          ),
        ],
      ),
    );
  }

  Widget _buildMsgItem(int index) {
    AccostMsgItem item = msgList[index];
    String typeText = '';
    if (item.isText) {
      typeText = K.msg_text_accost;
    } else if (item.isVoice) {
      typeText = K.msg_voice_accost;
    } else if (item.isImage) {
      typeText = K.msg_image_accost;
    }
    return Container(
      key: _keyList[index],
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text(
            K.msg_accost_msg_name_index_prefix,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: R.color.mainTextColor,
            ),
          ),
          Container(
            width: 16,
            alignment: AlignmentDirectional.center,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: R.color.mainTextColor,
              ),
            ),
          ),
          Text(
            K.msg_accost_msg_name_index_postfix,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: R.color.mainTextColor,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          if (typeText.isNotEmpty)
            Container(
              width: 2,
              height: 2,
              decoration: BoxDecoration(
                color: R.color.mainTextColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          const SizedBox(
            width: 8,
          ),
          Text(
            typeText,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: R.color.secondTextColor),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (index > 0) {
                setState(() {
                  msgList.remove(item);
                  msgList.insert(0, item);
                });
              }
            },
            child: Container(
              width: 52,
              alignment: AlignmentDirectional.center,
              child: R.img(
                'ic_accost_sort_top.svg',
                package: ComponentManager.MANAGER_MESSAGE,
                width: 24,
                height: 24,
              ),
            ),
          ),
          Container(
            width: 52,
            alignment: AlignmentDirectional.center,
            child: R.img(
              'ic_accost_sort_drag.svg',
              package: ComponentManager.MANAGER_MESSAGE,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(
            width: 6,
            height: 46,
          ),
        ],
      ),
    );
  }
}
