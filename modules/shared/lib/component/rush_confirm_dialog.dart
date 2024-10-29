import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

/// 两个按钮弹窗
class RushConfirmDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final WidgetBuilder? contentBuilder;
  RushNegativeButton? negativeButton;
  RushPositiveButton? positiveButton;

  static Future openRushConfirmDialog(
    BuildContext context, {
    String? title,
    String? content,
    RushNegativeButton? negativeButton,
    RushPositiveButton? positiveButton,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      barrierColor: const Color(0xFF08032B).withOpacity(0.85).withOpacity(0.4),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return ElasticScaleAnim(
          child: RushConfirmDialog(
            title: title,
            content: content,
            negativeButton: negativeButton,
            positiveButton: positiveButton,
          ),
        );
      },
    );
  }

  RushConfirmDialog(
      {super.key,
      this.negativeButton,
      this.positiveButton,
      this.title,
      this.content,
      this.contentBuilder}) {
    negativeButton ??= RushNegativeButton();
    positiveButton ??= RushPositiveButton();
  }

  Widget _buildTitle(BuildContext context) {
    return Util.validStr(title)
        ? Text(
            title!,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        : const SizedBox();
  }

  Widget _buildContent(BuildContext context) {
    if (Util.validStr(content)) {
      return Container(
        padding: const EdgeInsets.only(top: 13),
        child: Text(
          content!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: R.color.thirdTextColor,
            fontSize: 13,
          ),
        ),
      );
    } else if (contentBuilder != null) {
      return contentBuilder!(context);
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          constraints: const BoxConstraints(
            maxHeight: 400,
          ),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding:
              const EdgeInsets.only(left: 23, right: 23, top: 24, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildTitle(context),
                    _buildContent(context),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (negativeButton != null) negativeButton!,
                  if (positiveButton != null) positiveButton!,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RushNegativeButton extends StatelessWidget {
  String? text;
  final VoidCallback? onPressed;
  final double width;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;

  RushNegativeButton(
      {super.key,
      this.text,
      this.width = 119,
      this.onPressed,
      this.decoration,
      this.textStyle}) {
    if (text == null || text!.isEmpty) {
      text = K.cancel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onPressed == null) {
            Navigator.of(context).pop(false);
          } else {
            onPressed!();
          }
        },
        borderRadius: BorderRadius.circular(21.5),
        child: Ink(
          width: width,
          height: 43,
          decoration: decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(21.5),
                border: Border.all(
                    color: const Color(0xFF202020).withOpacity(0.2), width: 1),
              ),
          child: Center(
            child: Text(
              text!,
              style: textStyle ??
                  TextStyle(
                    color: R.color.thirdTextColor,
                    fontSize: 13,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class RushPositiveButton extends StatelessWidget {
  String? text;
  final VoidCallback? onPressed;
  final double width;

  RushPositiveButton(
      {super.key, this.text = '确定', this.onPressed, this.width = 119}) {
    if (text == null || text!.isEmpty) {
      text = K.cancel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onPressed == null) {
            Navigator.of(context).pop(true);
          } else {
            onPressed!();
          }
        },
        borderRadius: BorderRadius.circular(21.5),
        child: Ink(
          width: width,
          height: 43,
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: BorderRadius.circular(21.5),
            gradient: LinearGradient(
              colors: R.color.mainBrandGradientColors,
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
            ),
          ),
          child: Center(
            child: Text(
              text!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RushGradientPositiveButton extends StatelessWidget {
  String? text;
  final VoidCallback? onPressed;

  RushGradientPositiveButton({super.key, this.text = '确定', this.onPressed}) {
    if (text == null || text!.isEmpty) {
      text = K.cancel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onPressed == null) {
            Navigator.of(context).pop(true);
          } else {
            onPressed!();
          }
        },
        borderRadius: BorderRadius.circular(21.5),
        child: Ink(
          width: 119,
          height: 43,
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: BorderRadius.circular(21.5),
            gradient: const LinearGradient(
              colors: [Color(0xFFFF8D8D), Color(0xFFFF6CD2)],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
            ),
          ),
          child: Center(
            child: Text(
              text!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
