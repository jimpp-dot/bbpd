import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';

typedef OnEditSelect = void Function(int index);
typedef OnItemDelete = void Function(int index);

/// 编辑剧本：item
class EditDramaItem extends StatelessWidget {
  final PiaJuBen item;
  final int index;
  final OnEditSelect onItemEdit;
  final OnItemDelete? onItemDelete;
  final bool editCv;

  const EditDramaItem({
    Key? key,
    required this.item,
    required this.index,
    required this.onItemEdit,
    this.onItemDelete,
    required this.editCv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: 63,
      child: Row(
        children: [
          const SizedBox(
            width: 22,
          ),
          SizedBox(
            width: 27,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Util.width - 49 - 20 - 76 - 24 - 25),
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    _buildType(),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'CV ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    Image.asset(MoneyConfig.moneyIcon, width: 15, height: 15),
                    Text(
                      '${item.payGs.giftPrice * item.payGs.giftNum} + ${K.room_reception_fee} ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    Image.asset(MoneyConfig.moneyIcon, width: 15, height: 15),
                    Text(
                      '${item.payRecepition.giftPrice * item.payRecepition.giftNum} *2',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
              onItemEdit(index);
            },
            child: R.img(
              'ic_edit.svg',
              width: 24,
              height: 24,
              color: Colors.white,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          if (editCv) ...[
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 1,
              height: 14,
              color: Colors.white.withOpacity(0.5),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: () {
                if (onItemDelete != null) {
                  onItemDelete!(index);
                }
              },
              child: R.img(
                'ic_delete_white.png',
                width: 24,
                height: 24,
                color: Colors.white,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          ],
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildType() {
    return Container(
      width: 24,
      height: 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(2),
        color: Colors.transparent,
        border: Border.all(color: const Color(0xFF1ECBFF), width: 1),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        item.type == PiaJuBenType.PiaJuBenTypeSingle
            ? K.room_single_person
            : K.room_drama_type_multi,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1ECBFF),
          height: 1,
        ),
      ),
    );
  }
}
