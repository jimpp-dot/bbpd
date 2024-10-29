import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/game_list/util/game_list_util.dart';
import 'package:chat_room/src/live/normal/live_fans_label.dart';
import 'package:chat_room/src/visitant/visitant_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../game_list/widget/game_list_label.dart';
import '../widget/wish_gift_label.dart';

/// 房间右上角按钮
enum RoomTopRightItemType {
  /// 游戏玩法列表标签
  gameList,

  /// 贵宾榜
  visitantRank,

  /// 心愿礼物
  wishGift,

  /// 五星挑战
  liveFans,
}

/// 房间右上角
class RoomTopRightWidgetsManager {
  final ChatRoomData room;

  final List<_TopRightItemEntry> _itemEntryChildren = [];

  /// 最大可展示数量,默认2
  int maxCount;

  /// 创建的带BannerItem的索引，从1开始累加
  int _bannerItemHandleIndex = 1;

  RoomTopRightWidgetsManager({required this.room, this.maxCount = 3});

  /// 添加一个新item
  /// [putInBanner] 是否将该item放进可滚动Banner中
  /// 皮队友调整 - 优先级最高的单独放出来，其他的都放在一个banner中
  void addItem(RoomTopRightItemType itemType, {String? putInBannerIndex}) {
    Widget? widget;
    switch (itemType) {
      case RoomTopRightItemType.gameList:
        {
          /// 游戏玩法列表标签
          if (GameListUtil.showRoomGameListLabel(room)) {
            widget = GameListLabel(room: room);
          }
          break;
        }
      case RoomTopRightItemType.visitantRank:
        {
          if (room.isShowVisitantRank == true) {
            widget = VisitantLabel(room: room);
          }
          break;
        }
      case RoomTopRightItemType.wishGift:
        {
          if (room.roomWishGiftsData != null) {
            widget = WishGiftLabel(room: room);
          }
          break;
        }
      case RoomTopRightItemType.liveFans:
        {
          if (ChatRoomUtil.isCanShowFansLabel(room)) {
            widget = LiveFansLabel(room: room);
          }
          break;
        }
      default:
        break;
    }

    if (widget == null) return;
    addItemWidget(widget, putInBannerIndex: putInBannerIndex);
  }

  /// 添加一个外部自定义组件
  void addItemWidget(Widget child, {String? putInBannerIndex}) {
    final entry = _TopRightItemEntry();
    entry.children.add(child);
    _itemEntryChildren.add(entry);

    // if (!Util.isNullOrEmpty(putInBannerIndex)) {
    //   /// 放进bannerChildren中
    //   final _bannerEntryList = _itemEntryChildren.where((element) => element.bannerIndex == putInBannerIndex).toList();
    //   if (_bannerEntryList.isNotEmpty) {
    //     final _bannerEntry = _bannerEntryList.first;
    //     _bannerEntry.children.add(child);
    //   }
    // } else {
    //   final _entry = _TopRightItemEntry(bannerIndex: putInBannerIndex);
    //   _entry.children.add(child);
    //   _itemEntryChildren.add(_entry);
    // }
  }

  /// 创建一个可滚动Banner组件，返回该组件的handlerId
  String createBannerItem({Size? bannerSize}) {
    _bannerItemHandleIndex += 1;
    String handlerId = '$_bannerItemHandleIndex';
    final bannerEntry =
        _TopRightItemEntry(bannerIndex: handlerId, bannerSize: bannerSize);
    _itemEntryChildren.add(bannerEntry);
    return handlerId;
  }

  Widget getTopRightWidget({EdgeInsetsGeometry padding = EdgeInsets.zero}) {
    if (_itemEntryChildren.isEmpty) return const SizedBox.shrink();

    List<Widget> children = [];

    for (var element in _itemEntryChildren) {
      if (element.children.isNotEmpty) {
        children.addAll(element.children);
      }
    }

    if (children.length > 2) {
      var tmpChildren = children.toList();
      children.clear();
      children.add(tmpChildren.first);
      tmpChildren.removeAt(0);

      Size bannerSize = const Size(86, 22);

      /// 放在滚动Banner下的按钮
      children.add(
        SizedBox(
          width: bannerSize.width,
          height: bannerSize.height,
          child: Swiper(
            loop: true,
            autoplay: true,
            itemBuilder: (context, index) => tmpChildren[index],
            itemCount: tmpChildren.length,
          ),
        ),
      );
    }

    // if (_itemEntryChildren.length > 2) {
    //   /// 超过两个时，左边显示一个，右边把剩余的玩法放进一个banner里
    //   _children.add(_itemEntryChildren.first.children.first);
    // }
    //
    // final _reverseItems = _itemEntryChildren.reversed.toList();
    //
    // /// 构建BannerItem
    //
    // for (var element in _reverseItems) {
    //   if (Util.isNullOrEmpty(element.bannerIndex)) {
    //     /// 普通的按钮
    //     _children.addAll(element.children);
    //   } else {
    //     if (element.children.isNotEmpty) {
    //       if (element.children.length == 1) {
    //         _children.addAll(element.children);
    //       } else {
    //         Size _bannerSize = element.bannerSize ?? const Size(86, 22);
    //         /// 放在滚动Banner下的按钮
    //         _children.add(
    //           SizedBox(
    //             width: _bannerSize.width,
    //             height: _bannerSize.height,
    //             child: Swiper(
    //               loop: true,
    //               autoplay: true,
    //               itemBuilder: (context,index) => element.children[index],
    //               itemCount: element.children.length,
    //             ),
    //           ),
    //         );
    //       }
    //     }
    //   }
    // }

    // while (_children.length > maxCount) {
    //   _children.removeAt(0);
    // }

    List<Widget> widgets = [];
    children.forEachIndexed((i, e) {
      widgets.add(
        Padding(
          padding: EdgeInsetsDirectional.only(start: (i == 0 ? 0 : 4)),
          child: e,
        ),
      );
    });

    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }
}

class _TopRightItemEntry {
  List<Widget> children;

  String? bannerIndex;

  Size? bannerSize;

  _TopRightItemEntry({this.bannerIndex, this.bannerSize}) : children = [];
}
