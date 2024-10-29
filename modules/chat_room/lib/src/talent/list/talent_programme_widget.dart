import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent/add/talent_edit_panel.dart';
import 'package:chat_room/src/talent/data/talent_main_view_model.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';
import 'package:chat_room/src/talent/data/talent_repo.dart';

import '../talent_constants.dart';
import '../talent_helper.dart';
import 'talent_programme_list_add.dart';
import 'talent_programme_listitem.dart';

/// 节目单列表页面
class TalentProgrammeListWidget extends StatefulWidget {
  final ChatRoomData room;
  final TalentMainViewModel mainVM;

  const TalentProgrammeListWidget({
    super.key,
    required this.room,
    required this.mainVM,
  });

  static Future showOptionsPanel(
      BuildContext context, ChatRoomData room, TalentMainViewModel mainVM) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return TalentHelper.blurDialogWidget(
          child: TalentProgrammeListWidget(
            room: room,
            mainVM: mainVM,
          ),
        );
      },
    );
  }

  @override
  TalentProgrammeListWidgetState createState() =>
      TalentProgrammeListWidgetState();
}

class TalentProgrammeListWidgetState extends State<TalentProgrammeListWidget>
    with BaseScreenStateMixin {
  ProgramListResp? _data;

  bool _isEditing = false;

  // 有数据的时候盖在List上的loading
  bool _isLoading = false;

  final Color _mainTxtColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.mainVM,
      child: Container(
        // width: panelWith,
        child: SafeArea(child: buildStatusContent()),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    double listBottomPadding = 0;
    if (_hasEditPermission) {
      listBottomPadding = 74.dp;
    }

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        PositionedDirectional(
          top: 0,
          bottom: listBottomPadding,
          start: 0,
          end: 0,
          child: Column(
            children: [
              _buildTitle(),
              Expanded(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black,
                        Colors.transparent,
                        Colors.transparent
                      ],
                      stops: [0.0, 0.05, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstOut,
                  child: _buildListSelector(),
                ),
              ),
            ],
          ),
        ),
        if (_hasEditPermission)
          PositionedDirectional(
            height: 60.dp,
            bottom: 14.dp,
            child: _buildBottom(),
          ),
        if (_isLoading) const Loading(),
      ],
    );
  }

  Selector<TalentMainViewModel, BroadcasterInfoResp?> _buildListSelector() {
    return Selector<TalentMainViewModel, BroadcasterInfoResp?>(
      selector: (ctx, vm) => vm.data,
      builder: (context, data, child) {
        return _buildList(data?.broadcasterInfo?.programId);
      },
    );
  }

  @override
  @protected
  void onTapErrorWidget() {
    _loadData();
    setScreenLoading();
  }

  @override
  @protected
  onTapEmptyWidget() {
    if (TalentHelper.hasEditPermission(widget.room)) {
      TalentEditPanel.show(context, room: widget.room);
    } else {
      _loadData();
      setScreenLoading();
    }
  }

  refreshData() {
    if (mounted) {
      _loadData();
    }
  }

  _loadData() async {
    DataRsp<ProgramListResp> resp =
        await TalentRepo.programList(widget.room.rid);
    _isLoading = false;
    if (resp.success == true) {
      _data = resp.data;
      if (_data?.programList.isNotEmpty == true) {
        setScreenReady();
      } else {
        setScreenEmpty(handleEmptyTap: true);
      }
    } else if (_data == null) {
      setScreenError(errorMsg: resp.msg);
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  bool get _hasEditPermission => TalentHelper.hasEditPermission(widget.room);

  Widget _buildList(int? currentProgramId) {
    if (_data?.programList.isEmpty ?? true) {
      return const EmptyWidget();
    }
    var list = <Widget>[];

    for (int i = 0; i < _data!.programList.length; i++) {
      var program = _data!.programList[i];
      var item = TalentProgrammeListItem(
        key: ValueKey(program.id),
        room: widget.room,
        index: i,
        program: program,
        performing: program.id == currentProgramId,
        isEditing: _isEditing,
        reloadCallback: (index) {
          _loadData();
        },
        onUpCallback: (index) {
          if (index > 0) {
            _data!.programList.swap(index - 1, index);
            _refresh();
          }
        },
        onDownCallback: (index) {
          if (index < _data!.programList.length - 1) {
            _data!.programList.swap(index, index + 1);
            _refresh();
          }
        },
      );
      list.add(item);
    }

    if (_isEditing && _hasEditPermission) {
      list.add(TalentListItemAdd(
        room: widget.room,
        index: list.length,
        reloadCallback: (index) {
          _isLoading = true;
          _refresh();
          _loadData();
        },
      ));
    }

    if (_isEditing) {
      return ListView(
        children: list,
      );
      /*return ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = _data.programList.removeAt(oldIndex);
          _data.programList.insert(newIndex, item);
          _refresh();
        },
        children: list,
      );*/
    } else {
      return ListView(
        children: list,
      );
    }
  }

  Widget _buildBottom() {
    if (_isEditing) {
      return _buildBottomEditBtn();
    } else {
      return _buildNormalMode();
    }
  }

  /// 底部按钮的编辑模式，放弃保存和保存编辑
  Widget _buildBottomEditBtn() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildExistSave(),
        SizedBox(width: 20.dp),
        _buildSave(),
      ],
    );
  }

  /// 底部按钮的普通模式，编辑按钮
  Widget _buildNormalMode() {
    return GestureDetector(
      onTap: () {
        _onTapEditProgram();
      },
      child: Center(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          height: 52.dp,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 53.dp),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: buttonColors,
            ),
            borderRadius: BorderRadius.circular(26.dp),
          ),
          child: Text(
            K.room_talent_edit_program,
            style: TextStyle(color: Colors.white, fontSize: 16.dp),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapEditProgram() async {
    _isEditing = true;
    _refresh();
  }

  Widget _buildSave() {
    return GestureDetector(
      onTap: _onTapSaveSort,
      child: Container(
        height: 52.dp,
        padding: EdgeInsets.symmetric(horizontal: 37.dp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: buttonColors,
          ),
          borderRadius: BorderRadius.circular(26.dp),
        ),
        child: Text(
          K.room_talent_edit_save,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.dp,
          ),
        ),
      ),
    );
  }

  Widget _buildExistSave() {
    return GestureDetector(
      onTap: () {
        _isEditing = false;
        _refresh();
      },
      child: Container(
        height: 52.dp,
        padding: EdgeInsets.symmetric(horizontal: 37.dp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.dp),
          border:
              Border.all(width: 1, color: talentMainTxtColor.withOpacity(0.4)),
        ),
        child: Text(
          K.room_talent_giveup_save,
          style: TextStyle(
            color: talentMainTxtColor,
            fontSize: 16.dp,
          ),
        ),
      ),
    );
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  Future<void> _onTapSaveSort() async {
    var idList = _data!.programList.map((e) => e.id).toList();
    var resp = await TalentRepo.sortProgram(rid: widget.room.rid, ids: idList);
    if (resp.success == true) {
      _isLoading = true;
      _isEditing = false;
      _refresh();
      _loadData();
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  void exitEdit() {
    _isEditing = false;
    _refresh();
  }

  Widget _buildTitle() {
    return Container(
      padding:
          EdgeInsetsDirectional.only(start: 14.dp, top: 20.dp, bottom: 10.dp),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        K.room_talent_program_list_title,
        style: TextStyle(
          color: _mainTxtColor,
          fontSize: 18.dp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
