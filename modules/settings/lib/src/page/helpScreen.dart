import 'package:shared/dart_extensions/widget/box_extension.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

import '../model/pb/generated/help.pb.dart';
import '../model/setting_repository.dart';

/// 帮助
class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

  static void showHelpScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HelpScreen(),
        settings: const RouteSettings(name: '/help'),
      ),
    );
  }
}

class _State extends State<HelpScreen> {
  List<HelpList> _items = [];

  double ratio = (Util.width / 2) / 60;

  bool _isLoading = true;

  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    _error = null;
    _isLoading = true;
    ResHelpList rsp = await SettingRepository.getHelpList();
    if (rsp.success) {
      var data = rsp.data;
      data.removeWhere((e) => e.title == '安卓用户教程');
      data.removeWhere((e) => e.title == '资质认证');
      data.removeWhere((e) => e.title == '钱包说明');
      data.removeWhere((e) => e.title == '账号充值');
      HelpList? one = data.firstWhereOrNull((e) => e.title == '派对管理规范');
      one?.title = '派对房管理规范';
      HelpList? two = data.firstWhereOrNull((e) => e.title == '大神管理规则');
      two?.title = '主播管理规则';
      _items = data;
    } else {
      _error = rsp.msg;
    }
    _isLoading = false;

    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.setting_helpful,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
      ),
      backgroundColor: Colors.transparent,
      body: _buildBody(),
    ).withCommonBg();
  }

  Widget _buildBody() {
    if (_isLoading) return const Loading();

    if (_error != null) {
      return ErrorData(
        error: _error,
        onTap: () => _load(),
      );
    }

    if (_items.isEmpty) {
      return const EmptyWidget();
    }

    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return _Item(_items[index]);
      },
    );
  }
}

class _Item extends StatelessWidget {
  final HelpList item;

  const _Item(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BaseWebviewScreen.show(context, url: item.jumpUrl, title: item.title);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        alignment: AlignmentDirectional.centerStart,
        decoration: commonBoxDecorationWithParams([Colors.white.withOpacity(0.05),Colors.white.withOpacity(0.05)],10),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: Util.parseIcon(item.icon),
              width: 32,
              height: 32,
              color: R.color.mainBrandColor,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.title,
                    style: R.textStyle.body1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // if (item.desc.isNotEmpty)
                  //   Text(item.desc,
                  //       style: R.textStyle.body2,
                  //       maxLines: 2,
                  //       overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
