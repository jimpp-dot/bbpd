import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

///礼物选择界面
class GiftItemWidget extends StatelessWidget {
  final Gift? gift;
  final VoidCallback? onItemClicked;

  const GiftItemWidget({Key? key, this.gift, this.onItemClicked})
      : super(key: key);

  Widget _renderPrice(Gift? gift) {
    String unit;
    String priceStr;
    if (gift?.giftType == 'coin') {
      // 金币礼物单位为金
      unit = K.gift_coin_unit;
      priceStr = Util.removeDecimalZeroFormat(gift?.price);
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(Util.parseInt((gift?.price ?? 0) * 100));
    }
    return Text(
      "$priceStr$unit",
      style: TextStyle(
        color: R.color.secondTextColor,
        fontSize: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onItemClicked != null) onItemClicked!();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  placeholder: const CupertinoActivityIndicator(),
                  imageUrl:
                      '${System.imageDomain}static/$giftSubDir/${gift?.id ?? 0}.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                Text(
                  gift?.name ?? ' ',
                  style: TextStyle(
                    color: (gift?.isnaming ?? 0) > 0
                        ? R.color.thirdBrightColor
                        : R.color.mainTextColor,
                    fontSize: 12.0,
                  ),
                  maxLines: 1,
                ),
                _renderPrice(gift),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GiftListWidget extends StatefulWidget {
  final List<Gift>? gifts;

  const GiftListWidget({Key? key, this.gifts}) : super(key: key);

  @override
  _GiftListWidgetState createState() => _GiftListWidgetState();
}

class _GiftListWidgetState extends State<GiftListWidget> {
  List<Gift>? _gifts;

  @override
  void initState() {
    _gifts = widget.gifts;
    load();

    super.initState();
  }

  void load() {
    GiftListRepository.getGiftList().then((rsp) {
      if (rsp.success == true &&
          rsp.data != null &&
          rsp.data?.isNotEmpty == true) {
        _gifts = rsp.data;

        if (mounted) setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          BaseAppBar.custom(
            showBack: false,
            title: Text(
              K.gift,
            ),
            backgroundColor: Colors.transparent,
          ),
          Expanded(
              child: _gifts == null || _gifts?.isEmpty == true
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : GridView.count(
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      childAspectRatio: 0.9,
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      children: _gifts?.isNotEmpty == true
                          ? _gifts!.map((gift) {
                              return GiftItemWidget(
                                gift: gift,
                                onItemClicked: () =>
                                    Navigator.of(context).pop(gift),
                              );
                            }).toList()
                          : [],
                    )),
        ],
      ),
    );
  }
}
