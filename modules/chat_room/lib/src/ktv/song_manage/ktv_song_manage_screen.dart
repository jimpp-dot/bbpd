import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/utils/ktv_theme.dart';
import 'package:chat_room/src/ktv/model/ktv_song_manage_beans.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/ktv/song_manage/ktv_song_add_modify_screen.dart';
import 'package:permission_handler/permission_handler.dart';

/// 管理我的歌曲
class KtvSongManageScreen extends StatefulWidget {
  const KtvSongManageScreen({Key? key}) : super(key: key);

  static Future<bool?> show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const KtvSongManageScreen(),
        settings: const RouteSettings(name: '/KtvSongManageScreen'),
      ),
    );
  }

  @override
  _KtvSongManageScreenState createState() => _KtvSongManageScreenState();
}

class _KtvSongManageScreenState extends State<KtvSongManageScreen> {
  final GlobalKey<PageLoadingListState> _listKey =
      GlobalKey<PageLoadingListState>();

  bool _share = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.ktv_my_song_manage),
      backgroundColor: KtvTheme.mainBgColor,
      bottomNavigationBar: _buildBottomBtn(),
      body: _buildBody(),
    );
  }

  Widget _buildBottomBtn() {
    List<Color> colors = KtvTheme.gradientColors;
    String text = K.ktv_upload_song;
    if (Platform.isIOS) {
      colors = KtvTheme.gradientColorsDisable;
      text = K.ktv_ios_not_support_upload_song;
    }

    return BottomButton.of(
      title: text,
      bgColor: colors,
      onTap: () async {
        if (Platform.isAndroid) {
          PermissionStatus storagePermission =
              await PermissionUtil.checkAndRequestPermissions(
                  context, Permission.storage);
          if (storagePermission != PermissionStatus.granted) {
            return;
          }

          bool? re = await KtvSongAddModifyScreen.show(context);
          if (re == true) {
            _refreshList();
          }
        }
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          height: 52,
          padding: const EdgeInsetsDirectional.only(start: 4),
          child: SettingItemWithSwitchWidget(
            title: K.ktv_share_my_song,
            value: _share,
            onChanged: (bool s) async {
              _share = s;
              refresh();
              bool re = await KtvRepo.shareSetting(_share);
              if (re == false) {
                _share = !_share;
                refresh();
              }
            },
          ),
        ),
        Expanded(
          child: PageLoadingList<MySongItem>(
            key: _listKey,
            loadData: (page) => _loadData(page),
            onFirstPageData: (_) {
              refresh();
            },
            indicatorBuilder: (context, status) {
              if (status == IndicatorStatus.noMoreLoad)
                return const LoadingFooter(hasMore: false);
              return null;
            },
            itemBuilder: (context, item, index) {
              return _buildItem(item);
            },
          ),
        ),
      ],
    );
  }

  Future<MySongListResp> _loadData(int page) async {
    int lastId = 0;
    if (page > 1) {
      if (_listKey.currentState != null) {
        List<MySongItem> list =
            (_listKey.currentState!.data as List<MySongItem>);
        lastId = list.last.id;
      }
    }
    MySongListResp resp = await KtvRepo.getMySongList(lastId);

    if (page == 1) {
      _share = resp.data?.share ?? false;
    }
    return resp;
  }

  Widget _buildItem(MySongItem item) {
    return Container(
      height: 72,
      width: Util.width,
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.name} - ${item.singer}',
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  K.ktv_who_share([item.shareUser]),
                  style:
                      TextStyle(color: R.color.secondTextColor, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24, height: 72),
          GestureDetector(
            onTap: () async {
              bool? re =
                  await KtvSongAddModifyScreen.show(context, songId: item.id);
              if (re == true) {
                _refreshList();
              }
            },
            child: R.img('ic_edit.svg',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 24,
                height: 24,
                color: R.color.secondTextColor),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () async {
              bool re = await KtvRepo.deleteSong(item.id);
              if (re == true) {
                _refreshList();
              }
            },
            child: R.img(
              'ic_delete.svg',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 24,
              height: 24,
              color: R.color.secondTextColor,
            ),
          ),
        ],
      ),
    );
  }

  void _refreshList() {
    if (mounted) {
      _listKey.currentState?.refresh(true);
    }
  }
}
