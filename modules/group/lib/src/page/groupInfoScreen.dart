import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group/src/repo/group_repo.dart';

import '../../k.dart';
import '../images.dart';
import 'groupPersonInfoScreen.dart';
import 'groupSettingScreen.dart';

class GroupInfoScreen extends StatefulWidget {
  final int? groupId;
  final String? title;

  static Future openGroupInfoScreen(BuildContext context,
      {Key? key, int? groupId, String? title}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GroupInfoScreen(
          key: key,
          groupId: groupId,
          title: title,
        ),
        settings: const RouteSettings(name: '/groupinfo'),
      ),
    );
  }

  const GroupInfoScreen({Key? key, this.groupId, this.title}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<GroupInfoScreen> {
  bool _isCreator = false;
  String _groupName = '';
  List _memebers = [];
  bool _allow_manage = false;
  bool _allow_add = false;
  int _groupCode = 0;
  bool _openMessage = true;
  int _creatorUid = 0;

  @override
  void initState() {
    super.initState();
    _load();

    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
  }

  @override
  void dispose() {
    super.dispose();

    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
  }

  _onPageChanged(String type, dynamic value) {
    Log.d("_onPageChanged $type $value");
    String pageName = value;
    Log.d('category$pageName');
    if (pageName == '/groupinfo') {
      _load();
    }
  }

  void _onQuitGroup() async {
    bool? r = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Text(R.string('notice')),
              content: Text(R.string('leave_group_notice')),
              actions: <Widget>[
                CupertinoButton(
                    child: Text(R.string('cancel')),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    }),
                CupertinoButton(
                    child: Text(R.string('sure')),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }),
              ]);
        });
    if (r != null && r == true) {
      try {
        XhrResponse response = await Xhr.postJson(
            "${System.domain}go/yy/group/quit",
            {
              'groupId': widget.groupId.toString(),
            },
            formatJson: true,
            throwOnError: true);
        if (response.error == null) {
          Map res = response.response as Map<dynamic, dynamic>;
          if (res['success'] == true) {
            bool removeResult = await Im.removeConversation(
                ConversationType.Group, widget.groupId.toString());
            if (removeResult) {
              eventCenter.emit(Im.EventRemoveConversation, {
                'type': ConversationType.Group,
                'targetId': widget.groupId.toString(),
              });
            }
            Navigator.pop(context);
          }
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
      }
    }
  }

  void _load() async {
    String url = "${System.domain}group/info";
    XhrResponse response = await Xhr.postJson(
        url, {"groupId": widget.groupId.toString()},
        throwOnError: false);
    if (response.error == null) {
      Map res = response.response as Map<dynamic, dynamic>;
      if (res['success'] == true) {
        Map data = res['data'];
        _creatorUid = Util.parseInt(data['createor']);
        _isCreator = (Util.parseInt(data['createor']) == Session.uid);
        _groupName = data['name'];
        _memebers = data['members'];
        _allow_manage =
            _isCreator || Util.parseInt(data['allow_manage']) > 0 || _isCreator;
        _allow_add = Util.parseInt(data['allow_invite']) > 0 || _isCreator;
        _groupCode = Util.parseInt(data['group_id']);

        _openMessage = await Im.getConversationNotificationStatus(
            'group', widget.groupId.toString(),
            syncFromServer: true);

        Log.d('${_openMessage}_openMessage');

        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  void _onMsgSwitchValueChangedByBBim(bool value) async {
    try {
      bool res = await Im.setConversationNotificationStatus(
          'group', widget.groupId.toString(), !value);

      Log.d(value);
      if (res == true) {
        _openMessage = value;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(
            msg: K.setting_success, gravity: ToastGravity.CENTER);
      } else {
        Fluttertoast.showToast(
            msg: K.setting_failed, gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListSection(
          isEnd: false,
          children: [
            ListTile(
              dense: true,
              title: Text(R.string('group_num'),
                  textScaleFactor: 1.0,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16.0, color: R.color.mainTextColor)),
              trailing: IntrinsicWidth(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    Text(_groupCode.toString(),
                        textScaleFactor: 1.0,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15.0, color: R.color.secondTextColor)),
                  ])),
            ),
            _allow_manage
                ? ListTile(
                    dense: true,
                    title: Text(R.string('manage_group'),
                        textScaleFactor: 1.0,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 16.0, color: R.color.mainTextColor)),
                    trailing: IntrinsicWidth(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          Images.img('icn_next.svg', width: 15, height: 15)
                        ])),
                    onTap: () {
                      GroupSettingScreen.openGroupSettingScreen(context,
                          groupId: widget.groupId);
                    },
                  )
                : null,
            SwitchListTile(
              title: Text(R.string('group_msg_notification'),
                  textScaleFactor: 1.0,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16.0, color: R.color.mainTextColor)),
              value: _openMessage,
              onChanged: _onMsgSwitchValueChangedByBBim,
              activeColor: Colors.white,
            ),
          ].where((it) => it != null).toList()),
    ];

    if (_allow_add) {
      widgets.add(ListSection(isEnd: true, children: [
        ListTile(
          dense: false,
          title: Row(
            children: <Widget>[
              Container(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: Images.img('group_add_member.svg',
                      width: 20, height: 20)),
              Text(R.string('add_member'),
                  textScaleFactor: 1.0,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16.0, color: R.color.mainTextColor)),
            ],
          ),
          trailing: IntrinsicWidth(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Images.img('icn_next.svg', width: 15, height: 15)
              ])),
          onTap: _addMember,
        ),
      ]));
    }

    if (_memebers.isNotEmpty) {
      for (var item in _memebers) {
        if (Util.parseInt(item['uid']) != Session.uid) {
          widgets.add(
            ListTile(
              dense: false,
              title: ContactItem(data: item),
              trailing: IntrinsicWidth(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    Images.img('icn_next.svg', width: 15, height: 15)
                  ])),
              onTap: () {
                GroupPersonInfoScreen.openGroupPersonInfoScreen(context,
                    groupId: widget.groupId, uid: Util.parseInt(item['uid']));
              },
            ),
          );
        }
      }
    }

    return Scaffold(
      appBar: BaseAppBar(widget.title ?? R.string('manage_group')),
      body: ListView(
        children: widgets,
      ),
      bottomNavigationBar: BottomButton.of(
        title: R.string('quit_group'),
        onTap: _onQuitGroup,
      ),
    );
  }

  void _addMember() async {
    IGroupManager groupManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);
    List<int> preUids = [];
    if (!Util.isCollectionEmpty(_memebers)) {
      for (var item in _memebers) {
        preUids.add(Util.parseInt(item['uid']));
      }
    }
    List<int>? uids = await groupManager.openSelectUserScreen(context,
        preSelectedUis: preUids);
    if (!Util.isCollectionEmpty(uids)) {
      await GroupRepo.addMemberForDiscussionGroup(widget.groupId, uids!);
    }
  }
}

class ListSection extends StatelessWidget {
  final List<Widget?>? children;
  final bool? isEnd;

  const ListSection({Key? key, this.children, this.isEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool end = isEnd != null && isEnd!;
    List<Widget>? mChildren = [];
    if (children == null || (children?.isEmpty == true)) {
      mChildren = [];
    } else {
      for (var item in children!) {
        if (item != null) {
          mChildren.add(item);
        }
      }
    }

    return end
        ? Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children as List<Widget>))
        : Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 4.0, color: R.color.secondBgColor),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: mChildren));
  }
}

class ContactItem extends StatefulWidget {
  final Map? data;

  const ContactItem({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ContactItemState();
  }
}

class ContactItemState extends State<ContactItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CommonAvatar(
          path: widget.data!['icon'],
          size: 40,
          shape: BoxShape.circle,
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${widget.data!['name']}',
                textScaleFactor: 1.0,
                style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  widget.data!['uid'].toString(),
                  textScaleFactor: 1.0,
                  style:
                      TextStyle(fontSize: 12.0, color: R.color.thirdTextColor),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
