import 'dart:math';

import 'package:shared/assets.dart';
import 'package:group/assets.dart';
import 'package:group/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group/src/repo/group_repo.dart';
import '../../a.dart';
import 'package:shared/a.dart' as BaseA;
import '../images.dart';

class GroupPersonInfoScreen extends StatefulWidget {
  final int? groupId;
  final int? uid;
  final PageRefer? refer;
  final bool? fromMangerScreen;

  static Future openGroupPersonInfoScreen(BuildContext context,
      {Key? key, int? groupId, int? uid, bool fromMangerScreen = false}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GroupPersonInfoScreen(
          key: key,
          groupId: groupId,
          uid: uid,
          refer: const PageRefer('GroupPersonInfoScreen'),
          fromMangerScreen: fromMangerScreen,
        ),
        settings: const RouteSettings(name: '/groupperoninfo'),
      ),
    );
  }

  const GroupPersonInfoScreen(
      {Key? key, this.groupId, this.uid, this.refer, this.fromMangerScreen})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<GroupPersonInfoScreen> {
  Map _data = {};
  XhrError? _error;
  bool _loading = true;
  bool _isManager = false;
  var key = GlobalKey();

  List<String> get configs => A.group_config_normal;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _load() async {
    _loading = true;
    _error = null;
    try {
      String url = "${System.domain}go/yy/group/user";
      XhrResponse response = await Xhr.postJson(
        url,
        {"groupId": widget.groupId.toString(), "uid": widget.uid.toString()},
        formatJson: true,
        throwOnError: true,
      );
      if (response.error == null) {
        Map res = response.response as Map<dynamic, dynamic>;
        if (res['success'] == true) {
          Map data = res['data'];

          _data = data;

          _isManager = Util.parseBool(_data['is_manager']);

          Log.d(_data);
        }
      }

      _loading = false;
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e as XhrError?;
      });
    }
  }

  Widget _renderWait() {
    return Scaffold(appBar: BaseAppBar(''), body: _renderWaitBody());
  }

  Widget _renderWaitBody() {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (_error != null) {
      return ErrorData(
        error: _error.toString(),
        onTap: () {
          setState(() {
            _loading = true;
          });
          _reload();
        },
      );
    }

    return Container();
  }

  void _reload() async {
    _load();
  }

  void _removeFromGroup() async {
    bool? r = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Text(K.notice),
              content: Text(configs[18]),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(K.cancel),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                CupertinoButton(
                  child: Text(K.sure),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ]);
        });
    if (r != null && r == true) {
      try {
        XhrResponse response = await Xhr.postJson(
          '${System.domain}go/yy/group/remove',
          {
            'groupId': widget.groupId.toString(),
            'uids': widget.uid.toString(),
            'deleted': '0'
          },
          formatJson: true,
          throwOnError: true,
        );

        Map res = response.value();
        if (res['success'] == true) {
          Navigator.pop(context);
          eventCenter.emit(IGroupManager.EVENT_REFRESH_GROUP_INFO);
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            Fluttertoast.showToast(
                msg: res['msg'], gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _onBackSwitch() async {
    bool? r = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Text(K.notice),
              content: Text(K.remove_blacklist_notice),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(K.cancel),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                CupertinoButton(
                  child: Text(K.sure),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ]);
        });
    if (r != null && r == true) {
      try {
        XhrResponse response = await Xhr.postJson(
          '${System.domain}go/yy/group/back',
          {'groupId': widget.groupId.toString(), 'uid': widget.uid.toString()},
          formatJson: true,
          throwOnError: true,
        );

        Map res = response.value();
        if (res['success'] == true) {
          Navigator.pop(context);
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            Fluttertoast.showToast(
                msg: res['msg'], gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _onDisturbSwitch() async {
    List<SheetItem> res = [];
    if (Util.parseInt(_data['forbidden']) > 0) {
      res = [
        SheetItem(K.lift_the_ban, "", 0),
      ];
    } else {
      res = [
        SheetItem(K.two_hour, "", 120),
        SheetItem(K.twelve_hours, "", 720),
        SheetItem(K.one_day, "", 1440),
        SheetItem(K.seven_days, "", 10080),
        SheetItem(K.one_month, "", 43200),
      ];
    }

    SheetCallback result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            title: Util.parseInt(_data['forbidden']) > 0
                ? K.operate_options
                : K.ban_times,
            data: res,
          );
        });

    if (result.reason == SheetCloseReason.Active) {
      return;
    }
    try {
      XhrResponse response = await Xhr.postJson(
          '${System.domain}go/yy/group/forbidden',
          {
            'groupId': widget.groupId.toString(),
            'uid': widget.uid.toString(),
            'duration': (result.value?.extra ?? '').toString()
          },
          formatJson: true,
          throwOnError: true);

      Map res = response.value();
      if (res['success'] == true) {
        _data['forbidden'] = Util.parseInt(res['data']['forbidden']);
        setState(() {});
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  Widget _renderFooter() {
    return Container(
      height: 72.0,
      width: Util.width,
      margin: EdgeInsets.only(bottom: Util.iphoneXBottom + 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Material(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  IChatManager? manager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_CHAT);
                  manager?.openUserChatScreen(context,
                      type: 'private',
                      targetId: widget.uid!,
                      title: _data['name']);
                },
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      R.img(
                        Assets.group$icn_chat_svg,
                        width: 40,
                        height: 40,
                        color: R.color.mainBrandColor,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 1),
                        child: Text(
                          K.group_chat,
                          style: TextStyle(
                            color: R.color.mainBrandColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ].where((it) => it != null).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading == true || _error != null) {
      return _renderWait();
    }

    List<Widget> widgets = [
      ListSection(isEnd: false, children: [
        ListTile(
          dense: true,
          title: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                CommonAvatar(
                  path: _data['icon'],
                  size: 55,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _data['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: R.color.mainTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          trailing: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                R.img(
                  Assets.group$icn_next_svg,
                  width: 15,
                  height: 15,
                ),
              ],
            ),
          ),
          onTap: () async {
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, widget.uid!,
                refer: widget.refer!);
          },
        ),
        ListTile(
          dense: true,
          title: Text(
            "ID : ${widget.uid}",
            textScaleFactor: 1.0,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 16.0, color: R.color.mainTextColor),
          ),
        ),
      ])
    ];

    bool isBlack = Util.parseInt(_data['deleted']) == 3;
    bool isAdmin = _data['is_admin'] != null && _data['is_admin'];
    bool isCreator = Util.parseBool(_data['is_creator']);

    if (isBlack) {
      widgets.add(ListSection(isEnd: true, children: [
        ListTile(
          dense: true,
          title: Text(
            K.leave_blacklist,
            textScaleFactor: 1.0,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 16.0, color: R.color.mainTextColor),
          ),
          trailing: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Images.img(Assets.group$icn_next_svg, width: 15, height: 15)
              ],
            ),
          ),
          onTap: _onBackSwitch,
        ),
      ]));
    } else if (isAdmin) {
      widgets.add(
        ListSection(isEnd: true, children: [
          ListTile(
            dense: true,
            title: Text(
              K.ban_speak,
              textScaleFactor: 1.0,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 16.0, color: R.color.mainTextColor),
            ),
            trailing: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      Util.parseInt(_data['forbidden']) > 0
                          ? Utility.formatDateV1(
                              Util.parseInt(_data['forbidden']))
                          : K.un_ban_speak,
                      textScaleFactor: 1.0,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 12.0)),
                  R.img(
                    BaseAssets.shared$icon_next_svg,
                    width: 15,
                    color: R.color.thirdTextColor,
                  )
                ],
              ),
            ),
            onTap: _onDisturbSwitch,
          ),
          ListTile(
            dense: true,
            title: Text(
              configs[16],
              textScaleFactor: 1.0,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 16.0, color: R.color.mainTextColor),
            ),
            trailing: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Images.img(Assets.group$icn_next_svg, width: 15, height: 15)
                ],
              ),
            ),
            onTap: _removeFromGroup,
          ),
        ]),
      );
    }

    if (isCreator && widget.fromMangerScreen == true) {
      widgets.add(WidgetUtils.buildSwitchListTile(
          K.group_set_manager, _isManager,
          onChanged: _onSetManager));
    }

    return Scaffold(
      appBar: BaseAppBar(K.personal_info),
      body: Stack(
        children: <Widget>[
          ListView(children: widgets),
          if (widget.uid != Session.uid)
            PositionedDirectional(
              bottom: 0,
              start: 0,
              child: _renderFooter(),
            ),
        ],
      ),
    );
  }

  void _setRole(int op, {bool dismiss = false}) async {
    bool result = await GroupRepo.setManager(widget.groupId, widget.uid, op);
    if (result == true) {
      eventCenter.emit(IGroupManager.EVENT_REFRESH_GROUP_INFO);
      if (dismiss) {
        Navigator.pop(context);
      }
      _load();
      eventCenter.emit(IGroupManager.EVENT_REFRESH_GROUP_INFO);
    }
  }

  void _onSetManager(bool v) async {
    _isManager = v;
    setState(() {});
    bool result =
        await GroupRepo.setManager(widget.groupId, widget.uid, v ? 1 : 0);
    if (result == true) {
      eventCenter.emit(IGroupManager.EVENT_REFRESH_GROUP_INFO);
    } else {
      _isManager = !_isManager;
      setState(() {});
    }
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
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children!)
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
