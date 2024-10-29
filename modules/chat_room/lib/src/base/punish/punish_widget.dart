import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/punish/punish_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'punish_control.dart';

/// 惩罚面板UI,父Widget可见听 PunishNotification通知获取变化
class PunishGridWidget extends StatefulWidget {
  /// 初始选中的项目
  final int initSelectedPid;

  /// 惩罚项目列表
  final List<PunishModel> punishList;

  final String? title;

  const PunishGridWidget({
    super.key,
    this.title,
    required this.initSelectedPid,
    required this.punishList,
  });

  /// 构建惩罚面板Widget，initSelectedPid & punishList 不能为null
  static Widget buildGridNotifyWidget(int initSelectedPid,
      List<PunishModel> punishList, PunishChangeCallback callback) {
    return NotificationListener<PunishNotification>(
      onNotification: (notification) {
        callback.call(notification.model);
        return true;
      },
      child: PunishGridWidget(
          title: K.room_pk_punish,
          initSelectedPid: initSelectedPid,
          punishList: punishList),
    );
  }

  @override
  PunishGridWidgetState createState() => PunishGridWidgetState();
}

typedef PunishChangeCallback = Function(PunishModel? model);

class PunishGridWidgetState extends State<PunishGridWidget> {
  late PunishControl _punishControl;

  late TextEditingController _selectionController;
  String? _hitContent;

  @override
  void initState() {
    super.initState();
    _punishControl = PunishControl(
        selectId: widget.initSelectedPid, punishList: widget.punishList);
    _selectionController = TextEditingController();
    _selectionController.addListener(() {
      _punishControl.currentPunish = _selectionController.text;
      _dispatchPunishChange();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 220,
          ),
          child: _buildGridView(),
        ),
        _buildTextEditorWidget(),
      ],
    );
  }

  /// 顶部标题
  Widget _buildTitle() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 18),
        child: Text(widget.title ?? K.live_pk_my_punish,
            style: TextStyle(fontSize: 16, color: R.color.mainTextColor)));
  }

  /// 惩罚中间Grid列表
  Widget _buildGridView() {
    if (Util.isCollectionEmpty(_punishControl.punishList)) {
      return Container();
    }
    return GridView.builder(
      itemCount: _punishControl.punishList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: _crossAxisCount(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        height: 48,
      ),
      primary: false,
      padding: const EdgeInsets.all(0.0),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _buildGridItem(_punishControl.punishList[index]);
      },
    );
  }

  /// 列的排列数量
  int _crossAxisCount() {
    var len = _punishControl.punishList.length;
    if (len == 1) {
      return 1;
    } else if (len <= 2) {
      return 2;
    } else {
      return 3;
    }
  }

  /// 惩罚项目Grid
  Widget _buildGridItem(PunishModel model) {
    return _buildPunishItem(model.name, _punishControl.selectId == model.id,
        () {
      _punishControl.selectId = model.id;
      _punishControl.currentPunish = model.name;
      _refresh();
      _dispatchPunishChange();
    });
  }

  /// 每一个GridItem惩罚项目UI
  Widget _buildPunishItem(String text, bool select, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 106,
        height: 48,
        decoration: BoxDecoration(
          border: select
              ? Border.all(color: R.color.mainBrandColor, width: 1)
              : Border.all(color: _borderColor(), width: 1),

          // gradient: select
          //     ? LinearGradient(
          //         begin: AlignmentDirectional.centerStart,
          //         end: AlignmentDirectional.centerEnd,
          //         colors: R.color.mainBrandGradientColors)
          //     : null,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        alignment: Alignment.center,
        child: Text(text,
            style: TextStyle(
                color: select ? Colors.white : _textColor(),
                fontWeight: FontWeight.w600,
                fontSize: 13)),
      ),
    );
  }

  Color _textColor() {
    return R.color.secondTextColor;
  }

  /// 底部自定义惩罚内容
  Widget _buildTextEditorWidget() {
    if (!_punishControl.isSelected() &&
        _hitContent != null &&
        _hitContent!.isNotEmpty) {
      _selectionController.text = _hitContent!;
      _selectionController.selection = TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream, offset: _hitContent!.length));
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor(), width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          R.img(
            RoomAssets.chat_room$livev3_icon_live_pk_setting_edit_svg,
            width: 20,
            height: 20,
            color: _textColor(),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _selectionController,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  color: _textColor(),
                  fontSize: 13,
                  height: 1,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: _textColor(),
                    fontSize: 13,
                    height: 1,
                    fontWeight: FontWeight.w600),
                hintText: K.live_pk_diy_punish_hint,
              ),
              keyboardType: TextInputType.text,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              textInputAction: TextInputAction.done,
              onTap: () {
                _punishControl.currentPunish = _selectionController.text;
                _punishControl.selectId = -1;
                _refresh();
                _dispatchPunishChange();
              },
            ),
          )
        ],
      ),
    );
  }

  Color _borderColor() => R.color.mainTextColor.withAlpha(26);

  void _dispatchPunishChange() =>
      PunishNotification(_currentPunishData()).dispatch(context);

  PunishModel? _currentPunishData() {
    return _punishControl.currentPunishData();
  }

  _refresh() {
    if (mounted) setState(() {});
  }
}

class PunishNotification extends Notification {
  PunishModel? model;

  PunishNotification(this.model);
}
