import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../../k.dart';

/// 完善资料 dialog
class ProfileIntegrityDialog extends StatefulWidget {
  final String? titleText;

  const ProfileIntegrityDialog({super.key, this.titleText});

  @override
  State createState() {
    return _ProfileIntegrityState();
  }

  static Future<bool?> openDialog(BuildContext context, {String? titleText}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ProfileIntegrityDialog(titleText: titleText),
    );
  }
}

class _ProfileIntegrityState extends State<ProfileIntegrityDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: _renderIdAuth(),
      ),
    );
  }

  Widget _renderIdAuth() {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 23,
                bottom: 23,
              ),
              child: R.img(Assets.chat$chat_profile_comp_header_webp,
                  width: 180,
                  height: 144,
                  fit: BoxFit.contain,
                  package: ComponentManager.MANAGER_CHAT),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 27,
                end: 27,
                bottom: 8,
              ),
              child: Text(
                widget.titleText ?? K.chat_profile_tips_title,
                style: const TextStyle(
                    color: Color(0xFF242528),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            Text(
              K.chat_profile_tips_subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xB3202020),
                fontSize: 14,
              ),
            ),
            GestureDetector(
              onTap: () => _go(),
              child: Container(
                width: 258,
                height: 40,
                margin: const EdgeInsetsDirectional.only(
                    start: 27, end: 27, top: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: R.colors.mainBrandGradientColors,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.chat_profile_go,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _notNow(),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 16),
                child: Text(
                  K.chat_not_now,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9B9B9B),
                  ),
                ),
              ),
            ),
          ],
        ),
        PositionedDirectional(
          top: 11,
          end: 12,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                size: 24,
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _go() async {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    await manager.openImageModifyScreen(context);
    Navigator.of(context).pop(true);
  }

  void _notNow() {
    Navigator.of(context).pop(false);
  }
}
