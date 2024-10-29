import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/k.dart';
import 'package:profile/src/NewUserPayRepo.dart';
import 'package:profile/src/model/pb/generated/new_user_pay_gs.pb.dart';
import 'package:profile/src/new_user_pay_gs_points_sub.dart';

class NewUserPayGsPointsDetail extends StatefulWidget {
  const NewUserPayGsPointsDetail({super.key});

  @override
  State<StatefulWidget> createState() => NewUserPayGsPointsState();

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewUserPayGsPointsDetail(),
    ));
  }
}

class NewUserPayGsPointsState extends State<NewUserPayGsPointsDetail>
    with BaseScreenStateMixin {
  final List<String> _tabs = [
    K.profile_tab_today,
    K.profile_tab_yesterday,
    K.profile_tab_this_week,
    K.profile_tab_last_week
  ];
  final List<Widget> _pagesWidget = [];

  PageController? _pageController;
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    ResGsTransferPointsDetail resp =
        await NewUserPayRepo.getTransferPointsTabs();
    if (resp.success) {
      _pageController = PageController(initialPage: _curIndex, keepPage: true);
      _tabs.forEachIndexed((i, e) {
        _pagesWidget.add(
            NewUserPayGsPointsSub(dateTab: (i + 1), subTabs: resp.data.tabs));
      });
      setScreenReady();
    } else {
      setScreenError();
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar.custom(
        title: Text(K.profile_new_user_pay_points_detail_title,
            style: R.textStyle.title),
      ),
      body: SafeArea(child: buildStatusContent()),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTabWidget(),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _pagesWidget,
          ),
        ),
      ],
    );
  }

  Widget _buildTabWidget() {
    return Container(
      width: double.infinity,
      height: 38,
      margin: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 5, bottom: 5),
      padding: const EdgeInsets.all(2),
      decoration: const ShapeDecoration(
        color: Color(0xFFF6F7F9),
        shape: StadiumBorder(),
      ),
      child: Row(
        children: _tabs.mapIndexed((i, e) => _buildTabItem(i, e)).toList(),
      ),
    );
  }

  Widget _buildTabItem(int index, String tabLabel) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabSelected(index),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: ShapeDecoration(
            color: _curIndex == index ? Colors.white : Colors.transparent,
            shape: const StadiumBorder(),
          ),
          alignment: Alignment.center,
          child: Text(
            tabLabel,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _curIndex == index
                  ? const Color(0xFF202020)
                  : const Color(0x66202020),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) async {
    _curIndex = index;
    _pageController?.jumpToPage(index);
    refresh();
  }
}
