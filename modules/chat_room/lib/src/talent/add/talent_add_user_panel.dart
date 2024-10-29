import 'package:chat_room/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/src/talent/data/talent_add_user_mixin.dart';
import 'package:chat_room/src/talent/talent_helper.dart';

import '../talent_constants.dart';

/// 添加主播页面
class TalentAddUserPanel extends StatefulWidget {
  const TalentAddUserPanel({super.key});

  @override
  _TalentAddUserPanelState createState() => _TalentAddUserPanelState();

  static Future<TalentAddUserItem?> show(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return TalentHelper.blurDialogWidget(
          child: const TalentAddUserPanel(),
        );
      },
    );
  }
}

class _TalentAddUserPanelState extends State<TalentAddUserPanel>
    with TalentAddSearchDataMixin<TalentAddUserPanel> {
  Timer? _cancelTimer;

  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();

  @override
  void dispose() {
    _cancelTimer?.cancel();
    closeInput();
    super.dispose();
  }

  void _onQueryChanged(String text) {
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => search(text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        Divider(height: 0.5.dp, color: const Color(0x14202020)),
        _buildSearchBar(),
        Expanded(child: _buildList()),
      ],
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
            K.room_talent_add_anchor,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.dp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
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
        searchIcon: Icon(
          Icons.search_sharp,
          size: 16.dp,
          color: const Color(0x33FFFFFF),
        ),
        hintText: K.room_talent_search_hit_text,
        hintStyle: TextStyle(
          color: const Color(0x33FFFFFF),
          fontSize: 13.dp,
        ),
        bgColor: const Color(0xFFFFFFFF).withOpacity(0.1),
      ),
    );
  }

  Widget _buildList() {
    if (isLoading) {
      return const Loading();
    }

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.black, Colors.transparent, Colors.transparent],
          stops: [0.0, 0.05, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: SafeArea(
        top: false,
        child: CustomScrollView(
          controller: controller,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverList(
              delegate: FixedExtentSliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  TalentAddUserItem item = data[index];
                  return _buildListItem(item);
                },
                childCount: data.length,
                onPositionChanged: handlePositionChanged,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildLoadMore(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapUser(TalentAddUserItem item) {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, item.uid,
        refer: const PageRefer('TalentAddUser'));
  }

  Widget _buildListItem(TalentAddUserItem item) {
    return SizedBox(
      height: 70.dp,
      child: Row(
        children: [
          SizedBox(width: 20.dp),
          GestureDetector(
            onTap: () => _onTapUser(item),
            child: CommonAvatar(
              path: item.icon,
              size: 50.dp,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10.dp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 14.dp),
                Text(
                  item.name,
                  style: TextStyle(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 17.dp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 2.dp),
                if (item.statusStr != null)
                  Text(
                    item.statusStr!,
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 12.dp,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
              ],
            ),
          ),
          _buildAddBtn(item),
          SizedBox(width: 20.dp),
        ],
      ),
    );
  }

  Widget _buildAddBtn(TalentAddUserItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(item);
      },
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

  void resetData() {}

  @override
  void closeInput() {
    if (_inputKey.currentState != null) {
      _inputKey.currentState!.close();
    }
  }

  @override
  void onLoadError(int page, String msg) {
    refreshUI();
    Fluttertoast.showCenter(msg: msg);
  }

  Widget _buildLoadMore() {
    if (noMore()) {
      return const SizedBox();
    }
    return SizedBox(
      height: 50.0,
      child: Center(
        child: Text(
          more ? BaseK.K.common_loading : BaseK.K.common_no_more,
          textScaleFactor: 1.0,
          style: TextStyle(fontSize: 13.0, color: R.color.secondTextColor),
        ),
      ),
    );
  }

  @override
  void onLoadSuccess(int page) {
    if (page == 0 && data.isEmpty) {
      // EMPTY
      refreshUI();
    } else {
      refreshUI();
    }
  }
}
