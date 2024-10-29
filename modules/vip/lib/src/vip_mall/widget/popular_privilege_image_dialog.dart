import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';

class PopularPrivilegeImageDialog extends StatefulWidget {
  final String image;
  final String name;
  final String desc;
  final bool own;

  const PopularPrivilegeImageDialog(this.image, this.name, this.desc, this.own,
      {super.key});

  static void show(
      BuildContext context, String image, String name, String desc, bool own) {
    displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        builder: (BuildContext context) {
          return PopularPrivilegeImageDialog(image, name, desc, own);
        });
  }

  @override
  State<StatefulWidget> createState() {
    return _PopularPrivilegeImageDialogState();
  }
}

class _PopularPrivilegeImageDialogState
    extends State<PopularPrivilegeImageDialog> {
  @override
  Widget build(BuildContext context) {
    double bottom = Util.iphoneXBottom;
    bottom = bottom > 0 ? bottom : 20;
    Color tagBgColor = R.color.mainBrandColor;
    Color tagTextColor = R.color.mainBrandColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: Util.height - 180 - bottom),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: widget.image,
              width: MediaQuery.of(context).size.width - 60 * 2,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsetsDirectional.only(bottom: bottom),
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 16, end: 16, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 16,
                            color: R.color.mainTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                          height: 22,
                          padding: const EdgeInsetsDirectional.only(
                              start: 6, end: 6),
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: tagBgColor.withOpacity(0.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(11)),
                          ),
                          child: Text(K.vip_popularity_auto_give,
                              style: TextStyle(
                                  fontSize: 11, color: tagTextColor))),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                  child: Text(
                    widget.desc,
                    style:
                        TextStyle(fontSize: 13, color: R.color.mainTextColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    double opacity = 1.0;
    if (widget.own) {
      opacity = 0.6;
    }
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        if (!widget.own) {
          IVipManager vipManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_VIP);
          vipManager.showMyLevelScreen(context);
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
        ),
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.5),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors
                .map((e) => e.withOpacity(opacity))
                .toList(),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.own ? K.vip_own : K.vip_go_and_get,
          style: TextStyle(
            color: Colors.white.withOpacity(opacity),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
