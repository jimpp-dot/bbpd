import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/gift_wall/model/gift_wall_api.dart';

import '../../../K.dart';
import '../widget/gift_wall_item_widget.dart';

class GiftWallLimitScreen extends StatefulWidget {
  final int targetUid;
  final ChatRoomData? room;
  final VoidCallback? giftCountChange;

  const GiftWallLimitScreen(
      {Key? key, required this.targetUid, this.room, this.giftCountChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GiftWallLimitState();
}

class _GiftWallLimitState extends State<GiftWallLimitScreen>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  GiftWallLimitData? _data;

  GiftWallLimitData get data => _data ?? GiftWallLimitData();

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_time_collect'});
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _load() async {
    ResGiftWallLimit resp =
        await GiftWallApi.getBBGiftWallLimitListResp(widget.targetUid, 0);
    if (resp.success) {
      _data = resp.data;
      if (Util.isCollectionEmpty(data.lightGift)) {
        setScreenEmpty();
      } else {
        setScreenReady();
      }
    } else {
      setScreenError();
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildStatusContent();
  }

  @override
  Widget buildContent() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _load();
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _buildItem(data.lightGift[index]);
        },
        itemCount: data.lightGift.length,
      ),
    );
  }

  Widget _buildItem(GiftWallLimitItem item) {
    double crossAxisSpacing = 8;
    double mainAxisSpacing = 16;
    double width = (Util.width - 20 * 2 - crossAxisSpacing * 3) / 4;
    double ratio = width / 78;

    int rowNum = (item.gift.length - 1) ~/ 4 + 1;
    double itemHeight = rowNum * 126 * ratio + 16 * (rowNum - 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.title,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              Text(item.desc,
                  style:
                      TextStyle(color: R.color.secondTextColor, fontSize: 11)),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: itemHeight,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 78 / 126,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
              ),
              itemCount: item.gift.length,
              itemBuilder: (context, index) =>
                  _buildGiftItem(item.gift[index], ratio),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGiftItem(GiftWallItem gift, double ratio) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        PositionedDirectional(
          top: 30 * ratio,
          child: Container(
            width: 78 * ratio,
            height: 96 * ratio,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF000000).withOpacity(0.04),
            ),
          ),
        ),
        ColorFiltered(
          colorFilter: gift.num == 0
              ? greyscale
              : const ColorFilter.mode(Colors.transparent, BlendMode.color),
          child: CachedNetworkImage(
            placeholder: const CupertinoActivityIndicator(),
            imageUrl: Util.giftImgUrl(gift.gid),
            width: 60 * ratio,
            height: 60 * ratio,
            fit: BoxFit.contain,
            fadeInDuration: const Duration(microseconds: 0),
            fadeOutDuration: const Duration(microseconds: 0),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                gift.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11 * ratio,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 36 * ratio,
                alignment: AlignmentDirectional.topCenter,
                padding: EdgeInsetsDirectional.only(top: 6 * ratio),
                child: (gift.num > 0)
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${gift.price}',
                              style: TextStyle(
                                  fontSize: 11 * ratio,
                                  color: const Color(0x99202020))),
                          Image.asset(MoneyConfig.moneyIcon,
                              width: 12 * ratio, height: 12 * ratio),
                        ],
                      )
                    : (Session.uid == widget.targetUid)
                        ? Text(
                            K.personal_not_lighten,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11 * ratio,
                              color: const Color(0xFF202020).withOpacity(0.6),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              if (gift.num == 0 &&
                                  Session.uid != widget.targetUid) {
                                IGiftManager manager = ComponentManager.instance
                                    .getManager(ComponentManager.MANAGER_GIFT);
                                if (widget.room != null) {
                                  // 房间礼物面板
                                  await manager.showRoomGiftPanel(context,
                                      room: widget.room,
                                      uid: widget.targetUid,
                                      defaultId: gift.gid);

                                  Tracker.instance.track(
                                      TrackEvent.giftwall_button_click,
                                      properties: {
                                        'rid': widget.room?.rid,
                                        'target_uid': widget.targetUid,
                                        'room_type': describeEnum(
                                            widget.room?.config?.types),
                                      });
                                } else {
                                  // 资料页礼物面板
                                  await manager.showPrivateGiftPanel(context,
                                      uid: widget.targetUid,
                                      defaultId: gift.gid);

                                  Tracker.instance.track(
                                      TrackEvent.giftwall_button_click,
                                      properties: {
                                        'rid': 0,
                                        'target_uid': widget.targetUid,
                                        'room_type': 0,
                                      });
                                }
                                _load();
                                widget.giftCountChange?.call();
                              }
                            },
                            child: FittedBox(
                              fit: BoxFit.none,
                              child: Container(
                                height: 20 * ratio,
                                margin: EdgeInsetsDirectional.only(
                                  top: 6 * ratio,
                                  bottom: 10 * ratio,
                                ),
                                padding: const EdgeInsetsDirectional.only(
                                  start: 12,
                                  end: 12,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: R.color.mainBrandColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                ),
                                child: Text(
                                  K.personal_gift_wall_send,
                                  style: TextStyle(
                                    fontSize: 11 * ratio,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
