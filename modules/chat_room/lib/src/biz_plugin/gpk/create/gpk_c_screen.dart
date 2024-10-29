import 'dart:async';
import 'package:provider/provider.dart' hide Selector;
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/base/punish/punish_widget.dart';
import 'package:chat_room/src/chatRoomData.dart';
import '../create/gpk_c_panel_position.dart';
import '../gpk_constants.dart';
import '../model/gpk_model.dart';
import '../widget/gpk_timer_picker.dart';

import 'gpk_c_control.dart';
import 'gpk_c_panel.dart';
import 'gpk_select_dialog.dart';
import 'gpk_select_model.dart';

/// 分组pk创建页面
class GPKCreateScreen extends StatefulWidget {
  final ChatRoomData room;

  const GPKCreateScreen({super.key, required this.room});

  @override
  _GPKCreateScreenState createState() => _GPKCreateScreenState();
}

class _GPKCreateScreenState extends State<GPKCreateScreen> {
  late GPKCreateController _createController;
  late StreamSubscription<bool> keyboardSubscription;

  bool _isKeyboardVisible = false;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _createController = GPKCreateController(widget.room);
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      Log.d('gpk create keyboard visible=$visible');
      if (_isKeyboardVisible != visible) {
        _isKeyboardVisible = visible;
        _refresh();
      }
    });
    _loadData();
    widget.room.addListener(
      RoomConstant.Event_Refresh,
      _onChanged,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.room.removeListener(
      RoomConstant.Event_Refresh,
      _onChanged,
    );
    keyboardSubscription.cancel();
    _createController.dispose();
  }

  _loadData() async {
    _isLoading = true;
    _refresh();
    GPKConfigResp resp = await _createController.loadData();
    _isLoading = false;

    if (false == resp.success && resp.msg != null) {
      Fluttertoast.showToast(msg: resp.msg);
    }
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar(
        K.room_gpk_create_page_title,
      ),
      body: SizedBox(
        height: Util.height - Util.statusHeight - kToolbarHeight,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              bottom: 70 + Util.iphoneXBottom,
              // 防止小屏幕手机与底部按钮重叠
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  _buildPositionPanel(),
                  _buildRuleRow(),
                  // _buildGoldRow(),
                  _buildTimerRow(),
                  _buildPunishRow(),
                ],
              ),
            ),
            _buildBottomBtn(),
            if (_isLoading) const Loading(),
          ],
        ),
      ),
    );
  }

  /// PK座位人选
  Widget _buildPositionPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ChangeNotifierProvider<GPKSelPosModel>.value(
        value: _createController.gpkSelPosModel,
        child: Consumer<GPKSelPosModel>(builder: (context, posModel, child) {
          List<GPKCreatePosWidget> camp1 =
              _buildCampWidgets(_createController.campList(GPKCamp.camp1), () {
            _onClickCamp(GPKCamp.camp1);
          });

          List<GPKCreatePosWidget> camp2 =
              _buildCampWidgets(_createController.campList(GPKCamp.camp2), () {
            _onClickCamp(GPKCamp.camp2);
          });

          return GPKCreatePanel(
            camp1: camp1,
            camp2: camp2,
          );
        }),
      ),
    );
  }

  /// 构建阵营网格
  List<GPKCreatePosWidget> _buildCampWidgets(
      List<GPKSelPosItem> list, VoidCallback callback) {
    return list.map((e) {
      return e.isIdle
          ? GPKCreatePosWidget.addWidget(
              onClickListener: callback,
            )
          : GPKCreatePosWidget.avatarWidget(
              id: e.uid,
              name: e.name,
              imgUrl: e.avatarUrl,
              onClickListener: callback,
            );
    }).toList();
  }

  /// PK规则设置
  Widget _buildRuleRow() {
    return _buildSettingItem(
      K.room_gpk_settings_rule,
      _createController.getRuleSelectText(),
      () {
        _displayRuleSheet();
      },
    );
  }

  /// Pk 金币是否计入
  Widget _buildGoldRow() {
    if (_createController.rule != RULE_GIF_VALUE) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 76,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: R.color.dividerColor))),
        child: Row(
          children: [
            Expanded(
              child: Text(
                K.room_gpk_settings_gold,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                ),
              ),
            ),
            CupertinoSwitch(
              value: _createController.coinValid,
              activeColor: R.color.mainBrandColor,
              onChanged: (bool value) async {
                _createController.coinValid = value;
                _refresh();
              },
            )
          ],
        ),
      ),
    );
  }

  /// PK时间设置
  Widget _buildTimerRow() {
    return _buildSettingItem(
      K.room_gpk_settings_time,
      _createController.getTimerSelectText(),
      () {
        _displayTimerPicker();
      },
    );
  }

  /// 标准形式的设置项目UI
  Widget _buildSettingItem(String title, String sel, VoidCallback callback) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Container(
          width: double.infinity,
          height: 76,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: R.color.dividerColor))),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                sel,
                style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 16,
                ),
              ),
              R.img(RoomAssets.chat_room$live_icon_live_pk_setting_next_webp,
                  width: 16, height: 16)
            ],
          ),
        ),
      ),
    );
  }

  /// PK惩罚设置
  Widget _buildPunishRow() {
    if (_createController.data == null ||
        _createController.data!.hasPunishList() == false) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 30),
      child: PunishGridWidget.buildGridNotifyWidget(
        _createController.data!.punishId,
        _createController.data!.toPunishList(),
        (punishData) {
          Log.d('gpk receive data->$punishData');
          _createController.punishData = punishData;
        },
      ),
    );
  }

  /// 底部创建按钮
  Widget _buildBottomBtn() {
    if (_isKeyboardVisible) {
      return const SizedBox.shrink();
    }
    return PositionedDirectional(
        bottom: 0,
        start: 0,
        end: 0,
        child: BottomButton.of(
            title: K.create,
            onTap: () async {
              _isLoading = true;
              _refresh();
              var success = await _createController.commit();
              _isLoading = false;
              if (success == true) {
                Navigator.of(context).pop();
              } else {
                _refresh();
              }
            }));
  }

  /// 展现PK规则选项
  _displayRuleSheet() async {
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            title: K.room_gpk_settings_rule,
            data: _createController.ruleSheetItem,
            render: (BuildContext context, SheetItem? item, int index,
                {VoidCallback? callback}) {
              return _buildRuleSheetItem(item);
            },
          );
        });

    if (result == null || result.value == null) {
      return;
    }
    Log.d(tag: 'gpk', 'rule options onTap => ${result.value?.label ?? ''}');
    _createController.rule = Util.parseInt(result.value?.key);
    _refresh();
  }

  /// 选择项的item UI.
  Widget _buildRuleSheetItem(SheetItem? item) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: R.color.dividerColor, width: 0.0),
        ),
      ),
      child: Text(
        item?.label ?? '',
        maxLines: 1,
        style: TextStyle(color: R.color.mainTextColor, fontSize: 17.0),
      ).toCenter(),

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(top: 4),
      //       child: Text(
      //         item?.label ?? '',
      //         maxLines: 1,
      //         style: TextStyle(color: R.color.mainTextColor, fontSize: 17.0),
      //       ),
      //     ),
      //     Text(
      //       item?.extra ?? '',
      //       maxLines: 1,
      //       style: TextStyle(color: R.color.secondTextColor, fontSize: 14),
      //     ),
      //   ],
      // ),
    );
  }

  /// 展示底部弹出的时间选择器
  _displayTimerPicker() async {
    GPKTimerResult? result = await showTimerPickerPopup(
      context: context,
      minSecond: 30,
      secondList: GPKCreateController.getTimerSecondSection(),
      minuteList: GPKCreateController.getTimerMinuteSection(),
    );
    Log.d(tag: 'gpk', 'select timer =>$result');
    if (result == null) {
      return;
    }
    _createController.minute = result.minute;
    _createController.second = result.second;

    _refresh();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  _onClickCamp(GPKCamp targetCamp) async {
    await showGpkSelectDialog(
        context, _createController.gpkSelPosModel, targetCamp);
    _refresh();
  }

  _onChanged(String type, dynamic data) {
    _createController.refreshRoomData(ChatRoomData.getInstance()!);
    _refresh();
  }
}
