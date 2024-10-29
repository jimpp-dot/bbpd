import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';

/// 约玩标签选择页
class PlayTagSelectScreen extends StatefulWidget {
  static Future<SelectGame?> openPlayTagSelectScreen(BuildContext context,
      {Key? key, SelectGame? selectGame}) {
    return Navigator.of(context).push(
      DisappearBottomRoute(
        builder: (context) {
          return PlayTagSelectScreen(key: key, selectGame: selectGame);
        },
        settings: const RouteSettings(name: '/play_tag_select_screen'),
      ),
    );
  }

  final SelectGame? selectGame;

  const PlayTagSelectScreen({super.key, this.selectGame});

  @override
  _PlayTagSelectScreenState createState() => _PlayTagSelectScreenState();
}

class _PlayTagSelectScreenState extends State<PlayTagSelectScreen> {
  RushConfigBean? _configBean;

  Map<String, GameInfo>? _gameOptions;

  bool _loading = true;
  String? _errorMessage;

  SelectGame _selectGame = SelectGame();
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _selectGame = widget.selectGame ?? SelectGame();

    _loadConfig();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  _refresh() {
    setState(() {
      _loading = true;
      _loadConfig();
    });
  }

  String get value {
    return _textController.value.text.trim();
  }

  _loadConfig() async {
    _errorMessage = null;
    DataRsp<RushConfigBean> response = await Api.getRushConfig('play');
    if (response.success) {
      _configBean = response.data;
      _gameOptions = response.data?.options;
    } else {
      Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      _errorMessage = response.msg;
    }

    // 初始化选择位置
    if (_selectGame.game == null &&
        _configBean != null &&
        _configBean!.games.isNotEmpty) {
      _selectGame.game = _configBean?.games[0];
      _initSelectInfo(_selectGame);
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  void _initSelectInfo(SelectGame? selectGame) {
    if (selectGame == null || selectGame.game == null) {
      return;
    }
    GameInfo? gameInfo = _gameOptions?[selectGame.game!.name];
    if (gameInfo != null) {
      if (gameInfo.mode != null && gameInfo.mode!.list.isNotEmpty) {
        selectGame.mode = gameInfo.mode!.list[0];
      }

      if (gameInfo.srv != null && gameInfo.srv!.list.isNotEmpty) {
        selectGame.srv = gameInfo.srv!.list[0];
      }

      if (gameInfo.people != null && gameInfo.people!.list.isNotEmpty) {
        selectGame.people = gameInfo.people!.list[0];
      }

      if (gameInfo.level != null && gameInfo.level!.list.isNotEmpty) {
        selectGame.level = gameInfo.level!.list[0];
      }
    }
  }

  /// 其他游戏提交
  _onOtherGameSubmitted(String? value) async {
    if (value == null || value.isEmpty) return;
    _selectGame = SelectGame();
    _selectGame.game = Game(name: value.trim(), type: 'other');
  }

  _onGameItemTaped(Game game) {
    if (_selectGame.game?.name == game.name) {
      return;
    }
    _selectGame = SelectGame();
    _selectGame.game = game;
    _initSelectInfo(_selectGame);

    if (mounted) setState(() {});
  }

  _onFinishedTaped() {
    if (_selectGame.game?.gameType == GameType.other) {
      if (value.isEmpty) {
        Fluttertoast.showToast(
            msg: K.moment_input_game_name, gravity: ToastGravity.CENTER);
        return;
      }

      /// 敏感词效验
      bool hasSensitiveWords = trie.search(value);
      if (hasSensitiveWords) {
        Fluttertoast.showToast(
            msg: R.string('sensitive_words_warning'),
            gravity: ToastGravity.CENTER);
        return;
      }

      _selectGame = SelectGame();
      _selectGame.game = Game(name: value.trim(), type: 'other');
    }
    Navigator.of(context).pop(_selectGame);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        leading: const NavigatorClose(),
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Row(
              children: <Widget>[
                GradientButton(
                  K.moment_confirm,
                  onTap: () => _onFinishedTaped(),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                  colors: R.color.mainBrandGradientColors,
                  height: 32,
                  width: 58,
                ),
              ],
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null && _errorMessage!.isNotEmpty) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: _refresh,
      );
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCategory(),
            _buildSelectChild(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    List<Widget> widgets = [];
    _configBean?.games.forEach((game) {
      widgets.add(GestureDetector(
        onTap: () => _onGameItemTaped(game),
        child: TagSelectItem(
            text: game.name ?? '', select: _selectGame.game?.name == game.name),
      ));
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            K.moment_game,
            style: TextStyle(fontSize: 14.0, color: R.color.thirdTextColor),
          ),
        ),
        GridView.count(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 5 / 3,
          padding: const EdgeInsets.all(0.0),
          mainAxisSpacing: 8,
          crossAxisSpacing: 5,
          crossAxisCount: 4,
          shrinkWrap: true,
          children: widgets,
        )
      ],
    );
  }

  Widget _buildSelectChild() {
    if (_selectGame.game?.gameType == GameType.other) {
      return _buildOther();
    }

    GameInfo? info = _gameOptions?[_selectGame.game?.name ?? ''];

    if (info == null) {
      return const SizedBox.shrink();
    }
    List<Widget> widgets = [];

    // 模式
    if (info.mode != null) {
      widgets.add(TagGridWidget(
//        key: ValueKey(info.mode.title),
        title: info.mode!.title,
        items: info.mode!.list,
        selectItem: _selectGame.mode,
        onTaped: (index, item) {
          _selectGame.mode = item;
        },
      ));
    }

    // 区服
    if (info.srv != null) {
      widgets.add(TagGridWidget(
//        key: ValueKey(info.srv.title),
        title: info.srv!.title,
        items: info.srv!.list,
        selectItem: _selectGame.srv,
        onTaped: (index, item) {
          _selectGame.srv = item;
        },
      ));
    }

    // 段位
    if (info.level != null) {
      widgets.add(TagGridWidget(
//        key: ValueKey(info.level.title),
        title: info.level!.title,
        items: info.level!.list,
        selectItem: _selectGame.level,
        onTaped: (index, item) {
          _selectGame.level = item;
        },
      ));
    }

    // 人数
    if (info.people != null) {
      widgets.add(TagGridWidget(
//        key: ValueKey(info.people.title),
        title: info.people!.title,
        items: info.people!.list,
        selectItem: _selectGame.people,
        onTaped: (index, item) {
          _selectGame.people = item;
        },
      ));
    }

    List<Widget> allWidgets = [];
    for (var it in widgets) {
      allWidgets.add(it);
      allWidgets.add(Container(height: 24));
    }

    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: allWidgets,
      ),
    );
  }

  /// 其他游戏
  Widget _buildOther() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
          child: Text(
            K.moment_game_name,
            style: TextStyle(fontSize: 14.0, color: R.color.thirdTextColor),
          ),
        ),
        Container(
          height: 36,
          width: 168,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: BorderRadius.circular(23),
          ),
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 13,
                  fontFamily: Util.fontFamily),
              focusNode: FocusNode(),
              controller: _textController,
              autocorrect: false,
              autofocus: true,
              onSubmitted: _onOtherGameSubmitted,
              maxLines: 1,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              inputFormatters: [LengthLimitingTextInputFormatter(8)],
              keyboardAppearance: Brightness.light,
              decoration: InputDecoration(
                hintText: K.moment_game_name_input,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: R.color.thirdTextColor,
                    fontFamily: Util.fontFamily),
                isDense: true,
              ),
            ),
          ),
        ),
        if (_configBean?.qqGroup != null && _configBean!.qqGroup!.isNotEmpty)
          _buildQQGroup(),
      ],
    );
  }

  Widget _buildQQGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 14.0, bottom: 8),
          child: Text(
            K.moment_other_game,
            style: TextStyle(color: R.color.thirdTextColor, fontSize: 14),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              K.moment_join_group,
              style: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 14,
                  fontFamily: Util.fontFamily),
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: _configBean?.qqGroup ?? ''));
                Fluttertoast.showToast(
                    msg: K.moment_group_copy, gravity: ToastGravity.CENTER);
              },
              child: Text(
                ' ${_configBean!.qqGroup} ',
                style: TextStyle(
                    color: R.color.secondaryBrandColor,
                    fontSize: 14,
                    fontFamily: Util.fontFamily),
              ),
            ),
            Text(
              K.moment_join_group_report,
              style: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 14,
                  fontFamily: Util.fontFamily),
            ),
          ],
        ),
      ],
    );
  }
}
