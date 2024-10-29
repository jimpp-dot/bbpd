import 'package:shared/shared.dart';
import '../../assets.dart';
import '../../k.dart';
import 'package:flutter/cupertino.dart';

class DisplayPlayGameWish extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final Widget iconView;

  const DisplayPlayGameWish(
      {super.key,
      required this.message,
      required this.extra,
      required this.iconView});

  @override
  State<StatefulWidget> createState() {
    return _DisplayPlayGameWishState();
  }
}

class _DisplayPlayGameWishState extends State<DisplayPlayGameWish> {
  MessageContent get message => widget.message;

  Map get extra => widget.extra;

  Widget get iconView => widget.iconView;

  @override
  Widget build(BuildContext context) {
    var giftList = extra['gift'];

    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 6, bottom: 6),
          constraints: const BoxConstraints(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 40,
                height: 40,
                child: iconView,
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 212,
                padding: const EdgeInsetsDirectional.only(
                    start: 12, end: 12, top: 12, bottom: 10),
                decoration: BoxDecoration(
                  color: R.colors.secondBgColor,
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    _renderGameRow(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            message.content,
                            style: TextStyle(
                              color: R.colors.mainTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        _renderWish(giftList is List ? giftList : null),
      ],
    );
  }

  Widget _renderGameRow() {
    String level = extra['level'] ?? '';
    return Row(
      children: <Widget>[
        CommonAvatar(
          path: extra['icon'] ?? '',
          size: 56,
          loadingWidget: const CupertinoActivityIndicator(),
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          suffix: null,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: level.isEmpty
              ? renderGameName()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    renderGameName(),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        R.img(
                            Util.parseInt(extra['certified']) == 1
                                ? Assets.chat$ic_game_verify_svg
                                : Assets.chat$ic_game_verify_false_svg,
                            width: 14,
                            height: 14,
                            package: ComponentManager.MANAGER_CHAT),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          level,
                          style: TextStyle(
                              color: R.colors.mainTextColor, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget renderGameName() {
    return Text(
      extra['game'] ?? '',
      style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _renderWish(List? giftList) {
    if (giftList == null || giftList.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Spacer(),
            ...giftList
                .map((e) =>
                    _renderWishItem(Util.parseInt(e['id']), '${e['icon']}'))
                .toList(),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(
              start: 8, end: 8, top: 2, bottom: 2),
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(10.5)),
              color: R.colors.secondBgColor),
          child: Text(
            K.game_wish_click_send,
            style: TextStyle(color: R.colors.thirdTextColor, fontSize: 11),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget _renderWishItem(int giftId, String icon) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showPrivateGiftPanel(context,
            gameWishGift: true,
            fromChat: true,
            uid: Util.parseInt(widget.message.targetId),
            defaultId: giftId);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        child: CommonAvatar(
          path: icon,
          size: 52,
          loadingWidget: const CupertinoActivityIndicator(),
          suffix: null,
        ),
      ),
    );
  }
}
