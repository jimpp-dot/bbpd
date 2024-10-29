import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../../../assets.dart';
import '../../../../k.dart';
import '../model/juke_music_repos.dart';

///添加待唱
class JukeMusicSingerAddPanel extends StatefulWidget {
  final ChatRoomData room;

  const JukeMusicSingerAddPanel({Key? key, required this.room})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => JukeMusicSingerAddPanelState();

  static Future<bool?> show(BuildContext context, ChatRoomData room) {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        disableTapDismissible: true,
        builder: (context) {
          return JukeMusicSingerAddPanel(room: room);
        });
  }
}

class JukeMusicSingerAddPanelState extends State<JukeMusicSingerAddPanel> {
  final List<int> _selectedUids = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600 + Util.iphoneXBottom,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(RoomAssets.chat_room$jukemusic_juke_bg_webp),
            fit: BoxFit.fill),
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16.dp)),
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(height: 12),
          _buildSubTitle(),
          Expanded(child: _buildContent()),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    List<Widget> res = [];
    for (var user in widget.room.positions) {
      if (user.icon.isNotEmpty) {
        res.add(_buildSingerIcon(user));
      }
    }
    if (res.isEmpty) {
      return EmptyWidget(desc: K.room_juke_no_singer, textColor: Colors.white);
    }
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      mainAxisSpacing: 10,
      crossAxisSpacing: 20,
      crossAxisCount: 4,
      children: res,
    );
  }

  Widget _buildTitle() {
    return SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: R.img(RoomAssets.chat_room$jukemusic_ic_juke_back_png,
                    width: 24, height: 24),
              ),
            ),
            Expanded(
                flex: 1,
                child: Text(K.room_juke_add_singer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold))),
            const SizedBox(width: 44),
          ],
        ));
  }

  Widget _buildSubTitle() {
    return Text(K.room_juke_choose_singer,
        style: const TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600));
  }

  Widget _buildSingerIcon(RoomPosition item) {
    bool selected = _selectedUids.contains(item.uid);
    return InkWell(
      onTap: () {
        if (!_selectedUids.contains(item.uid)) {
          _selectedUids.add(item.uid);
        } else {
          _selectedUids.remove(item.uid);
        }
        refresh();
      },
      child: Container(
        width: 52,
        height: 65,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        alignment: AlignmentDirectional.topCenter,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                CommonAvatar(
                  path: item.icon,
                  size: 52,
                  shape: BoxShape.circle,
                ),
                if (selected) ...[
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(
                          side: BorderSide(color: Color(0xFF926AFF), width: 1)),
                    ),
                  ),
                  const PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: SelectedIcon(
                        size: 16,
                      ))
                ],
              ],
            ),
            const SizedBox(height: 5),
            Text(item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: R.color.brightTextColor, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return GestureDetector(
      onTap: () async {
        if (_selectedUids.isEmpty) {
          Fluttertoast.showToast(msg: K.room_juke_choose_tips);
        } else {
          String uids = "";
          for (int i = 0; i < _selectedUids.length; i++) {
            if (i != _selectedUids.length - 1) {
              uids = "$uids${_selectedUids[i]},";
            } else {
              uids = "$uids${_selectedUids[i]}";
            }
          }
          BaseResponse rsp =
              await JukeMusicRepos.addSinger(rid: widget.room.rid, uids: uids);
          if (rsp.success && mounted) {
            Fluttertoast.showToast(msg: K.room_juke_done);
            Navigator.pop(context, true);
          } else if (rsp.success == false && rsp.msg?.isNotEmpty == true) {
            Fluttertoast.showToast(msg: rsp.msg);
          }
        }
      },
      child: Container(
        height: 52,
        width: Util.width,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.only(
            bottom: Util.iphoneXBottom + 30, top: 20),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFDD7AE6), Color(0xFF8C35FF)]),
            borderRadius: BorderRadius.circular(26)),
        child: Text(K.room_juke_add_confirm,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
