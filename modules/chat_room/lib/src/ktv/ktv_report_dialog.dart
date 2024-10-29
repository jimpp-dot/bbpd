import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'utils/ktv_theme.dart';
import 'model/ktv_accuse_beans.dart';
import 'repo/ktv_repo.dart';

/// 举报底部弹窗
///
class KtvReportDialog extends StatefulWidget {
  final int sid;

  const KtvReportDialog({super.key, required this.sid});

  @override
  State<KtvReportDialog> createState() => _KtvReportDialogState();

  static showDialog(BuildContext context, int sid) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.88,
      builder: (context) => KtvReportDialog(sid: sid),
      supportSoftKeyBoard: true,
      disableTapDismissible: true,
    );
  }
}

class _KtvReportDialogState extends State<KtvReportDialog>
    with BaseScreenStateMixin {
  KtvAccuseModel? _data;
  AccuseConfig? _selectCofig;
  AccuseItem? _selectItem;

  bool get _commitEnable => _selectItem != null;

  late TextEditingController _textEditingController;

  final double _headerHeight = 45;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          color: KtvTheme.mainBgColor,
          borderRadius:
              const BorderRadiusDirectional.vertical(top: Radius.circular(12)),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: buildStatusContent()),
            if (_data != null) _buildConfirm(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 44, height: 40),
          Expanded(
            child: Text(
              K.ktv_report_title,
              style: TextStyle(
                color: KtvTheme.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: Container(
              width: 44,
              height: 50,
              alignment: Alignment.center,
              child: R.img(
                "room_ic_close.svg",
                package: ComponentManager.MANAGER_BASE_ROOM,
                color: KtvTheme.mainTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectTip() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8),
      child: Text(
        K.ktv_report_problem_type,
        style: TextStyle(
          fontSize: 14,
          color: KtvTheme.secondTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  @protected
  void onTapErrorWidget() {
    setScreenLoading();
    _loadData();
  }

  void _loadData() async {
    DataRsp<KtvAccuseModel> rsp = await KtvRepo.getAccuseInfo(widget.sid);
    if (rsp.success == true) {
      _data = rsp.data;
      setScreenReady();
    } else {
      setScreenError(errorMsg: rsp.msg);
    }
  }

  @override
  Widget buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSelectTip(),
          ..._buildOptions(),
          _buildFormTitle(K.ktv_report_singer),
          _buildNameInputText(_data?.singerName ?? ''),
          _buildFormTitle(K.ktv_report_song),
          _buildNameInputText(_data?.songName ?? ''),
          _buildDescriptionInput(),
        ],
      ),
    );
  }

  Widget _headerContainer({required Widget child}) {
    return Container(
      height: _headerHeight,
      width: double.infinity,
      alignment: AlignmentDirectional.centerStart,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x0D313131))),
      ),
      child: child,
    );
  }

  Widget _buildListHeader(AccuseConfig item) {
    return _headerContainer(
      child: Text(
        item.name,
        style: TextStyle(
          color: KtvTheme.mainTextColor,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildExpansionBody(AccuseConfig config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        shrinkWrap: true,
        cacheExtent: 36,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var item = config.item[index];
          bool checked = item.name == _selectItem?.name;
          return _buildExpansionItem(config, item, checked);
        },
        itemCount: config.item.length,
      ),
    );
  }

  Widget _buildExpansionItem(
      AccuseConfig config, AccuseItem item, bool checked) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectItem != item) {
            _selectItem = item;
            _selectCofig = config;
          } else {
            _selectItem = null;
            _selectCofig = null;
          }
        });
      },
      child: Row(
        children: [
          Icon(
            checked ? Icons.check_circle : Icons.check_circle_outline_rounded,
            color: checked
                ? KtvTheme.mainBrandColor
                : KtvTheme.mainTextColor.withOpacity(0.4),
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                item.name,
                style: TextStyle(color: KtvTheme.mainTextColor, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOptions() {
    return _data?.accuseConfig.map((e) {
          if (e.item.length == 1) {
            var item = e.item[0];
            bool checked = item.name == _selectItem?.name;
            return _headerContainer(
              child: _buildExpansionItem(e, item, checked),
            );
          }

          return ExpansionListItem(
            header: _buildListHeader(e),
            expandMoreIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: KtvTheme.mainTextColor.withOpacity(0.4),
            ),
            body: _buildExpansionBody(e),
          );
        }).toList() ??
        [];
  }

  Widget _buildFormTitle(String name, {bool canEdit = false}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 24, bottom: 12),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
                color: KtvTheme.mainTextColor.withAlpha(99),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          if (canEdit == false)
            const Text(
              '*',
              style: TextStyle(color: Color(0xFFFF5F7D), fontSize: 14),
            ),
        ],
      ),
    );
  }

  Widget _buildNameInputText(String text) {
    return Container(
      height: 48,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
          color: KtvTheme.formBg,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: TextStyle(color: KtvTheme.mainTextColor, fontSize: 14),
      ),
    );
  }

  Widget _buildDescriptionInput() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFormTitle(K.ktv_report_description, canEdit: true),
        Container(
          height: 144,
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 12, bottom: 12),
          decoration: BoxDecoration(
              color: KtvTheme.formBg,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: TextField(
            controller: _textEditingController,
            cursorColor: KtvTheme.cursorColor,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            scrollPadding: EdgeInsets.zero,
            enableInteractiveSelection: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: InputBorder.none,
              hintStyle: TextStyle(
                  color: KtvTheme.formHintColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              // counterText: '',
            ),
            style: TextStyle(color: KtvTheme.mainTextColor, fontSize: 14),
            maxLength: 300,
            maxLines: 12,
            autofocus: false,
            autocorrect: false,
            onChanged: (String text) {},
            onSubmitted: (text) {},
          ),
        ),
        const SizedBox(height: 24)
      ],
    );
  }

  Widget _buildConfirm() {
    return InkWell(
      onTap: _commit,
      child: Container(
        height: 48,
        margin: EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 12, bottom: 12 + Util.iphoneXBottom),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _commitEnable
                ? KtvTheme.gradientColors
                : KtvTheme.gradientColorsDisable,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          K.room_confirm,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  _commit() async {
    Log.d(
        'commit accuse mainId=${_selectCofig?.id},subId=${_selectItem?.id},des=${_textEditingController.text}');
    if (_selectItem == null || _selectCofig == null) {
      Fluttertoast.showToast(msg: K.ktv_report_pls_sel_issue_type);
      return;
    }
    var resp = await KtvRepo.accuse(
      sid: widget.sid,
      mainId: _selectCofig!.id,
      subId: _selectItem!.id,
      description: _textEditingController.text,
    );
    if (resp.success == true) {
      Fluttertoast.showToast(msg: K.ktv_report_success);
    } else if (resp.msg != null) {
      Fluttertoast.showToast(msg: resp.msg);
    }
    Navigator.of(context).maybePop();
  }
}
