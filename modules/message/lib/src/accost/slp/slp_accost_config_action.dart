import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class BbAccostConfigActionWidget extends StatelessWidget {
  final List<BbAccostConfigActionItem> _list;

  const BbAccostConfigActionWidget(this._list, {super.key});

  static Future<bool?> show(
      BuildContext context, List<BbAccostConfigActionItem> list) async {
    return await displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return BbAccostConfigActionWidget(list);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 190 + Util.iphoneXBottom,
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: _buildBody(context),
        ),
      ),
    );
  }

  List<Widget> _buildBody(BuildContext context) {
    List<Widget> result = [];
    var data = _list.where((e) => e.show).toList();
    data.forEachIndexed((i, e) {
      result.add(_buildItem(context, e));
      if (i < data.length - 1) {
        result.add(const SizedBox(width: 33));
      }
    });
    return result;
  }

  Widget _buildItem(BuildContext context, BbAccostConfigActionItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        item.onTap?.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFF2ECEFE).withOpacity(0.06),
              borderRadius: BorderRadius.circular(27),
            ),
            alignment: AlignmentDirectional.center,
            child: R.img(item.icon,
                width: 29,
                height: 29,
                package: ComponentManager.MANAGER_MESSAGE),
          ),
          const SizedBox(height: 6),
          Container(
            constraints: const BoxConstraints(maxWidth: 62),
            child: Text(
              item.name ?? '',
              style: TextStyle(
                color: R.colors.secondTextColor,
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class BbAccostConfigActionItem {
  bool show;
  String? icon;
  String? name;
  VoidCallback? onTap;

  BbAccostConfigActionItem(
      {this.show = true, this.icon, this.name, this.onTap});
}
