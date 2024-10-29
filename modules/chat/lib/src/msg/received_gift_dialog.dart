import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../../k.dart';

class ReceivedGiftDialog extends StatefulWidget {
  final Map extra;

  const ReceivedGiftDialog(this.extra, {super.key});

  static void show(BuildContext context, Map extra) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return ReceivedGiftDialog(extra);
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
      useRootNavigator: true,
      routeSettings: null,
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _ReceivedGiftDialogState();
  }
}

class _ReceivedGiftDialogState extends State<ReceivedGiftDialog> {
  late ShopMailCommodity commodity;
  final double ratio = 1.0;
  late String senderName;
  late String senderIcon;
  late String message;
  late String period;

  Map get extra => widget.extra;

  @override
  void initState() {
    super.initState();

    senderName = safeStr(extra, 'sender_name');
    senderIcon = safeStr(extra, 'sender_icon');
    message = safeStr(extra, 'message');
    period = safeStr(extra, 'period');
    extra['type'] = extra['commodity_type'];
    commodity = ShopMailCommodity.fromJson(extra as Map<String, dynamic>);
  }

  String safeStr(Map extra, String key) {
    var str = extra[key];
    if (str != null) {
      if (str is String) {
        return str;
      } else {
        return '$str';
      }
    }
    return '';
  }

  Widget _buildGift() {
    return Center(
      child: CachedNetworkImage(
        imageUrl: commodity.image,
        width: 112 * ratio,
        height: 112 * ratio,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildFrame() {
    return Center(
      child: SizedBox(
        width: 112 * ratio,
        height: 112 * ratio,
        child: Stack(
          children: [
            Center(
              child: CommonAvatar(
                path: Session.icon,
                shape: BoxShape.circle,
                size: 95 * ratio,
              ),
            ),
            CachedNetworkImage(
              imageUrl: commodity.image,
              width: 112 * ratio,
              height: 112 * ratio,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBubble() {
    return Center(
      child: ChatBubbleWidget(
        image: commodity.image,
        text: commodity.bubbleDesc ?? '',
        color: commodity.getTextColor(),
      ),
    );
  }

  Widget _buildEnterEffect() {
    return Center(
      child: CachedNetworkImage(
        imageUrl: commodity.image,
        height: 40 * ratio,
        width: 112 * ratio,
      ),
    );
  }

  /// 麦上光圈
  Widget _buildMicroPhone() {
    return SizedBox(
      width: 128 * ratio,
      height: 128 * ratio,
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          CachedNetworkImage(
            imageUrl: commodity.image,
            width: 150 * ratio,
            height: 150 * ratio,
            fit: BoxFit.fill,
          ),
          Center(
            child: CommonAvatar(
              path: Session.icon,
              shape: BoxShape.circle,
              size: 95 * ratio,
            ),
          ),
        ],
      ),
    );
  }

  Widget commodityTop() {
    switch (commodity.commodityType) {
      case ShopMailCommodityType.Title:
      case ShopMailCommodityType.Gift:
      case ShopMailCommodityType.Coupon:
      case ShopMailCommodityType.Defend:
      case ShopMailCommodityType.RadioDefend:
      case ShopMailCommodityType.Decorate:
        return _buildGift();
      case ShopMailCommodityType.EnterEffect:
        return _buildEnterEffect();
      case ShopMailCommodityType.Frame:
        return _buildFrame();
      case ShopMailCommodityType.Bubble:
        return _buildBubble();
      case ShopMailCommodityType.MicrophoneEffect:
        return _buildMicroPhone();
      case ShopMailCommodityType.Unknown:
      default:
        return _buildGift();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          R.img(Assets.chat$received_gift_dialog_top_png,
              width: 311, height: 90, package: ComponentManager.MANAGER_CHAT),
          Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.only(start: 32, end: 32),
            padding: const EdgeInsetsDirectional.only(
                top: 16, bottom: 16, start: 16, end: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CommonAvatar(
                      path: senderIcon,
                      shape: BoxShape.circle,
                      size: 38,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            senderName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xffFE8732),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 13, color: Color(0xb3202020)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl: commodity.imageBackground ?? '',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    commodityTop(),
                    if (period.isNotEmpty)
                      Container(
                          width: 140,
                          height: 140,
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            padding: const EdgeInsetsDirectional.only(
                                start: 12, end: 12, top: 3, bottom: 3),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius:
                                    const BorderRadiusDirectional.only(
                                  bottomStart: Radius.circular(20),
                                  topEnd: Radius.circular(20),
                                )),
                            child: Text(
                              period,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                          )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pop(context);
                    IVipManager? manager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_VIP);
                    manager?.showBagPage(context, tabType: commodity.type);
                  },
                  child: Container(
                    width: 190,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                        colors: [Color(0xffFD8849), Color(0xffFFC45E)],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      K.to_bag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 12),
            width: 40,
            height: 40,
            child: GestureDetector(
                child: R.img(Assets.chat$dialog_bottom_close_png,
                    package: ComponentManager.MANAGER_CHAT),
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ),
          const SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}

class ChatBubbleWidget extends StatelessWidget {
  final String? image;
  final String? text;
  final Color? color;

  const ChatBubbleWidget({super.key, this.image, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
      constraints: const BoxConstraints(minHeight: 48, minWidth: 66),
      child: Stack(
        children: <Widget>[
          PositionedDirectional(
            start: 0,
            top: 0,
            end: 0,
            bottom: 0,
            child: CachedNetworkImageStretch(
              imageUrl: image,
              centerSlice: const Rect.fromLTWH(32, 23, 2, 2),
              scale: 3,
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.fromSTEB(29, 15, 29, 13),
            child: Text(
              text ?? '',
              style: TextStyle(
                color: color ?? Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
