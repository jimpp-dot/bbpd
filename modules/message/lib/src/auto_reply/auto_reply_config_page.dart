import 'package:message/k.dart';
import 'dart:convert';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:message/src/auto_reply/model/auto_reply_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:message/src/widget/record_audio_dialog.dart';
import 'widget/auto_reply_item_widget.dart';

/// 自动回复设置页
class AutoReplyConfigPage extends StatefulWidget {
  const AutoReplyConfigPage({Key? key}) : super(key: key);

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const AutoReplyConfigPage();
        },
        settings: const RouteSettings(name: 'AutoReplyConfigPage'),
      ),
    );
  }

  @override
  _AutoReplyConfigPageState createState() => _AutoReplyConfigPageState();
}

class _AutoReplyConfigPageState extends State<AutoReplyConfigPage> {
  bool _loading = false;
  String? _errorMessage;
  final List<AutoReplyItem> _msgList = [];
  bool _imgLock = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    DataRsp<List<AutoReply>> response = await MessageRepo.autoReplyList();
    if (response.success == true && response.data != null) {
      List<AutoReply> list = response.data!;
      _msgList.clear();
      for (AutoReply data in list) {
        if (Util.validList(data.items)) {
          data.items[0].gsReplyCount = data.gsReplyCount;
          data.items[0].userReplyRate = data.userReplyRate;
          if (data.noReply) {
            for (int i = 0; i < data.items.length; i++) {
              data.items[i].subIndex = i;
            }
            _msgList.addAll(data.items);
          } else {
            _msgList.add(data.items[0]);
          }
        }
      }
    } else {
      _errorMessage = response.msg;
    }

    for (int i = 0; i < _msgList.length; i++) {
      _msgList[i].backUp();
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
          K.msg_auto_reply,
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          backColor: R.colors.mainTextColor,
          titleColor: R.colors.mainTextColor,
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
    for (AutoReplyItem item in _msgList) {
      if (item.dataChanged) {
        return true;
      }
    }
    return false;
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

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
            ),
            itemBuilder: (ctx, index) => _buildMsgItem(index),
            separatorBuilder: (ctx, index) => _itemSeparator(_msgList[index]),
            itemCount: _msgList.length,
          ),
        ),
        _buildCommitBtn(),
      ],
    );
  }

  Widget _itemSeparator(AutoReplyItem item) {
    if (item.noReply && item.subIndex < 2) {
      return const SizedBox(
        height: 0,
      );
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 24,
        bottom: 22,
      ),
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1,
        dashLength: 1,
        dashColor: R.color.mainTextColor.withOpacity(0.2),
        dashRadius: 0.5,
        dashGapLength: 6,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
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

  Future<void> _onTapCommit() async {
    if (!_checkDataChanged()) {
      Navigator.pop(context);
      return;
    }

    NormalNull rsp;
    List msgList = [];
    List deleteList = [];
    String? msgListStr;
    String? deleteListStr;

    for (int i = 0; i < _msgList.length; i++) {
      AutoReplyItem item = _msgList[i];
      if (item.hasData) {
        Map map = {
          'id': item.id,
          'scene': item.scene,
          'scene_type': item.sceneType,
          'content_type': item.contentType,
          'content': item.content,
          'state': item.contentChanged ? 0 : item.state,
        };
        if (item.designatedGift) {
          if (Util.isCollectionEmpty(item.giftIds)) {
            Fluttertoast.showToast(msg: K.msg_please_choose_gift);
            return;
          }
          map['gift_ids'] = item.giftIds!.join(',');
        }
        msgList.add(map);
      } else {
        if (item.id > 0) {
          deleteList.add(item.id);
        }
      }
    }

    if (msgList.isNotEmpty) {
      msgListStr = json.encode(msgList);
    }
    if (deleteList.isNotEmpty) {
      deleteListStr = deleteList.join(',');
    }

    rsp = await MessageRepo.commitAutoReplyList(
        msgListStr: msgListStr, deleteListStr: deleteListStr);
    if (rsp.success) {
      Navigator.pop(context, true);
    } else {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  Widget _buildMsgItem(int index) {
    AutoReplyItem item = _msgList[index];
    return AutoReplyItemWidget(
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
            item.contentType = 0;
            item.content = null;
          });
        }
      },
    );
  }

  void _onTapText(AutoReplyItem item) async {
    int index = FormScreen.config(
      type: FormTypes.textArea,
      title: K.msg_auto_reply,
      value: item.content,
      allowEmpty: false,
      maxLength: 64,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (value != null && value.isNotEmpty) {
      setState(() {
        item.contentType = 1;
        item.content = value;
      });
    }
  }

  void _onTapVoice(AutoReplyItem item) async {
    String? value = await RecordAudioDialog.openRecordAudioDialog(context);
    if (value != null && value.isNotEmpty) {
      setState(() {
        item.contentType = 2;
        item.content = value;
      });
    }
  }

  void _onTapImage(AutoReplyItem item) async {
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
            item.contentType = 3;
            item.content = url;
          });
        }
      }
    } catch (e) {
      CommonLoading.dismiss();
      Fluttertoast.showToast(
          msg: BaseK.K.select_photo_error_retry, gravity: ToastGravity.CENTER);
      _imgLock = false;
    }
  }
}
