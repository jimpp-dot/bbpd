import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:message/k.dart';

class StrategyModifyButtons extends StatelessWidget {
  final String editBtnText;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const StrategyModifyButtons(
      {super.key,
      required this.editBtnText,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildEditBtn(),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 2,
          height: 2,
          decoration: BoxDecoration(
            color: R.colors.mainTextColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        _buildDeleteBtn(),
      ],
    );
  }

  Widget _buildEditBtn() {
    return GestureDetector(
      onTap: onEdit,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_edit.svg',
            package: ComponentManager.MANAGER_MESSAGE,
            width: 16,
            height: 16,
            color: R.colors.secondTextColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            editBtnText,
            style: TextStyle(
                fontSize: 11,
                color: R.colors.thirdTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteBtn() {
    return GestureDetector(
      onTap: onDelete,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_delete.svg',
            package: ComponentManager.MANAGER_MESSAGE,
            width: 16,
            height: 16,
            color: R.colors.thirdTextColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            K.msg_clear,
            style: TextStyle(
                fontSize: 11,
                color: R.colors.thirdTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
