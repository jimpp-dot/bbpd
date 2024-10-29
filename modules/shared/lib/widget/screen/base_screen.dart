import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

enum ScreenStatus { Loading, Error, Empty, Ready }

abstract class BaseScreenState<T extends StatefulWidget> extends State<T>
    with BaseScreenStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar() ?? _buildAppBar(),
      backgroundColor: getBgColor(),
      body: buildStatusContent(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}

mixin BaseScreenStateMixin<T extends StatefulWidget> on State<T> {
  ScreenStatus screenStatus = ScreenStatus.Loading;
  String? emptyMsg;
  Color? emptyMsgColor;
  String? emptyImgPath;
  String? errorMsg;
  Color? errorMsgColor;
  String? errorImgPath;

  bool handleEmptyTap = false;
  bool handleErrorTap = true;

  Widget buildStatusContent() {
    switch (screenStatus) {
      case ScreenStatus.Loading:
        return const Center(child: Loading());
      case ScreenStatus.Empty:
        return buildEmptyWidget();
      case ScreenStatus.Error:
        return buildErrorWidget();
      case ScreenStatus.Ready:
        return buildContent();
    }
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(44),
      child: BaseAppBar(""),
    );
  }

  /// 允许重写
  Widget buildEmptyWidget() {
    return Center(
      child: EmptyWidget(
        desc: emptyMsg,
        textColor: emptyMsgColor,
        imgPath: emptyImgPath,
        onTap: () {
          if (handleEmptyTap) {
            setScreenLoading();
            onTapEmptyWidget();
          }
        },
      ),
    );
  }

  /// 允许重写
  Widget buildErrorWidget() {
    return Center(
      child: ErrorData(
        error: errorMsg,
        bgImg: errorImgPath,
        fontColor: errorMsgColor,
        onTap: () {
          if (handleErrorTap) {
            setScreenLoading();
            onTapErrorWidget();
          }
        },
      ),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar() => null;

  Widget? buildBottomNavigationBar() => null;

  Color getBgColor() => R.color.mainBgColor;

  @protected
  Widget buildContent();

  @protected
  void onTapErrorWidget() {}

  @protected
  void onTapEmptyWidget() {}

  setScreenError(
      {String? errorMsg,
      String? errorImgPath,
      bool handleErrorTap = true,
      Color? errorMsgColor}) {
    screenStatus = ScreenStatus.Error;
    this.errorMsg = errorMsg;
    this.errorImgPath = errorImgPath;
    this.handleErrorTap = handleErrorTap;
    this.errorMsgColor = errorMsgColor;
    refresh();
  }

  setScreenEmpty(
      {String? emptyMsg,
      bool handleEmptyTap = false,
      Color? emptyMsgColor,
      String? emptyImgPath}) {
    screenStatus = ScreenStatus.Empty;
    this.handleEmptyTap = handleEmptyTap;
    this.emptyMsg = emptyMsg;
    this.emptyMsgColor = emptyMsgColor;
    this.emptyImgPath = emptyImgPath;
    refresh();
  }

  setScreenLoading() {
    screenStatus = ScreenStatus.Loading;
    refresh();
  }

  setScreenReady() {
    screenStatus = ScreenStatus.Ready;
    refresh();
  }

  bool isScreenReady() => screenStatus == ScreenStatus.Ready;
}
