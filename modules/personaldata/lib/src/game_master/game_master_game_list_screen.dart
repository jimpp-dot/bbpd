import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/game_master/game_master_edit_screen.dart';

import 'model/game_master_api.dart';
import 'model/pb/generated/slp_godcard.pb.dart';

class GameMasterGameListSceen extends StatefulWidget {
  final String? fromRouteName;

  const GameMasterGameListSceen({this.fromRouteName, Key? key})
      : super(key: key);

  @override
  State<GameMasterGameListSceen> createState() =>
      _GameMasterGameListSceenState();

  static Future show(BuildContext context, {String? fromRouteName}) {
    String? routeName = fromRouteName;
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GameMasterGameListSceen(fromRouteName: routeName),
        settings: const RouteSettings(name: '/gameMasterGameList'),
      ),
    );
  }
}

class _GameMasterGameListSceenState extends State<GameMasterGameListSceen> {
  ResGodCardCategory? _resData;
  bool _isFirstLoading = true;

  void _loadData() async {
    _resData = await GameMasterAPI.getGameCategoryRes();
    _isFirstLoading = false;

    if (mounted) {
      setState(() {});
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
    double pageSide = 16;
    double minItemWidth = 66;
    double itemWidth = minItemWidth;
    if (stateWidget == null) {
      int minRowNum = 4;
      int rowNum = minRowNum;
      itemWidth = (Util.width - pageSide * 2) / minRowNum;
      if (itemWidth >= minItemWidth * 1.5) {
        rowNum = ((Util.width - pageSide * 2) / minItemWidth).truncate();
        itemWidth = ((Util.width - pageSide * 2) / rowNum).truncateToDouble();
      } else {
        itemWidth =
            ((Util.width - pageSide * 2) / minRowNum).truncateToDouble();
      }
    }

    return Scaffold(
      appBar: BaseAppBar(K.personaldata_gm_select_game),
      body: stateWidget ??
          Container(
              child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              _loadData();
            },
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                GodCardCategory element = _resData!.godCategory[index];
                String title = element.title;
                return _buildGameGroup(
                    title, element.list, pageSide, itemWidth);
              },
              itemCount: _resData!.godCategory.length,
            ),
          )),
    );
  }

  Widget _buildGameGroup(String title, List<GodCardCategoryItem> items,
      double pageSide, double itemWidth) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: pageSide, end: pageSide, top: 12, bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color(0x0D000000), offset: Offset(0, 0), blurRadius: 20)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 16, bottom: 26),
              child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 22,
                children: List.generate(items.length, (index) {
                  GodCardCategoryItem item = items[index];
                  return InkWell(
                      onTap: () {
                        GameMasterEditScreen.show(context, item.name, item.id,
                            fromRouteName: widget.fromRouteName);
                      },
                      child: SizedBox(
                        width: itemWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: "${System.imageDomain}${item.icon}",
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              item.name,
                              style: TextStyle(
                                  color: R.color.secondTextColor, fontSize: 12),
                            ),
                          ],
                        ),
                      ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
