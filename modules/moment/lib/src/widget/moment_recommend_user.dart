import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/model/moment_recommend.dart';

import '../../k.dart';

/// 动态推荐用户列表
class MomentRecommendUser extends StatefulWidget {
  final List<RecommendUser>? recommendUsers;

  const MomentRecommendUser({super.key, this.recommendUsers});

  @override
  _MomentRecommendUserState createState() => _MomentRecommendUserState();
}

class _MomentRecommendUserState extends State<MomentRecommendUser> {
  @override
  Widget build(BuildContext context) {
    if (widget.recommendUsers == null || widget.recommendUsers!.isEmpty) {
      return Container();
    }

    return Container(
      color: R.color.secondBgColor,
      padding: const EdgeInsets.only(bottom: 16, top: 16),
      width: Util.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 12),
            child: Text(
              K.moment_recommend_user,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 13),
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 8),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.recommendUsers!.length,
              scrollDirection: Axis.horizontal,
              addAutomaticKeepAlives: false,
              controller: ScrollController(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RecommendItem(
                  recommendUser: widget.recommendUsers![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendItem extends StatefulWidget {
  final RecommendUser? recommendUser;

  const RecommendItem({super.key, this.recommendUser});

  @override
  _RecommendItemState createState() => _RecommendItemState();
}

class _RecommendItemState extends State<RecommendItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.recommendUser == null) {
      return Container();
    }

    return Container(
      width: 100,
      margin: const EdgeInsetsDirectional.only(end: 8),
      decoration: BoxDecoration(
          color: R.color.mainBgColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: RoundNetIcon(
              url: widget.recommendUser!.userIcon,
              size: 48,
              onTap: () => _gotoImageScreen(context),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.recommendUser!.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 13),
            ),
          ),
          Text(
            widget.recommendUser!.desc ?? '',
            style: TextStyle(color: R.color.secondTextColor, fontSize: 11),
          ),
          Expanded(
            child: Container(),
          ),
          widget.recommendUser!.follow
              ? Container(
                  width: 48,
                  height: 24,
                  margin: const EdgeInsets.only(top: 0, bottom: 8),
                  decoration: BoxDecoration(
                    color: R.color.secondBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: R.img(
                    'ic_check.svg',
                    width: 16,
                    height: 16,
                    color: R.color.thirdTextColor,
                    package: ComponentManager.MANAGER_MOMENT,
                  ),
                )
              : GestureDetector(
                  onTap: _onFollow,
                  child: Container(
                    width: 48,
                    height: 24,
                    margin: const EdgeInsets.only(top: 0, bottom: 8),
                    decoration: BoxDecoration(
                      color: R.color.mainBrandColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _onFollow() async {
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    NormalNull response = await BaseRequestManager.onFollow(
        widget.recommendUser?.uid.toString() ?? '');
    if (response.success) {
      widget.recommendUser?.follow = true;
      if (mounted) {
        setState(() {});
      }
    } else {
      Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
    }
  }

  _gotoImageScreen(BuildContext context) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, widget.recommendUser?.uid ?? 0,
        refer: const PageRefer('MomentRecommendUser'));
  }
}
