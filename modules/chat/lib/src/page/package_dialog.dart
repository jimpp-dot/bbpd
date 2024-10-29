import 'dart:convert';

import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../page/group_package_detail.dart';

class PackageDialog extends StatefulWidget {
  final String type;
  final int id;
  final int messageId;

  const PackageDialog(
      {super.key, required this.type, required this.id, this.messageId = 0});

  @override
  _PackageDialogState createState() => _PackageDialogState();
}

class _PackageDialogState extends State<PackageDialog> {
  bool _loading = true;
  Map? _resPrivate;

  Map? _resGroup;
  String _displayGroup = '';
  String _messageGroup = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    if (widget.type == ConversationType.Private) {
      await _loadPrivate();
    } else {
      await _loadGroup();
    }
  }

  _loadPrivate() async {
    String url = "${System.domain}money/info/?id=${widget.id}";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (mounted == false) return;
      setState(() {
        _loading = false;
        _resPrivate = response.value()['data'];
      });
    } catch (e) {
      _onError(e.toString());
    }
  }

  _loadGroup() async {
    String url = "${System.domain}fleet/packageQuery/?packageId=${widget.id}";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (mounted == false) return;
      setState(() {
        _loading = false;
        _resGroup = response.value();
        Map temp = response.value();
        if (temp.containsKey('display')) _displayGroup = temp['display'];
        if (temp.containsKey('message')) _messageGroup = temp['message'];
      });
    } catch (e) {
      _onError(e.toString());
      return;
    }

    if (mounted && _displayGroup == 'result') {
      _logDisplay();
    }
  }

  _onError(String e) {
    if (mounted) Toast.showCenter(context, e);
  }

  Widget _renderBody() {
    if (_loading) {
      return const Loading();
    } else {
      if (widget.type == ConversationType.Private) {
        return _renderPrivateBody();
      } else {
        return _renderGroupBody();
      }
    }
  }

  String? _getActionMessage() {
    if (_resPrivate == null) return null;
    int confirm = Util.parseInt(_resPrivate!['confirm'], 0);
    int uid = Util.parseInt(_resPrivate!['uid'], 0);
    String status = _resPrivate!['status'].toString();
    if (confirm == 0) return null;
    if (Session.uid == uid) {
      if (status == 'sent') {
        return K.chat_done;
      }
    } else {
      if (status == 'sent') {
        return K.package_send_back;
      }
    }
    return null;
  }

  String? _getMessage() {
    if (_resPrivate == null) return '';
    String? status = _resPrivate!['status']?.toString();
    if (status == 'sent') {
      return K.waiting_for_confirm;
    } else if (status == 'cancel') {
      return K.has_send_back;
    } else if (status == 'complete') {
      return K.chat_has_done;
    } else {
      return ' ';
    }
  }

  _onAction() {
    int confirm = Util.parseInt(_resPrivate?['confirm'], 0);
    int uid = Util.parseInt(_resPrivate?['uid'], 0);
    String? status = _resPrivate?['status'].toString();
    if (confirm == 0) return;
    if (Session.uid == uid) {
      if (status == 'sent') {
        _sentAction('confirm');
      }
    } else {
      if (status == 'sent') {
        _sentAction('cancel');
      }
    }
  }

  _sentAction(String op) async {
    String url = "${System.domain}money/$op/";
    try {
      await Xhr.postJson(url, {'id': _resPrivate!['id'].toString()},
          throwOnError: true);
    } catch (e) {
      if (mounted) {
        Toast.showCenter(context, e.toString());
      }
    }
    if (mounted) {
      await _load();
    }
  }

  Widget _renderPrivateBody() {
    int uid = Util.parseInt(_resPrivate?['uid'], 0);
    Map profile = _resPrivate?['profile'] ?? {};
    String? actionMessage = _getActionMessage();
    String money = MoneyConfig.moneyNum(Util.parseInt(_resPrivate?['money']),
        fractionDigits: 2);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300.0,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 325.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5353),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFF8D8AF), width: 3.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(31.5)),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${System.imageDomain + profile['icon']}!head100',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                        child: Text(
                          uid == Session.uid
                              ? K.you_send_to_somebody_red_envelope(
                                  [profile['name']])
                              : "${profile['name']} ${K.send_you_red_envelope}",
                          style: const TextStyle(
                              color: Color(0xFFF9E2B6), fontSize: 16.0),
                        ),
                      ),
                      Text(
                        _getMessage() ?? '',
                        style: const TextStyle(
                            color: Color(0xFFF9E2B6), fontSize: 14.0),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "$money${MoneyConfig.moneyName}",
                            style: const TextStyle(
                                color: Color(0xFFF9E2B6),
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Image.asset(
                R.imagePath('chat_bg_package.png',
                    package: ComponentManager.MANAGER_CHAT),
                width: 325,
                height: 36,
              ),
            ],
          ),
        ),
        Container(
          height: 20.0,
        ),
        Expanded(
          child: actionMessage == null
              ? Container()
              : Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: _onAction,
                    child: Container(
                      width: 85.0,
                      height: 28.0,
                      constraints: const BoxConstraints(),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                        border: Border.all(
                            color: const Color(0xFFF9E2B6), width: 1.0),
                      ),
                      child: Text(
                        actionMessage,
                        style: const TextStyle(color: Color(0xFFF9E2B6)),
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }

  bool _lock = false;

  _groupPackageOpen() async {
    if (_lock) return;
    _lock = true;
    try {
      String token = _resGroup?['message'] ?? '';
      String url =
          '${System.domain}fleet/packageOpen?ptoken=${Uri.encodeComponent(token)}';
      await Xhr.getJson(url, throwOnError: true);
      await _logDisplay();
      _displayGroupPackageDetail();
    } catch (e) {
      if (mounted) Toast.showCenter(context, e.toString());
    }
    _lock = false;
  }

  _logDisplay() async {
    if (widget.messageId <= 0) return;
    try {
      await Im.setMessageExtra(
          widget.messageId, json.encode({'display': 'result'}));
      eventCenter.emit('MsgExtraChanged', {
        'messageId': widget.messageId,
        'extra': json.encode({'display': 'result'})
      });
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  _displayGroupPackageDetail() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return GroupPackageDetail(
        id: widget.id,
      );
    }));
  }

  _renderGroupEnterDetail() {
    return Center(
      child: TextButton(
        onPressed: _displayGroupPackageDetail,
        child: Text(
          K.check_get_detail,
          style: const TextStyle(color: Color(0xFFF9E2B6), fontSize: 13),
        ),
      ),
    );
  }

  Widget _renderGroupOpen() {
    if (_displayGroup != 'open') {
      return Container(
        height: 80.0,
      );
    }
    return Positioned(
      child: Center(
        child: InkWell(
          onTap: _groupPackageOpen,
          child: SizedBox(
            width: 80.0,
            height: 80.0,
            child: Image.asset(
              R.imagePath('chat_package_open.png',
                  package: ComponentManager.MANAGER_CHAT),
              width: 80,
              height: 80,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderGroupAction() {
    if (_displayGroup == 'no' || _displayGroup == 'error') {
      return Expanded(
        child: Center(
          child: Text(
            _messageGroup,
            style: const TextStyle(
              color: Color(0xFFF9E2B6),
              fontSize: 16.0,
            ),
          ),
        ),
      );
    } else if (_displayGroup == 'open') {
      return Expanded(
        child: Center(
          child: Text(
            _resGroup?['data']['description'] ?? '',
            maxLines: 3,
            style: const TextStyle(
              color: Color(0xFFF9E2B6),
              fontSize: 20.0,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _renderGroupBody() {
    Log.d(_resGroup);
    Map data = _resGroup?['data'] ?? {};
    Map profile = data.containsKey('sender') ? data['sender'] : {};
    bool displayEnter = _displayGroup == 'no' ||
        _displayGroup == 'result' ||
        Session.uid == Util.parseInt(profile['uid']);

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 325.0,
            decoration: const BoxDecoration(
              color: Color(0xFFFF5353),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: R.color.thirdBgColor, width: 3.0),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${System.imageDomain + profile['icon']}!head100',
                        width: 60.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: Text(
                    profile['name'],
                    style: const TextStyle(
                        color: Color(0xFFF9E2B6), fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    K.give_you_a_red_envelope,
                    style: const TextStyle(
                        color: Color(0xFFF9E2B6), fontSize: 12.0),
                  ),
                ),
                _renderGroupAction()
              ],
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            SvgPicture.asset(
              R.imagePath('chat_package_dialog_bg.svg',
                  package: ComponentManager.MANAGER_CHAT),
              width: 325,
              height: 36,
              fit: BoxFit.fill,
            ),
            _renderGroupOpen()
          ],
        ),
        SizedBox(
          height: 90.0,
          child: displayEnter ? _renderGroupEnterDetail() : Container(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(this.context).pop();
        },
        child: Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 325.0,
              height: 430.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Color(0xFFF24F4F),
              ),
              child: Stack(
                children: <Widget>[
                  _renderBody(),
                  PositionedDirectional(
                    end: 0.0,
                    top: 0.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      onPressed: () {
                        Navigator.of(this.context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
