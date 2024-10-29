import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/gpk/widget/check_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/chatRoomData.dart';

/// 显示选人页面
Future<List<int>?> showUserSelectDialog(BuildContext context,
    List<OptionUser> userList, List<OptionUser> hasSelectList) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return VoteUserSelectDialog(List.from(userList), hasSelectList);
      });
}

/// 投票插件选人对话框页面
class VoteUserSelectDialog extends StatefulWidget {
  final List<OptionUser> userList;
  final List<OptionUser> hasSelectList;

  const VoteUserSelectDialog(this.userList, this.hasSelectList, {super.key});

  @override
  _VoteUserSelectDialogState createState() => _VoteUserSelectDialogState();
}

class _VoteUserSelectDialogState extends State<VoteUserSelectDialog> {
  late List<OptionUser> _selectList;
  OptionUser? _headUser;
  late List<OptionUser> _list;

  @override
  void initState() {
    super.initState();
    _selectList = widget.hasSelectList;
    _list = widget.userList;
    if (!(ChatRoomData.getInstance()?.isEightPosition ?? false)) {
      _headUser = _list.removeAt(0);
    }
  }

  /// 是否已经选择
  bool _hasSelected(OptionUser user) {
    for (OptionUser item in _selectList) {
      if (item.uid == user.uid) {
        return true;
      }
    }
    return false;
  }

  void _onItemClick(OptionUser user) {
    if (_hasSelected(user)) {
      _selectList.removeWhere((element) => element.uid == user.uid);
    } else {
      _selectList.add(user);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 312,
        height: 295,
        child: Column(
          children: [
            if (_headUser != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: _UserItemWidget(
                    item: _headUser!,
                    isHeader: true,
                    isSelected: _hasSelected(_headUser!),
                    onClick: () {
                      _onItemClick(_headUser!);
                    },
                  ),
                ),
              ),
            GridView.count(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              crossAxisCount: 4,
              childAspectRatio: 0.90,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _buildSelPosList(_list),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建列表项
  List<Widget> _buildSelPosList(List<OptionUser> list) {
    return list
        .map((e) => _UserItemWidget(
              item: e,
              isSelected: _hasSelected(e),
              onClick: () {
                _onItemClick(e);
              },
            ))
        .toList();
  }
}

/// 选人页面位置
class _UserItemWidget extends StatelessWidget {
  final OptionUser item;
  final bool isSelected;
  final bool isHeader; //头部尺寸不同
  final VoidCallback? onClick;

  const _UserItemWidget(
      {required this.item,
      required this.isSelected,
      this.isHeader = false,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    var isIdle = item.uid == 0;
    String text;
    if (isIdle) {
      text = K.room_gpk_idle;
    } else {
      text = item.name;
    }
    return SizedBox(
      width: isHeader ? 120 : 64,
      height: isHeader ? 74 : 68,
      child: InkWell(
        onTap: () {
          _onClickItem();
        },
        child: Column(
          children: [
            isIdle ? _buildChair() : _buildAvatar(),
            _buildText(text),
          ],
        ),
      ),
    );
  }

  /// 头像&选中态
  Widget _buildAvatar() {
    var isIdle = item.uid == 0;
    String url;
    if (isIdle) {
      url = RoomAssets.chat_room$gpk_gpk_chair_svg; // 沙发
    } else {
      url = item.icon;
    }
    return Stack(
      children: [
        CommonAvatar(
          path: url,
          size: _getImgSize(),
          shape: BoxShape.circle,
        ),
        if (isSelected)
          const PositionedDirectional(
              end: 0,
              bottom: 0,
              child: CheckedWidget(
                  gradientColors: [Color(0xFFFF6991), Color(0xFFFF38B2)])),
      ],
    );
  }

  /// 空闲沙发
  Widget _buildChair() {
    return Container(
      width: _getImgSize(),
      height: _getImgSize(),
      decoration: BoxDecoration(
        color: const Color(0xFF313131).withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: R.img(RoomAssets.chat_room$gpk_gpk_chair_svg,
            width: 24, height: 24),
      ),
    );
  }

  double _getImgSize() {
    return isHeader ? 52 : 48;
  }

  // 底部文字
  Widget _buildText(String text) {
    return Container(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: R.color.mainTextColor,
          fontWeight: FontWeight.w500,
          fontSize: _getTextSize(),
        ),
      ),
    );
  }

  double _getTextSize() {
    return isHeader ? 11 : 10;
  }

  /// 点击条目事件
  void _onClickItem() {
    if (item.uid == 0) {
      return;
    }
    if (onClick != null) onClick!();
  }
}
