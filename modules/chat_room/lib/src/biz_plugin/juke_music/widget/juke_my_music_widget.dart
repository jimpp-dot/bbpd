import 'package:shared/shared.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_beans.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';

import 'juke_gift_list_mixin.dart';
import 'juke_music_base_state.dart';

/// 我的歌单
class JukeMyMusicWidget extends StatefulWidget {
  final int rid;

  const JukeMyMusicWidget({super.key, required this.rid});

  static void open(BuildContext context, int rid) async {
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        maxHeightRatio: 1,
        builder: (BuildContext context) {
          return JukeMyMusicWidget(rid: rid);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
  }

  @override
  _JukeMyMusicWidgetState createState() => _JukeMyMusicWidgetState();
}

class _JukeMyMusicWidgetState extends JukeMusicBaseState<JukeMyMusicWidget>
    with JukeGiftListMixin, TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late ScrollController _scrollController;
  AnimationController? _moveAnimationController;

  List<JukeMusic>? _list;
  bool _foldGift = false; // true: 折叠礼物UI

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_foldGift == true) return;
      if (_scrollController.offset > 10) {
        _moveAnimationController?.forward();
      }
    });
    _moveAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          setState(() {
            _foldGift = true;
          });
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    _moveAnimationController?.dispose();
    super.dispose();
  }

  @override
  loadData() async {
    DataRsp dataResp = await JukeMusicRepos.myMusic(widget.rid);
    JukeMyMusicData? musicData = dataResp.data;
    if (musicData == null) {
      setScreenError(errorMsg: dataResp.msg);
    } else {
      _list = musicData.songList;
      _list ??= [];
      setGiftData(musicData.settingList);
      setScreenReady();
    }
  }

  /// 添加歌曲
  _onAddMusic(String name) async {
    if (name.trim().isEmpty) return;
    bool success =
        await JukeMusicRepos.myMusicAdd(rid: widget.rid, musicName: name);
    if (success && mounted) {
      _textEditingController.text = '';
      loadData();
    }
  }

  /// 修改价格
  _submit() async {
    bool success = await JukeMusicRepos.setMyMusicPrice(
        rid: widget.rid, giftId: selectItem!.giftId, giftCount: count);
    if (mounted && success) {
      Navigator.maybePop(context);
      Fluttertoast.showToast(msg: K.room_juke_user_price_set_success);
    }
  }

  /// 删除歌曲
  _delete(int songId) async {
    bool? result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.room_juke_delete_tip,
          );
        });
    if (result != true) return;
    bool success =
        await JukeMusicRepos.myMusicDel(rid: widget.rid, musicId: songId);
    if (success && mounted) loadData();
  }

  @override
  Widget buildTitle() {
    return Container(
      width: double.infinity,
      height: 56.dp,
      alignment: AlignmentDirectional.center,
      child: Text(K.room_juke_my_song,
          style: R.textStyle.title.copyWith(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550.dp + Util.iphoneXBottom,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.dp)),
        color: R.color.mainBgColor,
      ),
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      child: buildBody(),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: 0.5.dp,
          color: R.color.dividerColor,
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ListView.builder(
                  padding: EdgeInsetsDirectional.only(
                      bottom: _foldGift ? 20.dp : 136.dp),
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _list!.length + 1,
                  itemBuilder: _renderMusicItem),
              _renderGift(),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.5.dp,
          margin: EdgeInsetsDirectional.only(
              start: 18.dp, end: 18.dp, bottom: 10.dp),
          color: R.color.dividerColor,
        ),
        if (giftList != null && giftList!.isNotEmpty)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 18.dp),
              Text(K.room_juke_music_price,
                  style: R.textStyle.body1.copyWith(fontSize: 16)),
              SizedBox(width: 8.dp),
              Text(
                  (selectItem!.giftPrice * count > 0)
                      ? '${selectItem!.giftPrice * count}'
                      : K.free,
                  style: R.textStyle.body2.copyWith(fontSize: 13)),
              if (selectItem!.giftPrice * count > 0) ...[
                SizedBox(width: 2.dp),
                R.img(MoneyConfig.moneyIcon, width: 12.dp, height: 12.dp),
              ],
              SizedBox(width: 2.dp),
              Text('/${K.room_juke_song}',
                  style: R.textStyle.body2.copyWith(fontSize: 13)),
              const Spacer(),
              Container(
                width: 110.dp,
                height: 24.dp,
                alignment: AlignmentDirectional.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        reduceOne();
                      },
                      child: Container(
                        width: 32.dp,
                        height: 24.dp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.horizontal(
                              start: Radius.circular(8.dp)),
                          color: count <= selectItem!.min
                              ? R.color.mainBrandColor.withOpacity(0.2)
                              : R.color.mainBrandColor.withOpacity(0.5),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: R.img(
                            RoomAssets.chat_room$jukemusic_ic_minus_small_png,
                            width: 16.dp,
                            height: 16.dp),
                      ),
                    ),
                    Container(
                      width: 46.dp,
                      height: 24.dp,
                      color: R.color.mainBrandColor.withOpacity(0.5),
                      child: Container(
                        width: 42.dp,
                        height: 20.dp,
                        margin: EdgeInsets.all(2.dp),
                        alignment: AlignmentDirectional.center,
                        color: R.color.mainBgColor,
                        child: Text('$count',
                            style: R.textStyle.title.copyWith(fontSize: 13)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        addOne();
                      },
                      child: Container(
                        width: 32.dp,
                        height: 24.dp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.horizontal(
                              end: Radius.circular(8.dp)),
                          color: count >= selectItem!.max
                              ? R.color.mainBrandColor.withOpacity(0.2)
                              : R.color.mainBrandColor.withOpacity(0.5),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: R.img(
                            RoomAssets.chat_room$jukemusic_ic_add_small_png,
                            width: 16.dp,
                            height: 16.dp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 18.dp),
            ],
          ),
        SizedBox(height: 20.dp),
        GestureDetector(
          onTap: _submit,
          child: Container(
            width: 335.dp,
            height: 52.dp,
            margin: EdgeInsetsDirectional.only(bottom: 8.dp),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
              borderRadius: BorderRadius.circular(26.dp),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(K.room_confirm,
                style: R.textStyle.title
                    .copyWith(fontSize: 16, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _renderGift() {
    if (giftList == null || giftList!.isEmpty) return const SizedBox.shrink();
    return _foldGift
        ? PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _foldGift = false;
                });
                _moveAnimationController?.reverse();
              },
              child: Container(
                width: double.infinity,
                height: 20.dp,
                alignment: AlignmentDirectional.center,
                child: Container(
                  width: 140.dp,
                  height: 20.dp,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(R.imagePath(
                            RoomAssets.chat_room$jukemusic_bg_popu_down_png)),
                        fit: BoxFit.fill),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(K.room_juke_price_detail,
                          style: const TextStyle(
                              color: Color(0xFF838383), fontSize: 12)),
                      SizedBox(width: 4.dp),
                      R.img(RoomAssets.chat_room$jukemusic_ic_down_png,
                          width: 12.dp, height: 12.dp),
                    ],
                  ),
                ),
              ),
            ),
          )
        : PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            height: 116.dp,
            child: Stack(
              children: [
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(
                        Rect.fromLTWH(0, 0, Util.width, 116.dp),
                        Size(Util.width, 116.dp)),
                    end: RelativeRect.fromSize(
                        Rect.fromLTWH(0, 116.dp, Util.width, 116.dp),
                        Size(Util.width, 116.dp)),
                  ).animate(_moveAnimationController!),
                  child: Container(
                    width: double.infinity,
                    height: 116.dp,
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 30.dp,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                R.color.mainBgColor.withOpacity(0),
                                R.color.mainBgColor
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            height: 86.dp,
                            color: R.color.mainBgColor,
                            alignment: AlignmentDirectional.center,
                            child: renderGiftList()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildHotWidget(JukeMusic item) {
    bool hot = item.hot;
    return GestureDetector(
      onTap: () async {
        /// 加入热门
        NormalNull resp = await JukeMusicRepos.updateSongHot(
            rid: widget.rid, songId: item.id, flag: hot ? 0 : 1);
        if (resp.success) {
          item.hot = !hot;
          refresh();
        } else {
          Fluttertoast.showCenter(msg: resp.msg);
        }
      },
      child: Container(
        height: 24,
        decoration: ShapeDecoration(
          shape: StadiumBorder(
              side: BorderSide(
                  color:
                      hot ? const Color(0xFF60C8FF) : const Color(0x1A313131),
                  width: 1)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            hot
                ? R.img('nearby/ic_done.svg',
                    width: 12,
                    height: 12,
                    color: const Color(0xFF60C8FF),
                    package: ComponentManager.MANAGER_PERSONALDATA)
                : R.img('encounter/ic_add.svg',
                    width: 12,
                    height: 12,
                    color: const Color(0x66313131),
                    package: ComponentManager.MANAGER_BASE_ROOM),
            const SizedBox(width: 2),
            Text(
              K.room_juke_music_hot_switch,
              style: TextStyle(
                color: hot ? const Color(0xFF60C8FF) : const Color(0x66313131),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderMusicItem(BuildContext context, int index) {
    if (index < _list!.length) {
      JukeMusic item = _list![index];
      // 歌曲item
      return Container(
        width: double.infinity,
        padding:
            EdgeInsetsDirectional.only(end: 20.dp, top: 10.dp, bottom: 10.dp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48.dp,
              alignment: AlignmentDirectional.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  R.img(RoomAssets.chat_room$jukemusic_bg_num_2_png,
                      width: 15.dp, height: 24.dp),
                  Text(
                    '${++index}',
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 22.dp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.songName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 4.dp),
                Row(
                  children: [
                    Text(K.room_juke_music_order_count,
                        style: TextStyle(
                            color: R.color.secondTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    SizedBox(width: 2.dp),
                    Text('${item.orderCount ?? 0}${K.room_ci}',
                        style: const TextStyle(
                            color: Color(0xFFFDA252),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            )),
            _buildHotWidget(item),
            SizedBox(width: 16.dp),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  _delete(item.id);
                },
                child: R.img(RoomAssets.chat_room$jukemusic_ic_delete_png,
                    width: 24.dp,
                    height: 24.dp,
                    color: R.color.secondTextColor)),
          ],
        ),
      );
    } else {
      // 添加歌曲名
      Color dotColor = R.color.mainTextColor.withOpacity(0.2);
      return Stack(
        children: [
          SizedBox(
            width: Util.width,
            height: 56.dp,
          ),
          PositionedDirectional(
              end: 18.dp,
              bottom: 4.dp,
              child: R.img(
                  RoomAssets.chat_room$jukemusic_ic_add_music_right_png,
                  height: 48.dp,
                  width: 34.dp,
                  color: dotColor)),
          Container(
            width: Util.width - 18.dp * 2,
            height: 48.dp,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.only(
                start: 18.dp, end: 18.dp, top: 4.dp, bottom: 4.dp),
            decoration: DottedDecoration(
                shape: Shape.box,
                borderRadius: BorderRadius.circular(12.dp),
                color: dotColor),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    _onAddMusic(_textEditingController.text);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.dp),
                    child: R.img(
                        RoomAssets.chat_room$jukemusic_ic_add_small_png,
                        width: 18.dp,
                        height: 18.dp,
                        color: R.color.secondTextColor),
                  ),
                ),
                SizedBox(
                  width: 200.dp,
                  child: TextField(
                    controller: _textEditingController,
                    autofocus: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: K.room_juke_music_add_tip,
                      hintStyle: TextStyle(
                          color: R.color.secondTextColor, fontSize: 16),
                      border: InputBorder.none,
                    ),
                    style:
                        TextStyle(color: R.color.mainTextColor, fontSize: 16),
                    onSubmitted: _onAddMusic,
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}
