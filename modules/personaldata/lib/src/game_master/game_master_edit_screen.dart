import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'model/game_master_api.dart';
import 'model/pb/generated/slp_godcard.pb.dart';

class GameMasterEditScreen extends StatefulWidget {
  static const GameMasterCardDidChangeNotify = 'GameMasterCardDidChangeNotify';

  final String _title;
  final int _gameId;
  final String? fromRouteName;

  const GameMasterEditScreen(this._title, this._gameId,
      {this.fromRouteName, Key? key})
      : super(key: key);

  @override
  State<GameMasterEditScreen> createState() => _GameMasterEditScreenState();

  static Future show(BuildContext context, String title, int gameId,
      {List<GodCardCategoryDetail>? initProperties, String? fromRouteName}) {
    String? routeName = fromRouteName;
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GameMasterEditScreen(
          title,
          gameId,
          fromRouteName: routeName,
        ),
        settings: const RouteSettings(name: '/gameMasterEdit'),
      ),
    );
  }
}

class _GameMasterEditScreenState extends State<GameMasterEditScreen> {
  ResGodCardCategoryDetail? _resData;
  final Map<int, String> _currentEditingValue = {};
  bool _isFirstLoading = true;

  void _loadData() async {
    _resData = await GameMasterAPI.getGameProperties(widget._gameId);
    if (_resData != null) {
      for (var element in _resData!.godCategory) {
        if (element.value.isNotEmpty) {
          _currentEditingValue[element.id] = element.value;
        }
      }
    }
    _isFirstLoading = false;

    if (mounted) {
      setState(() {});
    }
  }

  void _saveData() async {
    CommonLoading.show();
    ResGodCardCategoryDetail result = await GameMasterAPI.submitGameProperties(
        widget._gameId, _currentEditingValue);
    Log.d(result.success.toString() + result.msg);
    CommonLoading.dismiss();
    if (result.success) {
      eventCenter.emit(GameMasterEditScreen.GameMasterCardDidChangeNotify);
      if (widget.fromRouteName != null) {
        Navigator.popUntil(context, ModalRoute.withName(widget.fromRouteName!));
      } else {
        Navigator.of(context).pop();
      }
    } else {
      Fluttertoast.showCenter(msg: result.msg);
    }
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget? stateWidget;
    if (_isFirstLoading) {
      stateWidget = const Center(
        child: Loading(),
      );
    } else if (_resData == null) {
      stateWidget = Center(
        child: ErrorData(
          error: _resData!.msg,
          onTap: () => _loadData(),
        ),
      );
    } else {
      if (!_resData!.success) {
        stateWidget = Center(
          child: ErrorData(
            error: _resData!.msg,
            onTap: () => _loadData(),
          ),
        );
      } else if (_resData!.godCategory.isEmpty) {
        stateWidget = const Center(
          child: EmptyWidget(),
        );
      }
    }

    //构建子视图
    List<Widget> columns = [];
    if (stateWidget == null) {
      for (var element in _resData!.godCategory) {
        String? editingValue = _currentEditingValue[element.id];
        columns.add(_buildPropertyItem(element, editingValue, (value) {
          //保存当前编辑的值
          if (mounted) {
            setState(() {
              _currentEditingValue[element.id] = value;
            });
          }
        }));
      }
    }

    return Scaffold(
      appBar: BaseAppBar(
        widget._title,
        actionTitle: '保存',
        onPressed: _saveData,
      ),
      body: stateWidget ??
          ListView(
            children: columns,
          ),
      // bottomNavigationBar: _buildExit(),
    );
  }

  SettingItemWidget _buildPropertyItem(GodCardCategoryDetail item,
      String? editingValue, void Function(String value) didEdit) {
    if (item.type == 1) {
      return SettingItemWidget(
        title: item.name,
        trailingText: editingValue ?? '请输入你的${item.name}',
        trailingTextColor: editingValue == null
            ? R.color.secondTextColor
            : R.color.mainTextColor,
        onClicked: () async {
          int index = FormScreen.config(
            title: item.name,
            value: editingValue ?? '',
            allowEmpty: false,
          );
          String? value = await FormScreen.openFormScreen(context, index);
          if (value != null) {
            didEdit(value);
          }
        },
      );
    } else if (item.type == 2) {
      return SettingItemWidget(
        title: item.name,
        trailingText: editingValue ?? '请选择你的${item.name}',
        trailingTextColor: editingValue == null
            ? R.color.secondTextColor
            : R.color.mainTextColor,
        onClicked: () {
          _showValueSelectBoard(item, (GodCardSubCate selectedItem) {
            setState(() {
              _currentEditingValue[item.id] = selectedItem.name;
            });
          });
        },
      );
    } else {
      return const SettingItemWidget(
        title: '',
        trailingText: '',
      );
    }
  }

  _showValueSelectBoard(GodCardCategoryDetail category,
      void Function(GodCardSubCate selectedItem) didSelected) {
    int lines = (category.subCate.length / 3).ceil();
    double estimateHeight = 66 + 126 + lines * 52 - 22;
    double maxHeightRatio = estimateHeight / Util.height;

    displayModalBottomSheet(
      context: context,
      maxHeightRatio: maxHeightRatio,
      builder: (BuildContext context) {
        return _ValueSelectBoard(
            category, didSelected, _currentEditingValue[category.id]);
      },
    );
  }
}

class _ValueSelectBoard extends StatefulWidget {
  final GodCardCategoryDetail properties;
  final void Function(GodCardSubCate selectedItem) didSelected;
  final String? selectValue;

  const _ValueSelectBoard(this.properties, this.didSelected, this.selectValue,
      {Key? key})
      : super(key: key);

  @override
  State<_ValueSelectBoard> createState() => _ValueSelectBoardState();
}

class _ValueSelectBoardState extends State<_ValueSelectBoard> {
  String? _selectValue;
  GodCardSubCate? _selectedItem;

  @override
  void initState() {
    super.initState();

    _selectValue = widget.selectValue;
    if (_selectValue != null) {
      for (var element in widget.properties.subCate) {
        if (element.name == _selectValue) {
          _selectedItem = element;
          continue;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const double sidePadding = 20;
    const double itemMargin = 13;
    final double itemWidth =
        (Util.width - sidePadding * 2 - itemMargin * 2) / 3;
    return Container(
      decoration: BoxDecoration(color: R.color.mainBgColor),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                widget.properties.name,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
          const SizedBox(
            height: 12,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: sidePadding, end: sidePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: itemMargin,
                        runSpacing: 12,
                        children: List.generate(
                            widget.properties.subCate.length, (index) {
                          GodCardSubCate item =
                              widget.properties.subCate[index];
                          bool selected = _selectValue == item.name;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItem = item;
                                _selectValue = item.name;
                              });
                            },
                            child: Container(
                              width: itemWidth,
                              height: 40,
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: selected
                                        ? const Color(0xFF2ECEFE)
                                        : const Color(0x1A313131),
                                  )),
                              child: Text(
                                item.name,
                                style: TextStyle(
                                    color: selected
                                        ? const Color(0xFF2ECEFE)
                                        : R.color.mainTextColor,
                                    fontSize: 16),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 33),
                  child: InkWell(
                    onTap: () {
                      if (_selectedItem != null) {
                        widget.didSelected(_selectedItem!);
                      }
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      width: Util.width - 40,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors,
                        ),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: const Text(
                        '确定',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
