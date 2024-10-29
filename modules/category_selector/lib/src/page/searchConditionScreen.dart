// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:category_selector/k.dart';
import 'package:flutter/material.dart';

import 'cityScreen.dart';
import 'searchResultScreen.dart';

enum ButtonState {
  Enable,
  Disable,
}

class SearchConditionScreen extends StatefulWidget {
  const SearchConditionScreen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SearchConditionScreen(),
      settings: const RouteSettings(name: '/searchConditionScreen'),
    ));
  }
}

class _ScreenState extends State<SearchConditionScreen> {
  String _filterCate = '';
  List<int> _filterCid = [];
  int _cityCode = 0;
  String _cityName = '';

  List filters = [];
  final List<String> _allowFilters = ['sex', 'city', 'age'];

  @override
  void initState() {
    super.initState();
    _initParam();
    _load();
  }

  void _initParam() {
    var localCityName = Config.get('location.cityName', '');
    var localCityCode = Config.getInt('location.cityCode', 0);
    var lastCid = Config.get('friend.lastcids', '[0]');
    var lastName = Config.get('friend.lastName', K.selector_no_limit);
    var lastCidList = jsonDecode(lastCid);

    lastCidList.forEach((item) {
      _filterCid.add(Util.parseInt(item));
    });

    _filterCate = lastName;
    _cityCode = localCityCode;
    _cityName = localCityCode > 0 ? localCityName : K.selector_no_limit;
  }

  _load() async {
    String url = '${System.domain}home/strangerswitch';
    final Map<String, String> params = {"cid": '0', "version": "1"};

    XhrResponse response = await Xhr.postJson(url, params);
    if (response.error != null) {
      return;
    }
    Map res = response.response as Map;
    if (res['success'] == false) {
      return;
    }

    Log.d('_load res:$res');

    if (res['cid'] != null) {
      _filterCid.clear();
      _filterCid.add(Util.parseInt(res['cid']));
    }

    if (res['name'] != null) {
      _filterCate = res['name'];
    }

    if (res['data'] != null && res['data'] is List) filters = res['data'];

    if (mounted) setState(() {});
  }

  void _onSearch() async {
    Map<String, Object> values = {
      'cid': jsonDecode(_filterCid.toString()),
      'cname': _filterCate,
      'city': _cityCode > 0 ? 'city' : 'all',
    };

    if (filters.isEmpty) return;

    for (var filter in filters) {
      List value = filter['value'];
      if (value.length == 1) {
        values[filter['key']] = value.first.toString();
      } else if (value.length == 2) {
        values[filter['key'] + 'min'] = value.first.toString();
        values[filter['key'] + 'max'] = value.last.toString();
      } else {
        values[filter['key']] = value;
      }
    }

    SearchResultScreen.show(context, params: values);
  }

  Widget _renderFooter() {
    return BottomButton.of(
      title: K.selector_find,
      onTap: _onSearch,
    );
  }

  void _onTapCategory() async {
    ICertificateManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_CERTIFICATE);
    Map res = await manager.openCategoryInterestScreen(context);
    bool allChose = res['allChoosed'] ?? false;
    if (allChose) {
      Config.set('friend.lastcids', '[0]');
      Config.set('friend.lastName', K.selector_no_limit);
      _filterCid = [0];
      _filterCate = K.selector_no_limit;
    } else {
      Config.set('friend.lastcids', jsonEncode(res['cids']));
      Config.set('friend.lastName', res['name']);
      _filterCid = res['cids'];
      _filterCate = res['name'];
    }
    if (mounted) setState(() {});
  }

  void _onTapCity() async {
    Map? res = await CityScreen.show(context);
    if (res == null) {
      return;
    }
    _cityCode = Util.parseInt(res['cityCode']);
    _cityName = res['cityName'];

    Config.set('location.cityCode', _cityCode.toString());
    Config.set('location.cityName', _cityName);
    if (mounted) setState(() {});
  }

  void _onFilterValueChanged(String id, Object newValue) {
    Map? filter = _getFilterByKey(id);
    if (filter == null) return;
    filter['value'] = newValue is List ? newValue : [newValue];
    setState(() {});
  }

  Map? _getFilterByKey(String key) {
    if (filters.isNotEmpty) {
      for (int i = 0; i < filters.length; i++) {
        Map filter = filters[i];
        if (filter['key'] == key) return filter;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListTile(
        title: Text(K.interest,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: R.colors.mainTextColor)),
        trailing: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_filterCate,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: R.colors.mainTextColor)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconTheme(
                    data: Theme.of(context)
                        .iconTheme
                        .copyWith(color: R.colors.secondTextColor),
                    child: const Icon(Icons.navigate_next)),
              )
            ],
          ),
        ),
        onTap: _onTapCategory,
      ),
      ListTile(
        title: Text(K.geo_position,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: R.colors.mainTextColor)),
        trailing: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_cityName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: R.colors.mainTextColor)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconTheme(
                    data: Theme.of(context)
                        .iconTheme
                        .copyWith(color: R.colors.secondTextColor),
                    child: const Icon(Icons.navigate_next)),
              )
            ],
          ),
        ),
        onTap: _onTapCity,
      ),
    ];

    if (filters.isNotEmpty) {
      for (var filter in filters) {
        if (_allowFilters.contains(filter['key'])) {
          Widget widget = _parseFilterWidget(filter, _onFilterValueChanged);
          widgets.add(widget);
        }
      }
    }

    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.find_condition,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: widgets,
              ),
            ),
          ),
          _renderFooter()
        ],
      ),
    );
  }

  Widget _parseFilterWidget(Map data, OnFilterValueChanged onValueChanged) {
    switch (data['type']) {
      case 'radio':
        return FilterRadioWidget(
          name: data['name'],
          id: data['key'],
          value: data['value'],
          data: data['data'],
          onFilterValueChanged: onValueChanged,
        );
      case 'range':
        return FilterRangeWidget(
          name: data['name'] ?? '',
          id: data['key'] ?? '',
          value: data['value'],
          min: Util.parseInt(data['min']),
          max: Util.parseInt(data['max']),
          onFilterValueChanged: onValueChanged,
        );
    }
    return const SizedBox.shrink();
  }
}

typedef OnFilterValueChanged = Function(String id, Object newValue);

class FilterRadioWidget extends StatelessWidget {
  final String name;
  final String id;
  final List data;
  final List value;
  final OnFilterValueChanged onFilterValueChanged;

  const FilterRadioWidget({
    Key? key,
    required this.name,
    required this.id,
    required this.data,
    required this.value,
    required this.onFilterValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (data.isNotEmpty) {
      String selectValue = value.first.toString();
      for (var item in data) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: FilterRadioItemWidget(
              name: item['name'] ?? '',
              state: selectValue == item['key'].toString()
                  ? ButtonState.Enable
                  : ButtonState.Disable,
              callback: () {
                onFilterValueChanged(id, item['key']);
              },
            ),
          ),
        );
      }
    }
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: R.colors.mainTextColor),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widgets,
          ),
        ],
      ),
    );
  }
}

class FilterRadioItemWidget extends StatelessWidget {
  final String name;
  final ButtonState state;
  final VoidCallback? callback;

  const FilterRadioItemWidget(
      {Key? key,
      required this.name,
      this.state = ButtonState.Disable,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = state == ButtonState.Enable;
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 28.0,
        padding: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          color: selected ? R.colors.mainBrandColor : R.colors.moduleBgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          name,
          style: selected
              ? Theme.of(context)
                  .primaryTextTheme
                  .bodyMedium!
                  .copyWith(color: R.colors.mainTextColor)
              : R.textStyle.body2.copyWith(color: R.colors.thirdTextColor),
        ),
      ),
    );
  }
}

class FilterRangeWidget extends StatefulWidget {
  final int min;
  final int max;
  final String name;
  final String id;
  final List value;
  final OnFilterValueChanged onFilterValueChanged;

  const FilterRangeWidget({
    Key? key,
    required this.name,
    required this.id,
    required this.value,
    required this.min,
    required this.max,
    required this.onFilterValueChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilterRangeState();
  }
}

class _FilterRangeState extends State<FilterRangeWidget> {
  double _lowerValue = 0;
  double _upperValue = 0;

  @override
  void initState() {
    super.initState();
    _lowerValue = widget.min.toDouble();
    _upperValue = widget.max.toDouble();
    if (widget.value.length == 2) {
      _lowerValue = Util.parseDouble(widget.value[0], 18);
      _upperValue = Util.parseDouble(widget.value[1], 60);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(widget.name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: R.colors.mainTextColor)),
          ),
          Row(
            children: <Widget>[
              Text("${_lowerValue.toInt()}${K.age_year}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: R.colors.mainTextColor)),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorColor: R.colors.mainBrandColor,
                    valueIndicatorTextStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: R.colors.mainTextColor),
                    inactiveTrackColor: R.colors.secondBgColor,
                    thumbColor: R.colors.mainBrandColor,
                    activeTrackColor: R.colors.mainBrandColor,
                  ),
                  child: RangeSlider(
                    min: widget.min.toDouble(),
                    max: widget.max.toDouble(),
                    values: RangeValues(_lowerValue, _upperValue),
                    divisions: (widget.max - widget.min),
                    onChanged: (RangeValues values) {
                      widget.onFilterValueChanged(
                          widget.id, [values.start, values.end]);
                      setState(() {
                        _lowerValue = values.start;
                        _upperValue = values.end;
                      });
                    },
                  ),
                ),
              ),
              Text("${_upperValue.toInt()}${K.age_year}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: R.colors.mainTextColor)),
            ],
          )
        ],
      ),
    );
  }
}
