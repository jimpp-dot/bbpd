import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/widget/loveItem.dart';

import '../../k.dart';

class RankHeartBeatPage extends StatefulWidget {
  const RankHeartBeatPage({super.key});

  @override
  _RankHeartBeatPageState createState() => _RankHeartBeatPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RankHeartBeatPage(),
      settings: const RouteSettings(name: '/rankHeartBeat'),
    ));
  }
}

class _RankHeartBeatPageState extends State<RankHeartBeatPage> {
  final List<LoveItemData> _data = [];
  bool _isLoading = false;
  bool _loadFailed = false;
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _isLoading = true;
    String url = "${System.domain}/room/topheart";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      _isLoading = false;
      Map res = response.value();
      _loadFailed = !res['success'];
      if (!res.containsKey('data') || res['data'] == null) {
        return;
      }
      _data.clear();
      for (Map item in res['data']) {
        _data.add(LoveItemData.fromJson(item));
      }
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      Log.d(e);
    }
  }

  _buildContent() {
    if (_isLoading) {
      return const Loading();
    } else if (_loadFailed) {
      return ErrorData(
        onTap: _loadData,
      );
    }

    return _buildNormalContent();
  }

  _buildNormalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: RefreshIndicatorFactory.of(
              key: _key,
              onRefresh: _loadData,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverFixedExtentList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return LoveItemWidget(
                            data: _data.elementAt(index), index: index);
                      },
                          childCount: _data.length,
                          addAutomaticKeepAlives: false),
                      itemExtent: 90),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      height: Util.iphoneXBottom,
                    )
                  ])),
                ],
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(K.rank_heart_beat_area, style: R.textStyle.title),
        // actions: [
        //   GestureDetector(
        //     child: Container(
        //       width: 64,
        //       height: 44,
        //       alignment: Alignment.center,
        //       child: R.img(
        //         BaseAssets.ic_help_svg,
        //         width: 24,
        //         height: 24,
        //         fit: BoxFit.contain,
        //         color: R.color.mainTextColor,
        //         package: ComponentManager.MANAGER_BASE_CORE,
        //       ),
        //     ),
        //     onTap: () {
        //       showDialog(context:context,
        //           builder: (buildContext){
        //             return ConfirmDialog(
        //               title: K.rank_heart_beat_rule,
        //               negativeButton: null,
        //               contentBuilder: (contentContext){
        //                 return Padding(
        //                   padding: const EdgeInsets.only(top: 10),
        //                   child: Text(
        //                     '$_rankRule',
        //                     textAlign: TextAlign.center,
        //                     style: TextStyle(
        //                         color: R.color.secondTextColor,
        //                         fontSize: 15
        //                     ),
        //                   ),
        //                 );
        //               },
        //             );
        //           }
        //       );
        //     },
        //   )
        // ],
      ),
      body: ScaffoldBody(
        child: _buildContent(),
      ),
    );
  }
}
