import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/model/tag_bean.dart';

import 'moment_discover_page.dart';

/// 朋友圈标签页
class MomentTagScreen extends StatefulWidget {
  static const String MOMENT_TAG_ROUTE = '/MomentTagScreen';

  final PageType type;
  final String? title; // 标题
  final int id; // 标签id
  final String? icon;

  static Future openMomentTagScreen(
    BuildContext context, {
    Key? key,
    PageType type = PageType.PlayTag,
    required String title,
    required int id,
    String? icon,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: MOMENT_TAG_ROUTE),
        builder: (context) {
          return MomentTagScreen(
            key: key,
            title: title,
            type: type,
            id: id,
            icon: icon,
          );
        },
      ),
    );
  }

  const MomentTagScreen(
      {super.key, this.title, required this.type, required this.id, this.icon});

  @override
  _MomentTagScreenState createState() => _MomentTagScreenState();
}

class _MomentTagScreenState extends State<MomentTagScreen>
    with TickerProviderStateMixin {
  final GlobalKey _discoveryKey = GlobalKey<MomentDiscoverPageState>();

  @override
  void initState() {
    super.initState();
  }

  void _scrollToTop() {
    if (_discoveryKey.currentState is MomentDiscoverPageState) {
      (_discoveryKey.currentState as MomentDiscoverPageState).scrollToTop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar.custom(
        backgroundColor: R.colors.homeBgColor,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        title: GestureDetector(
          onDoubleTap: _scrollToTop,
          child: _buildTitle(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _getTitleIcon(),
        Text(
          widget.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Widget _getTitleIcon() {
    if (widget.type == PageType.PlayTag) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 7.0),
        child: R.img(
          'ic_play_tag.svg',
          width: 18,
          height: 18,
          package: ComponentManager.MANAGER_MOMENT,
        ),
      );
    } else if (widget.type == PageType.Tag) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 7.0),
        child: R.img(
          'ic_title_tag.svg',
          width: 18,
          height: 18,
          package: ComponentManager.MANAGER_MOMENT,
        ),
      );
    } else if (widget.type == PageType.Case) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 7.0),
        child: R.img(
          'ic_title_tag.svg',
          width: 18,
          height: 18,
          package: ComponentManager.MANAGER_MOMENT,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildBody() {
    return MomentDiscoverPage(
      key: _discoveryKey,
      type: widget.type,
      id: widget.id,
      title: widget.title ?? '',
      icon: widget.icon ?? '',
    );
  }
}
