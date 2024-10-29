import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/talent_new/data/talent_repo_new.dart';
import 'package:chat_room/src/talent_new/talent_constants_new.dart';
import 'package:flutter/material.dart' hide SearchBar;

import '../../../assets.dart';
import '../../protobuf/generated/common_artcenter.pb.dart';
import '../talent_helper_new.dart';

/// 添加主播页面
class TalentAddRidPanelNew extends StatefulWidget {
  const TalentAddRidPanelNew({super.key});

  @override
  _TalentAddRidPanelNewState createState() => _TalentAddRidPanelNewState();

  static Future<int?> show(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return TalentHelperNew.blurDialogWidget(
          child: const TalentAddRidPanelNew(),
        );
      },
    );
  }
}

class _TalentAddRidPanelNewState extends State<TalentAddRidPanelNew> {
  Timer? _cancelTimer;

  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();

  bool isLoading = false;

  ResArtRoomSearch? res;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cancelTimer?.cancel();
    closeInput();
    super.dispose();
  }

  void closeInput() {
    if (_inputKey.currentState != null) {
      _inputKey.currentState!.close();
    }
  }

  void _onQueryChanged(String text) {
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 500), () => _search(text));
  }

  void _search(String query) async {
    if (query.length < 9) {
      res = null;
      refresh();
      return;
    }
    isLoading = true;
    refresh();
    res = await TalentNewRepo.searchRid(query);
    isLoading = false;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTitle(),
          Divider(height: 0.5.dp, color: const Color(0x14202020)),
          _buildSearchBar(),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: 20.dp, top: 20.dp, bottom: 20.dp),
          child: Text(
            K.talent_add_room,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.dp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop(0);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 16.dp, top: 16.dp),
            child: Icon(
              Icons.close,
              size: 24.dp,
              color: const Color(0xFFA5A5A5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.dp, vertical: 15.dp),
      child: SearchBar(
        _onQueryChanged,
        key: _inputKey,
        showSearchIcon: true,
        height: 36.dp,
        searchIcon: R.img(
            RoomAssets.chat_room$talent_new_ic_room_talent_search_webp,
            width: 16.dp,
            height: 16.dp),
        deleteIcon: R.img(
            RoomAssets.chat_room$talent_new_ic_delete_small_2_webp,
            width: 16.dp,
            height: 16.dp),
        textStyle: TextStyle(
          color: const Color(0xFFF6F7F9),
          fontSize: 13.dp,
        ),
        hintText: K.talent_input_room_id,
        hintStyle: TextStyle(
          color: const Color(0x33FFFFFF),
          fontSize: 13.dp,
        ),
        bgColor: const Color(0xFFFFFFFF).withOpacity(0.1),
        keyboardType: TextInputType.datetime,
        maxLength: 9,
        autoFocus: true,
      ),
    );
  }

  Widget _buildList() {
    if (isLoading) {
      return const Loading();
    }
    if (res == null) {
      return const SizedBox();
    }
    if (!res!.success) {
      return const EmptyWidget(textColor: Colors.white);
    }
    return _buildListItem();
  }

  Widget _buildListItem() {
    return InkWell(
      onTap: _pop,
      child: SizedBox(
        height: 70.dp,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20.dp),
            CommonAvatar(
              path: res?.icon ?? '',
              size: 50.dp,
              shape: BoxShape.circle,
            ),
            SizedBox(width: 10.dp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    res?.roomTitle ?? '',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 17.dp,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.dp),
                  IDWidget(
                    uid: res!.rid,
                    fontSize: 13,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            _buildAddBtn(),
            SizedBox(width: 20.dp),
          ],
        ),
      ),
    );
  }

  void _pop() {
    Navigator.of(context).pop(res?.rid ?? 0);
  }

  Widget _buildAddBtn() {
    return GestureDetector(
      onTap: _pop,
      child: Container(
        height: 28.dp,
        padding: EdgeInsets.symmetric(horizontal: 19.dp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: buttonColors,
          ),
          borderRadius: BorderRadius.circular(20.dp),
        ),
        child: Text(
          K.room_talent_add,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.dp,
          ),
        ),
      ),
    );
  }
}
