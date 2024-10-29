import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class ConfirmDialogNormal extends StatelessWidget {
  final String? title;
  final String? content;
  final String? btnName;
  final VoidCallback? onConfirm;

  const ConfirmDialogNormal(
      {Key? key, this.title, this.content, this.btnName, this.onConfirm})
      : super(key: key);

  static void show(BuildContext context,
      {String? title,
      String? content,
      String? btnName,
      VoidCallback? onConfirm}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (context) {
          return ConfirmDialogNormal(
            title: title,
            content: content,
            btnName: btnName,
            onConfirm: onConfirm,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Util.width - 2 * 40.dp,
          constraints: BoxConstraints(
            maxHeight: 400.dp,
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 24, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title?.isNotEmpty == true) ...[
                Text(title!,
                    style: const TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
                const SizedBox(height: 20),
              ],
              if (content?.isNotEmpty == true) ...[
                Text(content!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
              ],
              GestureDetector(
                onTap: () {
                  onConfirm?.call();
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  padding:
                      const EdgeInsetsDirectional.only(top: 14, bottom: 14),
                  width: 263,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(24),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: R.color.mainBrandGradientColors,
                    ),
                  ),
                  child: Text(btnName ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg,
              width: 40),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
