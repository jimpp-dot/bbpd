import 'dart:async';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'slp_search_KOL_rooms_screen.dart';
import '../k.dart';

class SlpSearchKOLBannerItem extends StatelessWidget {
  final JointSearchItem searchItem;
  final void Function(int position, JointSearchItem item) onTap;

  const SlpSearchKOLBannerItem(this.searchItem, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    JointSearchKolBannerItem bannerItem = searchItem.kolBanner;
    double side = 16;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: 16, start: side, end: side, bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 6),
              child: Text(
                K.search_result_activity,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: R.colors.secondTextColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onTap(0, searchItem),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(bannerItem.kolBannerUrl),
                  width: Util.width - side * 2,
                  fit: BoxFit.cover,
                  placeholder: const CupertinoActivityIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BbSearchKOLRecommendRoomItem extends StatelessWidget {
  final String searchString;
  final List<JointSearchItem> searchItems;
  final void Function(int position, JointSearchItem item) onTap;

  const BbSearchKOLRecommendRoomItem(
      this.searchItems, this.searchString, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    List<RoomListItem> rooms = [];
    for (var element in searchItems) {
      rooms.add(element.kolRoom);
    }

    List<Widget> rows = [];
    rooms.forEachIndexed((i, e) {
      PartyRoomGridItem item = e.changeToPartGridItem();
      if (i < 2) {
        rows.add(
          PartyRoomGridItemNewWidget(
            item: item,
            key: ValueKey('${item.rid}_${item.name}'),
            autoGotoRoom: false,
            onItemClick: () => onTap(i, searchItems[i]),
          ),
        );
      }
    });

    if (rows.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox(height: 0));
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 16, start: 16, end: 16, bottom: 6),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 6),
                  child: Text(
                    K.search_room,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: R.colors.secondTextColor,
                    ),
                  ),
                ),
                Expanded(
                  child: rooms.length <= 2
                      ? const SizedBox(width: 0)
                      : GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            SlpSearchKOLRoomsScreen.show(
                                searchItems.first.id, searchString, context);
                          },
                          child: Container(
                            alignment: AlignmentDirectional.topEnd,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  K.search_result_all,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: R.colors.thirdTextColor),
                                ),
                                const SizedBox(width: 4),
                                R.img(
                                  BaseAssets.shared$icon_next_fq_svg,
                                  width: 16,
                                  height: 16,
                                  color: R.color.mainTextColor.withOpacity(0.2),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rows,
            ),
          ],
        ),
      ),
    );
  }
}

class BbSearchKOLCountdownItem extends StatefulWidget {
  final int countdown;
  final String title;
  final void Function() tapClose;
  final void Function() gotoRoom;

  const BbSearchKOLCountdownItem(
      this.countdown, this.title, this.tapClose, this.gotoRoom,
      {super.key});

  @override
  State<BbSearchKOLCountdownItem> createState() =>
      _BbSearchKOLCountdownItemState();
}

class _BbSearchKOLCountdownItemState extends State<BbSearchKOLCountdownItem> {
  int _countdown = 0;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();

    _countdown = widget.countdown;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown <= 0) {
        _countdownTimer?.cancel();
        _countdownTimer = null;
        widget.gotoRoom();
        widget.tapClose();
        return;
      }

      setState(() {
        if (mounted) {
          _countdown--;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _countdownTimer?.cancel();
    _countdownTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 8),
        child: Container(
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0x001ecbff).withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 12,
                  child: Text(_countdown.toString(),
                      style: TextStyle(
                          fontSize: 13, color: R.colors.mainBrandColor)),
                ),
                Expanded(
                  child: Text(
                    's${widget.title}',
                    style:
                        TextStyle(fontSize: 13, color: R.colors.mainBrandColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 34,
                  height: 34,
                  child: IconButton(
                    onPressed: widget.tapClose,
                    icon: const Icon(
                      Icons.close,
                      size: 16,
                      color: Color(0xFF8C979A),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
