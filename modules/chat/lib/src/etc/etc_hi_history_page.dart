import 'package:chat/k.dart';
import 'package:chat/src/etc/etc_hi_history_controller.dart';
import 'package:chat/src/etc/quick_reply_etc_filter_panel.dart';
import 'package:chat/src/model/pbModel/generated/ka_touch.pb.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

import 'etc_controller_key.dart';

class ETCHiHistoryPage extends StatefulWidget {
  const ETCHiHistoryPage({super.key});

  @override
  State<ETCHiHistoryPage> createState() => _ETCHiHistoryPageState();
}

class _ETCHiHistoryPageState extends State<ETCHiHistoryPage> {
  late final ETCHiHistoryController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetManager().put(ETCHiHistoryController());
  }

  @override
  void dispose() {
    GetManager().delete<ETCHiHistoryController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
      statusBrightness: Brightness.light,
      backgroundColor: Colors.transparent,
      backColor: R.color.mainTextColor,
      title: Text(
        K.chat_greeting_data,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return GetBuilder<ETCHiHistoryController>(
      id: pageKey,
      builder: (controller) {
        if (controller.historyDataStatus == ScreenStatus.Loading) {
          return const Loading();
        }
        if (controller.historyDataStatus == ScreenStatus.Error) {
          return ErrorData(onTap: controller.loadAllHistoryData);
        }
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB3EEFF), Color(0x33E6F9FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              _buildAllHistoryData(),
              Expanded(child: _buildDailyData()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAllHistoryData() {
    return GetBuilder<ETCHiHistoryController>(
      id: historyDataKey,
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 14),
            _buildHistoryTitle(),
            _buildRowData(controller.curHistoryData),
          ],
        );
      },
    );
  }

  Widget _buildHistoryTitle() {
    return Row(
      children: [
        const SizedBox(width: 12),
        _buildText(K.chat_history_data, isTitle: true),
        const Spacer(),
        _buildFilterBtn(_controller.curHistoryData.name, onTap: () {
          _showPoolSelectSheet();
        }),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildRowData(KaTouchStatModule data) {
    return Row(
      children: [
        Expanded(child: _buildRowDataItem(K.chat_launch_count, data.sendCount)),
        _buildVerDivider(),
        Expanded(
            child: _buildRowDataItem(K.chat_user_reply_count, data.replyCount)),
        _buildVerDivider(),
        Expanded(
            child:
                _buildRowDataItem(K.chat_user_reply_rate, data.replyPercent)),
      ],
    );
  }

  Widget _buildRowDataItem(String title, String value) {
    return Column(
      children: [
        _buildNumText(value),
        const SizedBox(height: 8),
        _buildText(title),
      ],
    );
  }

  Widget _buildDailyData() {
    return GetBuilder<ETCHiHistoryController>(
      id: dateDataKey,
      builder: (controller) {
        Widget child;
        if (controller.dateDataStatus == ScreenStatus.Loading) {
          child = const Loading();
        } else if (controller.dateDataStatus == ScreenStatus.Error) {
          child = Stack(
            children: [
              PositionedDirectional(
                top: 0,
                start: 12,
                child: _buildText(K.chat_filter_data, isTitle: true),
              ),
              ErrorData(onTap: controller.loadDataByDate),
            ],
          );
        } else {
          child = Column(
            children: [
              _buildDailyTitle(),
              _buildRowData(_controller.selectedDateData),
              Expanded(child: _buildUserList()),
            ],
          );
        }
        return Container(
          padding: const EdgeInsetsDirectional.only(top: 12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white70, Colors.white10],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: child,
        );
      },
    );
  }

  Widget _buildDailyTitle() {
    return Row(
      children: [
        const SizedBox(width: 12),
        _buildText(K.chat_filter_data, isTitle: true),
        const Spacer(),
        // 选择日期
        _buildFilterBtn(_controller.selectedDateText,
            width: 90, onTap: _showDatePicker),
        const SizedBox(width: 6),
        // 选择发送内容
        _buildFilterBtn(_controller.selectedMsg,
            width: 88, onTap: _showTagSelectSheet),
        const SizedBox(width: 6),
        // 选择池子
        _buildFilterBtn(_controller.selectedDailyPool,
            onTap: _showDailyPoolSelectSheet),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildUserList() {
    var list = _controller.selectedDateUserList;
    if (list.isEmpty) {
      return const EmptyWidget();
    }
    return ListView.builder(
      itemBuilder: (_, index) => _buildUserItem(list[index]),
      itemExtent: 86,
      itemCount: list.length,
    );
  }

  Widget _buildUserItem(KaTouchPoolUser item) {
    return GestureDetector(
      onTap: () {
        IChatManager chatManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        chatManager.openUserChatScreen(context,
            type: 'private', targetId: item.uid, title: item.name);
      },
      child: Container(
        width: Util.width,
        height: 74,
        margin:
            const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 12),
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            CommonAvatar(
              path: item.avatar,
              size: 50,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 12),
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF222222)),
            ),
            const SizedBox(width: 4),
            R.img(
              item.sex == 1
                  ? BaseAssets.shared$ic_male_svg
                  : BaseAssets.shared$ic_female_svg,
              width: 12,
              height: 12,
              color: item.sex == 1
                  ? const Color(0xFF3B82FF)
                  : const Color(0xFFFE6BA3),
            ),
            const Spacer(),
            _buildPoolText(
                _controller.getPoolNameById(item.poolId),
                item.poolId == 1
                    ? const Color(0xFFFF794E)
                    : const Color(0xFFFFA318)),
          ],
        ),
      ),
    );
  }

  Widget _buildVerDivider() {
    return Container(
      width: 1,
      height: 14,
      color: R.color.dividerColor,
      margin: const EdgeInsetsDirectional.only(top: 42, bottom: 42),
    );
  }

  Widget _buildPoolText(String? text, Color color) {
    if (Util.isStringEmpty(text)) return const SizedBox.shrink();
    return Container(
      width: 60,
      height: 30,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(
        text!,
        style:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color),
      ),
    );
  }

  Widget _buildText(String text, {bool isTitle = false}) {
    return Text(
      text,
      style: isTitle
          ? const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)
          : const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
    );
  }

  Widget _buildNumText(String text) {
    return NumText(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
    );
  }

  Widget _buildFilterBtn(String text,
      {required VoidCallback onTap, double width = 64}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 26,
        padding: const EdgeInsetsDirectional.only(start: 8, end: 6),
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: Color(0xFF4EAAFF),
          borderRadius: BorderRadius.all(Radius.circular(13)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: NumText(
                text.toCharacterBreakStr(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            R.img(
              BaseAssets.shared$ic_expand_down_svg,
              width: 12,
              height: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() {
    var now = DateTime.now();
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: R.color.secondBgColor,
        cancel: Text(
          K.chat_cancel_button,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 17),
        ),
        confirm: Text(
          K.chat_sure,
          style: TextStyle(color: R.color.mainBrandColor, fontSize: 17),
        ),
        itemTextStyle: TextStyle(color: R.color.mainTextColor, fontSize: 15),
        itemHeight: 40,
      ),
      minDateTime: DateTime.now().subtract(const Duration(days: 90)),
      maxDateTime: DateTime(now.year, now.month, now.day),
      initialDateTime: now,
      onConfirm: (dateTime, selectedIndex) =>
          _controller.loadDataByDate(showLoading: false, dateTime: dateTime),
    );
  }

  void _showPoolSelectSheet() async {
    List<SheetItem> res = _controller.historyPoolFilterItems;
    if (res.isEmpty) {
      return;
    }
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.chat_pool_filter, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    _controller.updateHistoryFilter(result.index);
  }

  void _showTagSelectSheet() async {
    var result = await QuickReplyEtcFilterPanel.show(
        context, _controller.cacheTagList, (list) {
      _controller.cacheTagList = list;
    });
    if (result is List && result.length == 2) {
      _controller.updateDailyTagFilter(result[0], result[1]);
    }
  }

  void _showDailyPoolSelectSheet() async {
    List<SheetItem> res = _controller.dailyPoolFilterItems;
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.chat_pool_filter, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    _controller.updateDailyPoolFilter(result.index);
  }
}
