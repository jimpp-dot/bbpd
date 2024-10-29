import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/util/server.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';
import 'package:chat_room/src/music/music_room_helper.dart';
import 'package:crclib/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_server/http_server.dart';
import 'package:path/path.dart';

/// wifi 上传
class WifiScreen extends StatefulWidget {
  final ChatRoomData room;

  const WifiScreen({Key? key, required this.room}) : super(key: key);

  @override
  State<WifiScreen> createState() => WifiState();
}

class WifiState extends State<WifiScreen> {
  int _index = 0;
  Timer? _timer;

  late Server _server;
  bool _ok = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), _onTimer);
    _init();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    _server.stop();
    super.dispose();
  }

  _init() async {
    _server = Server(_onUpload);
    await _server.start();
    if (mounted) {
      setState(() {
        _ok = _server.ok;
      });
    }
  }

  Future<String?> _onUpload(HttpBodyFileUpload upload) async {
    if (upload.filename.isEmpty) return K.room_upload_name_not_empty;
    int index = upload.filename.lastIndexOf(".");
    if (index == -1) {
      return K.room_upload_not_sufix;
    }
    String ext = upload.filename.substring(index + 1).toLowerCase();
    List<String> allow = ['mp3', 'm4a', 'aac', 'wav', 'ncm'];
    if (!allow.contains(ext)) {
      return K.room_only_upload_files + allow.join(", ");
    }

    try {
      int id =
          int.parse(Crc32Xz().convert(utf8.encode(upload.filename)).toString());
      File file = File(join(Constant.documentsDirectory.path, '$id.$ext'));
      if (await file.exists()) {
        file.deleteSync(recursive: true);
      }
      await file.writeAsBytes(upload.content);
      String musicPath = file.path;
      String musicName = upload.filename;

      if (ext == 'ncm') {
        File mp3File = File('${file.path}.mp3');
        Ncm ncm = Ncm(File(file.path), mp3File);
        if (ncm.format() == true) {
          musicPath = mp3File.path;
          if (ncm.name.isNotEmpty) {
            musicName = ncm.name;
          }
        } else {
          return K.room_ncm_format_failed;
        }
      }
      Log.d('_onUpload musicPath  =$musicPath filepath=${file.path}');
      if (widget.room.isMusicRoom == true) {
        //音乐房自己处理后续逻辑
        await MusicRoomHelper.syncMusic2Server(
            rid: widget.room.rid,
            path: musicPath,
            name: musicName,
            type: PLAY_LIST_TYPE_LOCAL);
      } else {
        List<Map<String, dynamic>> res = await LocalStorage.db
                ?.rawQuery("select * from $musicTable where id = ?", [id]) ??
            [];
        if (res.isEmpty) {
          await LocalStorage.db?.insert(musicTable, {
            'id': id,
            'type': 'local',
            'name': musicName,
            'path': musicPath,
            'dateline': DateTime.now().millisecondsSinceEpoch,
          });
        } else {
          await LocalStorage.db?.execute(
            "update $musicTable set type = ?, name = ?, path = ?, dateline = ? where id = ?",
            [
              'local',
              upload.filename,
              file.path,
              DateTime.now().millisecondsSinceEpoch,
              id
            ],
          );
        }
      }
      Fluttertoast.showCenter(
          msg: "${upload.filename} ${K.room_upload_completed}");
      return null;
    } catch (e) {
      Log.d(e);
      return e.toString();
    }
  }

  _onTimer(Timer timer) {
    if (mounted) {
      setState(() {
        _index = (_index + 1) % 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.upload),
      body: Container(
        padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(top: 0.0),
              alignment: Alignment.center,
              child: IndexedStack(
                index: _index,
                children: List.generate(10, (int i) {
                  return R.img(
                    "wifi/icon_wifi_loading_${i + 1}.png",
                    width: 120.0,
                    height: 122 / 171 * 120,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 55.0,
                bottom: 15.0,
                start: (Util.width - 220.0) / 2,
                end: (Util.width - 220.0) / 2,
              ),
              child: GestureDetector(
                onTap: _ok
                    ? () {
                        Clipboard.setData(ClipboardData(text: _server.address));
                        Fluttertoast.showCenter(msg: K.room_copy_address);
                      }
                    : null,
                child: Container(
                  height: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: R.color.secondBgColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18.0))),
                  child: Text(
                    _ok ? _server.address : K.room_no_connect_network,
                    style: const TextStyle(),
                  ),
                ),
              ),
            ),
            Text(
              K.room_open_pc_input_address,
              textAlign: TextAlign.center,
              style: const TextStyle(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                K.room_pc_phone_in_wlan,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: R.color.secondTextColor, fontSize: 12.0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
