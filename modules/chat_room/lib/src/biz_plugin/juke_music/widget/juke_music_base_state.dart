import 'package:shared/shared.dart';
import 'package:shared/widget/screen/base_screen.dart';
import 'package:flutter/material.dart';

abstract class JukeMusicBaseState<T extends StatefulWidget> extends State<T>
    with BaseScreenStateMixin {
  @override
  initState() {
    super.initState();
    loadData();
  }

  /// 加载数据
  loadData();

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    loadData();
  }

  @protected
  Widget buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        buildTitle(),
        Expanded(child: buildStatusContent()),
      ],
    );
  }

  /// 标题
  @protected
  Widget buildTitle();

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }
}
