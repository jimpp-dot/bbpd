import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';
import 'searchConditionScreen.dart';

final List kHotCity = [
  {'name': R.array('hot_city')[0], 'code': 10},
  {'name': R.array('hot_city')[1], 'code': 21},
  {'name': R.array('hot_city')[2], 'code': 20},
  {'name': R.array('hot_city')[3], 'code': 755},
  {'name': R.array('hot_city')[4], 'code': 571},
  {'name': R.array('hot_city')[5], 'code': 27},
  {'name': R.array('hot_city')[6], 'code': 28},
  {'name': R.array('hot_city')[7], 'code': 23},
  {'name': R.array('hot_city')[8], 'code': 512},
  {'name': R.array('hot_city')[9], 'code': 29},
  {'name': R.array('hot_city')[10], 'code': 25},
  {'name': R.array('hot_city')[11], 'code': 731},
  {'name': R.array('hot_city')[12], 'code': 371},
  {'name': R.array('hot_city')[13], 'code': 22},
  {'name': R.array('hot_city')[14], 'code': 574},
];

/// 地理位置
class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CityScreen(),
      settings: const RouteSettings(name: '/city'),
    ));
  }
}

class _CityState extends State<CityScreen> {
  int _cityCode = 0;
  bool isInitCity = false;

  _CityState() : super();

  @override
  void initState() {
    initParam();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    Location.shutdown();
  }

  void initParam() {
    _cityCode = Config.getInt('location.cityCode', 0);
    String cityName = Config.get('location.cityName', '');
    if (_cityCode > 0 || cityName == K.selector_no_limit) {
      // 进入选择城市页面之前已经选择过城市或不限，自动定位后不自动刷城市状态
      isInitCity = true;
    }
  }

  void onChooseFinish(int code, String name) {
    Map<String, String> result = {};
    result['cityCode'] = code.toString();
    result['cityName'] = name;

    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> hotWidgets = [];
    for (var city in kHotCity) {
      hotWidgets.add(Item(
        name: city['name'],
        code: city['code'],
        state: city['code'] == _cityCode
            ? ButtonState.Enable
            : ButtonState.Disable,
        callback: onChooseFinish,
      ));
    }

    List<Widget> widgets = [
      Container(
        alignment: AlignmentDirectional.centerStart,
        child: Item(
          name: K.selector_no_limit,
          code: 0,
          state: _cityCode == 0 ? ButtonState.Enable : ButtonState.Disable,
          callback: onChooseFinish,
        ),
      ),
      Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.only(top: 30),
        child: Text(
          K.selector_location,
          textScaleFactor: 1.0,
          style: R.textStyle.caption.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.only(top: 10),
        child: ItemAuto(
          cityCode: _cityCode,
          onLocationChangedFunc: (code, name) {
            if (mounted) {
              setState(
                () {
                  _cityCode = code;
                },
              );
            }
          },
          callback: onChooseFinish,
          isInitCity: isInitCity,
        ),
      ),
      Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.only(top: 30),
        child: Text(
          K.selector_hot,
          textScaleFactor: 1.0,
          style: R.textStyle.caption.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      SizedBox(
        height: 400,
        child: GridView.count(
          primary: true,
          padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          crossAxisCount: 4,
          childAspectRatio: 3,
          children: hotWidgets,
        ),
      )
    ];

    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.geo_position,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 23),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef OnFinishFunc = Function(int code, String name);

class Item extends StatelessWidget {
  final String name;
  final ButtonState state;
  final int code;
  final OnFinishFunc? callback;

  const Item(
      {Key? key,
      required this.name,
      required this.code,
      required this.state,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = state == ButtonState.Enable;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (callback != null) {
          callback!(code, name);
        }
      },
      child: Container(
        height: 28.0,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selected ? R.colors.mainBrandColor : R.colors.moduleBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          name,
          style: selected
              ? R.textStyle.body2.copyWith(color: Colors.white)
              : R.textStyle.body2.copyWith(color: R.colors.secondTextColor),
        ),
      ),
    );
  }
}

typedef OnLocationChangedFunc = Function(int cityCode, String cityName);

/// 自动定位
class ItemAuto extends StatefulWidget {
  final OnLocationChangedFunc onLocationChangedFunc;
  final int cityCode;
  final OnFinishFunc? callback;
  final bool isInitCity;

  const ItemAuto({
    Key? key,
    required this.cityCode,
    required this.onLocationChangedFunc,
    this.callback,
    required this.isInitCity,
  }) : super(key: key);

  @override
  _ItemAutoState createState() => _ItemAutoState();
}

class _ItemAutoState extends State<ItemAuto> {
  String _message = K.wait_locationing;
  String _city = K.selector_locationing;
  int _code = -1;

  @override
  void initState() {
    _checkPermission();
    super.initState();
  }

  void _checkPermission() async {
    BBLocationData? loc =
        await Location.updateLocation(needPermissionDialog: true);
    if (loc == null || !loc.isValid()) {
      _message = K.get_city_failed;
      if (!mounted) return;
      setState(() {});
      return;
    }
    if (loc.citycode != null) {
      if (!widget.isInitCity) {
        Config.set('location.cityName', loc.city ?? '');
        Config.set('location.cityCode', loc.citycode);
        Config.set('location.longitude', loc.latitude.toString());
        Config.set('location.latitude', loc.latitude.toString());

        widget.onLocationChangedFunc(
            Util.parseInt(loc.citycode), loc.city ?? '');
      }

      _city = loc.city?.replaceAll('市', '') ?? '';
      _code = Util.parseInt(loc.citycode);
      _message = '(${K.selector_locationed}$_city)';

      if (!mounted) return;
      setState(() {});
    } else {
      _message = K.get_city_failed;
      if (!mounted) return;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    bool selected = _code == widget.cityCode;
    return Row(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (_code > 0 && widget.callback != null) {
              widget.callback!(_code, _city);
            } else {
              _checkPermission();
            }
          },
          child: Container(
            height: 28.0,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: selected ? R.color.mainBrandColor : R.colors.moduleBgColor,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: Text(
              _city,
              style: selected
                  ? R.textStyle.body1.copyWith(color: Colors.white)
                  : Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: R.colors.secondBgColor),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            _message,
            textScaleFactor: 1.0,
            style: R.textStyle.caption.copyWith(color: R.colors.mainBrandColor),
          ),
        )
      ],
    );
  }
}
