import 'package:shared/shared.dart';
import 'package:shared/component/no_data.dart' as NoData;
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:provider/provider.dart' hide Selector;

double _giftMediaPannelHeightRatio = 0.7;

class MediaItemWidget extends StatefulWidget {
  final double size;
  final MediaItem mediaItem;
  final bool? checked;
  final bool inEditMode;
  final ValueChanged<bool>? onCheckChange;

  const MediaItemWidget(this.mediaItem, this.size, this.onCheckChange,
      this.checked, this.inEditMode,
      {super.key});

  @override
  _MediaItemWidgetState createState() => _MediaItemWidgetState();
}

class _MediaItemWidgetState extends State<MediaItemWidget> {
  Widget _buildCheckBox(bool checked) {
    return GestureDetector(
      onTap: () {
        if (widget.onCheckChange != null) widget.onCheckChange!(!checked);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 8, bottom: 8, end: 4, top: 4),
        child: R.img(
            checked ? 'ic_checkbox_checked.svg' : 'ic_checkbox_unchecked.svg',
            package: ComponentManager.MANAGER_BASE_ROOM,
            width: 24,
            height: 24),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: CachedNetworkImage(
        imageUrl: '${System.imageDomain}${widget.mediaItem.image}!cover375',
        width: widget.size,
        height: widget.size,
        fit: BoxFit.cover,
        errorWidgetType: ErrorWidgetType.defaultUserIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GiftMediaModel.previewMediaItem(context, widget.mediaItem);
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildImage(),
            if (widget.mediaItem.status >= 1 || widget.inEditMode)
              PositionedDirectional(
                top: 0,
                end: 0,
                child: _buildCheckBox(widget.checked ?? false),
              ),
            if (widget.mediaItem.type == GiftMediaType.video)
              R.img('ic_videoplay.svg',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  width: 32,
                  height: 32),
            if (widget.mediaItem.status < 1)
              PositionedDirectional(
                start: 0,
                bottom: 0,
                end: 0,
                child: Container(
                  height: 24,
                  width: widget.size,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0x33000000),
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(8.0),
                        bottomEnd: Radius.circular(8.0)),
                  ),
                  child: Text(
                    BaseK.K.base_checking,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MediaListWidget extends StatefulWidget {
  final int uid;
  final int rid;
  final bool isAdmin;
  final ChatRoomData room;

  const MediaListWidget(this.uid, this.rid, this.isAdmin, this.room,
      {super.key});

  @override
  _MediaListWidgetState createState() => _MediaListWidgetState();

  static show(BuildContext context, int rid, bool isAdmin, ChatRoomData room) {
    Tracker.instance.track(TrackEvent.room_album_view, properties: {
      'rid': rid,
      'room_type': room.config?.type,
      'room_types': describeEnum(room.config?.types),
      'room_property': describeEnum(room.config?.property),
    });

    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      theme: Theme.of(System.context).copyWith(
        canvasColor: Colors.transparent,
        platform: Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
      builder: (context) {
        return MediaListWidget(Session.uid, rid, isAdmin, room);
      },
    );
  }
}

class _MediaListWidgetState extends State<MediaListWidget>
    with SingleTickerProviderStateMixin<MediaListWidget> {
  late GlobalKey<PageLoadingListState<MediaItem>> _privateListKey;
  late GlobalKey<PageLoadingListState<MediaItem>> _roomListKey;
  late GlobalKey<UploadState> _uploadKey;
  bool _withGift = false;
  int _giftId = 0;
  Gift? _gift;
  final Set<MediaItem> _checkedMedias = {};
  List<Gift>? _gifts;
  ExtendedTabController? _tabController;
  final double _pagePadding = 15.0;
  bool _inEditMode = false;
  final DialogLoadingController _controller = DialogLoadingController();

  @override
  void initState() {
    _privateListKey = GlobalKey<PageLoadingListState<MediaItem>>();
    _roomListKey = GlobalKey<PageLoadingListState<MediaItem>>();
    _uploadKey = GlobalKey<UploadState>();
    GiftListRepository.getGiftList().then((rsp) {
      if (rsp.success && rsp.data != null && rsp.data!.isNotEmpty) {
        _gifts = rsp.data;

        if (mounted) setState(() {});
      }
    });
    if (widget.isAdmin) {
      safeRun(
        () => _tabController =
            ExtendedTabController(initialIndex: 0, length: 2, vsync: this)
              ..addListener(
                () {
                  _inEditMode = false;
                  _checkedMedias.clear();
                  setState(() {});
                },
              ),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  Widget _buildTitle() {
    return Row(
      children: <Widget>[
        IconButton(
            icon: R.img('ic_help.svg',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 24,
                height: 24),
            padding: const EdgeInsets.all(0.0),
            iconSize: 40,
            onPressed: () {
              BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k31'));
            }),
        !widget.isAdmin || _tabController == null
            ? Expanded(
                child: Center(
                  child: Text(
                    K.room_gift_media_tab_room,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            : Expanded(
                child: Util.isUseAnimTabBar()
                    ? AnimTabBar(
                        titles: [
                          K.room_gift_media_tab_private,
                          K.room_gift_media_tab_room
                        ],
                        controller: _tabController,
                        selectedFontSize: 16,
                        unselectedFontSize: 14,
                        selectedFontWeight: FontWeight.w600,
                        unselectedFontWeight: FontWeight.w600,
                        selectedFontColor: R.color.mainTextColor,
                        unselectedFontColor: R.color.secondTextColor,
                        maxWidthForCenter: Util.width - 80,
                      )
                    : CommonTabBar(
                        controller: _tabController,
                        tabs: [
                          Text(
                            K.room_gift_media_tab_private,
                          ),
                          Text(
                            K.room_gift_media_tab_room,
                          ),
                        ],
                      ),
              ),
        (widget.isAdmin && (listData?.isNotEmpty ?? false))
            ? IconButton(
                icon: Text(
                  _inEditMode ? BaseK.K.finish : BaseK.K.base_edit,
                  style: TextStyle(fontSize: 16, color: R.color.mainBrandColor),
                ),
                padding: const EdgeInsetsDirectional.only(end: 8),
                iconSize: 40,
                onPressed: () {
                  _inEditMode = !_inEditMode;
                  _checkedMedias.clear();
                  setState(() {});
                })
            : const SizedBox(
                width: 40,
              ),
      ],
    );
  }

  Widget _buildRoomMediaList() {
    int crossCount = 2;
    double spacing = 13;
    double size = (Util.width - spacing * (crossCount - 1) - _pagePadding * 2) /
        crossCount;

    return Column(
      children: <Widget>[
        Expanded(
          child: PageLoadingList<GiftMediaInfo>(
            key: _roomListKey,
            itemBuilder: (c, item, index) => GiftMediaMessageItemContent(
              itemInfo: item,
              size: size,
              room: widget.room,
              checked: _checkedMedias.any((_) => _.id == item.id),
              inEditMode: _inEditMode,
              onCheckChange: (value) {
                if (value) {
                  _checkedMedias.add(item);
                  setState(() {});
                } else {
                  _checkedMedias.remove(item);
                  setState(() {});
                }
              },
            ),
            loadData: (page) => GiftMediaRepository.getGiftMediaInfoListByRoom(
                widget.rid, page),
            onFirstPageData: (_) {
              if (!mounted) return;
              setState(() {});
            },
            extendedListDelegate:
                SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
            ),
          ),
        ),
        SizedBox(
          height: _pagePadding,
        ),
        Divider(
          height: 0.5,
          color: R.color.dividerColor,
        ),
        if (_inEditMode) _buildEditBottom(),
      ],
    );
  }

  Widget _buildPage() {
    if (!widget.isAdmin) {
      return Expanded(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: _pagePadding, end: _pagePadding, bottom: _pagePadding),
          child: _buildRoomMediaList(),
        ),
      );
    }

    return Expanded(
        child: TabBarView(
      controller: _tabController,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: _pagePadding, end: _pagePadding),
          child: _buildPrivateList(),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: _pagePadding, end: _pagePadding, bottom: _pagePadding),
          child: _buildRoomMediaList(),
        ),
      ],
    ));
  }

  Widget _buildUpload(double size) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: ImageVideoUpload(
        key: _uploadKey,
        source: ImageSource.gallery,
        imageUplaodUrl: '${System.domain}upload/image/',
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const Icon(Icons.photo_camera),
              const Spacer(),
              Text(
                K.upload,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 19,
              ),
            ],
          ),
        ),
        onComplete: (String name, String type, String cover) {
          if (name.isEmpty) return false;
          GiftMediaRepository.addMedia(type, name, cover).then((rsp) {
            if (rsp.success) {
              _privateListKey.currentState?.refresh(
                  (_privateListKey.currentState?.data.length ?? 0) <= 2);
              Tracker.instance.track(TrackEvent.room_photo_upload, properties: {
                'rid': widget.rid,
                'room_type': widget.room.config?.type,
                'room_types': describeEnum(widget.room.config?.types),
                'room_property': describeEnum(widget.room.config?.property),
                'role': describeEnum(widget.room.purview),
              });
            } else if (rsp.msg != null && rsp.msg!.isNotEmpty) {
              Fluttertoast.showToast(msg: rsp.msg);
            }
          });

          return true;
        },
        onError: (msg) {
          Fluttertoast.showToast(msg: msg);
        },
      ),
    );
  }

  Widget _buildPrivateItem(MediaItem item, double size) {
    if (item is EmptyMediaItem) {
      return _buildUpload(size);
    }

    bool checked = _checkedMedias.any((_) => _.id == item.id);
    return MediaItemWidget(
      item,
      size,
      (value) {
        if (value) {
          if (_checkedMedias.length >= 9) {
            Fluttertoast.showToast(msg: K.room_gift_media_select_too_many);
          } else {
            _checkedMedias.add(item);
            setState(() {});
          }
        } else {
          _checkedMedias.remove(item);
          setState(() {});
        }
      },
      checked,
      _inEditMode,
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.empty) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              child: NoData.EmptyWidget(
                desc: K.room_gift_media_list_empty,
                textAlign: TextAlign.center,
                paddingBottom: 28,
                onTap: () {
                  _privateListKey.currentState?.refresh();
                },
              ),
            ),
            ImageVideoUpload(
              key: _uploadKey,
              source: ImageSource.gallery,
              imageUplaodUrl: '${System.domain}upload/image/',
              onFilePicked: () {
                if (_privateListKey.currentState?.data.isEmpty ?? false) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    _privateListKey.currentState?.data.add(EmptyMediaItem());
                    setState(() {});
                  });
                }
              },
              child: Container(
                width: 160,
                height: 40,
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      K.upload,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              onComplete: (String name, String type, String cover) {
                if (name.isEmpty) return false;
                GiftMediaRepository.addMedia(type, name, cover).then((rsp) {
                  if (rsp.success) {
                    _privateListKey.currentState?.refresh(
                        (_privateListKey.currentState?.data.length ?? 0) <= 2);
                  } else if (rsp.msg != null && rsp.msg!.isNotEmpty) {
                    Fluttertoast.showToast(msg: rsp.msg);
                  }
                });
                return true;
              },
              onError: (msg) {
                Fluttertoast.showToast(msg: msg);
              },
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildPrivateList() {
    int crossCount = 3;
    double spacing = 10;
    double size = (Util.width - spacing * (crossCount - 1) - _pagePadding * 2) /
        crossCount;

    return Column(
      children: <Widget>[
        Expanded(
          child: PageLoadingList<MediaItem>(
            key: _privateListKey,
            itemBuilder: (c, item, index) => _buildPrivateItem(item, size),
            loadData: (page) => GiftMediaRepository.getMediaList(page),
            onFirstPageData: (_) {
              if (mounted) setState(() {});
            },
            indicatorBuilder: _indicatorBuilder,
            extendedListDelegate:
                SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
            ),
          ),
        ),
        SizedBox(
          height: _pagePadding,
        ),
        Divider(
          height: 0.5,
          color: R.color.dividerColor,
        ),
        _inEditMode ? _buildEditBottom() : _buildSendBottom(),
      ],
    );
  }

  Widget _buildGift() {
    Widget widget;
    if (_giftId <= 0) {
      widget = Text(
        K.room_set_gift,
        style: TextStyle(color: R.color.thirdTextColor, fontSize: 13),
      );
    } else {
      widget = CachedNetworkImage(
          placeholder: const CupertinoActivityIndicator(),
          imageUrl: Util.giftImgUrl(_giftId),
          width: 32,
          height: 32,
          fit: BoxFit.contain);
    }

    return GestureDetector(
      onTap: () {
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager
            .openGiftSelectPanel(
                context, Util.height * _giftMediaPannelHeightRatio, _gifts)
            .then((gift) {
          if (gift != null) {
            _giftId = gift.id;
            _gift = gift;
            _withGift = true;
            setState(() {});
          }
        });
      },
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 8,
            height: 58,
          ),
          widget,
          R.img('icon_next_fq.svg',
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 16,
              height: 16),
        ],
      ),
    );
  }

  void sendGiftMedias() {
    if (_checkedMedias.isEmpty) {
      Fluttertoast.showToast(msg: K.room_select_media_first);
      return;
    }

    if (_withGift && _giftId <= 0) {
      Fluttertoast.showToast(msg: K.room_set_gift_first);
      return;
    }

    GiftMediaRepository.sendGiftMedia(_checkedMedias.map((_) => _.id).toList(),
            _withGift ? _giftId : 0, widget.rid)
        .then((rsp) {
      if (!rsp.success && rsp.msg != null) {
        Fluttertoast.showToast(msg: rsp.msg);
      } else {
        Navigator.of(context).pop();
      }
    });

    for (var _ in _checkedMedias) {
      Tracker.instance.track(TrackEvent.room_photo_send, properties: {
        'rid': widget.rid,
        'room_type': widget.room.config?.type,
        'room_types': describeEnum(widget.room.config?.types),
        'room_property': describeEnum(widget.room.config?.property),
        'role': describeEnum(widget.room.purview),
        'gift_price': _gift != null ? _gift!.price : 0,
        'is_video': _.type == GiftMediaType.video,
        'photo_id': _.id,
      });
    }
  }

  Widget _buildWithGift() {
    return GestureDetector(
      onTap: () {
        _withGift = !_withGift;
        setState(() {});
      },
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 2, end: 4, top: 14, bottom: 14),
            child: R.img(
                _withGift
                    ? 'ic_checkbox_checked.svg'
                    : 'ic_checkbox_unchecked.svg',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 24,
                height: 24),
          ),
          Text(
            K.room_gift_media,
            style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
          ),
          const SizedBox(
            width: 7,
          ),
        ],
      ),
    );
  }

  Widget _buildSendBottom() {
    return SizedBox(
      height: 52,
      child: Row(
        children: <Widget>[
          _buildWithGift(),
          Container(
            height: 12,
            width: 1,
            color: R.color.dividerColor,
          ),
          _buildGift(),
          const Spacer(),
          GradientButton(
            BaseK.K.base_send,
            width: 58,
            height: 32,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            colors: R.color.mainBrandGradientColors,
            onTap: sendGiftMedias,
          ),
        ],
      ),
    );
  }

  List<MediaItem>? get listData {
    if (_tabController == null) {
      return null;
    }
    int curTab = _tabController!.index;
    List<MediaItem>? data = (!widget.isAdmin || curTab == 1)
        ? _roomListKey.currentState?.data
        : _privateListKey.currentState?.data;
    return data;
  }

  Widget _buildCheckAll() {
    List<MediaItem>? data = listData;
    bool checkAll = data?.length != null &&
        data?.where((_) => _ is! EmptyMediaItem).length ==
            _checkedMedias.length;

    return GestureDetector(
      onTap: () {
        if (checkAll) {
          _checkedMedias.clear();
        } else if (data != null) {
          _checkedMedias.addAll(data.where((_) => _ is! EmptyMediaItem));
        }

        setState(() {});
      },
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 2, end: 4, top: 14, bottom: 14),
            child: R.img(
                checkAll
                    ? 'ic_checkbox_checked.svg'
                    : 'ic_checkbox_unchecked.svg',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 24,
                height: 24),
          ),
          Text(
            BaseK.K.common_choose_all,
            style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildEditBottom() {
    return SizedBox(
      height: 52,
      child: Row(
        children: <Widget>[
          _buildCheckAll(),
          const Spacer(),
          GradientButton(
            '${BaseK.K.delete}(${_checkedMedias.length})',
            width: 58,
            height: 32,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            colors: R.color.mainBrandGradientColors,
            onTap: () {
              if (_checkedMedias.isNotEmpty) {
                _controller.show(context: context);
                GiftMediaRepository.delMedia(
                        _tabController?.index == 0 ? 'private' : 'room',
                        _checkedMedias.map((_) => _.id).toList(),
                        widget.rid)
                    .then((rsp) {
                  _controller.close();
                  if (!(rsp.success)) {
                    if (rsp.msg != null) Fluttertoast.showToast(msg: rsp.msg);
                  } else {
                    _checkedMedias.clear();
                    setState(() {});
                  }
                  if (_tabController?.index == 0) {
                    _privateListKey.currentState?.refresh();
                  } else {
                    _roomListKey.currentState?.refresh();
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Util.height * _giftMediaPannelHeightRatio,
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(12),
            topEnd: Radius.circular(12),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildTitle(),
              _buildPage(),
            ],
          ),
        ),
      ),
    );
  }
}

//class GiftMediaMessageItemWidget extends StatelessWidget {
//  final MessageContent message;
//  final ChatRoomData room;
//
//  const GiftMediaMessageItemWidget({Key key, this.message, this.room})
//      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return  GiftMediaMessageItemTitle(
//      message: message,
//      room: room,
//    );
//  }
//}

class GiftMediaMessageItemWidget extends MessageItem {
  const GiftMediaMessageItemWidget({Key? key, message, room})
      : super(key: key, message: message, room: room);

  Widget _buildGiftMedia(BuildContext context) {
    GiftMediaInfo giftMediaInfo = GiftMediaInfo.fromMessage(message);
    return GiftMediaMessageItemContent(
      itemInfo: giftMediaInfo,
      size: 168.0,
      showLockTip: true,
      isAlbumItem: false,
      room: room,
    );
  }

  @override
  Widget build(BuildContext context) {
    return renderBody(context, false, _buildGiftMedia(context));
  }
}

class GiftMediaMessageItemContent extends StatelessWidget {
  final double size;
  final bool showLockTip;
  final GiftMediaInfo itemInfo;
  final bool isAlbumItem; //是否为房间相册（房间相册、公屏）
  final ChatRoomData? room;
  final bool? checked;
  final bool inEditMode;
  final ValueChanged? onCheckChange;

  const GiftMediaMessageItemContent(
      {super.key,
      required this.itemInfo,
      required this.size,
      this.showLockTip = false,
      this.isAlbumItem = true,
      this.room,
      this.inEditMode = false,
      this.onCheckChange,
      this.checked});

  Widget _buildCheckBox(bool checked) {
    return GestureDetector(
      onTap: () {
        if (onCheckChange != null) onCheckChange!(!checked);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 8, bottom: 8, end: 4, top: 4),
        child: R.img(
            checked ? 'ic_checkbox_checked.svg' : 'ic_checkbox_unchecked.svg',
            package: ComponentManager.MANAGER_BASE_ROOM,
            width: 24,
            height: 24),
      ),
    );
  }

  Widget _buildImage(double size, String url) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: CachedNetworkImage(
        imageUrl: '${System.imageDomain}$url',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  List<Widget> _buildPrice(GiftMediaInfo giftMediaInfo) {
    double price = giftMediaInfo.giftPrice.toDouble();
    double realPrice = price;
    if (giftMediaInfo.commodity != null) {
      if (giftMediaInfo.commodity!.type == CommodityType.coupon) {
        realPrice = price - giftMediaInfo.commodity!.ductionMoney;
      } else if (giftMediaInfo.commodity!.type == CommodityType.gift) {
        realPrice = 0;
      }
    }

    String unit = MoneyConfig.moneyName;
    if (realPrice != price) {
      return [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 2.0),
          child: Text(
            '${MoneyConfig.moneyNum(Util.parseInt(realPrice), fractionDigits: 2)}$unit',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ),
        Text(
          '${MoneyConfig.moneyNum(Util.parseInt(price), fractionDigits: 2)}$unit',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.white,
          ),
        )
      ];
    } else {
      return [
        Text(
          '${MoneyConfig.moneyNum(Util.parseInt(realPrice), fractionDigits: 2)}$unit',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        )
      ];
    }
  }

  Widget _buildLockInfo(GiftMediaInfo giftMediaInfo, double width) {
    if (!showLockTip) return Container();
    if (giftMediaInfo.giftId <= 0) return Container();
    return Container(
      width: width,
      height: 28,
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        color: Color(0x33000000),
        borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(8), bottomEnd: Radius.circular(8)),
      ),
      child: Text(
        giftMediaInfo.uid == Session.uid
            ? K.room_gift_media_packaging
            : K.room_gift_media_unlocked,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  Widget _buildGiftInfo(BuildContext context, double width,
      GiftMediaInfo giftMediaInfo, GiftMediaModel model) {
    return Container(
      width: width,
      height: 28,
      decoration: const BoxDecoration(
        color: Color(0x33000000),
        borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(8), bottomEnd: Radius.circular(8)),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 2,
          ),
          if (giftMediaInfo.giftIcon.isNotEmpty)
            CachedNetworkImage(
                placeholder: const CupertinoActivityIndicator(),
                imageUrl: '${System.imageDomain}${giftMediaInfo.giftIcon}',
                width: 22,
                height: 22,
                fit: BoxFit.contain),
          const SizedBox(
            width: 2,
          ),
          ..._buildPrice(giftMediaInfo),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (room != null) {
                model.payGiftMedia(context, giftMediaInfo, room!);
              }

              Tracker.instance.track(TrackEvent.room_photo_reward, properties: {
                'target_uid': giftMediaInfo.uid,
                'rid': room?.rid ?? 0,
                'room_type': room?.config?.type,
                'room_types': describeEnum(room?.config?.types),
                'room_property': describeEnum(room?.config?.property),
                'role': describeEnum(room?.purview),
                'gift_price': giftMediaInfo.giftPrice,
                'is_video': giftMediaInfo.type == GiftMediaType.video,
                'photo_id': giftMediaInfo.id,
                'is_album': isAlbumItem,
              });
            },
            child: Container(
              width: 60,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.imagePath('bg_gift_media_unlock.webp',
                        package: ComponentManager.MANAGER_BASE_ROOM))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  R.img('ic_gift_media_unlock.svg',
                      width: 16,
                      height: 16,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                  Text(
                    BaseK.K.base_unlock,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftMediaContent(
      {required BuildContext context,
      required String url,
      required bool showGiftInfo,
      required double size,
      required GiftMediaInfo giftMediaInfo,
      required GiftMediaModel model}) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _buildImage(size, url),
        if (giftMediaInfo.type == GiftMediaType.video)
          R.img('ic_videoplay.svg',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 40 * size / 160,
              height: 40 * size / 160),
        PositionedDirectional(
          start: 0,
          bottom: 0,
          child: showGiftInfo
              ? _buildGiftInfo(context, size, giftMediaInfo, model)
              : _buildLockInfo(giftMediaInfo, size),
        ),
        if (inEditMode)
          PositionedDirectional(
            top: 0,
            end: 0,
            child: _buildCheckBox(checked == true),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    GiftMediaModel giftMediaModel =
        Provider.of<GiftMediaModel>(context, listen: true);

    GiftMediaInfo? giftMediaInfo = giftMediaModel.giftMediaData[itemInfo.id];
    if (giftMediaInfo == null) {
      giftMediaInfo = itemInfo;
      if (itemInfo.giftId > 0) giftMediaModel.queryGiftMediaInfo(itemInfo.id);
    }

    bool isLock = itemInfo.giftId > 0 ? (giftMediaInfo.isLock) : false;
    bool showGiftInfo = isLock && itemInfo.giftId > 0;
    String url =
        isLock ? giftMediaInfo.image : '${giftMediaInfo.image}!cover375';

    return GestureDetector(
      onTap: () {
        if (isLock) {
          Fluttertoast.showToast(msg: K.room_unlock_first);
        } else if (giftMediaInfo != null) {
          GiftMediaModel.previewMediaItem(context, giftMediaInfo);

          Tracker.instance.track(TrackEvent.room_photo_view, properties: {
            'rid': room?.rid ?? 0,
            'room_type': room?.config?.type,
            'room_types': describeEnum(room?.config?.types),
            'room_property': describeEnum(room?.config?.property),
            'role': describeEnum(room?.purview),
            'gift_price': giftMediaInfo.giftPrice,
            'is_video': giftMediaInfo.type == GiftMediaType.video,
            'photo_id': giftMediaInfo.id,
            'is_album': isAlbumItem,
          });
        }
      },
      child: _buildGiftMediaContent(
        context: context,
        url: url,
        showGiftInfo: showGiftInfo,
        size: size,
        giftMediaInfo: giftMediaInfo,
        model: giftMediaModel,
      ),
    );
  }
}
