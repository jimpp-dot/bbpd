import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/model/sweet_album_repo.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/sweet_album_gift_dialog.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/widget/sweet_album_page_gift_item.dart';
import 'package:flutter/material.dart';

///甜蜜相册主页
class SweetAlbumPage extends StatefulWidget {
  final int targetUid;
  final int rid;
  final String? refer;
  final VoidCallback? onGiftSent;

  const SweetAlbumPage(
      {super.key,
      required this.targetUid,
      this.rid = 0,
      this.refer,
      this.onGiftSent});

  static Future show(BuildContext context, int targetUid,
      {int rid = 0, String? refer, VoidCallback? onGiftSent}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SweetAlbumPage(
            targetUid: targetUid, refer: refer, onGiftSent: onGiftSent),
        settings: const RouteSettings(name: '/SweetAlbumPage'),
      ),
    );
  }

  @override
  State<SweetAlbumPage> createState() => _SweetAlbumPageState();
}

class _SweetAlbumPageState extends State<SweetAlbumPage> {
  bool _loading = true;
  String _err = '';
  SweetAlbumPageData? _data;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(
      TrackEvent.sweet_photo_enter,
      properties: {
        'uid': Session.uid,
        'refer': Util.validStr(widget.refer) ? widget.refer : 'companion_in'
      },
    );
    _loadData();
  }

  void _loadData() async {
    ApiSweetAlbumPageResponse res =
        await SweetAlbumRepo.pageData(widget.targetUid, widget.rid);
    _loading = false;
    if (res.success) {
      _err = '';
      _data = res.data;
    } else {
      _err = res.message;
    }
    refresh();
  }

  void _reload() {
    _loading = true;
    _err = '';
    refresh();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF7548F0),
                  Color(0xFF8C87F5),
                  Color(0xFFFBDFFE),
                  Color(0xFFFCBCE1),
                  Color(0xFFF572D6)
                ],
                stops: [
                  0,
                  0.22,
                  0.34,
                  0.75,
                  1
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter),
          ),
        ),
        R.img(
          RoomAssets.chat_room$sweet_album_bg_album_page_webp,
          width: Util.width,
          height: 363.dp,
        ),
        Scaffold(
          appBar: BaseAppBar.custom(
            title: Text(K.room_sweet_album,
                style: Util.youSheBiaoTiYuan.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.normal)),
            backgroundColor: Colors.transparent,
            backColor: Colors.white,
            statusBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.transparent,
          body: _buildBody(),
        ),
      ],
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    } else if (_err.isNotEmpty) {
      return ErrorData(error: _err, onTap: _reload);
    } else if (_data == null) {
      return const EmptyWidget();
    } else {
      bool hasTargetUser = _data!.user2.uid > 0;
      return Column(
        children: [
          SizedBox(height: 4.dp),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
            child: Text(
              K.room_sweet_album_page_top_desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.dp, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 105.dp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonAvatar(
                        path: _data!.user1.icon,
                        size: 50.dp,
                        shape: BoxShape.circle),
                    R.img(
                      RoomAssets.chat_room$sweet_album_ic_heart_webp,
                      width: 42.dp,
                      height: 42.dp,
                    ),
                    hasTargetUser
                        ? CommonAvatar(
                            path: _data!.user2.icon,
                            size: 50.dp,
                            shape: BoxShape.circle)
                        : Container(
                            width: 50.dp,
                            height: 50.dp,
                            decoration: const ShapeDecoration(
                                shape: StadiumBorder(),
                                color: Color(0xFFF1E0FF)),
                            alignment: AlignmentDirectional.center,
                            child: R.img(
                              RoomAssets
                                  .chat_room$sweet_album_ic_empty_user_webp,
                              width: 20.dp,
                              height: 20.dp,
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 3.5.dp),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 82.dp,
                      child: Text(
                        _data!.user1.name.toCharacterBreakStr(),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12.dp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: 10.dp),
                    SizedBox(
                      width: 82.dp,
                      child: Text(
                        hasTargetUser
                            ? _data!.user2.name.toCharacterBreakStr()
                            : K.room_wait_for_seated,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12.dp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                if (hasTargetUser)
                  Container(
                    width: 100.dp,
                    height: 21.dp,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsetsDirectional.only(top: 6.dp),
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFAFAD2), Color(0xFFFEDF7D)]),
                    ),
                    child: GradientBorder(
                      borderRadius: 10.5.dp,
                      borderWidth: 1.5.dp,
                      borderGradient: const LinearGradient(
                          colors: [Color(0xFFFFE342), Color(0x00FFFFFF)]),
                      child: Container(
                        width: 100.dp,
                        height: 21.dp,
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          K.room_companion_level_x(['${_data!.currentLevel}']),
                          style: TextStyle(
                              fontSize: 12.dp, color: const Color(0xFFBC5B11)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8.dp),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    R.img(
                      RoomAssets.chat_room$sweet_album_bg_album_list_webp,
                      width: 343.dp,
                      height: 524.5.dp,
                    ),
                  ],
                ),
                SizedBox(height: 524.5.dp, child: _buildTaskList()),
              ],
            ),
          ),
          SizedBox(height: 10 + Util.iphoneXBottom),
        ],
      );
    }
  }

  Widget _buildTaskList() {
    List<SweetAlbumCategory> taskList = _data!.categories;
    return ListView.separated(
      shrinkWrap: true,
      padding:
          EdgeInsetsDirectional.only(top: 16.dp, bottom: 16.dp, start: 50.dp),
      itemBuilder: (context, index) {
        return _buildTaskItem(taskList[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.dp);
      },
      itemCount: taskList.length,
    );
  }

  Widget _buildTaskItem(SweetAlbumCategory item) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.dp),
          child: CachedNetworkImage(
            imageUrl: item.background,
            width: 275.dp,
            height: 132.dp,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 275.dp,
          height: 132.dp,
          padding: EdgeInsetsDirectional.only(
              start: 10.dp, end: 10.dp, top: 7.dp, bottom: 10.dp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.1)
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(item.chapter,
                      style: Util.youSheBiaoTiYuan
                          .copyWith(fontSize: 16.dp, color: Colors.white)),
                  SizedBox(width: 2.dp),
                  if (item.unlocked == 0)
                    R.img(
                      RoomAssets.chat_room$sweet_album_ic_lock_webp,
                      width: 10.dp,
                      height: 10.dp,
                    ),
                  const Spacer(),
                  Text(
                    item.unlocked > 0
                        ? K.room_companion_level_completed_x(
                            ['${item.levelRequired}'])
                        : K.room_companion_level_need_to_x(
                            ['${item.levelRequired}']),
                    style: TextStyle(
                      fontSize: 10.dp,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            offset: const Offset(0.0, 0.5),
                            blurRadius: 0,
                            color: Colors.black.withOpacity(0.5))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.gifts.isNotEmpty)
                    _buildGiftItem(item.gifts[0], item),
                  if (item.gifts.length > 1) SizedBox(width: 8.5.dp),
                  if (item.gifts.length > 1)
                    _buildGiftItem(item.gifts[1], item),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGiftItem(SweetAlbumGiftItem gift, SweetAlbumCategory item) {
    bool unlocked = item.unlocked > 0;
    return SweetAlbumPageGiftItem(
      gift: gift,
      unlocked: unlocked,
      onTap: () async {
        int? result = await SweetAlbumGiftDialog.show(
            context, widget.targetUid, gift, unlocked, _data!.numConfig, (n) {
          gift.light += n;
          refresh();
        });
        if (result != null) {
          gift.light += result;
          refresh();
          widget.onGiftSent?.call();
        }
      },
    );
  }
}
