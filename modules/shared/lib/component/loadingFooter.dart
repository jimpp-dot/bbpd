import 'package:shared/K.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingFooter extends StatefulWidget {
  final bool hasMore;
  final String? errorMessage;
  final VoidCallback? loadMore;
  final Color? textColor;

  const LoadingFooter(
      {super.key,
      this.hasMore = true,
      this.errorMessage,
      this.loadMore,
      this.textColor});

  @override
  _LoadingFooterState createState() => _LoadingFooterState();
}

class _LoadingFooterState extends State<LoadingFooter> {
  Color get textColor => widget.textColor ?? R.color.secondTextColor;

  @override
  Widget build(BuildContext context) {
    Widget more;

    if (widget.errorMessage != null) {
      String error = widget.errorMessage!;
      if (widget.errorMessage!.isNotEmpty) {
        error += '，';
      }
      error += K.click_to_retry;
      more = InkWell(
          onTap: () => widget.loadMore?.call(),
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                error,
                style: TextStyle(color: textColor),
              ),
            ),
          ));
      return more;
    }
    if (widget.hasMore) {
      more = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CupertinoActivityIndicator(animating: true),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              K.waitting_load,
              style: TextStyle(color: textColor),
            ),
          )
        ],
      );
    } else {
      more = Text(
        K.not_any_more,
        style: TextStyle(color: textColor),
      );
    }

    return Container(
      height: 50.0,
      width: Util.width,
      alignment: Alignment.center,
      child: more,
    );
  }
}
