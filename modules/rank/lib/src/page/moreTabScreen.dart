import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/model/entity/moreTabRsp.dart';
import 'package:rank/src/model/rankRequestManager.dart';
import 'package:rank/src/widget/moreTabGroup.dart';

class MoreTabScreen extends StatefulWidget {
  final OnTabItemClicked? onTabItemClicked;

  const MoreTabScreen({super.key, this.onTabItemClicked});

  @override
  _MoreTabScreenState createState() => _MoreTabScreenState();

  static Future show(BuildContext context,
      {OnTabItemClicked? onTabItemClicked}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MoreTabScreen(
        onTabItemClicked: onTabItemClicked,
      ),
      settings: const RouteSettings(name: '/moreTab'),
    ));
  }
}

class _MoreTabScreenState extends State<MoreTabScreen> {
  bool _loading = true;
  String? _errorMsg;
  MoreTabRsp? _moreTabRsp;

  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 20, top: 10, bottom: 10, end: 20),
              child: R.img(
                BaseAssets.close_icon_svg,
                width: 18,
                color: R.color.mainTextColor,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              '全部分类',
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildAppBar(),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  void _load() async {
    _loading = true;
    _errorMsg = null;

    _moreTabRsp = await RankRequestManager.getMoreTab();
    _loading = false;
    if (_moreTabRsp != null && _moreTabRsp!.success) {
    } else {
      _errorMsg = R.string('server_return_error_retry');
    }

    _refresh();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  _buildContent() {
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    } else if (_errorMsg != null) {
      return Center(
        child: ErrorData(
          onTap: () {
            _load();
          },
          error: _errorMsg,
        ),
      );
    }
    return _buildGroups();
  }

  Widget _buildGroups() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: ListView.builder(
        itemCount: _moreTabRsp?.groups.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 24),
            child: MoreTabGroup(
              data: _moreTabRsp!.groups[index],
              onTabItemClicked: _onTabItemClicked,
            ),
          );
        },
      ),
    );
  }

  void _onTabItemClicked(MoreTabItem item) {
    Navigator.of(context).pop();
    if (widget.onTabItemClicked != null) {
      widget.onTabItemClicked!(item);
    }
  }
}
