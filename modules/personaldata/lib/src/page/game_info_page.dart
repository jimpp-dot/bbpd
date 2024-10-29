import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/model/recent_playing_games.dart';
import 'package:personaldata/src/widget/recent_playing_widget.dart';

import 'playedKillerGamesScreen.dart';

/// 游戏战绩展示列表
class GameInfoPage extends StatefulWidget {
  final int uid;

  const GameInfoPage({Key? key, required this.uid}) : super(key: key);

  static void show(BuildContext context, {Key? key, required int uid}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GameInfoPage(key: key, uid: uid),
      settings: const RouteSettings(name: 'gameInfo'),
    ));
  }

  @override
  _GameInfoPageState createState() {
    return _GameInfoPageState();
  }
}

class _GameInfoPageState extends State<GameInfoPage> {
  List<HomeProfileGameItem>? _gameInfo;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    /// 游戏信息
    try {
      if (!mounted) return;

      _gameInfo =
          await RecentPlayingGamesRepository.getRecentPlayingGames(widget.uid);
      setState(() {});
    } catch (e) {
      Log.d(e.toString());
      Toast.show(context, e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('常玩游戏'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_gameInfo == null || (_gameInfo?.length ?? 0) < 1) {
      return const SizedBox();
    } else {
      return ListView(
        padding: const EdgeInsets.only(
          left: 16,
          top: 6,
          right: 16,
          bottom: 6,
        ),
        itemExtent: 76,
        children:
            _gameInfo?.map((element) => _buildGameItem(element)).toList() ?? [],
      );
    }
  }

  Widget _buildGameRealItem(HomeProfileGameItem game) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 12),
          child: RecentPlayingGames.buildIcon(game, iconSize: 56.0),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                game.name,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 17,
                ),
              ),
            ),
            _buildPlayInfo(game),
          ],
        ),
        Expanded(child: Container()),
        (game.key == 'rpg')
            ? Container(
//            padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.navigate_next,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _buildGameItem(HomeProfileGameItem game) {
    return (game.key == 'rpg')
        ? InkWell(
            onTap: () {
              if (Session.isLogined == false) {
                ILoginManager loginManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_LOGIN);
                loginManager.show(context);
                return;
              }
              PlayedKillerGamesScreen.openPlayedKillerGamesScreen(
                  context, widget.uid);
            },
            child: _buildGameRealItem(game),
          )
        : _buildGameRealItem(game);
  }

  Widget _buildPlayInfo(HomeProfileGameItem game) {
    List<Widget> widgets = [];
    for (var element in game.playInfo) {
      widgets.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 8),
        child: Text(
          element.name,
          style: TextStyle(
            color: R.color.mainBrandColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));
      widgets.add(Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: Text(
          element.value,
          style: TextStyle(
            color: R.color.thirdTextColor,
            fontSize: 13,
          ),
        ),
      ));
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 124,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: widgets),
      ),
    );
  }
}
