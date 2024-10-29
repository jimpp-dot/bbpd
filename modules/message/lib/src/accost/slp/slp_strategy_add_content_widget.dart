import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/model/pb/generated/slp_gs.pb.dart';

import '../../../k.dart';

class BbStrategyAddContentWidget extends StatelessWidget {
  final GsChatMsg item;
  final VoidCallback? onAddText;
  final VoidCallback? onAddVoice;
  final VoidCallback? onAddImage;
  final int index;

  const BbStrategyAddContentWidget(
      {super.key,
      required this.item,
      this.onAddText,
      this.onAddVoice,
      this.onAddImage,
      required this.index});

  @override
  Widget build(BuildContext context) {
    bool auditFail = item.state == 2;
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: auditFail
                ? const Color(0xFFFF5F7D)
                : R.colors.mainTextColor.withOpacity(0.2),
            width: 0.5),
      ),
      child: buildBtn(),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     _buildAddTextBtn(item),
      //     Container(width: 0.5, height: 16, color: R.colors.mainTextColor.withOpacity(0.1),),
      //     _buildAddVoiceBtn(item),
      //     Container(width: 0.5, height: 16, color: R.colors.mainTextColor.withOpacity(0.1),),
      //     _buildAddImageBtn(item),
      //   ],
      // ),
    );
  }

  Widget buildBtn() {
    if (index == 0) {
      return _buildAddTextBtn(item);
    } else if (index == 1) {
      return _buildAddVoiceBtn(item);
    } else if (index == 2) {
      return _buildAddImageBtn(item);
    }
    return _buildAddTextBtn(item);
  }

  Widget _buildAddTextBtn(GsChatMsg item) {
    return GestureDetector(
      onTap: () async {
        if (onAddText != null) {
          onAddText!();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_add_text.svg',
            package: ComponentManager.MANAGER_MESSAGE,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            K.msg_add_text,
            style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildAddVoiceBtn(GsChatMsg item) {
    return GestureDetector(
      onTap: () {
        if (onAddVoice != null) {
          onAddVoice!();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_add_voice.svg',
            package: ComponentManager.MANAGER_MESSAGE,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            K.msg_record_voice,
            style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildAddImageBtn(GsChatMsg item) {
    return GestureDetector(
      onTap: () {
        if (onAddImage != null) {
          onAddImage!();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_add_image.svg',
            package: ComponentManager.MANAGER_MESSAGE,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            K.msg_upload_image,
            style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
