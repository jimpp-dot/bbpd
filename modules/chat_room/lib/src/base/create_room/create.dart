import 'dart:convert';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/room_create_bean.dart';
import 'package:chat_room/src/protobuf/generated/room_info.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../a.dart';

part 'create.g.dart';

enum InputDisplay { normal, input, recommend }

/// 创建房间输入房间名 第二步
class CreateRoomStep2 extends StatefulWidget {
  static const String routeName = '/CreateRoomStep2';
  String? type;
  final String? label;
  final int rid; //房间rid，0为创建, 大于0为修改
  final String? refer;
  final bool fromWolfHomePage;
  final String typesLabel;
  final List<RoomCreateItemType>? types;
  final bool showPub; //是否显示公开属性
  final bool showPassword; //是否显示密码

  CreateRoomStep2({
    Key? key,
    this.type,
    this.label,
    this.rid = 0,
    this.refer,
    this.fromWolfHomePage = false,
    this.typesLabel = '',
    this.types,
    this.showPub = true,
    this.showPassword = false,
  }) : super(key: key);

  @override
  _State2 createState() => _State2();
}

class RecommendWord {
  final String label;
  final int index;
  final int length;

  RecommendWord(this.label, this.index, this.length);

  String get left {
    return label.safeSubstring(0, index);
  }

  String get center {
    return label.safeSubstring(index, index + length);
  }

  String get right {
    return label.safeSubstring(length);
  }
}

@JsonSerializable()
class RoomTag {
  String? type;
  String? title;
  String? icon;
  String? toast; // 如果toast不为空，弹框提示

  RoomTag(this.type, this.title, this.icon, this.toast);

  factory RoomTag.fromJson(Map json) =>
      _$RoomTagFromJson(json as Map<String, dynamic>);
}

class TypeInfo {
  String? label;
  String? type;

  TypeInfo.fromJson(Map<String, dynamic> json)
      : label = json['title'],
        type = json['type'];
}

class _State2 extends State<CreateRoomStep2> {
  late FocusNode _focusNode;
  late TextEditingController _textController;
  final List<String> _data = []; //热门标题，从服务器获取
  final List<String> _log = []; //自己使用的历史，从本地获取
  final List<TypeInfo> _typeInfo = [];
  final String _key = "private.room.log";
  bool _isLoading = false;
  String? _selectedOption;
  final List<String> _privateLevelOptions = A.room_private_attr;

  late FocusNode _focusNodePass;
  String _captcha = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: "");
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);
    _focusNodePass = FocusNode();
    _selectedOption = A.room_private_attr[0];
    _initLog();
    _load(widget.fromWolfHomePage);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    _focusNodePass.dispose();
    super.dispose();
  }

  _initLog() {
    String log = Config.get(_key, "");
    if (log.isNotEmpty) {
      try {
        _log.clear();
        List values = json.decode(log);
        for (var value in values) {
          _log.add(value.toString());
        }
      } catch (e) {
        Log.d(e);
      }
    }
  }

  _add(String? subject) {
    if (subject == null || subject.isEmpty) return;
    int index = _log.indexOf(subject);
    if (index > -1) {
      _log.remove(subject);
    }
    _log.insert(0, subject);
    while (_log.length > 9) {
      _log.removeLast();
    }
    Config.set(_key, json.encode(_log));
  }

  _load(bool loadCreateType) async {
    if (loadCreateType) {
      ///狼人杀二级首页创建房间时获取可创建房间类型
      _isLoading = true;
      String loadUrl = '${System.domain}roomwolfv2/createTypeInfo';
      try {
        XhrResponse response = await Xhr.getJson(loadUrl, throwOnError: true);
        Map res = response.value();
        List? data = res['data'];
        if (data == null || !mounted) {
          return;
        }
        for (var value in data) {
          _typeInfo.add(TypeInfo.fromJson(value));
        }
        if (_typeInfo.isEmpty) {
          return;
        }
        widget.type = _typeInfo[0].type;
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        if (mounted) Toast.showCenter(context, e.toString());
      }
    }

    if (widget.type == null || widget.type!.isEmpty) {
      if (widget.types != null && widget.types!.isNotEmpty) {
        widget.type = widget.types![0].typeKey;
      }
    }

    String url = '${System.domain}room/getCreateTags';
    try {
      XhrResponse response = await Xhr.postJson(
          url, {'type': widget.type ?? ''},
          throwOnError: true);
      if (!mounted) return;
      Map res = response.value();
      List data = res['data'];
      setState(() {
        for (var value in data) {
          _data.add(value.toString());
        }
      });
    } catch (e) {
      if (mounted) Toast.showCenter(context, e.toString());
    }
  }

  _onFocus() {
    Log.d("focus --------------- ${_focusNode.hasFocus}");
  }

  Widget _labelItem(String label) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          _setInputText(label);
        },
        child: Container(
          height: 40.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 14.0, right: 14.0),
          decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            label,
            style: TextStyle(color: R.color.secondTextColor, fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  Widget _privateItem(String label, {bool selected = false}) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          if (_selectedOption != label) {
            setState(() {
              _selectedOption = label;
            });
          }
        },
        child: Container(
          height: 40.0,
          width: 104.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color:
                    selected ? R.color.mainBrandColor : const Color(0xFFF6F7F9),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            label,
            style: TextStyle(
                color:
                    selected ? R.color.mainBrandColor : const Color(0x99313131),
                fontSize: 14.0,
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget _typeItem(String label, String type) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          if (widget.type != type) {
            setState(() {
              widget.type = type;
            });
          }
        },
        child: Container(
          height: 40.0,
          width: 104.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            border: Border.all(
              color: (widget.type == type)
                  ? R.color.mainBrandColor
                  : R.color.secondBgColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Text(
            label,
            style: TextStyle(
                color: (widget.type == type)
                    ? R.color.mainBrandColor
                    : R.color.secondTextColor,
                fontSize: 14.0,
                fontWeight:
                    (widget.type == type) ? FontWeight.w500 : FontWeight.w400),
          ),
        ),
      ),
    );
  }

  void _setInputText(String label) {
    _textController.text = label;
    _textController.selection = TextSelection.fromPosition(
      TextPosition(affinity: TextAffinity.downstream, offset: label.length),
    );
  }

  Widget _renderNormal() {
    return Scaffold(
      appBar: BaseAppBar.custom(
        showShape: false,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(K.room_create_room([(widget.label ?? '')])),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (widget.rid == 0) ? _create : _modify,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(
                    K.create,
                    style: TextStyle(
                        color: R.color.mainBrandColor, fontSize: 16.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: _isLoading
          ? const Loading()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (_typeInfo.isNotEmpty) _buildWolfType(),
                  Container(
                    padding:
                        const EdgeInsetsDirectional.only(start: 18, top: 16),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      K.room_create_v_title,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 18.0, end: 18.0),
                    height: 48,
                    margin:
                        const EdgeInsetsDirectional.only(start: 18, end: 18),
                    decoration: BoxDecoration(
                      color: R.color.secondBgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: textField()),
                        if (!Util.isCollectionEmpty(_data))
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (Util.isCollectionEmpty(_data)) {
                                Fluttertoast.showToast(
                                    msg: K.room_random_title_empty,
                                    gravity: ToastGravity.CENTER);
                                return;
                              }

                              String label =
                                  _data[Random().nextInt(_data.length)];
                              _setInputText(label);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                R.img(
                                  "room_ic_refresh_small.svg",
                                  width: 16,
                                  height: 16,
                                  color: R.color.mainBrandColor,
                                  package: ComponentManager.MANAGER_BASE_ROOM,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  K.room_random,
                                  style: TextStyle(
                                      color: R.color.mainBrandColor,
                                      fontSize: 14.0),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  _renderExist()
                ],
              ),
            ),
    );
  }

  _buildWolfType() {
    List<Widget> res = [];
    for (int i = 0; i < _typeInfo.length; i++) {
      res.add(_buildItem(_typeInfo[i].type ?? '', _typeInfo[i].label ?? ''));
      if (i != _typeInfo.length - 1) {
        res.add(const Spacer());
      }
    }
    return Padding(
      padding: const EdgeInsets.only(
          left: 18.0, right: 18.0, top: 30.0, bottom: 8.0),
      child: Row(
        children: res,
      ),
    );
  }

  _buildItem(String wolfType, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.type = wolfType;
        });
        _load(false);
      },
      child: Container(
        width: 100,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.type == wolfType
              ? const Color(0xFF00D98E)
              : R.color.secondBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: widget.type == wolfType
                  ? Colors.white
                  : R.color.mainTextColor,
              fontSize: 13),
        ),
      ),
    );
  }

  _create() async {
    String subject = _textController.value.text;
    if (subject.isEmpty || subject.trim().isEmpty) {
      Toast.showCenter(context, K.room_set_room_title);
      return;
    }
    if (widget.showPassword) {
      if (!(_captcha.isEmpty || _captcha.length == 4)) {
        Toast.showCenter(context, K.room_create_password_tips);
        return;
      }
    }
    _add(subject);
    String url =
        '${System.domain}room/new?room_version=${RoomConstant.roomVersion}';
    try {
      Map<String, String> params = {
        'display': 'private',
        'version': '${RoomConstant.roomNewVersion}',
        'type': widget.type ?? '',
        'subject': subject,
        'private_level': Util.isStringEmpty(_selectedOption)
            ? "0"
            : A.room_private_attr.indexOf(_selectedOption ?? '').toString(),
        'password': _captcha,
      };

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      int rid = Util.parseInt(res['data']);

      //游戏房创建后，房主上0号麦-- 在initOperate._newRoom中调用CreateRoom之后上麦位，否则后台会返回不在房间不能上麦
//      if (this.widget.type == 'under' ||
//          this.widget.type == 'guess' ||
//          this.widget.type == 'wolf') {
//        RoomRepository.joinMic(rid, 0, Session.uid);
//      }
      Tracker.instance.track(TrackEvent.create_room, properties: {
        'rid': rid,
        if (widget.refer != null && widget.refer!.isNotEmpty)
          'refer': widget.refer,
        'owner_uid': Session.uid,
        'room_type': widget.type,
      });
      if (mounted) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.setFirstRid(rid);
        Navigator.pop(context, rid);
      }
    } catch (e) {
      if (mounted) Toast.showCenter(context, e.toString());
    }
  }

  _modify() async {
    String subject = _textController.value.text;
    if (subject.isEmpty || subject.trim().isEmpty) {
      Toast.showCenter(context, K.room_set_room_title);
      return;
    }

    if (widget.showPassword) {
      if (!(_captcha.isEmpty || _captcha.length == 4)) {
        Toast.showCenter(context, K.room_create_password_tips);
        return;
      }
    }

    ResRoomInfo rsp = await RoomRepository.getRoomInfo(widget.rid);

    ///获取原来房间的信息，然后修改
    if (!mounted) return;
    if (rsp.success) {
      Map<String, String> post = {
        'icon': rsp.data.icon,
        'type': widget.type ?? '',
        'prefix': rsp.data.prefix,
        'name': subject,
        'description': rsp.data.description,
        'rid': widget.rid.toString(),
        'password': widget.showPassword ? _captcha : rsp.data.password,
        'clientVersion': '${RoomConstant.createClientVersion}',
        'reception': rsp.data.reception.toString(),
        'paier': rsp.data.paier.toString(),
        'private_level': Util.isStringEmpty(_selectedOption)
            ? "0"
            : A.room_private_attr.indexOf(_selectedOption ?? '').toString(),
      };
      bool result = await RoomRepository.roomCreate(post);
      if (result && mounted) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.setFirstRid(widget.rid);
        Navigator.pop(context, widget.rid);
      } else {
        return;
      }
    } else if (rsp.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
      Navigator.pop(context, -1);
    }
  }

  _onPassChanged(String value) {
    if (_captcha == value) return;
    setState(() {
      _captcha = value;
    });
    if (value.length == 4) {
      _focusNode.unfocus();
    }
  }

  TextField textField() {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      cursorColor: Theme.of(context).primaryColor,
      cursorWidth: 1.0,
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 14.0, color: R.color.mainTextColor),
      focusNode: _focusNode,
      controller: _textController,
      autocorrect: true,
      autofocus: true,
      onSubmitted: (String value) {},
      maxLines: 1,
      maxLength: 16,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
            color: R.color.thirdTextColor,
            fontSize: 14,
            fontFamily: Util.fontFamily),
        hintText: K.room_input_room_name,
        isDense: true,
        counterText: '',
      ),
    );
  }

  Widget _renderExist() {
    List<Widget> all = [];
    if (_log.isNotEmpty) {
      all.add(Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 18.0, top: 22.0, bottom: 16.0, end: 12.0),
        child: Text(
          K.room_common_title,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ));
      all.add(Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Wrap(
          spacing: 14.0,
          runSpacing: 14.0,
          children: _log.map((String value) {
            return _labelItem(value);
          }).toList(),
        ),
      ));
    }

    all.add(Container(
      height: 1,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 23),
      color: const Color(0x1A313131),
    ));

    if (widget.showPub) {
      all.add(Container(
        padding: const EdgeInsetsDirectional.only(
            start: 18.0, top: 22.0, bottom: 16.0, end: 12.0),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          K.room_create_v_attr,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ));
    }

    if (widget.showPub) {
      all.add(Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 18.0, end: 18.0, bottom: 18.0),
        child: Wrap(
          spacing: 14.0,
          runSpacing: 14.0,
          children: _privateLevelOptions.map((String value) {
            return _privateItem(value, selected: value == _selectedOption);
          }).toList(),
        ),
      ));
    }

    if (widget.types != null && widget.types!.length > 1) {
      all.add(Container(
        padding: const EdgeInsetsDirectional.only(
            start: 18.0, top: 22.0, bottom: 16.0, end: 12.0),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          widget.typesLabel,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ));
    }

    if (widget.types != null && widget.types!.length > 1) {
      all.add(Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 18.0, end: 18.0, bottom: 18.0),
        child: Wrap(
          spacing: 14.0,
          runSpacing: 14.0,
          children: widget.types!.map((RoomCreateItemType roomCreateItemType) {
            return _typeItem(
                roomCreateItemType.typeName, roomCreateItemType.typeKey);
          }).toList(),
        ),
      ));
    }

    if (widget.showPassword) {
      all.addAll([
        Container(
          padding: const EdgeInsetsDirectional.only(
              start: 18.0, top: 22.0, bottom: 16.0, end: 12.0),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            K.room_create_password,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 16.0, bottom: 18.0),
          height: 56.0,
          width: 228.0,
          child: Stack(
            children: [
              SizedBox(
                height: 43,
                child: TextField(
                  autofocus: true,
                  autocorrect: false,
                  maxLines: 1,
                  maxLength: 4,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: null,
                  obscureText: true,
                  cursorWidth: 0,
                  keyboardType: TextInputType.number,
                  enableInteractiveSelection: false,
                  focusNode: _focusNodePass,
                  onChanged: _onPassChanged,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4)
                  ],
                ),
              ),
              IgnorePointer(
                child: Container(
                  color: R.color.mainBgColor,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 48.0,
                        height: 56.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          _captcha.isNotEmpty ? _captcha[0] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor, fontSize: 34),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Container(
                        width: 48.0,
                        height: 56.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          _captcha.length > 1 ? _captcha[1] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor, fontSize: 34),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Container(
                        width: 48.0,
                        height: 56.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          _captcha.length > 2 ? _captcha[2] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor, fontSize: 34),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Container(
                        width: 48.0,
                        height: 56.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          _captcha.length > 3 ? _captcha[3] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor, fontSize: 34),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: all,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderNormal();
  }
}
