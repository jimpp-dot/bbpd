import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../k.dart';

class KnightBuyPage extends StatefulWidget {
  final int rid;
  final int uid;
  final KnightItem item;

  const KnightBuyPage(this.rid, this.uid, this.item, {Key? key}) : super(key: key);

  @override
  State<KnightBuyPage> createState() => KnightBuyPageState();
}

class KnightBuyPageState extends State<KnightBuyPage> with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  @override
  void initState() {
    super.initState();
    _selectIndex = (widget.item.knightLevel == 1) ? 1 : 0;

    if (Util.isVerify) {
      /// 该状态，个数只有一个,服务端控制
      _selectIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: Util.width - 32,
              height: (Util.width - 32) * 324 / 690,
              margin: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(R.imagePath(RoomAssets.chat_room$kaitong_middle_bg_png)),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 60,
                        height: 1,
                        color: const Color(0x1A313131),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        K.room_knight_buy_tips,
                        style: R.textStyle.regular12.copyWith(color: const Color(0xFF313131), fontSize: 13),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 60,
                        height: 1,
                        color: const Color(0x1A313131),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 126,
                    child: Row(
                      children: widget.item.equitiesList.map((e) {
                        return Expanded(
                          flex: 1,
                          child: _buildItem(e),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 110.dp,
              child: ListView.builder(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 16),
                itemBuilder: _buildPriceItem,
                itemCount: widget.item.durationList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
        // PositionedDirectional(
        //   top: 12,
        //   start: 26,
        //   child: R.img('ic_heart_1.png',
        //       width: 42,
        //       height: 42,
        //       package: ComponentManager.MANAGER_BASE_ROOM),
        // ),
        // PositionedDirectional(
        //   top: 0,
        //   end: 16,
        //   child: R.img('ic_heart_2.png',
        //       width: 75,
        //       height: 75,
        //       package: ComponentManager.MANAGER_BASE_ROOM),
        // ),
      ],
    );
  }

  Widget _buildItem(KnightEquities equities) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(equities.icon),
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 2),
          Text(
            equities.label,
            style: R.textStyle.regular14.copyWith(fontSize: 16, color: const Color(0xFF71206D)),
          ),
          const SizedBox(height: 2),
          Text(
            equities.desc,
            style: R.textStyle.regular12.copyWith(fontSize: 12, color: const Color(0xFF71206D).withOpacity(0.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceItem(BuildContext context, int index) {
    KnightDurationList durationList = widget.item.durationList[index];
    double size = (Util.width - 20) / 3;
    bool select = (_selectIndex == index);
    return GestureDetector(
      onTap: () {
        if (!select) {
          _selectIndex = index;
          if (mounted) {
            setState(() {});
          }
        }
      },
      child: Container(
        width: size - 12,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              R.imagePath(select ? RoomAssets.chat_room$selected_item_bg_png : RoomAssets.chat_room$unselected_item_bg_png),
            ),
          ),
        ),
        margin: const EdgeInsetsDirectional.only(start: 6, end: 6),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    child: Text(
                      '${durationList.durationPrice}',
                      style: R.textStyle.medium16.copyWith(
                        color: const Color(0xFF313131),
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Image.asset(MoneyConfig.moneyIcon, width: 20.0, height: 20.0),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              durationList.durationLabel,
              style: R.textStyle.regular12.copyWith(color: const Color(0x66313131), fontSize: 13),
            ),
            // Text(
            //   MoneyConfig.moneyName4,
            //   style: R.textStyle.regular12
            //       .copyWith(color: const Color(0x66313131), fontSize: 13),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
