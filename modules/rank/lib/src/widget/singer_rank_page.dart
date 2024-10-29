import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';
import 'package:rank/src/widget/singer_rank_sub_page.dart';

/// 歌手榜单
class SingerRankPage extends StatefulWidget {
  const SingerRankPage({super.key});

  @override
  State<StatefulWidget> createState() => _SingerRankState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SingerRankPage(),
      settings: const RouteSettings(name: '/SingerRank'),
    ));
  }
}

class _SingerRankState extends State<SingerRankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        statusBrightness: R.colors.statusBarTheme,
        backgroundColor: R.colors.homeBgColor,
        backColor: R.colors.mainTextColor,
        title: Text(K.rank_singer_title,
            style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      body: const SingerRankSubPage(),
    );
  }
}
