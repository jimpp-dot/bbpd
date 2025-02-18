import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class ShareMusicPage extends StatefulWidget {
  const ShareMusicPage({Key? key}) : super(key: key);

  @override
  _ShareMusicPageState createState() => _ShareMusicPageState();
}

class _ShareMusicPageState extends State<ShareMusicPage> {
  String _musicUrl = 'http://staff2.ustc.edu.cn/~wdw/softdown/index.asp/0042515_05.ANDY.mp3';
  String _musicLowBandUrl = 'http://www.qq.com';
  String _title = 'Beyond';
  String _description = 'A Popular Rock Band From China';
  String _thumnail = 'images/logo.png';
  WeChatScene scene = WeChatScene.SESSION;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShareMusicPage'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: _share,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: TextEditingController(
                text: 'http://staff2.ustc.edu.cn/~wdw/softdown/index.asp/'
                    '0042515_05.ANDY.mp3',
              ),
              onChanged: (str) {
                _musicUrl = str;
              },
              decoration: InputDecoration(labelText: 'music url'),
            ),
            TextField(
              controller: TextEditingController(text: 'http://www.qq.com'),
              onChanged: (str) {
                _musicLowBandUrl = str;
              },
              decoration: InputDecoration(labelText: 'music low band url'),
            ),
            TextField(
              controller: TextEditingController(text: 'Beyond'),
              onChanged: (str) {
                _title = str;
              },
              decoration: InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: TextEditingController(
                text: 'A Popular Rock Band From China',
              ),
              onChanged: (str) {
                _description = str;
              },
              decoration: InputDecoration(labelText: 'description'),
            ),
            TextField(
              controller: TextEditingController(text: 'images/logo.png'),
              onChanged: (str) {
                _thumnail = str;
              },
              decoration: InputDecoration(labelText: 'thumbnail'),
            ),
            Row(
              children: <Widget>[
                const Text('分享至'),
                Row(
                  children: <Widget>[
                    Radio<WeChatScene>(
                      value: WeChatScene.SESSION,
                      groupValue: scene,
                      onChanged: (v) {
                        if (v != null) handleRadioValueChanged(v);
                      },
                    ),
                    const Text('会话')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<WeChatScene>(
                      value: WeChatScene.TIMELINE,
                      groupValue: scene,
                      onChanged: (v) {
                        if (v != null) handleRadioValueChanged(v);
                      },
                    ),
                    const Text('朋友圈')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<WeChatScene>(
                      value: WeChatScene.FAVORITE,
                      groupValue: scene,
                      onChanged: (v) {
                        if (v != null) handleRadioValueChanged(v);
                      },
                    ),
                    const Text('收藏')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _share() {
    var model = WeChatShareMusicModel(
      title: _title,
      description: _description,
      musicUrl: _musicUrl,
      scene: scene,
      musicLowBandUrl: _musicLowBandUrl,
      thumbnail: WeChatImage.network(_thumnail),
    );

    shareToWeChat(model);
  }

  void handleRadioValueChanged(WeChatScene scene) {
    setState(() {
      this.scene = scene;
    });
  }
}
