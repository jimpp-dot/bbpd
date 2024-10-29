import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import '../../k.dart';

class NumSelectWidget extends StatefulWidget {
  final int defaultValue;
  final List<int> valueList;

  const NumSelectWidget(
      {Key? key, required this.defaultValue, required this.valueList})
      : super(key: key);

  @override
  _NumSelectWidgetState createState() =>
      _NumSelectWidgetState(defaultValue, valueList);

  static Future show(
      BuildContext context, int defaultValue, List<int> valueList) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
              )),
          padding: const EdgeInsets.only(top: 10.0),
          child: NumSelectWidget(
            defaultValue: defaultValue,
            valueList: valueList,
          ),
        );
      },
      maxHeightRatio: 1.0,
    );
  }
}

class _NumSelectWidgetState extends State<NumSelectWidget> {
  final int defaultValue;
  final List<int> valueList;
  final double _contentH = 240.0;
  late FixedExtentScrollController _scrollController;

  _NumSelectWidgetState(this.defaultValue, this.valueList);

  Widget itemWithString(String title) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text(
        title,
        style: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 17,
          fontFamily: Util.fontFamily,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget cityPicker() {
    return SizedBox(
      width: Util.width,
      height: _contentH,
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (notification.runtimeType == ScrollEndNotification) {}
          return true;
        },
        child: CupertinoPicker(
          itemExtent: 40,
          useMagnifier: true,
          magnification: 1.2,
          scrollController: _scrollController,
          backgroundColor: R.color.mainBgColor,
          onSelectedItemChanged: (index) {},
          children: valueList.map((e) => itemWithString('$e')).toList(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    int initialItem = 0;
    for (int i = 0; i < valueList.length; i++) {
      if (valueList[i] == defaultValue) {
        initialItem = i;
        break;
      }
    }
    _scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.color.mainBgColor,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
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
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pop(valueList[_scrollController.selectedItem]);
                  },
                  child: Text(
                    K.sure,
                    style: TextStyle(
                      color: R.color.mainBrandColor,
                      fontSize: 17,
                      fontFamily: Util.fontFamily,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
            cityPicker(),
          ],
        ),
      ),
    );
  }
}
