import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/mic_link/model/connector_bar_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/generated/connector_bar.pb.dart';
import '../model/mic_link_repo.dart';
import 'mic_link_user_list_logic.dart';

/// 连线用户列表
///
class MicLinkUserListPage extends StatefulWidget {
  final ChatRoomData room;

  const MicLinkUserListPage(this.room, {super.key});

  @override
  State<MicLinkUserListPage> createState() => _MicLinkUserListPageState();

  static Future show(BuildContext context, ChatRoomData room) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MicLinkUserListPage(room),
      settings: const RouteSettings(name: '/MicLinkRankPage'),
    ));
  }
}

class _MicLinkUserListPageState extends State<MicLinkUserListPage> {
  late MicLinkUserListLogic _logic;

  @override
  void initState() {
    super.initState();
    _logic = MicLinkUserListLogic(widget.room.rid);
    GetManager().put(_logic);
  }

  @override
  void dispose() {
    GetManager().delete<MicLinkUserListLogic>();
    super.dispose();
  }

  void _onBtnClick(PresentsUserInfo item) async {
    if (item.micStatus == 2) {
      NormalNull rsp =
          await MicLinkRepo.disconnectLink(widget.room.rid, item.uid);
      if (rsp.success) {
        Fluttertoast.showToast(msg: '断连成功');
        _logic.load();
      } else {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    } else if (item.micStatus == 1) {
      NormalNull rsp = await MicLinkRepo.joinUpper(widget.room.rid, item.uid);
      if (rsp.success) {
        Fluttertoast.showToast(msg: '连线成功');
        _logic.load();
      } else {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    } else {
      await RoomRepository.joinMic(widget.room.rid, -1,
          uid: item.uid, needCertify: false);
      _logic.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '连线列表',
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '连线送礼',
              style: TextStyle(color: R.color.mainTextColor, fontSize: 12),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              if (_logic.state?.isEmpty ?? true) {
                Fluttertoast.showToast(msg: '暂无数据');
                return;
              }
              bool? result = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ConfirmDialog(content: '是否清空统计');
                },
              );
              if (result == true) {
                _logic.onClearTaped();
              }
            },
            child: Container(
              width: 72,
              height: 32,
              alignment: Alignment.center,
              child: Text(
                '清空统计',
                style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.5),
                    fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _logic.obx(
      (state) => RefreshIndicatorFactory.of(
        onRefresh: () async {
          _logic.load();
        },
        child: ListView.builder(
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
          itemBuilder: (context, index) {
            PresentsUserInfo item = _logic.state![index];
            return _MicLinkUserItem(
              key: ValueKey(item.uid),
              item,
              onTap: () => _onBtnClick(item),
            );
          },
          itemCount: _logic.state?.length ?? 0,
        ),
      ),
      onError: (msg) => ErrorData(
        error: msg,
        onTap: () => _logic.load(),
      ),
      onEmpty: EmptyWidget(
        onTap: () => _logic.load(),
      ),
      onLoading: const Loading(),
    );
  }
}

class _MicLinkUserItem extends StatelessWidget {
  final PresentsUserInfo item;
  final VoidCallback? onTap;

  const _MicLinkUserItem(this.item, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81,
      child: Row(
        children: [
          const SizedBox(width: 16),
          CommonAvatar(path: item.icon, shape: BoxShape.circle, size: 44),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 4),
                    if (item.pos > 0)
                      Container(
                        height: 16,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF313131).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          '${item.pos}麦',
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 10),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 6),
                _buildCoin(),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildBtn(),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildCoin() {
    if (item.charm <= 0) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(MoneyConfig.moneyIcon, width: 20.0, height: 20.0),
        const SizedBox(width: 2),
        NumText(
          '${item.charm}',
          style: TextStyle(color: R.color.mainTextColor, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildBtn() {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 63,
        height: 28,
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(colors: item.btnColors),
        ),
        child: Text(
          item.btnText,
          style: const TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
