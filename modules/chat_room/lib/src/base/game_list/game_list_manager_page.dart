import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/game_list/repo/game_list_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';
import 'model/pb/generated/common_gameplaylist.pb.dart';

/// @Author wangyang
/// @Description 玩法列表管理页
/// @Date 2022/9/19
/// (房主和接待)游戏编辑界面
class GameListManagerPage extends StatefulWidget {
  final ChatRoomData room;

  const GameListManagerPage({super.key, required this.room});

  static Future show(BuildContext context, ChatRoomData room) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GameListManagerPage(room: room),
      ),
    );
  }

  @override
  State<GameListManagerPage> createState() => GameListManagerPageState();
}

class GameListManagerPageState extends BaseScreenState<GameListManagerPage> {
  List<GamePlayItem> _playList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    setScreenLoading();
    var rsp = await GameListRepo.getAll(widget.room.rid);
    if (rsp.success && rsp.data.list.isNotEmpty) {
      _playList = rsp.data.list;
      setScreenReady();
    } else {
      setScreenEmpty();
    }
  }

  @override
  void onTapEmptyWidget() {
    _loadData();
  }

  @override
  Widget buildContent() {
    return _buildPlayList();
  }

  _buildPlayList() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsetsDirectional.only(top: 12),
              alignment: Alignment.center,
              child: Text(
                K.room_game_list_manage_desc,
                style: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 12,
                ),
              ),
            );
          }

          var item = _playList[index - 1];
          return Container(
            margin:
                const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 6,
                ),
              ],
            ),
            height: 72,
            child: Row(
              children: [
                const SizedBox(width: 12),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black.withOpacity(0.04),
                  ),
                  alignment: Alignment.center,
                  child:
                      R.img(Util.getImgUrl(item.icon), width: 29, height: 29),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
                Transform.scale(
                  scale: 0.78,
                  child: CupertinoSwitch(
                    activeColor: R.color.mainBrandColor,
                    trackColor: R.color.switchInActiveColor,
                    value: Util.parseBool(item.showStatus),
                    onChanged: (value) => _switchStatus(item, value),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          );
        },
        itemCount: _playList.length + 1,
      ),
    );
  }

  ///切换上下线状态
  _switchStatus(GamePlayItem item, bool value) async {
    var rsp =
        await GameListRepo.gameSwitch(widget.room.rid, item.id, value ? 1 : 0);
    if (rsp.success) {
      if (mounted) {
        ///切换成功后，刷新页面
        _loadData();
      }
    } else {
      Fluttertoast.showCenter(msg: rsp.msg);
    }
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(44),
      child: BaseAppBar(K.room_game_list_manage_title),
    );
  }
}
