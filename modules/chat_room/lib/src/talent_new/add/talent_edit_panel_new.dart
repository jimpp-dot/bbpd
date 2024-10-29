import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/talent_new/add/talent_add_intro_dialog_new.dart';
import 'package:chat_room/src/talent_new/add/talent_add_rid_panel_new.dart';
import 'package:chat_room/src/talent_new/add/talent_add_user_panel_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

import '../../protobuf/generated/common_artcenter.pb.dart';
import '../../talent_new/talent_constants_new.dart';
import '../data/talent_repo_new.dart';
import '../talent_helper_new.dart';

typedef DateTimeCallback = void Function(DateTime dateTime);

class TalentEditNewPanel extends StatefulWidget {
  final ChatRoomData room;

  final ArtListItem? program;

  final DateTime dateTime;

  const TalentEditNewPanel({
    required this.room,
    this.program, // 如果为空，这是新增节目单页面
    required this.dateTime,
    super.key,
  });

  @override
  _TalentEditPanelNewState createState() => _TalentEditPanelNewState();

  /// 返回true要刷新
  static Future<bool?> show(BuildContext context,
      {required ChatRoomData room,
      ArtListItem? program,
      required DateTime dateTime}) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return TalentHelperNew.blurDialogWidget(
          child: TalentEditNewPanel(
            room: room,
            program: program,
            dateTime: dateTime,
          ),
        );
      },
    );
  }
}

class _TalentEditPanelNewState extends State<TalentEditNewPanel> {
  static const int _optionNum = 5;

  final List<TextEditingController> _optionControllerList = [];

  bool _isEdit = false;
  bool _isLoading = false;

  final Color _mainTxtColor = Colors.white;

  late DateTime _minTime, _maxTime;

  // 当前的主播信息
  int rid = 0;

  // 当前的主播信息
  int uid = 0;
  String icon = '', name = '', sign = '';

  DateTime _curStartTime = DateTime.now(), _curEndTime = DateTime.now();

  Duration defaultInterval = const Duration(minutes: 30);

  bool get _showAddAvatar => (uid == 0);

  @override
  void initState() {
    super.initState();
    // 初始化时间
    DateTime dateTime = widget.dateTime;
    if (Utility.isToday(dateTime)) {
      dateTime = DateTime.now();
      _minTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
              dateTime.hour, dateTime.minute)
          .add(Duration(minutes: nearMinuteBy5(dateTime.minute))); // 设置为当前时间
    } else {
      _minTime = DateTime(dateTime.year, dateTime.month, dateTime.day);
    }
    _maxTime = DateTime(dateTime.year, dateTime.month, dateTime.day)
        .add(const Duration(days: 1)); // 再加一天
    if (widget.dateTime.secondsSinceEpoch > _minTime.secondsSinceEpoch) {
      updateCurStartTime(widget.dateTime);
    } else {
      updateCurStartTime(_minTime);
    }

    _isEdit = (widget.program != null);

    List<String> contents = [];
    if (_isEdit) {
      rid = widget.program!.contentRid;

      uid = widget.program!.contentUid;
      icon = widget.program!.contentUidIcon;
      name = widget.program!.contentUidName;
      sign = widget.program!.contentUidSign;

      _curStartTime = DateTime.fromMicrosecondsSinceEpoch(
          widget.program!.startTime * 1000000);
      _curEndTime = DateTime.fromMicrosecondsSinceEpoch(
          widget.program!.endTime * 1000000);

      if (widget.program!.contentDesc.isNotEmpty) {
        contents = widget.program!.contentDesc.split(',');
      }
    }

    for (int i = 0; i < _optionNum; i++) {
      String text = "";
      if (i < contents.length) {
        text = contents[i];
      }
      _optionControllerList.add(TextEditingController(text: text));
    }
  }

  @override
  void dispose() {
    for (var element in _optionControllerList) {
      element.dispose();
    }
    super.dispose();
  }

  void updateCurStartTime(DateTime dateTime) {
    _curStartTime = dateTime;
    _curEndTime = _curStartTime.add(defaultInterval);
    if (_curEndTime.secondsSinceEpoch > _maxTime.secondsSinceEpoch) {
      _curEndTime = _maxTime;
    }
  }

  int nearMinuteBy5(int minute) {
    return ((minute ~/ 5) + 1) * 5 - minute;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.dp),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.dp),
              _buildTitle(),
              SizedBox(height: 15.dp),
              _buildArtistLine(),
              SizedBox(height: 20.dp),
              _buildTimeLine(),
              SizedBox(height: 20.dp),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _isEdit ? K.room_talent_edit_programe : K.room_talent_add_program,
          style: TextStyle(
            fontSize: 18.dp,
            color: _mainTxtColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: _onTapUpdateRid,
          child: Container(
            height: 24.dp,
            padding: EdgeInsets.symmetric(horizontal: 10.dp),
            decoration: BoxDecoration(
              border: Border.all(
                  color: _mainTxtColor.withOpacity(0.4), width: 0.5.dp),
              borderRadius: BorderRadius.circular(12.dp),
            ),
            alignment: Alignment.center,
            child: (rid > 0)
                ? Text("$rid",
                    style: TextStyle(
                      color: _mainTxtColor,
                      fontSize: 11,
                    ))
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img(
                          RoomAssets
                              .chat_room$talent_new_ic_room_talent_search_webp,
                          width: 16.dp,
                          height: 16.dp),
                      SizedBox(width: 4.dp),
                      Text(
                        K.talent_add_room,
                        style: TextStyle(
                          color: _mainTxtColor.withOpacity(0.4),
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
          ),
        )
      ],
    );
  }

  Widget _buildArtistLine() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildArtistAvatarOrAdd(),
        SizedBox(width: 10.dp),
        Expanded(child: _buildArtistInfoOrAdd()),
      ],
    );
  }

  Widget _buildArtistAvatarOrAdd() {
    Widget artistAvatar;
    if (_showAddAvatar) {
      artistAvatar = Container(
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
      artistAvatar = CommonAvatar(
        path: icon,
        size: 55.dp,
        shape: BoxShape.circle,
      );
    }
    return GestureDetector(
      onTap: _onTapUpdateArtist,
      child: artistAvatar,
    );
  }

  void _onTapUpdateArtist() async {
    var item = await TalentAddUserPanelNew.show(context);
    if (item != null) {
      uid = item.uid;
      icon = item.icon;
      name = item.name;
      refresh();
    }
  }

  void _onTapUpdateRid() async {
    int? rid = await TalentAddRidPanelNew.show(context);
    if (rid != null && rid > 0) {
      this.rid = rid;
      refresh();
    }
  }

  Widget _buildArtistInfoOrAdd() {
    Widget artistInfo;
    if (_showAddAvatar) {
      artistInfo = GestureDetector(
        onTap: _onTapUpdateArtist,
        child: Text(
          K.room_talent_add_user,
          style: TextStyle(
            color: _mainTxtColor,
            fontSize: 16.dp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      artistInfo = _buildArtistInfo();
    }
    return artistInfo;
  }

  Widget _buildArtistInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 190.dp,
              ),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: _mainTxtColor,
                  fontSize: 16.dp,
                ),
              ),
            ),
            InkWell(
              onTap: _onTapUpdateArtist,
              child: Container(
                height: 24.dp,
                padding: EdgeInsets.symmetric(horizontal: 8.dp),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.dp),
                    border: Border.all(
                        color: _mainTxtColor.withOpacity(0.4), width: 0.5.dp)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    R.img(
                        RoomAssets
                            .chat_room$talent_new_ic_room_talent_change_anchor_webp,
                        width: 12.dp,
                        height: 12.dp),
                    SizedBox(width: 4.dp),
                    Text(
                      K.room_talent_change_anchor,
                      style: TextStyle(color: _mainTxtColor, fontSize: 11.dp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.dp),
        _buildArtistSign(),
      ],
    );
  }

  Widget _buildArtistSign() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (sign.isNotEmpty == true)
          Flexible(
            child: Text(
              sign,
              style: TextStyle(
                color: _mainTxtColor.withOpacity(0.6),
                fontSize: 11.dp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        GestureDetector(
          onTap: _onTapEditArtistSign,
          child: Padding(
            padding: EdgeInsetsDirectional.all(4.dp),
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

  void _onTapEditArtistSign() async {
    var result = await TalentAddIntroNewDialog.show(context, sign);
    if (result != null) {
      sign = result;
      refresh();
    }
  }

  Widget _buildTimeLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.room_talent_program_start_time,
              style: TextStyle(
                color: _mainTxtColor.withOpacity(0.4),
                fontSize: 11.dp,
              ),
            ),
            SizedBox(width: 10.dp),
            InkWell(
              onTap: () {
                if (_isEdit) {
                  Fluttertoast.showToast(msg: K.room_talent_edit_time_tip);
                } else {
                  showSelectTime(_curStartTime, (dateTime) {
                    updateCurStartTime(dateTime);
                    setState(() {});
                  });
                }
              },
              child: Container(
                width: 90.dp,
                height: 36.dp,
                decoration: BoxDecoration(
                  color: _mainTxtColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.dp),
                ),
                child: Center(
                  child: Text(
                    Utility.formatDateToHourAndMin(
                        _curStartTime.secondsSinceEpoch),
                    style: TextStyle(
                      color: _mainTxtColor,
                      fontSize: 15.dp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.room_talent_program_end_time,
              style: TextStyle(
                color: _mainTxtColor.withOpacity(0.4),
                fontSize: 11.dp,
              ),
            ),
            SizedBox(width: 10.dp),
            InkWell(
              onTap: () {
                if (_isEdit) {
                  Fluttertoast.showToast(msg: K.room_talent_edit_time_tip);
                } else {
                  showSelectTime(_curEndTime, (dateTime) {
                    _curEndTime = dateTime;
                    setState(() {});
                  });
                }
              },
              child: Container(
                width: 90.dp,
                height: 36.dp,
                decoration: BoxDecoration(
                  color: _mainTxtColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.dp),
                ),
                child: Center(
                  child: Text(
                    Utility.formatDateToHourAndMin(
                        _curEndTime.secondsSinceEpoch),
                    style: TextStyle(
                      color: _mainTxtColor,
                      fontSize: 15.dp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showSelectTime(DateTime time, DateTimeCallback callback) {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: Colors.black,
        confirm: Text(
          K.sure,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        showTitle: true,
        itemTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        itemHeight: 48.dp,
        pickerHeight: 270.dp,
      ),
      dateFormat: K.room_talent_new_datetime_format,
      pickerMode: DateTimePickerMode.datetime,
      locale: DateTimePickerLocale.zh_cn,
      minDateTime: _minTime,
      maxDateTime: _maxTime.add(const Duration(minutes: 5)),
      initialDateTime: time,
      minuteDivider: 5,
      onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
        callback.call(dateTime);
      },
    );
  }

  List<Widget> _buildEditList() {
    double dividerHeight = 20.dp;
    List<Widget> list = [];

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
                hintStyle: TextStyle(
                    color: _mainTxtColor.withOpacity(0.4), fontSize: 14.dp),
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
                refresh();
              },
            ),
          ),
          if (!Util.isStringEmpty(textController.text))
            PositionedDirectional(
              top: 0,
              bottom: 0,
              end: 0,
              child: GestureDetector(
                onTap: () {
                  textController.clear();
                  refresh();
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(
              color: _mainTxtColor.withOpacity(0.6),
              fontSize: 14.dp,
            ),
          ),
          SizedBox(width: 18.dp),
          // 右侧编辑输入
          Expanded(child: item),
        ],
      );

      list.add(line);

      if (index != _optionControllerList.length - 1) {
        list.add(SizedBox(height: dividerHeight));
      }
    }

    return list;
  }

  Widget _buildBottomBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // 取消修改/增加
        GestureDetector(
          onTap: () {
            _popNav();
          },
          child: Container(
            height: 50.dp,
            width: 136.dp,
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
        // 确认修改/新增
        GestureDetector(
          onTap: _onTapOk,
          child: Container(
            height: 50.dp,
            width: 136.dp,
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
      ],
    );
  }

  void _onTapOk() async {
    if (uid == 0) {
      Fluttertoast.showToast(msg: K.room_talent_toast_tip_1);
      return;
    }
    if (rid == 0) {
      Fluttertoast.showToast(msg: K.room_talent_toast_tip_2);
      return;
    }
    if (_curStartTime.secondsSinceEpoch >= _curEndTime.secondsSinceEpoch) {
      Fluttertoast.showToast(msg: K.room_talent_toast_tip_3);
      return;
    }
    String contentDesc = _optionControllerList
        .map((e) => e.text)
        .where((element) => !Util.isStringEmpty(element, trim: true))
        .toList()
        .join(",");
    if (contentDesc.isEmpty) {
      Fluttertoast.showToast(msg: K.room_talent_toast_tip_4);
      return;
    }

    if (_isEdit) {
      _isLoading = true;
      refresh();
      NormalNull resp = await TalentNewRepo.editProgram(
        widget.room.realRid,
        widget.program!.artId,
        contentRid: rid,
        contentUid: uid,
        contentSign: sign,
        contentDesc: contentDesc,
        startTime: _curStartTime.secondsSinceEpoch,
        endTime: _curEndTime.secondsSinceEpoch,
      );
      _isLoading = false;
      refresh();
      if (resp.success == true) {
        _popNav(refresh: true);
      } else if (resp.msg.isNotEmpty) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    } else {
      _isLoading = true;
      refresh();
      NormalNull resp = await TalentNewRepo.addProgram(
        widget.room.realRid,
        contentRid: rid,
        contentUid: uid,
        contentSign: sign,
        contentDesc: contentDesc,
        startTime: _curStartTime.secondsSinceEpoch,
        endTime: _curEndTime.secondsSinceEpoch,
      );
      _isLoading = false;
      refresh();
      if (resp.success == true) {
        _popNav(refresh: true);
      } else if (resp.msg.isNotEmpty) {
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
            top: 18.dp,
            bottom: Util.iphoneXBottom + 10.dp,
          ),
          child: Text(
            K.talent_programe_edit_del,
            style: TextStyle(
              color: _mainTxtColor.withOpacity(0.4),
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
          title: K.room_talent_delete_title_text,
          content: K.room_talent_delete_content,
          titleTextColor: const Color(0xFF313131),
          contentTextColor: const Color(0xFF313131),
          bgColor: _mainTxtColor,
          negativeButton: const NegativeButton(
            bgColor: Color(0xFFF5F5F5),
            textColor: Color(0xB3202020),
          ),
          positiveButton: PositiveButton(
            bgColor: R.color.mainBrandColor,
            textColor: _mainTxtColor,
          ),
        );
      },
    );

    if (del == true) {
      NormalNull resp = await TalentNewRepo.delProgram(
          widget.room.realRid, widget.program!.artId);
      if (resp.success == true) {
        _popNav(refresh: true);
      } else if (resp.msg.isNotEmpty) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }
}
