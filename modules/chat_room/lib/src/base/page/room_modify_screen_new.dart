import 'dart:convert';

import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/option_beans.dart';
import 'package:chat_room/src/base/repo/room_options_repo.dart';
import 'package:chat_room/src/base/setting/room_setting_mixin.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'roomModifyScreen.dart';

/// 房间顶部弹窗 => 房间设置
///
class RoomModifyScreenNew extends StatefulWidget {
  final int rid;

  const RoomModifyScreenNew({super.key, required this.rid});

  @override
  State<StatefulWidget> createState() {
    return _RoomModifyScreenNewState();
  }

  static Future open(BuildContext context, int rid) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: '/RoomModifyScreenNew'),
        builder: (context) => RoomModifyScreenNew(rid: rid),
      ),
    );
  }
}

class _RoomModifyScreenNewState extends State<RoomModifyScreenNew> with RoomSettingMixin<RoomModifyScreenNew> {
  List<OptionItem> groupedItems = [];
  bool _nameAudit = false; // 个人房房间标题是否正在审核中
  bool _descriptionAudit = false; // 个人房房间公告是否正在审核中

  @override
  void initState() {
    super.initState();
    _loadRoomSettings();
  }

  void _loadRoomSettings() async {
    try {
      /// partyStyle参数用于控制新的房间切换逻辑，会把部分房间合并。
      int partyStyle = BaseConfig.instance.roomSwitchPartyStyle ? 1 : 0;
      final url =
          '${System.domain}option/getRoomSetting?rid=${widget.rid}&version=${RoomModifyScreen.INFO_VERSION}&option_index_version=${RoomOptionsRepo.OPTION_INDEX_VERSION}&use_party_style=$partyStyle';
      final response = await Xhr.getJson(url, formatJson: true);
      Map res = response.value();
      if ((res['success'] ?? false) && res['data'] != null && res['data'] is Map) {
        RoomSettingData data = RoomSettingData.fromJson(res['data']);
        _group(data.list);
        if (mounted) {
          setState(() {
            _nameAudit = Util.parseInt(res['data']['name_audit']) == 1;
            _descriptionAudit = Util.parseInt(res['data']['description_audit']) == 1;
          });
        }
      }
    } catch (e) {}
  }

  void _group(List<OptionItem> list) {
    if (!Util.isCollectionEmpty(list)) {
      List<OptionItem> textList = [];
      List<OptionItem> switchList = [];
      List<OptionItem> listList = [];
      List<OptionItem> themeList = [];
      List<OptionItem> linkList = [];
      for (var element in list) {
        if (element.valueType == OptionValueType.TEXT) {
          textList.add(element);
        } else if (element.valueType == OptionValueType.SWITCH) {
          switchList.add(element);
        } else if (element.valueType == OptionValueType.LIST) {
          listList.add(element);
        } else if (element.valueType == OptionValueType.THEME &&
            !Util.isCollectionEmpty(element.subItems) &&
            element.subItems!.length > 1) {
          // 选项大于1
          themeList.add(element);
        } else if (element.valueType == OptionValueType.LINK) {
          linkList.add(element);
        }
      }

      if (!Util.isCollectionEmpty(textList)) {
        groupedItems.addAll(textList);
      }

      if (!Util.isCollectionEmpty(switchList)) {
        if (!Util.isCollectionEmpty(groupedItems)) {
          groupedItems.add(OptionItem.valueType(OptionValueType.DIVIDER));
        }
        groupedItems.addAll(switchList);
      }

      if (!Util.isCollectionEmpty(listList)) {
        if (!Util.isCollectionEmpty(groupedItems)) {
          groupedItems.add(OptionItem.valueType(OptionValueType.DIVIDER));
        }
        groupedItems.addAll(listList);
      }

      if (!Util.isCollectionEmpty(themeList)) {
        if (!Util.isCollectionEmpty(groupedItems)) {
          groupedItems.add(OptionItem.valueType(OptionValueType.DIVIDER));
        }
        groupedItems.addAll(themeList);
      }

      if (!Util.isCollectionEmpty(linkList)) {
        if (!Util.isCollectionEmpty(groupedItems)) {
          groupedItems.add(OptionItem.valueType(OptionValueType.DIVIDER));
        }
        groupedItems.addAll(linkList);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.room_settings),
      body: SizedBox.expand(
        child: _buildBody(),
      ),
      bottomNavigationBar: BottomButton.of(
        title: K.sure,
        onTap: _submit,
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(context, index);
      },
      itemCount: groupedItems.length,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    OptionItem item = groupedItems[index];
    String title = '';
    bool inAudit = false;
    if (item.type == 'room_name') {
      title = K.room_input_title;
      inAudit = _nameAudit;
    } else if (item.type == 'room_description') {
      title = K.room_please_input_room_notice;
      inAudit = _descriptionAudit;
    } else if (item.type == 'order_song_max') {
      title = item.name ?? '';
    }

    int? maxLength;
    if (item.type == 'order_song_max') {
      maxLength = 2;
    } else if (item.type != 'room_description') {
      maxLength = 16;
    }

    switch (item.valueType) {
      case OptionValueType.TEXT:
        return SettingItemWidget(
          title: item.name ?? '',
          trailingText: item.value ?? "",
          inAudit: inAudit,
          onClicked: () async {
            int index = FormScreen.config(
              title: title,
              value: item.value ?? "",
              keyboardType: item.type == 'order_song_max' ? TextInputType.number : TextInputType.text,
              allowEmpty: false,
              maxLength: maxLength,
            );
            String? value = await FormScreen.openFormScreen(context, index);
            if (value != null && mounted) {
              setState(() {
                item.value = value;
              });
            }
          },
        );
      case OptionValueType.SWITCH:
        return SettingItemWithSwitchWidget(
          title: item.name ?? '',
          value: item.value,
          onChanged: (bool selected) {
            setState(() {
              item.value = selected;
            });
          },
        );
      case OptionValueType.DIVIDER:
        return Container(
          width: Util.width,
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12, bottom: 12),
          height: 0.5,
          color: const Color(0x1A313131),
        );
      case OptionValueType.LIST:
      case OptionValueType.THEME:
        return SettingItemWidget(
          title: item.name ?? '',
          showNextIcon: item.subItems!.length > 1,
          trailingText: item.subItems!.firstWhereOrNull((element) => element.value.toString() == item.value.toString())?.name ?? '',
          onClicked: () {
            _showListItems(item);
          },
        );
      case OptionValueType.LINK:
        return SettingItemWidget(
          title: item.name ?? '',
          trailingText: item.value ?? "",
          onClicked: () async {
            if (item.type == OptionItemType.SYSTEM_CONFIG) {
              displayConfigSheet(ChatRoomData.getInstance());
            }
          },
        );
      default:
        return Container();
    }
  }

  void _showListItems(OptionItem item) async {
    List<OptionItem> attrs = item.subItems ?? [];
    List<SheetItem> res = [];
    for (int i = 0; i < attrs.length; i++) {
      res.add(SheetItem(attrs[i].name ?? '', attrs[i].value.toString()));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    String? key = result.value?.key;
    bool lock = false;
    if (item.valueType == OptionValueType.THEME) {
      lock = attrs.firstWhere((element) => element.value.toString() == key).lock;
    }

    /// 狼人杀，先答题解锁
    if (lock) {
      _handWolfLock(item.value.toString());
      return;
    }

    item.value = key;
    setState(() {});
  }

  void _submit() async {
    List<dynamic> list = [];
    for (OptionItem item in groupedItems) {
      if (item.type == null) continue;
      list.add({"type": item.type, "value": item.value});
    }
    bool result = await RoomOptionSaveHelper.saveOptions(widget.rid, json.encode(list));
    if (mounted && Navigator.canPop(context)) {
      Navigator.of(context).pop(result);
    }
  }

  Future _handWolfLock(String roomType) async {
    bool? result = await showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: K.room_answer_or_leve5_lock,
          negativeButton: NegativeButton(
            text: K.cancel,
          ),
          positiveButton: PositiveButton(
            text: K.room_go_answer,
          ),
        );
      },
    );
    if (result == true) {
      _toWolfTestPage(roomType);
    }
  }

  void _toWolfTestPage(String roomType) {
    Navigator.of(context).pop(false);
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.showWolfTestScreen(context, mode: getTestMode(roomType));
  }

  int getTestMode(String type) {
    switch (type) {
      case IWereWolfManager.WOLF9:
      case IWereWolfManager.NEWWOLF9:
        return 1;
      case IWereWolfManager.WOLF12:
        return 3;
    }
    return 1;
  }
}

class RoomOptionSaveHelper {
  /// 设置房间密码
  static Future<bool> saveLock(int rid, String value) async {
    List<dynamic> p = [];
    p.add({"type": OptionType.ROOM_LOCK, "value": value});
    return await saveOptions(rid, json.encode(p));
  }

  static Future<bool> saveOptions(int rid, String data) async {
    BaseResponse response = await RoomOptionsRepo.optionsSave(rid, {"options": data});
    if (!response.success) {
      Fluttertoast.showToast(msg: response.msg ?? R.array('xhr_error_type_array')[6]);
      return false;
    }
    return true;
  }
}
