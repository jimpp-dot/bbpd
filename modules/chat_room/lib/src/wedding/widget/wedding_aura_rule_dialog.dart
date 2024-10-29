import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

const _checkKey = 'WeddingAuraRuleCheck';

class WeddingAuraRuleModel {
  WeddingAuraRuleModel(this.checked, this.title);

  final String title;
  bool checked;

  static bool get isCheck {
    final isCheck = Config.getBool(_checkKey, false);
    return isCheck;
  }

  static set isCheck(bool isCheck) {
    Config.setBool(_checkKey, isCheck);
  }
}

class WeddingAuraRuleDialog extends StatelessWidget {
  const WeddingAuraRuleDialog({super.key, required this.model});

  final WeddingAuraRuleModel model;

  _onConfirm(BuildContext context, bool checked) {
    WeddingAuraRuleModel.isCheck = checked;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    double width = 312.dp;
    return ConfirmDialog(
      width: width,
      contentBuilder: _buildContent,
      negativeButton: null,
      positiveButton: PositiveButton(
        width: width - 40,
        text: K.sure,
        onPressed: () {
          _onConfirm(context, model.checked);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          model.title,
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        _buildCheckHint(),
      ],
    );
  }

  Widget _buildCheckHint() {
    return StatefulBuilder(
      builder: (context, setState) {
        return InkWell(
          onTap: () {
            setState(() {
              model.checked = !model.checked;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 4, bottom: 8, end: 4, top: 8),
                child: R.img(
                  model.checked
                      ? 'ic_checkbox_checked.svg'
                      : 'ic_checkbox_unchecked.svg',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  width: 20,
                  height: 20,
                ),
              ),
              Text(
                K.room_enough_remind,
                style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
