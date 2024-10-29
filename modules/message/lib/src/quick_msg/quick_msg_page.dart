import 'package:message/k.dart';
import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:message/src/widget/record_audio_dialog.dart';
import 'model/quick_msg_item.dart';
import 'widget/msg_item_widget.dart';

/// 快捷消息设置页
class QuickMsgPage extends StatefulWidget {
  const QuickMsgPage({Key? key}) : super(key: key);

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const QuickMsgPage();
        },
        settings: const RouteSettings(name: '/QuickMsgPage'),
      ),
    );
  }

  @override
  _QuickMsgPageState createState() => _QuickMsgPageState();
}

class _QuickMsgPageState extends State<QuickMsgPage> {
  bool _loading = true;
  String? _errorMessage;
  final List<QuickMsgItem> _msgList = [];
  final int msgCount = 5;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    DataRsp<List<QuickMsgItem>> response = await MessageRepo.quickMsgList(true);
    if (response.success == true && response.data != null) {
      List<QuickMsgItem> list = response.data!;
      if (!Util.isCollectionEmpty(list)) {
        for (int i = 0; i < msgCount && i < list.length; i++) {
          list[i].backup();
          _msgList.add(list[i]);
        }
      }
      for (int i = _msgList.length; i < msgCount; i++) {
        _msgList.add(QuickMsgItem.empty());
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
          K.msg_quick_msg,
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
    for (QuickMsgItem item in _msgList) {
      if (item.id > 0) {
        if (item.dataChanged) {
          return true;
        }
      } else if (item.hasData) {
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
            separatorBuilder: (ctx, index) => const SizedBox(
              height: 24,
            ),
            itemCount: _msgList.length,
          ),
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(
            top: 20,
          ),
          child: Text(
            K.msg_quick_msg_edit_intro,
            style: TextStyle(fontSize: 11, color: R.colors.thirdTextColor),
          ),
        ),
        _buildCommitBtn(),
      ],
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

  Future<void> _onTapCommit() async {
    if (!_checkDataChanged()) {
      Navigator.pop(context);
      return;
    }

    BaseResponse rsp;
    List msgList = [];
    List deleteList = [];
    String? msgListStr;
    String? deleteListStr;

    for (int i = 0; i < _msgList.length; i++) {
      QuickMsgItem item = _msgList[i];
      if (item.hasData) {
        Map map = {
          'type': item.type,
          'content': item.content,
        };
        if (item.id > 0) {
          map['id'] = item.id;
          if (item.dataChanged) {
            map['updated'] = 1;
          }
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

    rsp = await MessageRepo.commitQuickMsgList(
        msgListStr: msgListStr, deleteListStr: deleteListStr);
    if (rsp.success == true) {
      Navigator.pop(context, true);
    } else {
      if (!Util.isStringEmpty(rsp.msg)) {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    }
  }

  Widget _buildMsgItem(int index) {
    QuickMsgItem item = _msgList[index];
    return MsgItemWidget(
      index: index,
      item: item,
      onTapText: () => _onTapText(item),
      onTapVoice: () => _onTapVoice(item),
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

  void _onTapText(QuickMsgItem item) async {
    int index = FormScreen.config(
      type: FormTypes.textArea,
      title: K.msg_quick_msg,
      value: item.content,
      allowEmpty: false,
      maxLength: 64,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (!Util.isStringEmpty(value)) {
      setState(() {
        item.type = 1;
        item.content = value;
      });
    }
  }

  void _onTapVoice(QuickMsgItem item) async {
    String? value = await RecordAudioDialog.openRecordAudioDialog(context);
    if (!Util.isStringEmpty(value)) {
      setState(() {
        item.type = 2;
        item.content = value;
      });
    }
  }
}
