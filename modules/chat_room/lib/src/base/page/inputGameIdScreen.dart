import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class InputGameIdScreen extends StatefulWidget {
  final String uid;
  final String gameType;

  const InputGameIdScreen(
      {super.key, required this.uid, required this.gameType});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<InputGameIdScreen> {
  final List<SheetItem> _zoneNames = [
    SheetItem(R.string('room_qq_area'), 'qq'),
    SheetItem(R.string('room_wechat_area'), 'weichat'),
  ];
  String _gameId = '';
  String _gameZone = '';

  void _loadGameId() async {
    String url = "${System.domain}account/getgameid";
    XhrResponse response =
        await Xhr.postJson(url, {'uid': widget.uid, 'type': widget.gameType});
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true && mounted) {
        _gameId = res['data']['game_id'];
        _gameZone = res['data']['game_zone'];
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _loadGameId();
  }

  Future<bool> _save() async {
    Navigator.of(context).pop();
    try {
      await Xhr.postJson(
          '${System.domain}account/setgameid',
          {
            'uid': widget.uid,
            'type': widget.gameType,
            'game_zone': _gameZone,
            'game_id': _gameId,
          },
          throwOnError: true);
      return true;
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    String gameZone = '';
    if (_gameZone == 'qq') {
      gameZone = R.string('room_qq_area');
    } else if (_gameZone == 'weichat') {
      gameZone = R.string('room_wechat_area');
    }

    return Scaffold(
      appBar: BaseAppBar.custom(
        showBack: true,
        title: Text(R.string('room_modify_some_gameid', args: [
          (widget.gameType == 'chook'
              ? R.string('room_game_peace')
              : R.string('room_game_king_glory'))
        ])),
        actions: <Widget>[
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              child: TextButton(
                child: Text(
                  R.string('submit'),
                  textScaleFactor: 1.0,
                ),
                onPressed: () => _save(),
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          LineSetting(
            label: R.string('room_area_service'),
            message: gameZone,
            onTap: () async {
              SheetCallback? result = await displayModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return RadioBottomSheet(data: _zoneNames);
                  });
              if (result == null || result.reason == SheetCloseReason.Active) {
                return;
              }
              _gameZone = result.value?.key ?? '';

              if (mounted) {
                setState(() {});
              }
            },
          ),
          LineSetting(
            label: 'ID',
            message: _gameId,
            onTap: () async {
              int index = FormScreen.config(
                title: R.string('room_input_gameid'),
                value: _gameId,
                allowEmpty: false,
              );
              String? value = await FormScreen.openFormScreen(context, index);
              if (value != null && value.isNotEmpty) _gameId = value;

              if (mounted) {
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
