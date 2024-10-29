import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

import '../assets.dart';

class ErrorData extends StatelessWidget {
  final String? error;
  final VoidCallback? onTap;
  final String? bgImg;
  final Color? fontColor;
  final double? top;
  final double? bottom;

  const ErrorData(
      {Key? key,
      this.error,
      this.onTap,
      this.bgImg,
      this.fontColor,
      this.top = 12,
      this.bottom = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double adjustTop = top ?? 12.0;
    double adjustBottom = bottom ?? 8.0;
    //Material包装，解决Stack中InkWell控件下有图片等情况时点击水波纹显示异常问题
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              R.img(
                !Util.isStringEmpty(bgImg) ? bgImg : BaseAssets.error_data_webp,
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 180,
                height: 180,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: adjustTop, bottom: adjustBottom, start: 16, end: 16),
                child: Text(error ?? K.server_return_error_retry,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: fontColor ?? R.color.mainTextColor,
                        fontFamily: Util.fontFamily)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
