import 'package:shared/assets.dart';
import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/model/super_pack_beans.dart';
import 'package:gift/src/widget/super_pack_gift_item.dart';

import '../../assets.dart';

/// 充值后获取礼物弹窗
class SuperGiftReceiveDialog extends StatefulWidget {
  final SuperPackItem? data;

  const SuperGiftReceiveDialog({Key? key, @required this.data})
      : super(key: key);

  @override
  _SuperGiftReceiveDialogState createState() => _SuperGiftReceiveDialogState();

  static Future<bool?> show(BuildContext context, SuperPackItem data) {
    return showDialog(
        context: System.context,
        barrierDismissible: true,
        builder: (context) => Center(
              child: SuperGiftReceiveDialog(
                data: data,
              ),
            ));
  }
}

class _SuperGiftReceiveDialogState extends State<SuperGiftReceiveDialog> {
  double _realRadio = 90 / 160;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Util.width - 40,
                child: _buildGiftPack(),
              ),
              SizedBox(
                height: 12,
                width: Util.width,
              ),
              _buildClose()
            ],
          ),
          PositionedDirectional(
              bottom: 40,
              end: 0,
              child: R.img(
                Assets.gift_pack_gift_pack_dialog_footer_webp,
                width: 58,
                height: 64,
                package: ComponentManager.MANAGER_GIFT,
                fit: BoxFit.cover,
              )),
          PositionedDirectional(
              top: 20,
              start: 8,
              child: R.img(
                Assets.gift_pack_gift_pack_top_red_pkg_webp,
                width: 86,
                height: 74,
                package: ComponentManager.MANAGER_GIFT,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }

  Widget _buildGiftPack() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 60),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(Assets.gift_pack_gift_pack_main_bg_webp,
                package: ComponentManager.MANAGER_GIFT),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsetsDirectional.only(top: 16, bottom: 12),
              child: Text(
                K.gift_you_receive_pack([(widget.data?.name ?? '')]),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, bottom: 12),
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildItems(),
                  const SizedBox(
                    height: 12,
                  ),
                  _buildBottomBtn(),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItems() {
    List<Widget> children = [];
    if (widget.data?.gifts.isNotEmpty == true) {
      for (int i = 0; i < widget.data!.gifts.length; i++) {
        children.add(SuperPackGiftItem(
          size: 90,
          data: widget.data!.gifts[i],
          nameFontSize: 13,
          typeFontSize: 11,
          topTagWidth: 45,
          topTagHeight: 18,
          topTagFontSize: 11,
          onItemLayout: _onItemLayout,
        ));
      }
    }

    return GridView.count(
      padding:
          const EdgeInsetsDirectional.only(start: 0, end: 0, bottom: 0, top: 0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: _realRadio,
      children: children,
    );
  }

  Widget _buildBottomBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 220,
        height: 48,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFFF4E4E), Color(0xFFFFA879)]),
        ),
        child: Center(
          child: Text(
            K.gift_unlock_dialog_confirm,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildClose() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: R.img(
            BaseAssets.close_icon_svg,
            width: 24,
            height: 24,
            color: Colors.white,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
        ),
      ),
    );
  }

  void _onItemLayout(double radio) {
    if (_realRadio != radio) {
      _realRadio = radio;
      setState(() {});
    }
  }
}
