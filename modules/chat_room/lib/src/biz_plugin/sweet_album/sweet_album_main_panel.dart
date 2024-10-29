import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/action/sweet_album_send_gift_action.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/model/sweet_album_repo.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/sweet_album_page.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/sweet_album_select_user_panel.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/widget/sweet_album_common_btn.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/widget/sweet_album_panel_gift_item.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/widget/sweet_album_send_btn.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///甜蜜相册房间半弹层主操作面板
class SweetAlbumMainPanel extends StatefulWidget {
  const SweetAlbumMainPanel({super.key});

  static Future show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 1.0,
      builder: (context) {
        return const SweetAlbumMainPanel();
      },
    );
  }

  @override
  State<SweetAlbumMainPanel> createState() => _SweetAlbumMainPanelState();
}

class _SweetAlbumMainPanelState extends State<SweetAlbumMainPanel>
    with TickerProviderStateMixin, SweetAlbumSendGiftAction {
  bool _loading = true;
  String _err = '';
  SweetAlbumHomeData? _data;
  final List<SweetAlbumCategory> _progressList = [];
  int _progressIndex = 0;
  List<int> _giftIndexList = [];
  List<int> _giftNumList = [];
  TabController? _tabController;
  final SwiperController _swiperController = SwiperController();
  bool _swiperMoving = false;
  int _selectUid = 0;
  late GlobalKey _swiperKey;
  int _rid = 0;

  @override
  void initState() {
    super.initState();
    _rid = ChatRoomData.getInstance()?.rid ?? 0;
    Tracker.instance.track(TrackEvent.sweet_photo_layer_enter,
        properties: {'uid': Session.uid});
    _loadData();
  }

  void _onTapChanged() {
    if (_tabController!.indexIsChanging) return;
    _progressIndex = _tabController!.index;
    refresh();
    if (_swiperController.index != _progressIndex) {
      _swiperMoving = true;
      _swiperController.move(_progressIndex);
    }
  }

  @override
  void dispose() {
    _swiperController.dispose();
    _tabController?.removeListener(_onTapChanged);
    _tabController?.dispose();
    super.dispose();
  }

  void _loadData() async {
    ApiSweetAlbumHomeResponse res =
        await SweetAlbumRepo.panelData(_selectUid, _rid);
    _loading = false;
    if (res.success) {
      _err = '';
      _data = res.data;
      _progressList.clear();
      _progressList.addAll(_data!.categories);
      _giftIndexList = _progressList.map((e) => 0).toList();
      _giftNumList = _progressList.map((e) => 1).toList();
      _progressIndex = 0;
      for (int i = _progressList.length - 1; i > 0; i--) {
        SweetAlbumCategory item = _progressList[i];
        if (item.unlocked > 0) {
          if (item.gifts.any((element) => element.light == 0)) {
            _progressIndex = i;
            break;
          }
          if (_progressIndex == 0) {
            _progressIndex = i;
          }
        }
      }
      if (_tabController == null ||
          _tabController!.length != _progressList.length) {
        _tabController?.removeListener(_onTapChanged);
        _tabController?.dispose();
        _tabController = TabController(
            initialIndex: _progressIndex,
            length: _progressList.length,
            vsync: this);
        _tabController?.addListener(_onTapChanged);
        _swiperKey = GlobalKey();
      } else {
        _tabController!.index = _progressIndex;
      }
      _swiperController.index = _progressIndex;
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
    double height = Util.isIphoneX ? 604.dp : 604.dp - 18;
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          R.img(
            RoomAssets.chat_room$sweet_album_bg_panel_webp,
            width: Util.width,
            height: 604.dp,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: Util.width,
            height: height - (Util.isIphoneX ? Util.iphoneXBottom : 16),
            child: _buildBody(),
          ),
          PositionedDirectional(
            top: 16.dp,
            end: 16.dp,
            child: _buildIntroBtn(),
          ),
        ],
      ),
    );
  }

  /// 说明按钮
  Widget _buildIntroBtn() {
    return GestureDetector(
      onTap: () {
        BaseWebviewScreen.show(context,
            url: Util.parseActHelpUrl('lovephotosrule'));
      },
      child: R.img(RoomAssets.chat_room$vindicate_vindicate_instruction_webp,
          width: 24.dp, height: 24.dp),
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
      return Column(
        children: [
          SizedBox(height: 21.dp),
          _buildUserRow(),
          SizedBox(height: 21.dp),
          Container(
            height: 76.dp,
            margin: EdgeInsetsDirectional.only(start: 16.dp),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(12.dp)),
                  child: Container(
                    height: 60.dp,
                    padding: EdgeInsetsDirectional.only(top: 13.dp),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(RoomAssets
                            .chat_room$sweet_album_bg_panel_progress_webp),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: _buildProgressList(),
                  ),
                ),
                PositionedDirectional(end: 0, child: _buildToAlbum()),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 387.dp,
            child: Swiper(
              key: _swiperKey,
              controller: _swiperController,
              outer: true,
              loop: false,
              scale: 0.83,
              scrollDirection: Axis.horizontal,
              viewportFraction: 280 / 387,
              itemWidth: 280.dp,
              itemHeight: 387.dp,
              itemCount: _progressList.length,
              index: _progressIndex,
              physics: _progressList.length == 1
                  ? const NeverScrollableScrollPhysics()
                  : const PageScrollPhysics(parent: BouncingScrollPhysics()),
              onIndexChanged: (index) {
                _progressIndex = index;
                if (_tabController?.index != index && !_swiperMoving) {
                  _tabController?.animateTo(index);
                }
              },
              onScrollEnd: () {
                _swiperMoving = false;
                if (_tabController?.index != _progressIndex) {
                  _tabController?.animateTo(_progressIndex);
                }
              },
              itemBuilder: (BuildContext context, int index) {
                return _buildPageItem(_progressList[index], index);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget _buildUserRow() {
    bool hasUser = _data!.companion.uid > 0;
    String text1 =
        hasUser ? _data!.companion.name : K.room_your_companion_not_exist;
    String text2 = hasUser
        ? K.room_curr_companion_level_x(['${_data!.companion.currentLevel}'])
        : K.room_companion_level_need_v1;
    return Row(
      children: [
        SizedBox(width: 16.dp),
        hasUser
            ? CommonAvatar(
                path: _data!.companion.icon,
                size: 60.dp,
                shape: BoxShape.circle)
            : Container(
                width: 60.dp,
                height: 60.dp,
                decoration: const ShapeDecoration(
                    shape: StadiumBorder(), color: Color(0xFFF1E0FF)),
                alignment: AlignmentDirectional.center,
                child: R.img(
                  RoomAssets.chat_room$sweet_album_ic_empty_user_webp,
                  width: 22.dp,
                  height: 22.dp,
                ),
              ),
        SizedBox(width: 8.dp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      text1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.dp,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (hasUser)
                    Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: 4, end: 4),
                      margin: const EdgeInsetsDirectional.only(start: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(8),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF3D5E), Color(0xFFFF70FF)],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        ),
                      ),
                      child: Text(
                        K.room_accompanying,
                        style: TextStyle(
                          fontSize: 10.dp,
                          color: Colors.white,
                          shadows: const [
                            Shadow(
                                offset: Offset(0.0, 0.5),
                                blurRadius: 1,
                                color: Color(0xFFFF3D5E))
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 5.dp),
              Row(
                children: [
                  Text(text2,
                      style: TextStyle(
                          fontSize: 12.dp,
                          color: Colors.white.withOpacity(0.9))),
                  const Spacer(),
                  if (hasUser)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        int? uid = await SweetAlbumSelectUserPanel.show(
                            context, _data!.companion.uid, _rid);
                        if (uid != null) {
                          _selectUid = uid;
                          _reload();
                        }
                      },
                      child: Row(
                        children: [
                          Text(K.room_other_companion,
                              style: TextStyle(
                                  fontSize: 12.dp,
                                  color: Colors.white.withOpacity(0.9))),
                          R.img(
                            BaseAssets.shared$box_ic_next_small_svg,
                            width: 12.dp,
                            height: 12.dp,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 16.dp),
      ],
    );
  }

  Widget _buildProgressList() {
    List<Widget> tabs = [];
    for (int i = 0; i < _progressList.length; i++) {
      tabs.add(_buildProgressItem(_progressList[i], i));
    }
    if (tabs.isEmpty) return const SizedBox.shrink();
    return CommonTabBar(
      tabs: tabs,
      isScrollable: true,
      controller: _tabController!,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.8),
      labelStyle: TextStyle(color: Colors.white, fontSize: 10.dp),
      unselectedLabelStyle:
          TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10.dp),
      indicator: const BoxDecoration(),
      marginStart: 5.dp,
      marginEnd: 28.dp,
      labelPadding: EdgeInsetsDirectional.only(end: 5.dp),
    );
  }

  Widget _buildProgressItem(SweetAlbumCategory item, int index) {
    bool select = index == _progressIndex;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(9.dp),
          child: CachedNetworkImage(
            imageUrl: item.background,
            width: 82.5.dp,
            height: 40.dp,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 82.5.dp,
          height: 40.dp,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadiusDirectional.circular(9.dp),
            border: select
                ? Border.all(color: const Color(0xFFF056BD), width: 2.dp)
                : null,
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            select ? item.seqName : item.chapter,
            style: Util.youSheBiaoTiYuan.copyWith(
                fontSize: select ? 15.dp : 10.dp,
                color: select ? Colors.white : Colors.white.withOpacity(0.8)),
          ),
        ),
        if (item.unlocked == 0)
          PositionedDirectional(
            top: 2.dp,
            end: 2.dp,
            child: R.img(
              RoomAssets.chat_room$sweet_album_ic_lock_webp,
              width: 8.dp,
              height: 8.dp,
            ),
          ),
      ],
    );
  }

  Widget _buildToAlbum() {
    return GestureDetector(
      onTap: () async {
        bool onGiftSent = false;
        await SweetAlbumPage.show(context, _data!.companion.uid,
            rid: _rid, refer: 'sweet_photo_layer_in', onGiftSent: () {
          onGiftSent = true;
        });
        if (onGiftSent) {
          _reload();
        }
      },
      child: R.img(
        RoomAssets.chat_room$sweet_album_btn_panel_album_webp,
        width: 44.dp,
        height: 76.dp,
      ),
    );
  }

  Widget _buildPageItem(SweetAlbumCategory item, int index) {
    return Container(
      width: 280.dp,
      height: 387.dp,
      padding: EdgeInsetsDirectional.only(start: 10.dp, end: 10.dp),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                RoomAssets.chat_room$sweet_album_bg_panel_page_item_webp),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Container(
            height: 48.dp,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              item.name,
              style: Util.youSheBiaoTiYuan
                  .copyWith(fontSize: 24.dp, color: const Color(0xFF7F4EE2)),
            ),
          ),
          Container(
            height: 1.dp,
            color: const Color(0xFF7F4EE2).withOpacity(0.2),
          ),
          Container(
            height: 32.dp,
            alignment: AlignmentDirectional.centerStart,
            child: EasyRichText(
              K.room_companion_level_need_x_unlock_gift(
                  ['${item.levelRequired}']),
              defaultStyle: TextStyle(
                  fontSize: 12.dp, color: Colors.black.withOpacity(0.5)),
              patternList: [
                EasyRichTextPattern(
                  hasSpecialCharacters: true,
                  targetString: 'Lv${item.levelRequired}',
                  style: TextStyle(
                      fontSize: 12.dp, color: const Color(0xFF7F4EE2)),
                )
              ],
            ),
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.dp),
                child: CachedNetworkImage(
                  imageUrl: item.background,
                  width: 260.dp,
                  height: 215.dp,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 260.dp,
                height: 215.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12.dp),
                    color: Colors.black.withOpacity(0.2)),
                child: _buildGiftRow(item, index),
              ),
            ],
          ),
          SizedBox(height: 21.dp),
          item.unlocked > 0
              ? SweetAlbumSendBtn(
                  gift: item.gifts[_giftIndexList[index]],
                  sendNum: _giftNumList[index],
                  chooseNumConfig: _data!.numConfig,
                  onLeftTap: (count) {
                    refresh(() {
                      _giftNumList[index] = count;
                    });
                  },
                  onRightTap: (int n) {
                    sendGift(
                        _data!.companion.uid,
                        item.gifts[_giftIndexList[index]],
                        n > 0 ? n : _giftNumList[index], (n) {
                      item.gifts[_giftIndexList[index]].light += n;
                      refresh();
                    });
                  })
              : SweetAlbumCommonBtn(
                  text: K.room_to_unlock,
                  onTap: () {
                    if (_data!.companion.uid > 0) {
                      IPersonalDataManager manager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_PERSONALDATA);
                      manager.openAccompanyRemember(
                          context, _data!.companion.uid);
                    } else {
                      Toast.show(context, K.room_your_companion_not_exist);
                    }
                  },
                ),
          if (item.unlocked == 0)
            Container(
              height: 21.dp,
              alignment: AlignmentDirectional.center,
              child: Text(
                K.room_view_companion_level_task_desc,
                style: TextStyle(
                    fontSize: 9.dp,
                    color: const Color(0xFF7F4EE2).withOpacity(0.7)),
              ),
            ),
          SizedBox(height: 5.dp),
        ],
      ),
    );
  }

  Widget _buildGiftRow(SweetAlbumCategory item, int pageIndex) {
    List<SweetAlbumGiftItem> gifts = item.gifts;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (gifts.isNotEmpty) _buildGiftItem(gifts[0], pageIndex, 0),
        if (gifts.length > 1) SizedBox(width: 15.dp),
        if (gifts.length > 1) _buildGiftItem(gifts[1], pageIndex, 1),
      ],
    );
  }

  Widget _buildGiftItem(SweetAlbumGiftItem gift, int pageIndex, int giftIndex) {
    bool unlocked = _progressList[pageIndex].unlocked > 0;
    bool select = _giftIndexList[pageIndex] == giftIndex;
    return SweetAlbumPanelGiftItem(
      gift: gift,
      unlocked: unlocked,
      select: select,
      onTap: () {
        if (unlocked && !select) {
          refresh(() {
            _giftIndexList[pageIndex] = giftIndex;
          });
        }
      },
    );
  }
}
