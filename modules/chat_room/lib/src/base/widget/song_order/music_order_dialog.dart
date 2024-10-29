import 'package:flutter/material.dart';
import 'package:shared/k.dart';

/// 歌房列表通用dialog
class MusicOrderDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? cancelText;
  final String? confirmText;
  final bool? showCancelBtn;

  const MusicOrderDialog({
    super.key,
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.showCancelBtn,
  });

  static Future<bool?> show(
    BuildContext context, {
    String? title,
    String? content,
    String? cancelText,
    String? confirmText,
    bool showCancelBtn = true,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MusicOrderDialog(
          title: title,
          content: content,
          cancelText: cancelText,
          confirmText: confirmText,
          showCancelBtn: showCancelBtn,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool contentIsEmpty = content?.isEmpty ?? true;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 312,
          padding: const EdgeInsetsDirectional.only(
              start: 20, top: 24, end: 20, bottom: 24),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title?.isNotEmpty ?? false) ...[
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF202020),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: contentIsEmpty ? 30 : 15),
              ],
              if (!contentIsEmpty) ...[
                Text(
                  content!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: title?.isNotEmpty ?? false ? 15 : 18,
                    color: const Color(0xFF202020),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
              ],
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showCancelBtn ?? false) ...[
                    _buildBtn(context, 0),
                    const Spacer(),
                  ],
                  _buildBtn(context, 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBtn(BuildContext context, int type) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(type != 0),
      child: Container(
        width: 130,
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: type == 0
                ? const [Color(0xFFF5F5F5), Color(0xFFF5F5F5)]
                : const [Color(0xFF00D55F), Color(0xFF00C5A2)],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          type == 0 ? (cancelText ?? K.cancel) : (confirmText ?? K.sure),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: type == 0 ? const Color(0xB3202020) : Colors.white,
          ),
        ),
      ),
    );
  }
}
