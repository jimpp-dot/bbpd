import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:message/src/accost/slp/slp_accost_strategy_form_screen.dart';
import 'package:message/src/accost/widget/strategy_modify_buttons.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:message/src/model/pb/generated/slp_gs.pb.dart';
import 'package:message/src/widget/record_audio_dialog.dart';
import '../../model/pb/slp_gs_extension.dart';
import 'slp_strategy_msg_item_widget.dart';
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:permission_handler/permission_handler.dart';

class BbAccostStrategyPage extends StatefulWidget {
  final int categoryId;
  final int strategyId;
  final String? strategyName;

  const BbAccostStrategyPage(
      {super.key,
      required this.strategyId,
      this.strategyName,
      required this.categoryId});

  static Future openBbAccostStrategyPage(BuildContext context,
      {int strategyId = 0, String? strategyName, int categoryId = 0}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return BbAccostStrategyPage(
              strategyId: strategyId,
              strategyName: strategyName,
              categoryId: categoryId);
        },
        settings: const RouteSettings(name: 'AccostStrategyPage'),
      ),
    );
  }

  @override
  _BbAccostStrategyPageState createState() =>
      _BbAccostStrategyPageState(strategyId, strategyName, categoryId);
}

class _BbAccostStrategyPageState extends State<BbAccostStrategyPage> {
  final int categoryId;
  final int strategyId;
  String? strategyName;
  int _nearest = 0; //同城推荐开关
  List<String> examples = []; //参考话术
  bool _loading = false;
  String? _errorMessage;
  GsChatMsgListData? _config;
  final List<GsChatMsg> _msgList = [];
  final List<GsChatMsg> _backupList = [];
  final int msgCount = 3;
  bool _imgLock = false;
  bool _locationEnable = false; // 是否有定位权限

  _BbAccostStrategyPageState(
      this.strategyId, this.strategyName, this.categoryId);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < msgCount; i++) {
      _msgList.add(GsChatMsg(msgId: 0));
      _backupList.add(GsChatMsg(msgId: 0));
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
    ResGsChatMsgList response =
        await MessageRepo.bbAccostStrategyInfo(strategyId, categoryId);
    if (response.success) {
      _config = response.data;
      if (_config != null) {
        _nearest = _config!.nearest;
        if (_config!.msgList.isNotEmpty) {
          for (int i = 0; i < msgCount && i < _config!.msgList.length; i++) {
            _msgList[i] = _config!.msgList[i];
            _backupList[i] = _config!.msgList[i].deepCopy();
          }
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
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          backColor: R.colors.mainTextColor,
          backgroundColor: R.colors.homeBgColor,
          onBackPressedCallback: () async {
            await Navigator.maybePop(context);
          },
        ),
        body: _buildBody(),
      ),
    );
  }

  bool _checkDataChanged() {
    if (_isEdit) {
      if (_config == null) {
        return false;
      }
      if (_config!.nearest != _nearest) {
        return true;
      }
      if (_config!.strategyName != strategyName) {
        return true;
      }
      for (int i = 0; i < _msgList.length; i++) {
        GsChatMsg item = _msgList[i];
        GsChatMsg backup = _backupList[i];
        if (item.msgId > 0) {
          if (isChange(item, backup)) {
            return true;
          }
        } else if (item.hasData) {
          return true;
        }
      }
    } else {
      for (GsChatMsg item in _msgList) {
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
                color: R.color.mainTextColor,
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
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 14, bottom: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: R.color.mainTextColor.withOpacity(0.2), width: 0.5),
          ),
          child: Text(
            strategyName ?? '',
            style: TextStyle(fontSize: 14, color: R.color.mainTextColor),
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
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _reload();
        },
      );
    }

    int itemCount = _msgList.length + 3; // 加3；分别是 0-同城、1-策略名称、5-参考话术
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
                return _buildNearest(); // 同城推荐
              } else if (index == 1) {
                return _buildStrategyNameRow();
              } else if (index == itemCount - 1) {
                return _buildExample();
              } else {
                return _buildMsgItem(index);
              }
            },
            separatorBuilder: (ctx, index) => const SizedBox(height: 24),
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
                  color: R.color.mainTextColor),
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
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0x66202020)),
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
        border: Border.all(color: const Color(0x33202020), width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: R.color.mainTextColor),
      ),
    );
  }

  Widget _buildNearest() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          K.msg_strategy_nearest,
          style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
        ),
        CupertinoSwitch(
          value: (_nearest == 1),
          activeColor: Theme.of(context).primaryColor,
          onChanged: (bool value) async {
            if (_locationEnable) {
              _nearest = value ? 1 : 0;
              refresh();
            } else {
              if (await _checkPermission()) {
                _nearest = value ? 1 : 0;
                refresh();
              }
            }
          },
        ),
      ],
    );
  }

  Future<bool> _checkPermission() async {
    await PermissionUtil.checkAndRequestPermissions(
        context, Permission.locationWhenInUse);

    if (!Util.hasLocation) {
      PermissionStatus status = await Permission.locationWhenInUse.status;
      _locationEnable = status == PermissionStatus.granted;
    } else {
      _locationEnable = true;
    }
    return _locationEnable;
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
            colors: R.color.mainBrandGradientColors,
          ),
          borderRadius: BorderRadiusDirectional.circular(30),
        ),
        child: Text(
          BaseK.K.base_submmit,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _onTapExample() async {
    ResAccostSampleList resp =
        await MessageRepo.bbAccostStrategyExample(strategyId, categoryId);
    if (resp.success) {
      examples = resp.data;
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

    /// 校验
    if (!checkGsChat()) {
      return;
    }

    ResGsNull rsp;
    if (_isEdit) {
      List msgList = [];
      List deleteList = [];
      String? msgListStr;
      String? deleteListStr;

      for (int i = 0; i < _msgList.length; i++) {
        GsChatMsg item = _msgList[i];
        GsChatMsg backup = _backupList[i];
        if (item.hasData) {
          Map map = {
            'type': item.type,
            'content': item.content,
          };
          if (item.msgId > 0) {
            map['msg_id'] = item.msgId;
            if (isChange(item, backup)) {
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

      rsp = await MessageRepo.commitBbAccostStrategyInfo(
          categoryId, strategyId, strategyName,
          nearest: _nearest,
          msgListStr: msgListStr,
          deleteListStr: deleteListStr);
    } else {
      List msgList = [];
      for (GsChatMsg item in _msgList) {
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
        rsp = await MessageRepo.commitBbAccostStrategyInfo(
            categoryId, 0, strategyName,
            nearest: _nearest, msgListStr: json.encode(msgList));
      }
    }
    if (rsp.success) {
      Navigator.pop(context, true);
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
    }
  }

  /// 校验 三条搭讪策略
  bool checkGsChat() {
    bool countFlag = false; // 长度校验，三条必须都填写
    for (int i = 0; i < _msgList.length; i++) {
      var e = _msgList[i];
      if (!e.hasData) {
        countFlag = true;
        break;
      }
    }
    if (countFlag) {
      Fluttertoast.showToast(msg: K.msg_strategy_commit_tip);
      return false;
    }
    return true;
  }

  Widget _buildMsgItem(int index) {
    index -= 2;
    GsChatMsg item = _msgList[index];
    return BbStrategyMsgItemWidget(
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
            item.content = '';
          });
        }
      },
    );
  }

  void _onTapText(GsChatMsg item) async {
    int index = BbAccostStrategyFormScreen.config(
      type: BbAccostStrategyFormTypes.textArea,
      title: K.msg_accost_strategy,
      value: item.content,
      allowEmpty: false,
      maxLength: 64,
    );
    String? value =
        await BbAccostStrategyFormScreen.openFormScreen(context, index);
    if (value != null && value.isNotEmpty) {
      setState(() {
        item.type = 1;
        item.content = value;
      });
    }
  }

  void _onTapVoice(GsChatMsg item) async {
    String? value = await RecordAudioDialog.openRecordAudioDialog(context,
        maxRecordSeconds: 15, minRecordSeconds: 10);
    if (value != null && value.isNotEmpty) {
      setState(() {
        item.type = 2;
        item.content = value;
      });
    }
  }

  void _onTapImage(GsChatMsg item) async {
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

  bool isChange(GsChatMsg item, GsChatMsg backup) {
    return item.content != backup.content || item.type != backup.type;
  }
}
