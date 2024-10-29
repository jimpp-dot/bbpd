import 'package:flutter/material.dart';

import '../shared.dart';
import '../k.dart';

class SingleButtonDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final WidgetBuilder? contentBuilder;
  final SingleButton? button;
  final double? contentTopPadding;
  final double? contentBottomPadding;

  const SingleButtonDialog(
      {super.key,
      this.title,
      this.content,
      this.contentBuilder,
      this.button,
      this.contentTopPadding,
      this.contentBottomPadding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 280,
          constraints: const BoxConstraints(
            maxHeight: 400,
          ),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: contentBottomPadding ?? 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildTitle(context),
                    _buildContent(context),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (button != null) button!,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return title != null
        ? Text(
            title!,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        : const SizedBox.shrink();
  }

  Widget _buildContent(BuildContext context) {
    if (content != null) {
      return Container(
        width: 180,
        padding: EdgeInsets.only(top: contentTopPadding ?? 12),
        child: Text(
          content!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else if (contentBuilder != null) {
      return contentBuilder!(context);
    } else {
      return const SizedBox.shrink();
    }
  }
}

class SingleButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool useGradientBg;

  /// 支持外部传入按钮渐变色
  final List<Color>? gradientBg;

  const SingleButton(
      {super.key,
      this.text,
      this.onPressed,
      this.useGradientBg = false,
      this.gradientBg});

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
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: 132,
          height: 48,
          decoration: BoxDecoration(
            color: R.color.secondaryBrandColor,
            gradient: getGradient(),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              text ?? K.confirm,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient? getGradient() {
    if (useGradientBg) {
      return LinearGradient(
          colors: gradientBg ?? R.color.mainBrandGradientColors);
    }
    return null;
  }
}
