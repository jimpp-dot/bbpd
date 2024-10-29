import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../a.dart';
import '../../k.dart';

typedef OnSelectItemTap = Function();

class HiListFilterData {
  // 发言时间
  static const int SORT_TIME = 0;

  // vip 等级
  static const int SORT_VIP = 1;

  // 人气等级
  static const int SORT_POPULAR = 2;

  // 活跃时间
  static const int SORT_ACTIVE = 3;

  // 全部
  static const int SEX_ALL = 0;

  // 男
  static const int SEX_MALE = 1;

  // 女
  static const int SEX_FEMALE = 2;

  int sort;
  int sex;
  bool onlyNewUser;

  @override
  String toString() {
    return 'HiListFilterData{sort: $sort, sex: $sex, onlyNewUser: $onlyNewUser}';
  }

  HiListFilterData(this.sort, this.sex, this.onlyNewUser);

  static HiListFilterData getDefault() {
    return HiListFilterData(SORT_TIME, SEX_ALL, false);
  }

  bool equals(HiListFilterData? other) {
    if (other == null) {
      return false;
    }

    return sort == other.sort &&
        sex == other.sex &&
        onlyNewUser == other.onlyNewUser;
  }

  bool isAll() {
    return onlyNewUser == false && sex == SEX_ALL;
  }
}

class HiListFilterPanel extends StatefulWidget {
  final HiListFilterData? filterData;

  const HiListFilterPanel({super.key, required this.filterData});

  static Future<HiListFilterData?> show(BuildContext context,
      {HiListFilterData? filterData}) async {
    return await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return HiListFilterPanel(
            filterData: filterData,
          );
        });
  }

  @override
  State<StatefulWidget> createState() {
    return _HiListFilterPanelState();
  }
}

class _HiListFilterPanelState extends State<HiListFilterPanel> {
  int _selectedSort = 0;
  int _selectedSex = 0;
  bool _onlyNewUser = false;

  @override
  void initState() {
    super.initState();
    if (widget.filterData != null) {
      _selectedSort = widget.filterData!.sort;
      _selectedSex = widget.filterData!.sex;
      _onlyNewUser = widget.filterData!.onlyNewUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: R.colors.mainBgColor,
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(12), topEnd: Radius.circular(12))),
          padding:
              const EdgeInsetsDirectional.only(bottom: 34, start: 10, end: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              _buildItemTitle(K.msg_filter_sort),
              _buildSort(),
              const SizedBox(
                height: 20,
              ),
              _buildItemTitle(K.msg_filter_sex),
              _buildSex(),
              const SizedBox(
                height: 20,
              ),
              _buildOnlyNewUser(),
              const SizedBox(
                height: 20,
              ),
              _buildCompleteBtn()
            ],
          ),
        ));
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 44, height: 44),
        Expanded(
          child: Text(
            K.msg_filter,
            style: TextStyle(
                fontSize: 17,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).pop(null);
          },
          child: Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            child: R.img("room_ic_close.svg",
                package: ComponentManager.MANAGER_BASE_ROOM,
                color: R.colors.mainTextColor),
          ),
        )
      ],
    );
  }

  Widget _buildItemTitle(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(color: R.colors.mainTextColor, fontSize: 14),
      ),
    );
  }

  Widget _buildSort() {
    List<Widget> list = [];
    for (int i = 0; i < A.hi_list_sort_options.length; i++) {
      list.add(_selectItem(A.hi_list_sort_options[i],
          selected: i == _selectedSort, onSelectItemTap: () {
        if (i != _selectedSort) {
          setState(() {
            _selectedSort = i;
          });
        }
      }));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  Widget _buildSex() {
    List<Widget> list = [];
    for (int i = 0; i < A.hi_list_filter_sex.length; i++) {
      list.add(_selectItem(A.hi_list_filter_sex[i],
          width: 70, selected: i == _selectedSex, onSelectItemTap: () {
        if (i != _selectedSex) {
          setState(() {
            _selectedSex = i;
          });
        }
      }));
    }

    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: list,
    );
  }

  Widget _buildOnlyNewUser() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          K.msg_filter_only_new_user,
          style: TextStyle(
            color: R.colors.mainTextColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Switch(
          value: _onlyNewUser,
          inactiveTrackColor: R.colors.switchInActiveColor,
          activeColor: R.colors.switchActiveColor,
          onChanged: (bool selected) {
            setState(() {
              _onlyNewUser = selected;
            });
          },
        )
      ],
    );
  }

  Widget _buildCompleteBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context)
            .pop(HiListFilterData(_selectedSort, _selectedSex, _onlyNewUser));
      },
      child: Center(
        child: Container(
          height: 46,
          margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(23.0)),
              gradient:
                  LinearGradient(colors: R.colors.mainBrandGradientColors)),
          child: Text(
            K.msg_filter_complete,
            style: TextStyle(color: R.colors.brightTextColor),
          ),
        ),
      ),
    );
  }

  Widget _selectItem(String label,
      {bool selected = false,
      required OnSelectItemTap onSelectItemTap,
      double width = 0}) {
    return GestureDetector(
      onTap: () {
        onSelectItemTap();
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 12, end: 12, top: 6, bottom: 6),
        width: width > 0 ? width : null,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: selected ? null : R.colors.mainBgColor,
            border: selected
                ? null
                : Border.all(
                    color: R.colors.secondBgColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            gradient: selected
                ? LinearGradient(colors: R.colors.mainBrandGradientColors)
                : null),
        child: Text(
          label,
          style: TextStyle(
              color:
                  selected ? R.colors.brightTextColor : R.colors.mainTextColor,
              fontSize: 14.0,
              fontWeight: selected ? FontWeight.w500 : FontWeight.w400),
        ),
      ),
    );
  }
}
