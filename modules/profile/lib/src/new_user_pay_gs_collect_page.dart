import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/k.dart';
import 'package:profile/src/NewUserPayRepo.dart';
import 'package:profile/src/model/pb/generated/new_user_pay_gs.pb.dart';
import 'package:profile/src/new_user_pay_gs_points_detail.dart';
import 'package:profile/src/new_user_pay_gs_user_detail.dart';

class NewUserPayCollectGsPage extends StatefulWidget {
  const NewUserPayCollectGsPage({super.key});

  @override
  State<StatefulWidget> createState() => NewUserPayCollectGsState();

  static Future<void> show(BuildContext context) {
    Tracker.instance.track(TrackEvent.new_conversion_click,
        properties: {'page': 'entrance'});
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewUserPayCollectGsPage(),
    ));
  }
}

class NewUserPayCollectGsState extends State<NewUserPayCollectGsPage>
    with BaseScreenStateMixin {
  GsTransferStat? _data;

  GsTransferStat get data => _data ?? GsTransferStat();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    ResGsTransferStat resp = await NewUserPayRepo.getTransferState();
    if (resp.success) {
      _data = resp.data;
      setScreenReady();
    } else {
      setScreenError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar.custom(
        title: Text(K.profile_new_user_pay_gs, style: R.textStyle.title),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              /// 规则说明H5
              BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k136'));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 10, bottom: 10, start: 16, end: 16),
                child: R.img(
                  'ic_help.svg',
                  width: 24,
                  height: 24,
                  color: R.color.secondTextColor,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(child: buildStatusContent()),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        _buildPointsWidget(),
        const SizedBox(height: 20),
        _buildUserWidget(),
        const Spacer(),
        _buildExchange(),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildUserWidget() {
    return Container(
      width: double.infinity,
      height: 151,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 18, spreadRadius: 5, color: Color(0x0D000000))
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 24),
                Text(K.profile_new_user_pay_user_title,
                    style: const TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const Spacer(),
                _buildDetail(_onTapUserDetail),
              ],
            ),
          ),
          Divider(
              color: Colors.black.withOpacity(0.1),
              height: 1,
              indent: 12,
              endIndent: 12),
          Container(
            width: double.infinity,
            height: 90,
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: _buildItem(
                        K.profile_new_user_pay_user_today, data.todayTransfer)),
                Expanded(
                    child: _buildItem(
                        K.profile_new_user_pay_user_sum, data.sumTransfer)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointsWidget() {
    return Container(
      width: double.infinity,
      height: 151,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 18, spreadRadius: 5, color: Color(0x0D000000))
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 24),
                Text(K.profile_new_user_pay_points_text,
                    style: const TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const Spacer(),
                _buildDetail(_onTapPointsDetail),
              ],
            ),
          ),
          Divider(
              color: Colors.black.withOpacity(0.1),
              height: 1,
              indent: 12,
              endIndent: 12),
          Container(
            width: double.infinity,
            height: 90,
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: _buildItem(
                        K.profile_new_user_pay_points_today, data.todayPoints)),
                Expanded(
                    child: _buildItem(
                        K.profile_new_user_pay_points_curr, data.currPoints)),
                Expanded(
                    child: _buildItem(
                        K.profile_new_user_pay_points_sum, data.sumPoints)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(K.profile_new_user_pay_detail_text,
                style: const TextStyle(
                    color: Color(0x4D313131),
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            R.img('ic_arrow_right.svg',
                width: 15,
                height: 15,
                color: const Color(0x4D313131),
                package: ComponentManager.MANAGER_PROFILE),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, int num) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: TextStyle(color: R.color.secondTextColor, fontSize: 14)),
        const SizedBox(height: 10),
        Text(Util.numberToWString(num),
            style: const TextStyle(
                color: Color(0xFF202020),
                fontSize: 24,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildExchange() {
    return GestureDetector(
      onTap: _onTapExchange,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.profile_new_user_pay_points_exchange,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _onTapUserDetail() {
    Tracker.instance.track(TrackEvent.new_conversion_click,
        properties: {'page': 'conversion_detail'});
    NewUserPayGsUserDetail.show(context);
  }

  void _onTapPointsDetail() {
    Tracker.instance.track(TrackEvent.new_conversion_click,
        properties: {'page': 'integral_detail'});
    NewUserPayGsPointsDetail.show(context);
  }

  void _onTapExchange() {
    Tracker.instance.track(TrackEvent.new_conversion_click,
        properties: {'page': 'integral_conversion'});
    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    vipManager.show(context);
  }
}
