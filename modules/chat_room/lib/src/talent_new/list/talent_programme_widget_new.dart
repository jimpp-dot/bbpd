import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent_new/list/talent_programme_list_add_new.dart';
import 'package:chat_room/src/talent_new/list/talent_programme_listitem_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

import '../../../assets.dart';
import '../../protobuf/generated/common_artcenter.pb.dart';
import '../add/talent_edit_panel_new.dart';
import '../data/talent_repo_new.dart';
import '../talent_constants_new.dart';
import '../talent_helper_new.dart';

/// 节目单列表页面
class TalentProgrammeListNewWidget extends StatefulWidget {
  final ChatRoomData room;

  const TalentProgrammeListNewWidget({
    super.key,
    required this.room,
  });

  static showOptionsPanel(BuildContext context, ChatRoomData room) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return TalentHelperNew.blurDialogWidget(
          child: TalentProgrammeListNewWidget(
            room: room,
          ),
        );
      },
    );
  }

  @override
  TalentProgrammeListNewWidgetState createState() =>
      TalentProgrammeListNewWidgetState();
}

class TalentProgrammeListNewWidgetState
    extends State<TalentProgrammeListNewWidget> with BaseScreenStateMixin {
  List<ArtListItem> _data = [];

  AutoScrollController controller = AutoScrollController(
    //add this for advanced viewport boundary. e.g. SafeArea
    viewportBoundaryGetter: defaultViewportBoundaryGetter,
    //choose vertical/horizontal
    axis: Axis.vertical,
  );

  DateTime _curTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  // 有数据的时候盖在List上的loading
  bool _isLoading = false;

  final Color _mainTxtColor = Colors.white;

  bool canCopy = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildTitle(),
          Expanded(child: buildStatusContent()),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        _buildList(),
        if (_isLoading) const Loading(),
      ],
    );
  }

  _loadData({int scrollIndex = -1}) async {
    ResArtList resp = await TalentNewRepo.programList(
        widget.room.realRid, _curTime.secondsSinceEpoch);
    _isLoading = false;
    if (resp.success == true) {
      _data = resp.list;
      canCopy = resp.canCopy;
      if (_data.isNotEmpty == true) {
        setScreenReady();

        if (scrollIndex < 0 || scrollIndex >= _data.length) {
          // 首次进来 自动滚动到当前主播
          scrollIndex = _getScrollIndexByLiving();
        }
        _scrollToIndex(scrollIndex);
      } else {
        setScreenEmpty(
            emptyMsg: K.room_talent_programe_list_empty_2,
            emptyMsgColor: Colors.white.withOpacity(0.6));
      }
    } else {
      if (_data.isEmpty) {
        setScreenError(errorMsg: resp.msg);
      } else {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }

  int _getScrollIndexByLiving() {
    int curLivingIndex = -1;
    _data.forEachIndexed((i, e) {
      if (e.onLive) {
        curLivingIndex = i;
        return;
      }
    });
    return curLivingIndex;
  }

  void _scrollToIndex(int index) {
    if (index >= 0 && index < _data.length) {
      Future.delayed(const Duration(milliseconds: 500), () {
        controller.scrollToIndex(index,
            preferPosition: AutoScrollPosition.begin);
      });
    }
  }

  bool get _hasPermission => TalentHelperNew.hasEditPermission(widget.room);

  bool get _hasAdd =>
      _hasPermission &&
      !Utility.checkBeforeDateNow(_curTime.secondsSinceEpoch, overOneDay: true);

  Widget _buildList() {
    int itemCount = _hasAdd ? _data.length + 1 : _data.length;
    Log.d(tag: TAG, "itemCount:$itemCount");
    return ListView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == _data.length) {
            return AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              child: TalentListItemAddNew(
                room: widget.room,
                index: index,
                addCallback: () {
                  _goAddOrEditProgram(null, scrollIndex: index);
                },
              ),
            );
          } else {
            var program = _data[index];
            return AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              child: TalentProgrammeListItemNew(
                key: ValueKey(program.artId),
                room: widget.room,
                index: index,
                last: (index == _data.length - 1),
                program: program,
                isEditing: (_hasPermission &&
                    !Utility.checkBeforeDateNow(program.endTime)),
                isPermission: _hasPermission,
                editCallback: () {
                  _goAddOrEditProgram(program, scrollIndex: index);
                },
              ),
            );
          }
        });
  }

  @override
  @protected
  void onTapErrorWidget() {
    _loadData();
    setScreenLoading();
  }

  @override
  Widget buildEmptyWidget() {
    if (_hasAdd) {
      String emptyStr =
          canCopy ? K.room_talent_copy_hint : K.room_talent_programe_list_empty;
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emptyStr,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 34.dp),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildEmptyBtn(K.room_talent_add_2, _onTapEmptyAdd),
                if (canCopy) ...[
                  SizedBox(width: 15.dp),
                  _buildEmptyBtn(K.room_talent_copy, _onTapEmptyCopy),
                ]
              ],
            ),
          ],
        ),
      );
    } else {
      return super.buildEmptyWidget();
    }
  }

  Widget _buildEmptyBtn(String text, VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 52.dp,
        width: 150.dp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: buttonColors,
          ),
          borderRadius: BorderRadius.circular(26.dp),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.dp,
          ),
        ),
      ),
    );
  }

  void _onTapEmptyAdd() {
    _goAddOrEditProgram(null);
  }

  void _onTapEmptyCopy() {
    // 复制
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
      dateFormat: K.room_talent_new_date_format,
      pickerMode: DateTimePickerMode.date,
      locale: DateTimePickerLocale.zh_cn,
      minDateTime: DateTime.now().add(const Duration(days: -7)),
      maxDateTime: DateTime.now().add(const Duration(days: 14)),
      initialDateTime: _curTime,
      onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
        _onCopyProgram(dateTime);
      },
    );
  }

  void _goAddOrEditProgram(ArtListItem? program, {int scrollIndex = -1}) async {
    // 新增
    bool? refresh = await TalentEditNewPanel.show(context,
        room: widget.room, dateTime: getLastTime(), program: program);
    Log.d(tag: TAG, 'add panel need refresh->$refresh');
    if (refresh == true) {
      _refreshData(scrollIndex: scrollIndex);
    }
  }

  DateTime getLastTime() {
    if (!Util.isCollectionEmpty(_data)) {
      ArtListItem lastItem = _data[_data.length - 1];
      return DateTime.fromMillisecondsSinceEpoch(lastItem.endTime * 1000);
    }
    return _curTime;
  }

  void _refreshData({int scrollIndex = -1}) {
    _isLoading = true;
    refresh();
    _loadData(scrollIndex: scrollIndex);
  }

  void _onCopyProgram(DateTime dateTime) async {
    NormalNull resp = await TalentNewRepo.copyProgram(widget.room.realRid,
        dateTime.secondsSinceEpoch, _curTime.secondsSinceEpoch);
    if (resp.success) {
      _refreshData();
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 12.dp, top: 14.dp, bottom: 14.dp, end: 12.dp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            K.room_talent_program_list_title,
            style: TextStyle(
              color: _mainTxtColor,
              fontSize: 18.dp,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (_hasPermission)
            InkWell(
              onTap: _onTapDatePicker,
              child: Container(
                height: 36.dp,
                padding: EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(12.dp),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(
                        RoomAssets
                            .chat_room$talent_new_ic_room_talent_search_webp,
                        width: 20.dp,
                        height: 20.dp),
                    SizedBox(width: 4.dp),
                    Text(
                      Utility.formatDateToDayFromDateTime(_curTime),
                      style: TextStyle(
                        color: _mainTxtColor,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onTapDatePicker() {
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
      dateFormat: K.room_talent_new_date_format,
      pickerMode: DateTimePickerMode.date,
      locale: DateTimePickerLocale.zh_cn,
      minDateTime: DateTime.now().add(const Duration(days: -7)),
      maxDateTime: DateTime.now().add(const Duration(days: 14)),
      initialDateTime: _curTime,
      onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
        _curTime = dateTime;
        setState(() {});
        _refreshData();
      },
    );
  }
}
