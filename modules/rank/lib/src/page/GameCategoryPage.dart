import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';

/// 全部游戏
///
class GameCategoryPage extends StatefulWidget {
  const GameCategoryPage({super.key});

  @override
  GameCategoryState createState() {
    return GameCategoryState();
  }

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const GameCategoryPage(),
      settings: const RouteSettings(name: 'GameCategoryPage'),
    ));
  }
}

class GameCategoryState extends State<GameCategoryPage> {
  bool _loading = true;
  String? _errorMsg;

  List _games = [];
  List _funs = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    _loading = true;
    _errorMsg = null;

    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}search/indexcategorylist?version=2",
        throwOnError: true,
      );

      Map res = response.response as Map;

      if (res['success'] == true) {
        if (res['data'] != null && res['data']['games'] != null) {
          _games = res['data']['games'];
        }

        if (res['data'] != null && res['data']['funs'] != null) {
          _funs = res['data']['funs'];
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          _errorMsg = res['msg'];
        } else {
          _errorMsg = K.rank_net_error;
        }
      }
    } catch (e) {
      _errorMsg = K.rank_net_error;
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.rank_all_game),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMsg != null) {
      return Center(
        child: ErrorData(
          error: _errorMsg,
          onTap: () {
            _load();
          },
        ),
      );
    }

    return _buildCategory();
  }

  Widget _buildCategory() {
    bool hasCategory = _games.length + _funs.length > 0;

    if (hasCategory) {
      List<Widget> widgets = [];
      widgets.add(buildSingleCategory(_games, R.string('room_game_game')));
      if (!Util.isVerify)
        widgets.add(buildSingleCategory(_funs, R.string('room_config_joy')));

      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: widgets,
      );
    }
    return Container();
  }

  Widget buildSingleCategory(List items, String cateforyName) {
    if (items.isNotEmpty) {
      List<Widget> widgets = [];
      String type =
          cateforyName == R.string('room_game_game') ? 'game' : 'funs';
      bool isFirstItem = cateforyName == R.string('room_game_game');

      for (var item in items) {
        widgets.add(_buildItem(item, type));
      }

      return Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsetsDirectional.only(
                top: isFirstItem ? 20 : 2, bottom: 10.0, start: 20.0),
            child: Text(
              cateforyName,
              style: TextStyle(
                  fontSize: 15.0,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(0.0),
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 12.0,
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1.2,
              children: widgets,
            ),
          )
        ],
      );
    }

    return Container();
  }

  Widget _buildItem(Map item, String type) {
    String title = item['name'];
    String icon = item['icon'];

    return InkWell(
      onTap: () async {},
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 48.0,
                margin: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                child: CommonAvatar(
                  path: icon,
                  size: 48,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ],
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: R.color.thirdTextColor, fontSize: 13),
          )
        ],
      ),
    );
  }
}
