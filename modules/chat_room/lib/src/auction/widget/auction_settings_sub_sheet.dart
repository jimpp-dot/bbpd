import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/auction/model/auction_repo.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

class AuctionSettingsSubSheet extends StatefulWidget {
  final int type; //0-守护关系；1-其他
  final int rid; // 房间ID
  final int vvc; // 给后台透传参数
  final AuctionSettingData? data;

  const AuctionSettingsSubSheet(
      {super.key,
      required this.type,
      required this.rid,
      required this.vvc,
      required this.data});

  @override
  AuctionSettingsSubSheetState createState() {
    return AuctionSettingsSubSheetState();
  }
}

class AuctionSettingsSubSheetState extends State<AuctionSettingsSubSheet>
    with AutomaticKeepAliveClientMixin {
  AuctionSettingData? _auctionSettingData;

  final TextEditingController _textController = TextEditingController();

  bool showDefine = false;

  int selectContentId = 0; // 拍卖物品 选中 id
  int selectTimeId = 0; // 拍卖时长 选中 id
  int selectGiftId = 0; // 起拍礼物 选中 id

  List<AuctionGiftItem> giftListByFilter = []; // 关系+时长 对应 所需最低价格，筛选后的礼物列表
  List<AuctionTimeSettingsItem> timeListByFilter = []; // 关系 对应 时长

  @override
  void initState() {
    super.initState();
    _auctionSettingData = widget.data;
    if (_auctionSettingData != null) {
      if (widget.type == 0) {
        if (!Util.isCollectionEmpty(_auctionSettingData!.listCommodity)) {
          selectContentId = _auctionSettingData!.listCommodity[0].id;
        }
        _filterTimeList();
      } else {
        if (!Util.isCollectionEmpty(
            _auctionSettingData!.listCommoditySelfDefine)) {
          AuctionCommoditySettingsItem item =
              _auctionSettingData!.listCommoditySelfDefine[0];
          selectContentId = item.id;
          showDefine = item.isSelfDefine;
        }
      }
      _filterGiftList();
    }
  }

  /// 过滤时长
  void _filterTimeList() {
    if (_auctionSettingData == null) return;

    if (widget.type == 0) {
      AuctionCommoditySettingsItem? contentItem = _auctionSettingData
          ?.listCommodity
          .firstWhereOrNull((e) => e.id == selectContentId);
      if ((contentItem?.partPrice.length ?? 0) <
          _auctionSettingData!.listTime.length) {
        timeListByFilter = _auctionSettingData!.listTime
            .where((e) => (contentItem?.partPrice.containsKey(e.id) == true))
            .toList();
      } else {
        timeListByFilter = _auctionSettingData!.listTime;
      }
    } else {
      timeListByFilter = _auctionSettingData!.listTime;
    }
    if (!Util.isCollectionEmpty(timeListByFilter)) {
      selectTimeId = timeListByFilter[0].id;
    } else {
      selectTimeId = 0;
    }
  }

  /// 过滤 最低价格以下的礼物
  void _filterGiftList() {
    if (widget.type == 0) {
      AuctionCommoditySettingsItem? contentItem = _auctionSettingData!
          .listCommodity
          .firstWhereOrNull((e) => e.id == selectContentId);
      int minPrice = 0;
      if (contentItem?.partPrice.containsKey(selectTimeId) == true) {
        minPrice = contentItem!.partPrice[selectTimeId]!.toInt();
      }
      if (minPrice == 0) {
        giftListByFilter = _auctionSettingData!.listGift;
      } else {
        giftListByFilter = _auctionSettingData!.listGift
            .where((e) => e.price >= minPrice)
            .toList();
      }
    } else {
      giftListByFilter = _auctionSettingData!.listGift;
    }
    if (!Util.isCollectionEmpty(giftListByFilter)) {
      selectGiftId = giftListByFilter[0].id;
    } else {
      selectGiftId = 0;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_auctionSettingData == null) {
      return const SizedBox();
    }
    return SizedBox(
      width: Util.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildListTitle(K.room_auction_content_title),
          Container(
            width: Util.width,
            height: 56,
            padding: const EdgeInsetsDirectional.only(start: 16),
            alignment: AlignmentDirectional.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (widget.type == 0)
                  ? _auctionSettingData!.listCommodity.length
                  : _auctionSettingData!.listCommoditySelfDefine.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.type == 0) {
                  return _buildContentItem(
                      _auctionSettingData!.listCommodity[index]);
                } else {
                  return _buildContentItem(
                      _auctionSettingData!.listCommoditySelfDefine[index]);
                }
              },
            ),
          ),
          if (widget.type == 0 &&
              !Util.isCollectionEmpty(timeListByFilter)) ...[
            _buildListTitle(K.room_auction_time_title),
            Container(
              width: Util.width,
              height: 56,
              padding: const EdgeInsetsDirectional.only(
                  top: 10, bottom: 10, start: 16),
              alignment: AlignmentDirectional.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timeListByFilter.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildTimeItem(timeListByFilter[index]);
                },
              ),
            ),
          ],
          if (widget.type != 0 && showDefine) ...[
            _buildListTitle(K.room_auction_define_content),
            Container(
              width: double.infinity,
              height: 36,
              margin: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: R.color.secondBgColor,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: K.room_auction_define_content_hint,
                  counterText: '',
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintStyle:
                      TextStyle(color: R.color.thirdTextColor, fontSize: 14),
                  isDense: true,
                  contentPadding: EdgeInsetsDirectional.zero,
                ),
                textAlignVertical: TextAlignVertical.center,
                maxLength: 8,
                style: TextStyle(fontSize: 14, color: R.color.mainTextColor),
                controller: _textController,
                maxLines: 1,
                textInputAction: TextInputAction.done,
                keyboardAppearance: Brightness.light,
              ),
            ),
          ],
          _buildListTitle(K.room_auction_gift_title),
          Container(
            width: Util.width,
            height: 150,
            padding: const EdgeInsetsDirectional.only(
                top: 10, bottom: 10, start: 16),
            alignment: AlignmentDirectional.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 92,
              itemCount: giftListByFilter.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildGiftItem(giftListByFilter[index]);
              },
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _onBtnTap,
            child: Container(
              width: double.infinity,
              height: 52,
              margin: const EdgeInsetsDirectional.only(
                  start: 20, end: 20, bottom: 10),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                ),
                shape: const StadiumBorder(),
              ),
              child: Text(
                K.sure,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTitle(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: R.color.mainTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildContentItem(AuctionCommoditySettingsItem item) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 8),
      child: GestureDetector(
        onTap: () {
          _onContentTap(item);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 36,
              constraints: const BoxConstraints(
                minWidth: 84,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  colors: item.id == selectContentId
                      ? R.color.mainBrandGradientColors
                      : [const Color(0xFFF6F7F9), const Color(0xFFF6F7F9)],
                ),
                shape: const StadiumBorder(),
              ),
              alignment: Alignment.center,
              child: Text(
                item.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: item.id == selectContentId
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: item.id == selectContentId
                      ? Colors.white
                      : R.color.secondTextColor,
                ),
              ),
            ),
            if (item.tag.isNotEmpty == true)
              PositionedDirectional(
                top: -8,
                end: 0,
                child: Container(
                  height: 16,
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(8),
                      topEnd: Radius.circular(8),
                      bottomStart: Radius.circular(8),
                      bottomEnd: Radius.circular(2),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFA7845), Color(0xFFFF638C)],
                    ),
                  ),
                  child: Text(
                    item.tag,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeItem(AuctionTimeSettingsItem item) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 8),
      child: GestureDetector(
        onTap: () {
          _onTimeTap(item.id);
        },
        child: Container(
          height: 36,
          constraints: const BoxConstraints(
            minWidth: 84,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: item.id == selectTimeId
                  ? R.color.mainBrandGradientColors
                  : [const Color(0xFFF6F7F9), const Color(0xFFF6F7F9)],
            ),
            shape: const StadiumBorder(),
          ),
          alignment: Alignment.center,
          child: Text(
            item.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight:
                  item.id == selectTimeId ? FontWeight.bold : FontWeight.normal,
              color: item.id == selectTimeId
                  ? Colors.white
                  : R.color.secondTextColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGiftItem(AuctionGiftItem gift) {
    return Container(
      width: 92,
      margin: const EdgeInsetsDirectional.only(end: 8),
      alignment: AlignmentDirectional.center,
      child: GestureDetector(
        onTap: () {
          _onGiftTap(gift.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: R.color.secondBgColor,
                border: Border.all(
                  width: 1,
                  color: selectGiftId == gift.id
                      ? R.color.mainBrandColor
                      : Colors.transparent,
                ),
              ),
              alignment: Alignment.center,
              child: CachedNetworkImage(
                placeholder: const CupertinoActivityIndicator(),
                imageUrl: Util.giftImgUrl(gift.id),
                width: 60,
                height: 60,
                fit: BoxFit.contain,
                fadeInDuration: const Duration(microseconds: 0),
                fadeOutDuration: const Duration(microseconds: 0),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              gift.name,
              style: TextStyle(
                fontSize: 13,
                color: R.color.mainTextColor.withOpacity(0.8),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  MoneyConfig.moneyIcon,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 2),
                Text(
                  MoneyConfig.moneyNum(gift.price),
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.secondTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onContentTap(AuctionCommoditySettingsItem item) {
    if (selectContentId != item.id && mounted) {
      setState(() {
        selectContentId = item.id;
        showDefine = item.isSelfDefine;
        _filterTimeList();
        _filterGiftList();
      });
    }
  }

  void _onTimeTap(int id) {
    if (selectTimeId != id && mounted) {
      setState(() {
        selectTimeId = id;
        _filterGiftList();
      });
    }
  }

  void _onGiftTap(int id) {
    if (selectGiftId != id && mounted) {
      setState(() {
        selectGiftId = id;
      });
    }
  }

  void _onBtnTap() async {
    String cName = '';
    if (widget.type != 0 && showDefine) {
      cName = _textController.text.trim();
      if (cName.isEmpty) {
        Fluttertoast.showCenter(msg: K.room_auction_define_empty_toast);
        return;
      }
    }
    RespAuctionSave rsp = await AuctionRepo.saveSettings(
        rid: widget.rid,
        cid: selectContentId,
        cName: cName,
        flag: widget.type,
        expired: selectTimeId,
        giftId: selectGiftId,
        vvc: widget.vvc);
    if (rsp.success) {
      Navigator.of(context).pop();
    } else {
      Fluttertoast.showCenter(msg: rsp.message);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
