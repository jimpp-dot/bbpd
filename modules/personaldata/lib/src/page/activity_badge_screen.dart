import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/api.dart';

/// 运营活动称号列表
class ActivityBadgeScreen extends StatefulWidget {
  final int uid;

  const ActivityBadgeScreen({Key? key, this.uid = 0}) : super(key: key);

  static Future show(BuildContext context, int uid) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ActivityBadgeScreen(
          uid: uid,
        ),
        settings: const RouteSettings(name: '/ActivityBadgeScreen'),
      ),
    );
  }

  @override
  _ActivityBadgeScreenState createState() => _ActivityBadgeScreenState();
}

class _ActivityBadgeScreenState extends State<ActivityBadgeScreen> {
  HomeProfileBadgesResp? _rsp;

  @override
  void initState() {
    super.initState();

    _load();
  }

  _load() async {
    _rsp = await Api.getActivityBadge(widget.uid);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.activity_title_list,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontFamily: Util.fontFamily),
        ),
        actions: <Widget>[
          IconButton(
              icon: R.img(
                'ic_title_info.webp',
                package: ComponentManager.MANAGER_PERSONALDATA,
                width: 24,
                height: 24,
              ),
              onPressed: _titleInfo),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        child: _buildBody(),
      ),
    );
  }

  _titleInfo() {
    BaseWebviewScreen.show(context, url: Util.getHelpUrlWithQStr('k74'));
  }

  _buildBody() {
    if (_rsp == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if (_rsp != null && (_rsp!.success == false || _rsp!.badges.isEmpty)) {
      return EmptyWidget(
        onTap: () {
          _load();
        },
        desc: _rsp!.msg,
      );
    }

    return ListView.builder(
        itemExtent: 72.0,
        itemCount: _rsp?.badges.length,
        itemBuilder: _itemBuilder);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    HomeProfileBadgeItem? item = _rsp?.badges[index];

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 71,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(
                      (item?.hasIcon() ?? false) ? item!.icon : ''),
                  height: 26,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Text(
                    (item?.hasDesc() ?? false) ? (item?.desc ?? '') : '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xFF313131)),
                  ),
                ),
                if (widget.uid == Session.uid) ...[
                  const SizedBox(
                    width: 30,
                  ),
                  _buildWearBtn(item),
                ],
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: const Color(0X1A313131),
          ),
        ],
      ),
    );
  }

  Widget _buildWearBtn(HomeProfileBadgeItem? item) {
    bool hasWear = (item?.hasIsWear() ?? false) ? item!.isWear : false;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (hasWear) return;

        HomeProfileWearBadgeResp rsp =
            await Api.wearActivityBadge(item?.badgeId ?? 0);
        if (rsp.success == true) {
          await _load();
        } else if (rsp.success == false) {
          Fluttertoast.showCenter(msg: rsp.msg);
        }
      },
      child: Container(
        width: 63,
        height: 28,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          gradient: LinearGradient(
            colors: hasWear
                ? [const Color(0xFFD5D8E0), const Color(0xFFE4E7EE)]
                : R.color.mainBrandGradientColors,
          ),
        ),
        child: Text(
          hasWear ? K.activity_title_wearing : K.activity_title_wear,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
