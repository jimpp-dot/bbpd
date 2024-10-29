import 'dart:ui';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/game_list/util/game_list_util.dart';
import 'package:flutter/material.dart';
import '../message/message_send_data.dart';
import 'game_list_manager_page.dart';
import 'model/pb/generated/common_gameplaylist.pb.dart';
import 'repo/game_list_repo.dart';

part 'game_list_extends.dart';

class GameListPage extends StatefulWidget {
  final ChatRoomData room;

  const GameListPage({super.key, required this.room});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends BaseScreenState<GameListPage> {
  final List<GamePlayItem> _listData = [];

  bool get isNormalUser => !widget.room.isCreator && !widget.room.isReception;

  @override
  Widget build(BuildContext context) {
    return _wrapContainer(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitleBar(
            K.room_play_games_list,
            actions: _buildAction(),
          ),
          Expanded(
            child: buildStatusContent(),
          ),
        ],
      ),
      maxHeight: 480,
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() => null;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    RespGamePlayListAll resp = await GameListRepo.getAll(widget.room.rid);
    if (resp.success) {
      _listData.clear();

      ///过滤掉关闭的玩法
      for (var item in resp.data.list) {
        if (Util.parseBool(item.showStatus)) {
          _listData.add(item);
        }
      }
      if (_listData.isEmpty) {
        setScreenEmpty();
      } else {
        setScreenReady();
      }
    } else {
      setScreenError(errorMsg: resp.message, errorMsgColor: Colors.white);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget buildContent() {
    return ListView.builder(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      itemCount: _listData.length,
      itemBuilder: (_, index) => _buildItem(_listData[index], _onItemClick),
    );
  }

  ///房主或者接待 才展示管理入口
  List<Widget>? _buildAction() {
    if (isNormalUser) return null;

    return [
      GestureDetector(
        onTap: () async {
          Navigator.of(context).pop();
          GameListManagerPage.show(context, widget.room);
        },
        child: Padding(
          padding:
              const EdgeInsetsDirectional.only(top: 14, bottom: 14, end: 16),
          child: R.img(
            RoomAssets.chat_room$ic_manage_svg,
            width: 24,
            height: 24,
            color: Colors.white60,
          ),
        ),
      )
    ];
  }

  ///跳转到玩法详情页时，先隐藏列表页
  void _onItemClick(GamePlayItem item) async {
    Navigator.of(context).pop();
    bool? result =
        await GameListUtil.openGameDetail(context, widget.room, item);

    ///如果没有点击我要玩，返回时再展示列表页
    if (result != true) {
      GameListUtil.openGameList(Constant.context, widget.room);
    }
  }
}

/// 普通用户点击游戏列表，进入详情页，可以点击我要玩按钮
class GameDetailPage extends StatelessWidget {
  final ChatRoomData room;
  final GamePlayItem item;

  const GameDetailPage({super.key, required this.room, required this.item});

  @override
  Widget build(BuildContext context) {
    return _wrapContainer(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitleBar(item.title, showBack: true),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10),
            child: Container(
              constraints: const BoxConstraints(minHeight: 134),
              width: Util.width,
              padding: const EdgeInsetsDirectional.only(
                  start: 16, top: 10, end: 16, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.white10,
                border: Border.all(color: const Color(0x33F6F7F9), width: 0.5),
              ),
              child: Text(
                item.content,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 52),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16, bottom: 20),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _play(context),
              child: Container(
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                width: Util.width,
                height: 52,
                child: Center(
                  child: Text(
                    K.room_iwant_play,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      maxHeight: 450.dp,
    );
  }

  void _play(BuildContext context) async {
    Tracker.instance.track(TrackEvent.play_guide_join, properties: {
      'uid': Session.uid,
      'rid': room.rid,
      'room_factory_type': room.config?.originalRFT,
    });

    NormalNull resp = await GameListRepo.select(room.rid, item.id);
    if (resp.success) {
      await room.sendMessage('${K.room_iwant_play}${item.title}',
          MessageSendData.msgExtraJsonEncode(room));
      Navigator.of(context).pop(true);
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }
}
