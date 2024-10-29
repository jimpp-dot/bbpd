import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class LoadingDelegate {
  Widget buildBigImageLoading(
      BuildContext context, AssetEntity entity, Color themeColor);

  Widget buildPreviewLoading(
      BuildContext context, AssetEntity entity, Color themeColor);
}

class DefaultLoadingDelegate extends LoadingDelegate {
  @override
  Widget buildBigImageLoading(
      BuildContext context, AssetEntity entity, Color themeColor) {
    return Center(
      child: SizedBox(
        width: 30.0,
        height: 30.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(themeColor),
        ),
      ),
    );
  }

  @override
  Widget buildPreviewLoading(
      BuildContext context, AssetEntity entity, Color themeColor) {
    return Center(
      child: SizedBox(
        width: 30.0,
        height: 30.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(themeColor),
        ),
      ),
    );
  }
}

class SimpleLoadingDelegate extends LoadingDelegate {
  @override
  Widget buildBigImageLoading(
      BuildContext context, AssetEntity entity, Color themeColor) {
    return const Center(
      child: SizedBox(
        width: 30.0,
        height: 30.0,
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  @override
  Widget buildPreviewLoading(
      BuildContext context, AssetEntity entity, Color themeColor) {
    return const Center(
      child: SizedBox(
        width: 30.0,
        height: 30.0,
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
