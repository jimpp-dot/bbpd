import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/gift_wall/model/gift_wall_api.dart';

class GiftWallLimitPage extends StatefulWidget {
  final int targetUid;

  const GiftWallLimitPage({Key? key, required this.targetUid})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GiftWallLimitState();
}

class _GiftWallLimitState extends State<GiftWallLimitPage>
    with BaseScreenStateMixin {
  GiftWallLimitData? _data;

  GiftWallLimitData get data => _data ?? GiftWallLimitData();

  int _selectedIndex = 0;

  ScrollController? _gridController;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _gridController?.dispose();
    super.dispose();
  }

  Future _load() async {
    ResGiftWallLimit resp =
        await GiftWallApi.getBBGiftWallLimitListResp(widget.targetUid, 1);
    if (resp.success) {
      _data = resp.data;
      Config.set('Gift_Wall_Limit_Page_${Session.uid}', '${resp.data.version}');
      if (Util.isCollectionEmpty(data.lightGift) &&
          Util.isCollectionEmpty(data.newGifts.gift) &&
          Util.isCollectionEmpty(data.backGifts.gift)) {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar.custom(
        statusBrightness: Brightness.dark,
        leading: const BackButton(color: Color(0xFF313131)),
        title: Text(K.personal_gift_wall_activity,
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF313131),
                fontWeight: FontWeight.w500)),
      ),
      body: buildStatusContent(),
    );
  }

  @override
  Widget buildContent() {
    List<Widget> items = [];
    if (!Util.isCollectionEmpty(data.lightGift)) {
      items.add(_buildLimitItem(data.lightGift));
    }
    if (!Util.isCollectionEmpty(data.newGifts.gift)) {
      items.add(_buildItem(data.newGifts));
    }
    if (!Util.isCollectionEmpty(data.backGifts.gift)) {
      items.add(_buildItem(data.backGifts));
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return items[index];
      },
      itemCount: items.length,
    );
  }

  Widget _buildLimitItem(List<GiftWallLimitItem> items) {
    GiftWallLimitItem item = items[_selectedIndex];
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
              Text(K.personal_gift_wall_limit_title,
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
        Container(
          width: double.infinity,
          height: 260,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [Color(0xFFD670FF), Color(0xFF91ADFF)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Container(
                width: 74,
                height: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(R.imagePath(
                        'mate/gift_wall/ic_gift_wall_limit_tab_bg.webp',
                        package: ComponentManager.MANAGER_PERSONALDATA)),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _buildLimitTabItem(items[index], index);
                  },
                  itemCount: items.length,
                ),
              ),
              const SizedBox(width: 5),
              // Expanded(
              //   child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 3,
              //       childAspectRatio: 78 / 111,
              //       crossAxisSpacing: 6,
              //       mainAxisSpacing: 4,
              //     ),
              //     itemBuilder: (context, index) {
              //       return _buildGiftItem2(item.gift[index]);
              //     },
              //     controller: _gridController,
              //     itemCount: item.gift.length,
              //     physics: const ClampingScrollPhysics(),
              //   ),
              // ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      List<Widget> rowItems = [];
                      rowItems.add(_buildGiftItem2(item.gift[index * 3]));
                      if (index * 3 + 1 < item.gift.length) {
                        rowItems.add(_buildGiftItem2(item.gift[index * 3 + 1]));
                      } else {
                        rowItems.add(const SizedBox());
                      }
                      if (index * 3 + 2 < item.gift.length) {
                        rowItems.add(_buildGiftItem2(item.gift[index * 3 + 2]));
                      } else {
                        rowItems.add(const SizedBox());
                      }
                      return Container(
                        margin: EdgeInsetsDirectional.only(
                            top: index == 0 ? 5 : 0,
                            bottom:
                                index == ((item.gift.length - 1) ~/ 3) ? 5 : 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: rowItems[0]),
                            const SizedBox(width: 6),
                            Expanded(child: rowItems[1]),
                            const SizedBox(width: 6),
                            Expanded(child: rowItems[2]),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 4);
                    },
                    controller: _gridController,
                    itemCount: (item.gift.length - 1) ~/ 3 + 1,
                    physics: const ClampingScrollPhysics(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLimitTabItem(GiftWallLimitItem item, int index) {
    bool selected = index == _selectedIndex;
    return GestureDetector(
      onTap: () {
        if (_selectedIndex != index) {
          _selectedIndex = index;
          _gridController?.animateTo(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
          refresh();
        }
      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: selected
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(R.imagePath(
                      'mate/gift_wall/ic_gift_wall_limit_tab_item_bg.webp',
                      package: ComponentManager.MANAGER_PERSONALDATA)),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        alignment: AlignmentDirectional.center,
        child: Text(
          item.title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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

  Widget _buildGiftItem2(GiftWallItem gift) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double ratio = constraints.maxWidth / 78;
        return Container(
          width: constraints.maxWidth,
          height: 111 * ratio,
          margin: const EdgeInsetsDirectional.only(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(R.imagePath(
                  gift.num > 0
                      ? 'mate/gift_wall/ic_gift_wall_limit_gift_item_bg.webp'
                      : 'mate/gift_wall/ic_gift_wall_limit_gift_item_bg_d.webp',
                  package: ComponentManager.MANAGER_PERSONALDATA)),
              fit: BoxFit.cover,
            ),
          ),
          alignment: AlignmentDirectional.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8 * ratio),
              CachedNetworkImage(
                placeholder: const CupertinoActivityIndicator(),
                imageUrl:
                    '${System.imageDomain}static/$giftSubDir/${gift.gid}.png',
                width: 48 * ratio,
                height: 48 * ratio,
                fit: BoxFit.contain,
                fadeInDuration: const Duration(microseconds: 0),
                fadeOutDuration: const Duration(microseconds: 0),
                color: Color.fromRGBO(255, 255, 255, gift.num > 0 ? 1 : 0.5),
                colorBlendMode: BlendMode.modulate,
              ),
              SizedBox(height: 8 * ratio),
              Text(
                gift.name,
                style: TextStyle(
                    color: gift.num > 0
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    fontSize: 11 * ratio,
                    fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4 * ratio),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.topCenter,
                  child: (gift.num > 0)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${gift.price}',
                                style: TextStyle(
                                    fontSize: 11 * ratio,
                                    color: const Color(0xCCFFFFFF))),
                            Image.asset(MoneyConfig.moneyIcon,
                                width: 12 * ratio, height: 12 * ratio),
                          ],
                        )
                      : Text(
                          K.personal_not_lighten,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11 * ratio,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
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
        CachedNetworkImage(
          placeholder: const CupertinoActivityIndicator(),
          imageUrl: Util.giftImgUrl(gift.gid),
          width: 60 * ratio,
          height: 60 * ratio,
          fit: BoxFit.contain,
          fadeInDuration: const Duration(microseconds: 0),
          fadeOutDuration: const Duration(microseconds: 0),
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
              SizedBox(height: 6 * ratio),
              Row(
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
              ),
              SizedBox(height: 12 * ratio),
            ],
          ),
        ),
      ],
    );
  }
}
