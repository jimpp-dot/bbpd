import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class KuGouAuthDialog extends StatefulWidget {
  const KuGouAuthDialog({super.key});

  @override
  _KuGouAuthDialogState createState() => _KuGouAuthDialogState();

  static Future<bool?> show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const KuGouAuthDialog();
        });
  }
}

class _KuGouAuthDialogState extends State<KuGouAuthDialog> {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      width: 312.dp,
      contentBuilder: (context) {
        return _buildContent();
      },
      positiveButton: PositiveButton(
        text: K.room_authorization_now,
        width: 264.dp,
        height: 48,
        useGradientBg: true,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          K.room_song_authorization,
          style: const TextStyle(
              color: Color(0xFF202020),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          K.room_song_authorization_desc,
          style: TextStyle(
              color: const Color(0xFF202020).withOpacity(0.6), fontSize: 16),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
