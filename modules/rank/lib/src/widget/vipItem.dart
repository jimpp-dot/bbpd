import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

import '../../k.dart';
import '../rankManager.dart';

/// 贵族
class VipItem extends StatelessWidget {
  final Map data;
  final int index;

  const VipItem({super.key, required this.data, required this.index});

  // 签名
  Widget _renderInfo() {
    if (data['sign'] == null || data['sign'].isEmpty) {
      return const SizedBox(height: 6);
    }
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 3, bottom: 4),
        child: Text(
          data['sign'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Colors.black, fontSize: 13.0),
        ),
      ),
    );
  }

  // 在线时间
  Widget _renderMisc(BuildContext context) {
    var onlineText = Util.parseInt(data['online_status']) > 0
        ? (data['online_dateline_diff'] ?? '') + ' ' + (data['city'] ?? '')
        : K.rank_online_now + (data['city'] ?? '');

    return Flexible(
      child: Text(
        onlineText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontSize: 10.0),
      ),
    );
  }

  // 排名序号
  Widget _renderIndex() {
    if (index <= 2) {
      Log.d('index + 1:${index + 1}');
      return R.img(
        Assets.rank_rank_x_png(index + 1),
        width: 32,
        height: 32,
        package: ComponentManager.MANAGER_RANK,
      );
    } else {
      return NumText(
        "${index + 1}",
        textScaleFactor: 1.0,
        style: R.textStyle.subCaption.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RankManager.showImage(context, Util.parseInt(data['uid']), const PageRefer('RankVip'));
      },
      child: SizedBox(
        height: 76.0,
        child: Row(
          children: <Widget>[
            Container(
              width: 35,
              alignment: Alignment.center,
              child: showRankByKey(homeNobleKey) ? _renderIndex() : const SizedBox.shrink(),
            ),
            SizedBox(
              width: 56.0,
              height: 56.0,
              child: CommonAvatarWithFrame(
                uid: Util.parseInt(data['uid']),
                overflow: -3.0,
                childWidget: CommonAvatar(path: data['icon'] ?? '', shape: BoxShape.circle, size: 56),
                framePath: data['frame_icon'],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data['name'] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0, color: Colors.black, height: 1.1),
                  ),
                  _renderInfo(),
                  _renderMisc(context)
                ],
              ),
            ),
            NobilityCornerMarker(
              titleNew: Util.parseInt(data['title_new']),
              height: 48,
              padding: const EdgeInsetsDirectional.only(end: 16.0, bottom: 8.0),
            ),
          ],
        ),
      ),
    );
  }
}

/// 贵族榜底部自己的排名
class SelfVipItem extends StatelessWidget {
  final Map data;
  final bool showRuleFlag;

  const SelfVipItem(this.data, {Key? key, this.showRuleFlag = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      width: Util.width,
      height: 80 + Util.iphoneXBottom,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (R.img(
            Assets.rank_bg_vip_gui_bottom_bg,
            package: Assets.package,
            width: Util.width,
            height: 80 + Util.iphoneXBottom,
          ) as Image)
              .image,
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: <Widget>[
          showRankByKey(homeNobleKey) ? _renderIndex() : const Padding(padding: EdgeInsetsDirectional.only(start: 8)),
          CommonAvatar(
            path: data['icon'],
            size: 48,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: Util.width - 112 - 60 - 52 - 20),
                    child: Text(
                      data['name'] ?? '',
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  UserNobilityWidget(
                    titleNew: Session.titleNew,
                    padding: const EdgeInsetsDirectional.only(start: 1),
                  ),
                ],
              ),
              if (data['sign'] != null && data['sign'].toString().isNotEmpty)
                Container(
                  padding: const EdgeInsetsDirectional.only(top: 3),
                  constraints: BoxConstraints(maxWidth: Util.width - 112 - 52 - 20),
                  child: Text(
                    data['sign'],
                    maxLines: 1,
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
            ],
          ),
          const Spacer(),
          if (showRuleFlag)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: GestureDetector(
                onTap: _showRule,
                child: Text(
                  K.rank_rule_of_activity,
                  style: TextStyle(
                    fontSize: 13.0,
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // 排名序号
  Widget _renderIndex() {
    String index = data['rank'] ?? '';
    if (index == '1' || index == '2' || index == '3') {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 6.0, start: 8.0, bottom: 3.0),
        child: R.img(
          Assets.rank_rank_x_png(index),
          width: 20.0,
          height: 22,
          package: ComponentManager.MANAGER_RANK,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 8.0, start: 8.0),
        child: NumText(
          index,
          style: TextStyle(fontSize: index.length >= 3 ? 11 : 13, color: R.color.thirdTextColor),
        ),
      );
    }
  }

  _showRule() {
    showDialog(
      context: Constant.context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width * 0.7,
                ),
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, bottom: 6.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              K.rank_rule_of_activity,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: R.color.mainBrandColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0, top: 12.0),
                              child: Text(
                                K.rank_vip_rule_detail,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: R.color.mainTextColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    PositionedDirectional(
                      end: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          alignment: Alignment.center,
                          child: R.img(
                            Assets.rank_dialog_close_svg,
                            package: ComponentManager.MANAGER_RANK,
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
