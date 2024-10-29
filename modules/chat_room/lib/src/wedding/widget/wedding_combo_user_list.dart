import 'package:flutter/material.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_view_mode.dart';
import 'package:chat_room/src/wedding/mode/wedding_combo_data.dart';

import 'wedding_combo_user_item.dart';
import 'package:provider/provider.dart';

/// 连击玩家列表
class WeddingComboUserList extends StatefulWidget {
  const WeddingComboUserList({super.key, this.combos});

  final List<WeddingComboUser>? combos;

  @override
  _WeddingComboUserListState createState() => _WeddingComboUserListState();
}

class _WeddingComboUserListState extends State<WeddingComboUserList> {
  List<WeddingComboUser>? _combos = [];

  @override
  void initState() {
    super.initState();
    _combos = widget.combos;
  }

  @override
  void didUpdateWidget(covariant WeddingComboUserList oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _combos = widget.combos;
    });
  }

  _onWelcomeComplete(WeddingComboUser data) {
    if (_combos!.contains(data)) {
      setState(() {
        _combos!.remove(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_combos == null || _combos!.isEmpty) return Container();
    final int? duration = context.select((RoomWeddingViewModel value) =>
        value.weddingData?.comboConfig?.duration);

    List<Widget> children = [];
    for (int index = 0; index < _combos!.length; index++) {
      WeddingComboUser e = _combos![index];
      children.add(_buildItems(e, index, duration));
    }
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: RepaintBoundary(
        child: Stack(
          children: children.reversed.toList(),
        ),
      ),
    );
  }

  Widget _buildItems(WeddingComboUser? user, int index, int? duration) {
    if (user == null) return Container();

    Widget content = AnimatedContainer(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(top: 55.0 * index),
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      child: WeddingComboUserItem(
        data: user,
        duration: duration,
        onComplete: _onWelcomeComplete,
      ),
    );
    return Positioned.fill(key: ValueKey(user.uid), child: content);
  }
}
