import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/k.dart';
import 'package:lpinyin/lpinyin.dart';

class AreaCode extends ISuspensionBean {
  String? name;
  String? code;
  String? namePinyin;
  String? nameTag;

  AreaCode({this.name, this.code, this.namePinyin});

  Map<String, dynamic> toJson() =>
      {'name': name, 'code': code, 'namePinyin': namePinyin};

  @override
  String getSuspensionTag() {
    return nameTag ?? '';
  }
}

class PhoneAreaCode extends StatefulWidget {
  const PhoneAreaCode({super.key});

  static Future<String?> show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const PhoneAreaCode(),
      settings: const RouteSettings(name: '/phone_code'),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PhoneAreaCode> {
  final List<AreaCode> _areaCodes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.login_country_area),
      body: _isLoading
          ? _buildWaitBody()
          : AzListView(
              padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
              data: _areaCodes,
              itemBuilder: (context, index) =>
                  _buildListItem(_areaCodes[index]),
              itemCount: _areaCodes.length,
              indexBarItemHeight: 50,
              susItemHeight: 40,
              indexHintBuilder: (context, hint) {
                return Container(
                  alignment: Alignment.center,
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: R.color.mainBrandColor.withAlpha(200),
                    shape: BoxShape.circle,
                  ),
                  child: Text(hint,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 30.0)),
                );
              },
              indexBarOptions: IndexBarOptions(
                textStyle:
                    TextStyle(color: R.color.secondTextColor, fontSize: 12),
                downTextStyle:
                    TextStyle(color: R.color.mainTextColor, fontSize: 12),
                downColor: R.color.secondBgColor,
              ),
            ),
    );
  }

  void _search() {}

  Widget _buildListItem(AreaCode? model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (model?.isShowSuspension == true)
          Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                model?.nameTag ?? '',
                style: TextStyle(fontSize: 15, color: R.color.thirdTextColor),
              )),
        InkWell(
          onTap: () {
            if (model != null) {
              return _selectAreaCode(model);
            }
          },
          child: Container(
            height: 56,
            padding: const EdgeInsets.only(left: 16, right: 32),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  model?.name ?? '',
                  style: TextStyle(fontSize: 17, color: R.color.mainTextColor),
                )),
                Text(
                  '＋${model?.code ?? ''}',
                  style: TextStyle(color: R.color.thirdTextColor, fontSize: 17),
                )
              ],
            ),
          ),
        ),
        Divider(
          height: .0,
          indent: 16,
          endIndent: 16,
          color: R.color.dividerColor,
        )
      ],
    );
  }

  Widget _buildWaitBody() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  void _selectAreaCode(AreaCode model) {
    Navigator.pop(context, model.code);
  }

  void _load() async {
    String codesPath = 'packages/login/assets/area/area_codes.json';
    int lanIndex = Translations.lanIndex;
    lanIndex++;

    String jsonStr = await otaResourceBundle.loadString(codesPath);
    Map res = json.decode(jsonStr);
    List data = res['data'] as List;
    for (var item in data) {
      List<String> info = item.toString().split('-');
      int len = info.length;
      _areaCodes.add(AreaCode(name: info[lanIndex], code: info[len - 1]));
    }

    for (int i = 0, length = _areaCodes.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(_areaCodes[i].name ?? '');
      String tag = pinyin.substring(0, 1).toUpperCase();
      _areaCodes[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        _areaCodes[i].nameTag = tag;
      } else {
        _areaCodes[i].nameTag = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(_areaCodes);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
