import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'groupBlackScreen.dart';

/// 群管理
class GroupSettingScreen extends StatefulWidget {
  final int? groupId;

  static Future openGroupSettingScreen(BuildContext context,
      {Key? key, int? groupId}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GroupSettingScreen(
          key: key,
          groupId: groupId,
        ),
        settings: const RouteSettings(name: '/groupsetting'),
      ),
    );
  }

  const GroupSettingScreen({Key? key, this.groupId}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<GroupSettingScreen> {
  bool _isCreator = false;
  String _name = '';
  String _tag = '';
  String? _tagName = '';
  List _tags = [];

  bool _allow_manage = false;
  bool _allow_invite = false;
  bool _allow_search = false;
  bool _forbidden = false;

  ///禁言

  String _orgQuery = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    String url = "${System.domain}group/info";
    XhrResponse response = await Xhr.postJson(
        url, {"groupId": widget.groupId.toString()},
        throwOnError: true);
    if (response.error == null) {
      Map res = response.response as Map<dynamic, dynamic>;
      if (res['success'] == true) {
        Map data = res['data'];
        _isCreator = (Util.parseInt(data['createor']) == Session.uid);
        _tags = data['tags'];
        _allow_manage = Util.parseInt(data['allow_manage']) > 0;
        _allow_invite = Util.parseInt(data['allow_invite']) > 0;
        _allow_search = Util.parseInt(data['allow_search']) > 0;
        _name = data['name'];
        _tag = data['tag'];
        _forbidden = Util.parseInt(data['forbidden']) > 0;
        _orgQuery = _getSubmitQuery();
        _getTagName();

        Log.d(data['tags']);

        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  void _getTagName() {
    for (var item in _tags) {
      if (item['val'] == _tag) {
        _tagName = item['label'];
      }
    }
  }

  String _getSubmitQuery() {
    Map args = {
      "groupId": widget.groupId,
      "name": _name,
      "tag": _tag,
      "forbidden": _forbidden ? 1 : 0,
      "allow_invite": _allow_invite ? 1 : 0,
      "allow_search": _allow_search ? 1 : 0,
    };

    if (_isCreator) {
      args['allow_manage'] = _allow_manage ? 1 : 0;
    }

    return jsonEncode(args);
  }

  void onTapTag() async {
    List<SheetItem> res = [];
    for (var item in _tags) {
      res.add(SheetItem(item['label'], item['val']));
    }

    SheetCallback result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
              title: R.string('order_select_tag'), data: res);
        });
    if (result.reason == SheetCloseReason.Active) {
      return;
    }

    _tag = (result.value?.key ?? '').toString();
    _getTagName();
    setState(() {});
  }

  void _onSave() async {
    String args = _getSubmitQuery();
    if (args == _orgQuery) {
      Fluttertoast.showToast(
          msg: R.string('none_changed'), gravity: ToastGravity.CENTER);
      return;
    }

    Map<String, String> params = {
      "groupId": widget.groupId.toString(),
      "name": _name,
      "tag": _tag,
      "forbidden": _forbidden ? '1' : '0',
      "allow_invite": _allow_invite ? '1' : '0',
      "allow_search": _allow_search ? '1' : '0',
    };

    if (_isCreator) {
      params['allow_manage'] = _allow_manage ? '1' : '0';
    }

    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}group/modify", params,
          throwOnError: true);

      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(
            msg: R.string('modify_success'), gravity: ToastGravity.CENTER);
        Navigator.of(context).pop();
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: BaseAppBar(
          R.string('manage_group'),
          actionTitle: R.string('submit'),
          onPressed: _onSave,
        ),
        body: ListView(
          children: <Widget>[
            ListSection(isEnd: false, children: [
              SettingItemWidget(
                title: R.string('group_name'),
                trailingText: _name,
                onClicked: () async {
                  int index = FormScreen.config(
                    title: R.string('group_name'),
                    value: _name,
                    allowEmpty: false,
                  );
                  String? value =
                      await (FormScreen.openFormScreen(context, index));

                  if (!Util.isStringEmpty(value) && _name != value) {
                    _name = value!;
                    setState(() {});
                  }
                },
              ),
              SettingItemWidget(
                title: R.string('tag'),
                trailingText: _tagName!,
                onClicked: onTapTag,
              ),
            ]),
            ListSection(isEnd: false, children: [
              SettingItemWidget(
                title: R.string('blacklist'),
                onClicked: () => GroupBlackScreen.openGroupBlackScreen(context,
                    groupId: widget.groupId),
              ),
            ]),
            ListSection(
              isEnd: true,
              children: [
                if (_isCreator)
                  SettingItemWithSwitchWidget(
                    title: R.string('group_mute'),
                    value: _forbidden,
                    onChanged: (value) {
                      setState(() {
                        _forbidden = value;
                      });
                    },
                  ),
                if (_isCreator)
                  SettingItemWithSwitchWidget(
                    title: R.string('allow_member_manage'),
                    value: _allow_manage,
                    onChanged: (value) {
                      setState(() {
                        _allow_manage = value;
                      });
                    },
                  ),
                if (_isCreator)
                  SettingItemWithSwitchWidget(
                    title: R.string('allow_member_invite'),
                    value: _allow_invite,
                    onChanged: (value) {
                      setState(() {
                        _allow_invite = value;
                      });
                    },
                  ),
                SettingItemWithSwitchWidget(
                  title: R.string('allow_search_add'),
                  value: _allow_search,
                  onChanged: (value) {
                    setState(() {
                      _allow_search = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _requestPop() async {
    if (_orgQuery != _getSubmitQuery()) {
      _notifyChanged();
      return false;
    } else {
      return true;
    }
  }

  void _notifyChanged() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(R.string('save_notice')),
            actions: <Widget>[
              CupertinoButton(
                  child: Text(R.string('cancel')),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    Navigator.pop(context);
                  }),
              CupertinoButton(
                child: Text(R.string('sure')),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  _onSave();
                },
              ),
            ],
          );
        });
  }
}

class ListSection extends StatelessWidget {
  final List<Widget>? children;
  final bool? isEnd;

  const ListSection({Key? key, this.children, this.isEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool end = isEnd != null && isEnd!;
    return end
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children!,
            ),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: R.color.dividerColor),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children!,
            ),
          );
  }
}
