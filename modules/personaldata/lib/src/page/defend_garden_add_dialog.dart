import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import '../widget/defend_relation_item.dart';

class DefendGardenAddDialog extends StatelessWidget {
  final List<DefendRelationModel>? showList;
  DefendGardenAddDialog({super.key, this.showList});

  static Future<bool?> show({
    required BuildContext context,
    List<DefendRelationModel>? showList,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      builder: (context) {
        return DefendGardenAddDialog(showList: showList);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double ratio = (Util.width - 48 - 20) / 3 / 102;
    double height =
        (showList?.length ?? 0) > 3 ? (2 * ratio * 148 + 8) : ratio * 148;
    return Container(
      width: Util.width,
      padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16),
          topEnd: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            K.personal_defend_garden_add_dialog_title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            K.personal_defend_garden_add_subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0x66222222),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: Util.width - 48,
            height: height,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 6,
                childAspectRatio: 102 / 158,
                mainAxisExtent: ratio * 158,
              ),
              itemBuilder: (BuildContext context, int index) {
                return DefendRelationItem(
                  item: showList?[index],
                  ratio: ratio,
                  onTap: () async {
                    onTap(context, showList?[index].id ?? '');
                  },
                );
              },
              itemCount: showList?.length ?? 0,
            ),
          ),
          SizedBox(
            height: 15 + Util.iphoneXBottom,
          )
        ],
      ),
    );
  }

  bool tap = false;
  void onTap(BuildContext context, String id) async {
    if (tap) {
      return;
    }
    tap = true;
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}defend/hideOrShowRelation?version=3",
        {'id': id, 'hidden': '1'},
        throwOnError: true,
      );
      BaseResponse baseResponse = BaseResponse.parse(response);
      if (baseResponse.success == true) {
        Navigator.of(context).pop(true);
        return;
      } else if (Util.validStr(baseResponse.msg)) {
        Fluttertoast.showToast(msg: baseResponse.msg);
      } else {
        Fluttertoast.showToast(msg: BaseK.K.base_net_error);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
    tap = false;
  }
}
