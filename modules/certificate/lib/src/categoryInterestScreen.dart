import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:certificate/k.dart';
import 'package:flutter/material.dart';

/// 兴趣选择
class CategoryInterestScreen extends StatefulWidget {
  const CategoryInterestScreen({super.key});

  static Future openCategoryInterestScreen(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CategoryInterestScreen(),
        settings: const RouteSettings(name: '/categoryInterestScreen'),
      ),
    );
  }

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<CategoryInterestScreen> {
  final bool _loading = false;
  List categories = [];
  final HashSet<int> _selectionSet = HashSet<int>();
  bool _allSelected = false;
  int _itemCount = 0;
  final Map<int, String> _nameMap = <int, String>{};

  _ScreenState() : super();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _load() async {
    String url = '${System.domain}home/allIn';
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        List<dynamic> data = res['data'];
        categories = data;
        if (Util.isVerify) {
          categories = data.where((item) => item['cid'].toInt() != 3).toList();
        }

        if (!mounted) return;

        for (var category in categories) {
          var items = category['data'];
          if (items != null) {
            items.forEach((item) {
              _itemCount++;
              _nameMap[item['cid']] = item['name'];
            });
          }
        }

        setState(() {});
      }
    }
  }

  void _submit() async {
    if (_selectionSet.isNotEmpty) {
      var cid = _selectionSet.toList()[0];
      String name = _nameMap[cid] ?? '';
      name = _selectionSet.length > 1 ? name + K.certificate_more : name;

      Map result = {};
      result['cids'] = _selectionSet.toList();
      result['name'] = name;
      result['allChoosed'] = _allSelected;

      Navigator.of(context).pop(result);
    } else {
      Fluttertoast.showToast(
          msg: K.choose_interest_tag_notice, gravity: ToastGravity.CENTER);
    }
  }

  Widget _renderFooter() {
    return BottomButton.of(title: K.sure, onTap: _submit);
  }

  void _selectItem(Map item) async {
    if (_selectionSet.contains(item['cid'])) {
      _selectionSet.remove(item['cid']);
    } else {
      _selectionSet.add(item['cid']);
    }

    _allSelected = (_selectionSet.length == _itemCount);

    setState(() {});
  }

  Widget _buttonItem(Map item) {
    String title = item['name'];
    String icon = item['icon'];

    bool selected = _selectionSet.contains(item['cid']);

    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: selected
            ? Border.all(color: R.colors.mainBrandColor, width: 2)
            : Border.all(style: BorderStyle.none),
      ),
      child: GestureDetector(
        onTap: () {
          _selectItem(item);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: CachedNetworkImage(
                width: 48,
                height: 48,
                imageUrl: '${System.imageDomain}$icon',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.0,
                color: selected
                    ? R.colors.mainBrandColor
                    : R.colors.secondTextColor,
              ),
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(Map category) {
    List<Widget> widgets = [];
    var items = category['data'];

    if (items != null) {
      items.forEach((item) {
        widgets.add(_buttonItem(item));
      });
    }

    return Column(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsetsDirectional.only(
              top: 24.0, bottom: 16.0, start: 16.0, end: 16.0),
          color: Colors.transparent,
          child: Text(
            category['name'],
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: R.colors.mainTextColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            childAspectRatio: 0.9,
            primary: false,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 8.0,
            crossAxisCount: 4,
            shrinkWrap: true,
            children: widgets,
          ),
        )
      ],
    );

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.interest,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        actionTitle: _allSelected ? K.cancel_choose_all : K.choose_all,
        onPressed: () {
          if (_loading) return;
          _selectionSet.clear();
          if (!_allSelected) {
            for (var category in categories) {
              var items = category['data'];
              if (items != null) {
                items.forEach((item) {
                  _selectionSet.add(item['cid']);
                });
              }
            }
          }
          setState(() {
            _allSelected = !_allSelected;
          });
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) return const Loading();

    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: categories.map((e) => _buildCategory(e)).toList(),
          ),
        ),
        const SizedBox(height: 10),
        _renderFooter(),
      ],
    );
  }
}
