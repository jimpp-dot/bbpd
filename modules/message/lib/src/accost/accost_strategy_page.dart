import 'package:message/k.dart';
import 'dart:convert';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:message/src/model/accost_msg_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:message/src/model/accost_strategy_config.dart';
import 'package:message/src/widget/record_audio_dialog.dart';
import 'accost_strategy_sort_page.dart';
import 'widget/strategy_modify_buttons.dart';
import 'widget/strategy_msg_item_widget.dart';

/// 搭讪策略页
class AccostStrategyPage extends StatefulWidget {
  final int strategyId;
  final String strategyName;

  const AccostStrategyPage(
      {super.key, required this.strategyId, required this.strategyName});

  static Future openAccostStrategyPage(BuildContext context,
      {int strategyId = 0, String? strategyName}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return AccostStrategyPage(
              strategyId: strategyId, strategyName: strategyName ?? '');
        },
        settings: const RouteSettings(name: 'AccostStrategyPage'),
      ),
    );
  }

  @override
  _AccostStrategyPageState createState() => _AccostStrategyPageState();
}

class _AccostStrategyPageState extends State<AccostStrategyPage> {
  int get strategyId => widget.strategyId;

  String? strategyName;
  List<String> examples = []; //参考话术
  bool _loading = false;
  String? _errorMessage;
  AccostStrategyConfig? _config;
  final List<AccostMsgItem> _msgList = [];
  final int msgCount = 3;
  bool _imgLock = false;

  @override
  void initState() {
    super.initState();
    strategyName = widget.strategyName;
    for (int i = 0; i < msgCount; i++) {
      _msgList.add(AccostMsgItem.empty());
    }
    if (_isEdit) {
      _loading = true;
      _load();
    }
    _onTapExample(); // 获取参考话术
  }

  /// 是编辑还是添加策略
  bool get _isEdit => strategyId > 0;

  _load() async {
    DataRsp<AccostStrategyConfig> response =
        await MessageRepo.accostStrategyInfo(strategyId);
    if (response.success == true) {
      _config = response.data;
      if (_config != null) {
        for (int i = 0; i < msgCount && i < _config!.msgList.length; i++) {
          _msgList[i] = _config!.msgList[i];
          _msgList[i].backUp();
        }
      }
    } else {
      _errorMessage = response.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _reload() {
    setState(() {
      _errorMessage = null;
      _loading = true;
    });
    _load();
  }

  @override
  Widget build(BuildContext context) {
    List<AccostMsgItem> hasDataList = [];
    for (AccostMsgItem item in _msgList) {
      if (item.hasData) {
        hasDataList.add(item);
      }
    }

    bool showSort = _isEdit && hasDataList.length > 1;

    return WillPopScope(
      onWillPop: () async {
        if (_checkDataChanged()) {
          bool? result = await showDialog(
            context: context,
            builder: (context) => ConfirmDialog(
              title: K.msg_accost_strategy_exit_confirm,
            ),
          );
          if (result == true) {
            return true;
          } else {
            return false;
          }
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: R.colors.homeBgColor,
        appBar: BaseAppBar(
          K.msg_accost_strategy,
          titleColor: R.colors.mainTextColor,
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          backColor: R.colors.mainTextColor,
          actionColor: R.colors.mainTextColor,
          backgroundColor: R.colors.homeBgColor,
          onBackPressedCallback: () async {
            await Navigator.maybePop(context);
          },
          onPressed: showSort
              ? () async {
                  List<AccostMsgItem>? sortList =
                      await AccostStrategySortPage.openAccostStrategySortPage(
                          context, hasDataList);
                  if (sortList != null) {
                    for (int i = 0;
                        i < sortList.length && i < _msgList.length;
                        i++) {
                      _msgList[i] = sortList[i];
                    }
                    setState(() {});
                  }
                }
              : null,
          actionTitle: showSort ? K.msg_sort : '',
        ),
        body: _buildBody(),
      ),
    );
  }

  bool _checkDataChanged() {
    if (_isEdit) {
      if (_config?.strategyName != strategyName) {
        return true;
      }
      for (AccostMsgItem item in _msgList) {
        if (item.msgId > 0) {
          if (item.dataChanged) {
            return true;
          }
        } else if (item.hasData) {
          return true;
        }
      }
    } else {
      for (AccostMsgItem item in _msgList) {
        if (item.hasData) {
          return true;
        }
      }
    }
    return false;
  }

  Widget _buildStrategyNameRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              K.msg_strategy_name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: R.colors.mainTextColor,
              ),
            ),
            const Spacer(),
            StrategyModifyButtons(
              editBtnText: K.msg_edit,
              onEdit: () async {
                int index = FormScreen.config(
                  type: FormTypes.input,
                  title: K.msg_strategy_name,
                  value: strategyName ?? '',
                  allowEmpty: false,
                  maxLength: 10,
                );
                String? value = await FormScreen.openFormScreen(context, index);
                if (value != null && value.isNotEmpty) {
                  setState(() {
                    strategyName = value;
                  });
                }
              },
              onDelete: () async {
                if (strategyName != null && strategyName!.isNotEmpty) {
                  bool? result = await showDialog(
                    context: context,
                    builder: (context) => ConfirmDialog(
                      title: K.msg_strategy_name_clear_confirm,
                    ),
                  );
                  if (result == true) {
                    setState(() {
                      strategyName = null;
                    });
                  }
                }
              },
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 14, bottom: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: R.colors.mainTextColor.withOpacity(0.2), width: 0.5),
          ),
          child: Text(
            strategyName ?? '',
            style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          _reload();
        },
        fontColor: R.colors.secondTextColor,
      );
    }

    int itemCount = _msgList.length + 2; // 加2；分别是 0-策略名称、4-参考话术
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
            ),
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return _buildStrategyNameRow();
              } else if (index == itemCount - 1) {
                return _buildExample();
              } else {
                return _buildMsgItem(index);
              }
            },
            separatorBuilder: (ctx, index) => const SizedBox(
              height: 24,
            ),
            itemCount: itemCount,
          ),
        ),
        _buildCommitBtn(),
      ],
    );
  }

  Widget _buildExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              K.msg_strategy_example,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: R.colors.mainTextColor),
            ),
            InkWell(
              onTap: _onTapExample,
              child: Row(
                children: [
                  R.img(
                    'ic_example_change.webp',
                    package: ComponentManager.MANAGER_MESSAGE,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    K.msg_strategy_example_change,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: R.colors.secondTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ListView.separated(
          itemCount: examples.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return _buildExampleItem(examples[index]);
          },
          separatorBuilder: (ctx, index) => const SizedBox(height: 12),
        ),
      ],
    );
  }

  Widget _buildExampleItem(String text) {
    return Container(
      width: double.infinity,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 12, bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: R.colors.secondTextColor, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
      ),
    );
  }

  Widget _buildCommitBtn() {
    double bottom = Util.iphoneXBottom;
    if (bottom > 0) {
      bottom += 8;
    } else {
      bottom = 16;
    }
    return GestureDetector(
      onTap: _onTapCommit,
      child: Container(
        width: double.infinity,
        height: 52,
        margin: EdgeInsetsDirectional.only(
            bottom: bottom, top: 20, start: 20, end: 20),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: R.colors.mainBrandGradientColors,
          ),
          borderRadius: BorderRadiusDirectional.circular(30),
        ),
        child: Text(
          BaseK.K.base_submmit,
          style: TextStyle(
              fontSize: 16,
              color: R.colors.brightTextColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _onTapExample() async {
    DataRsp<List<String>> resp = await MessageRepo.mateAccostStrategyExample();
    if (resp.success == true) {
      examples = resp.data!;
      refresh();
    }
  }

  Future<void> _onTapCommit() async {
    if (strategyName == null || strategyName!.isEmpty) {
      Fluttertoast.showToast(msg: K.msg_please_edit_strategy_name);
      return;
    }

    if (!_checkDataChanged()) {
      Navigator.pop(context);
      return;
    }

    NormalNull rsp;
    if (_isEdit) {
      List msgList = [];
      List deleteList = [];
      String? msgListStr;
      String? deleteListStr;

      for (int i = 0; i < _msgList.length; i++) {
        AccostMsgItem item = _msgList[i];
        if (item.hasData) {
          Map map = {
            'type': item.type,
            'content': item.content,
          };
          if (item.msgId > 0) {
            map['msg_id'] = item.msgId;
            if (item.dataChanged) {
              map['updated'] = 1;
            }
          }
          msgList.add(map);
        } else {
          if (item.msgId > 0) {
            deleteList.add(item.msgId);
          }
        }
      }

      if (msgList.isNotEmpty) {
        msgListStr = json.encode(msgList);
      }
      if (deleteList.isNotEmpty) {
        deleteListStr = deleteList.join(',');
      }

      rsp = await MessageRepo.commitAccostStrategyInfo(
          strategyId, strategyName ?? '',
          msgListStr: msgListStr, deleteListStr: deleteListStr);
    } else {
      List msgList = [];
      for (AccostMsgItem item in _msgList) {
        if (item.hasData) {
          msgList.add({
            'type': item.type,
            'content': item.content,
          });
        }
      }
      if (msgList.isEmpty) {
        Fluttertoast.showToast(msg: K.msg_please_set_accost_strategy);
        return;
      } else {
        rsp = await MessageRepo.commitAccostStrategyInfo(0, strategyName ?? '',
            msgListStr: json.encode(msgList));
      }
    }
    if (rsp.success) {
      Navigator.pop(context, true);
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
    }
  }

  Widget _buildMsgItem(int index) {
    index--;
    AccostMsgItem item = _msgList[index];
    return StrategyMsgItemWidget(
      index: index,
      item: item,
      onTapText: () => _onTapText(item),
      onTapVoice: () => _onTapVoice(item),
      onTapImage: () => _onTapImage(item),
      onTapDelete: () async {
        bool? result = await showDialog(
          context: context,
          builder: (context) => ConfirmDialog(
            title: K.msg_accost_msg_clear_confirm,
          ),
        );
        if (result == true) {
          setState(() {
            item.type = 0;
            item.content = null;
          });
        }
      },
    );
  }

  void _onTapText(AccostMsgItem item) async {
    int index = FormScreen.config(
      type: FormTypes.textArea,
      title: K.msg_accost_strategy,
      value: item.content,
      allowEmpty: false,
      maxLength: 64,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (value != null && value.isNotEmpty) {
      setState(() {
        item.type = 1;
        item.content = value;
      });
    }
  }

  void _onTapVoice(AccostMsgItem item) async {
    String? value = await RecordAudioDialog.openRecordAudioDialog(context);
    if (value != null && value.isNotEmpty) {
      setState(() {
        item.type = 2;
        item.content = value;
      });
    }
  }

  void _onTapImage(AccostMsgItem item) async {
    if (_imgLock) return;
    try {
      _imgLock = true;
      File? imgFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1080,
      );
      _imgLock = false;
      if (imgFile != null) {
        CommonLoading.show(status: K.msg_uploading);
        String? url = await Util.uploadSingleImage(imgFile);
        CommonLoading.dismiss();
        if (url == null || url.isEmpty) {
          Fluttertoast.showToast(msg: K.msg_image_upload_fail);
        } else {
          setState(() {
            item.type = 3;
            item.content = url;
          });
        }
      }
    } catch (e) {
      CommonLoading.dismiss();
      Fluttertoast.showToast(
          msg: BaseK.K.select_photo_error_retry, gravity: ToastGravity.CENTER);
      _imgLock = false;
      Log.d(e);
    }
  }
}
