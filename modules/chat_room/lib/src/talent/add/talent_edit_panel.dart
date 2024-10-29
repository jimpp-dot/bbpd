import 'dart:io';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent/data/talent_add_user_mixin.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';
import 'package:chat_room/src/talent/data/talent_repo.dart';

import '../talent_constants.dart';
import '../talent_helper.dart';
import 'talent_add_intro_dialog.dart';
import 'talent_add_user_panel.dart';

class TalentEditPanel extends StatefulWidget {
  final ChatRoomData room;

  // 表演者序号
  final int? position;
  final Program? program;

  const TalentEditPanel({
    required this.room,
    this.program, // 如果为空，这是新增节目单页面
    this.position,
    super.key,
  });

  @override
  _TalentEditPanelState createState() => _TalentEditPanelState();

  /// 返回true要刷新
  static Future<bool?> show(BuildContext context,
      {required ChatRoomData room, Program? program, int? position}) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return TalentHelper.blurDialogWidget(
          child: TalentEditPanel(
            room: room,
            program: program,
            position: position,
          ),
        );
      },
    );
  }
}

class _TalentEditPanelState extends State<TalentEditPanel> {
  final double _horizontalPadding = 20.dp;

  late TextEditingController _positionTextEditCtr;

  static const int _optionNum = 5;

  final _optionControllerList = <TextEditingController>[];

  bool _isEdit = false;
  bool _isLoading = false;

  // 当前的主播信息
  _AnchorInfo? _currentAnchorInfo;

  final Color _mainTxtColor = Colors.white;

  @override
  void initState() {
    super.initState();
    if (widget.program != null) {
      _currentAnchorInfo = _AnchorInfo.fromProgram(widget.program!);
    }
    for (int i = 0; i < _optionNum; i++) {
      String? text;
      if (widget.program != null) {
        text = Util.getListElementSafely(widget.program!.contents, i);
      }
      var ctl = TextEditingController(text: text ?? '');
      _optionControllerList.add(ctl);
    }

    _isEdit = widget.program != null;

    _positionTextEditCtr =
        TextEditingController(text: '${widget.position ?? ''}');
    _positionTextEditCtr.addListener(_positionChangeListener);
  }

  _positionChangeListener() {
    String position = _positionTextEditCtr.text;
    Log.d(tag: 'talent', 'positionChange->$position');
  }

  @override
  void dispose() {
    super.dispose();
    _positionTextEditCtr.removeListener(_positionChangeListener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(),
              _buildAvatarOrder(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _buildEditList(),
                  ),
                ),
              ),
              SizedBox(height: 20.dp),
              _buildBottomBtn(),
              _buildDel(),
            ],
          ),
        ),
        if (_isLoading) const Loading()
      ],
    );
  }

  // 顶部编辑节目一栏
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: _horizontalPadding, top: 20.dp),
              child: Text(
                _isEdit
                    ? K.room_talent_edit_programe
                    : K.room_talent_add_program,
                style: TextStyle(
                  fontSize: 18.dp,
                  color: _mainTxtColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _popNav();
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 16.dp, top: 16.dp),
                child: Icon(
                  Icons.close,
                  size: 24.dp,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 8.dp,
            start: _horizontalPadding,
            end: _horizontalPadding,
          ),
          child: Text(
            K.room_talent_edit_rule_tip,
            style: TextStyle(
                fontSize: 11.dp, color: _mainTxtColor.withOpacity(0.6)),
          ),
        ),
        SizedBox(height: 20.dp),
      ],
    );
  }

  Widget _buildAvatarOrder() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 头像名称
        Expanded(child: _buildAvatarName()),
        // 表演序号，暂时不需要
        // if (widget.position != null) _buildOrder(),
      ],
    );
  }

  /// 主播名称星光数
  Widget _buildAvatarName() {
    Widget avatarRightInfo;
    if (_currentAnchorInfo != null) {
      avatarRightInfo = _buildInfo();
    } else {
      avatarRightInfo = Text(
        K.room_talent_add_user,
        style: TextStyle(
          color: _mainTxtColor,
          fontSize: 16.dp,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: _horizontalPadding,
        end: _horizontalPadding,
        top: 19.dp,
        bottom: 20.dp,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatarOrAdd(),
          SizedBox(width: 10.dp),
          Expanded(child: avatarRightInfo),
        ],
      ),
    );
  }

  Column _buildInfo() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 主播名称
        Text(
          _currentAnchorInfo!.name,
          style: TextStyle(
            color: _mainTxtColor,
            fontSize: 16.dp,
          ),
        ),

        SizedBox(height: 1.dp),

        // 主播信息
        _buildIntro(),

        SizedBox(height: 3.dp),

        // 星光值
        _buildStarNum(),
      ],
    );
  }

  Widget _buildStarNum() {
    if (_currentAnchorInfo!.starNum == null ||
        _currentAnchorInfo!.starNum! < 0) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img(
          RoomAssets.chat_room$talent_talent_star_webp,
          width: 14.dp,
          height: 14.dp,
        ),
        SizedBox(width: 2.dp),
        Text(
          'x${_currentAnchorInfo!.starNum}',
          style: TextStyle(
            color: _mainTxtColor,
            fontSize: 10.dp,
            height: 1.1,
          ),
        )
      ],
    );
  }

  Widget _buildIntro() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            _currentAnchorInfo!.intro ?? '',
            style: TextStyle(
              color: _mainTxtColor.withOpacity(0.6),
              fontSize: 11.dp,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        GestureDetector(
          onTap: () async {
            var result = await TalentAddIntroDialog.show(
                context, _currentAnchorInfo!.intro);
            Log.d(tag: TAG, 'AddIntroDialog result=$result');
            if (result != null) {
              _currentAnchorInfo!.intro = result;
              _refresh();
            }
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 4.dp),
            child: Text(
              K.room_talent_edit,
              style: TextStyle(
                color: _mainTxtColor,
                decoration: TextDecoration.underline,
                fontSize: 11.dp,
              ),
            ),
          ),
        )
      ],
    );
  }

  bool get _showAdd => _currentAnchorInfo == null;

  Widget _buildAvatarOrAdd() {
    Widget widget;
    if (_showAdd) {
      widget = Container(
        width: 55.dp,
        height: 55.dp,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: Color(0xFF312E44),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add,
          color: const Color(0xFFBA69FF),
          size: 25.dp,
        ),
      );
    } else {
      widget = CommonAvatar(
        path: _currentAnchorInfo!.icon,
        size: 55.dp,
        shape: BoxShape.circle,
      );
    }
    return GestureDetector(
      onTap: () async {
        var item = await TalentAddUserPanel.show(context);
        if (item != null) {
          _currentAnchorInfo = _AnchorInfo.fromAddUser(item);
          _refresh();
          DataRsp<AnchorInfoResp> resp =
              await TalentRepo.anchorInfo(anchorUid: item.uid);
          if (resp.success == true && _currentAnchorInfo?.uid == item.uid) {
            _currentAnchorInfo?.refresh(resp.data!);
            _refresh();
          }
        }
      },
      child: widget,
    );
  }

  List<Widget> _buildEditList() {
    double dividerHeight = 20.dp;
    List<Widget> list = [];

    var textStyle = TextStyle(color: _mainTxtColor, fontSize: 14.dp);

    for (int index = 0; index < _optionControllerList.length; index++) {
      var textController = _optionControllerList[index];

      Widget item = Stack(
        children: [
          SizedBox(
            height: 48.dp,
            child: TextFormField(
              key: ValueKey('form_$index'),
              controller: textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: _mainTxtColor.withOpacity(0.1),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _mainTxtColor.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(8.dp),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _mainTxtColor.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(8.dp),
                ),
                hintText: K.room_talent_edit_option_hit,
                hintStyle: textStyle.copyWith(
                  color: _mainTxtColor.withOpacity(0.4),
                ),
                // hide maxLength hit
                counterText: '',
                contentPadding: EdgeInsetsDirectional.only(
                  start: 10.dp,
                  end: 50.dp,
                ), // for text center
              ),
              keyboardType: TextInputType.text,
              maxLength: 20,
              style: TextStyle(
                color: _mainTxtColor,
                fontSize: 14.dp,
              ),
              onChanged: (text) {
                _refresh();
              },
            ),
          ),
          if (!Util.isStringEmpty(textController.text))
            PositionedDirectional(
              top: 0,
              bottom: Platform.isAndroid ? 4.dp : 0,
              end: 0,
              child: GestureDetector(
                onTap: () {
                  textController.clear();
                  _refresh();
                },
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                    end: 15.dp,
                    start: 5.dp,
                  ),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    K.room_talent_clear,
                    style: TextStyle(
                      color: const Color(0xFFBA69FF),
                      fontSize: 14.dp,
                    ),
                  ),
                ),
              ),
            ),
        ],
      );

      Widget line = Row(
        children: [
          SizedBox(width: _horizontalPadding),

          Padding(
            padding: EdgeInsetsDirectional.only(end: 18.dp),
            child: Text(
              '${index + 1}',
              style: textStyle.copyWith(
                color: _mainTxtColor.withOpacity(0.6),
              ),
            ),
          ),

          // 右侧编辑输入
          Expanded(child: item),

          SizedBox(width: _horizontalPadding),
        ],
      );

      list.add(line);

      if (index != _optionControllerList.length - 1) {
        list.add(SizedBox(height: dividerHeight));
      }
    }

    return list;
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  Widget _buildBottomBtn() {
    return Row(
      children: [
        SizedBox(width: 20.dp),

        // 取消修改/增加
        GestureDetector(
          onTap: () {
            _popNav();
          },
          child: Container(
            height: 50.dp,
            width: 155.dp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: _mainTxtColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(25.dp),
            ),
            child: Text(
              _isEdit ? K.room_talent_edit_cancel : K.room_talent_add_cancel,
              style: TextStyle(
                color: _mainTxtColor,
                fontSize: 16.dp,
              ),
            ),
          ),
        ),

        const Spacer(),

        // 确认修改/新增
        GestureDetector(
          onTap: _onTapOk,
          child: Container(
            height: 50.dp,
            width: 155.dp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: buttonColors,
              ),
              borderRadius: BorderRadius.circular(25.dp),
            ),
            child: Text(
              _isEdit ? K.room_talent_edit_sure : K.room_talent_add_sure,
              style: TextStyle(
                color: _mainTxtColor,
                fontSize: 16.dp,
              ),
            ),
          ),
        ),
        SizedBox(width: 20.dp),
      ],
    );
  }

  void _onTapOk() async {
    var anchor = _currentAnchorInfo;
    if (anchor == null) {
      return;
    }
    List<String> contents = _optionControllerList
        .map((e) => e.text)
        .where((element) => !Util.isStringEmpty(element, trim: true))
        .toList();

    if (true == _isEdit) {
      _isLoading = true;
      _refresh();
      BaseResponse resp = await TalentRepo.editProgram(
        rid: widget.room.rid,
        programId: widget.program!.id,
        anchorUid: anchor.uid,
        intro: anchor.intro,
        contents: contents,
      );
      _isLoading = false;
      _refresh();
      if (resp.success == true) {
        _popNav(refresh: true);
      } else if (resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    } else {
      _isLoading = true;
      _refresh();
      BaseResponse resp = await TalentRepo.addProgram(
        rid: widget.room.rid,
        anchorUid: anchor.uid,
        intro: anchor.intro,
        contents: contents,
      );
      _isLoading = false;
      _refresh();
      if (resp.success == true) {
        _popNav(refresh: true);
      } else if (resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }

  /// 返回上级页面
  /// [refresh] 上级页面是否要刷新
  void _popNav({bool? refresh}) {
    Navigator.of(context).maybePop(refresh);
  }

  Widget _buildDel() {
    if (_isEdit) {
      return GestureDetector(
        onTap: _onTapDel,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: 15.dp,
            bottom: Util.iphoneXBottom + 10.dp,
          ),
          child: Text(
            K.talent_programe_edit_del,
            style: TextStyle(
              color: _mainTxtColor,
              fontSize: 14.dp,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    } else {
      return SizedBox(height: Util.iphoneXBottom + 30.dp);
    }
  }

  void _onTapDel() async {
    FocusScope.of(context).requestFocus(FocusNode());
    bool? del = await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: K.room_talent_delete_title,
          titleTextColor: Colors.black,
          bgColor: _mainTxtColor,
          negativeButton: NegativeButton(
            bgColor: const Color(0xFFE4E7EE),
            textColor: _mainTxtColor,
          ),
          positiveButton: PositiveButton(
            bgColor: R.color.mainBrandColor,
            textColor: _mainTxtColor,
          ),
        );
      },
    );

    if (del == true) {
      var resp = await TalentRepo.delProgram(
          rid: widget.room.rid, programId: widget.program!.id);
      if (resp.success == true) {
        _popNav(refresh: true);
      } else if (resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }
}

class _AnchorInfo {
  int uid;
  String name;
  String icon;
  String? intro;
  int? starNum;

  _AnchorInfo({
    required this.uid,
    required this.name,
    required this.icon,
    this.intro,
    this.starNum,
  });

  factory _AnchorInfo.fromProgram(Program program) {
    return _AnchorInfo(
      uid: program.anchor?.uid ?? 0,
      name: program.anchor?.name ?? '',
      icon: program.anchor?.icon ?? '',
      intro: program.intro,
      starNum: program.starNum,
    );
  }

  factory _AnchorInfo.fromAddUser(TalentAddUserItem user) {
    return _AnchorInfo(
      uid: user.uid,
      name: user.name,
      icon: user.icon,
    );
  }

  void refresh(AnchorInfoResp data) {
    starNum = data.anchor?.starNum;
  }
}
