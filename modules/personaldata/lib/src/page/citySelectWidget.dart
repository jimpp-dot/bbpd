import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

import '../../k.dart';

// ignore: must_be_immutable
class CitySelectWidget extends StatefulWidget {
  int selectedCityCode;

  CitySelectWidget({super.key, this.selectedCityCode = 0});

  @override
  _CitySelectWidgetState createState() => _CitySelectWidgetState();

  static Future show(BuildContext context, int selectedCityCode) {
    return displayModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: R.color.mainBgColor,
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                  )),
              padding: const EdgeInsets.only(top: 10.0),
              child: CitySelectWidget(
                selectedCityCode: selectedCityCode,
              ),
            ));
      },
      maxHeightRatio: 1.0,
    );
  }
}

class _CitySelectWidgetState extends State<CitySelectWidget> {
  List? provinceData;
  bool _loading = true;
  final double _contentH = 240.0;
  int _provinceIndex = 0;
  int _cityIndex = 0;
  late FixedExtentScrollController _fixedProvinceExtentScrollController;
  late FixedExtentScrollController _fixedCityExtentScrollController;

  _onRefresh() async {
    String url = '${System.domain}city';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
      }
      try {
        Map result = response.value();
        if (result['success'] == true) {
          provinceData = result['data'];
          _getSelectIndex(provinceData);
        }
      } catch (e) {
        Log.d(e);
      }
    } catch (e) {
      Log.d(e);
    }
    _refreshUI();
  }

  List _getCityData() {
    if (provinceData == null || (provinceData?.length ?? 0) <= _provinceIndex) {
      return [];
    }
    return provinceData![_provinceIndex]['cities'];
  }

  void _getSelectIndex(List? provincesData) {
    int indexI = 0;
    int indexJ = 0;
    provinceData?.forEach((element) {
      List cities = element['cities'];
      indexJ = 0;
      for (var element in cities) {
        int cityCode = Util.parseInt(element['citycode']);
        if (widget.selectedCityCode > 0 &&
            widget.selectedCityCode == cityCode) {
          _provinceIndex = indexI;
          _cityIndex = indexJ;
          continue;
        }
        indexJ++;
      }
      indexI++;
    });
  }

  _refreshUI() {
    _loading = false;
    _fixedProvinceExtentScrollController =
        FixedExtentScrollController(initialItem: _provinceIndex);
    _fixedCityExtentScrollController =
        FixedExtentScrollController(initialItem: _cityIndex);
    if (mounted) {
      setState(() {});
    }
  }

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

  Widget provincePicker() {
    return SizedBox(
      height: _contentH,
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (notification.runtimeType == ScrollEndNotification) {
            _fixedCityExtentScrollController.jumpToItem(0);
            setState(() {});
          }
          return true;
        },
        child: CupertinoPicker(
          itemExtent: 40,
          useMagnifier: true,
          magnification: 1.2,
          backgroundColor: R.color.mainBgColor,
          scrollController: _fixedProvinceExtentScrollController,
          onSelectedItemChanged: (index) {
            Log.d('onSelectedItemChanged$index');
            _provinceIndex = index;
          },
          children:
              provinceData?.map((e) => itemWithString(e['title'])).toList() ??
                  [],
        ),
      ),
    );
  }

  Widget cityPicker() {
    return SizedBox(
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
          scrollController: _fixedCityExtentScrollController,
          backgroundColor: R.color.mainBgColor,
          onSelectedItemChanged: (index) {},
          children:
              _getCityData().map((e) => itemWithString(e['title'])).toList(),
        ),
      ),
    );
  }

  Widget _buildContentWidget() {
    if (_loading) {
      return SizedBox(height: _contentH, child: const Loading());
    }
    if (provinceData == null || provinceData?.length == 0) {
      return SizedBox(
        height: _contentH,
        child: ErrorData(
          error: K.personaldata_no_data,
          onTap: () {
            _onRefresh();
          },
        ),
      );
    }
    return Row(
      children: [
        Expanded(flex: 1, child: provincePicker()),
        Expanded(flex: 1, child: cityPicker())
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onRefresh();
    _fixedCityExtentScrollController = FixedExtentScrollController();
    _fixedProvinceExtentScrollController = FixedExtentScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fixedCityExtentScrollController.dispose();
    _fixedProvinceExtentScrollController.dispose();
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
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    List cityList = _getCityData();
                    String result = '';
                    if (cityList.length >
                        _fixedCityExtentScrollController.selectedItem) {
                      result = cityList[_fixedCityExtentScrollController
                          .selectedItem]['citycode'];
                    }
                    Navigator.of(context).pop(result);
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
            _buildContentWidget(),
          ],
        ),
      ),
    );
  }
}
