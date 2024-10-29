import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import '../../../../k.dart';

/// 时间选择
class TimeSelectSheet extends StatefulWidget {
  final int initIndex;

  const TimeSelectSheet({super.key, required this.initIndex});

  @override
  TimeSelectSheetState createState() {
    return TimeSelectSheetState();
  }

  static Future<int?> show(
      {required BuildContext context, int initIndex = 2}) async {
    return displayModalBottomSheet(
      context: context,
      builder: (context) => TimeSelectSheet(initIndex: initIndex),
    );
  }

  static String getStringByIndex(int index) {
    switch (index) {
      case 0:
        int time =
            DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000 - 2 * 86400;
        return '${K.room_before_yesterday} ${getMonthDay(time)}';
      case 1:
        int time =
            DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000 - 1 * 86400;
        return '${K.room_yesterday} ${getMonthDay(time)}';
      case 2:
        int time = DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000;
        return '${K.room_today} ${getMonthDay(time)}';
      case 3:
        return K.room_near_7day;
      default:
        return K.room_near_30_day;
    }
  }

  static String getMonthDay(int time) {
    return Translations.currentLanguage == SupportLanguage.ZH.locale
        ? Utility.formatDateToMonthDayAndChinese(time)
        : Utility.formatDateMonthDay(time);
  }
}

class TimeSelectSheetState extends State<TimeSelectSheet> {
  late int _selectIndex;
  late final FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _selectIndex = widget.initIndex;
    _controller = FixedExtentScrollController(initialItem: _selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 44,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(12),
              topEnd: Radius.circular(12),
            ).resolve(Directionality.of(
                context)), // Border.all(width: 1, color: Color(0xff979797))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCancelWidget(),
              const Spacer(),
              _buildSelectTime(),
              const Spacer(),
              _buildConfirmWidget(),
            ],
          ),
        ),
        Container(
          height: 150 + Util.iphoneXBottom,
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            border: Border(
                top: BorderSide(color: R.color.dividerColor, width: 0.5)),
          ),
          child: CupertinoPicker(
            diameterRatio: 2,
            scrollController: _controller,
            itemExtent: 40,
            backgroundColor: R.color.mainBgColor,
            onSelectedItemChanged: onSelectedItemChanged,
            children: _buildPickers(),
          ),
        ),
      ],
    );
  }

  void onSelectedItemChanged(int index) {
    if (mounted) {
      setState(() {
        _selectIndex = index;
      });
    }
  }

  List<Widget>? pickers;

  List<Widget> _buildPickers() {
    pickers ??= [];
    for (int i = 0; i < 5; i++) {
      pickers!.add(_buildPick(TimeSelectSheet.getStringByIndex(i)));
    }
    return pickers!;
  }

  Widget _buildPick(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget _buildCancelWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 5, bottom: 5),
        child: Text(
          K.cancel,
          style: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 17,
            fontFamily: Util.fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop(_selectIndex);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 5, bottom: 5),
        child: Text(
          K.sure,
          style: TextStyle(
            color: R.color.mainBrandColor,
            fontSize: 17,
            fontFamily: Util.fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectTime() {
    return Text(
      TimeSelectSheet.getStringByIndex(_selectIndex),
      style: TextStyle(
        color: R.color.mainTextColor,
        fontSize: 18,
        fontFamily: Util.fontFamily,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
