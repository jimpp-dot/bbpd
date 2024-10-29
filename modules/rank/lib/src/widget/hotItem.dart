import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/assets.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import '../rankManager.dart';

/// 红人
class HotItem extends StatelessWidget {
  final Map data;
  final int index;

  const HotItem({super.key, required this.data, required this.index});

  Widget _renderInfo(BuildContext context) {
    Log.d(data);

    if (data['sign'] == null || data['sign'].isEmpty) {
      return Container(
        margin: const EdgeInsets.only(bottom: 5),
      );
    }
    return Container(
      margin: const EdgeInsets.only(top: 2.5, bottom: 4),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 160.0),
      child: Text(
        data['sign'],
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _renderMisc(BuildContext context) {
    var onlineText = Util.parseInt(data['online_status']) > 0
        ? data['online_dateline_diff'] + ' ' + (data['city'] ?? '')
        : K.rank_online_now + (data['city'] ?? '');

    return Flexible(
      child: Text(onlineText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: R.textStyle.subCaption),
    );
  }

  Widget _renderIndex() {
    if (index <= 2) {
      return R.img(
        Assets.rank_rank_x_png(index + 1),
        width: 20.0,
        height: 22,
        package: ComponentManager.MANAGER_RANK,
      );
    } else {
      return Container(
        padding: EdgeInsets.only(left: index >= 99 ? 2.0 : 4.0),
        width: index >= 99 ? 29.0 : 27.0,
        child: NumText(
          "${index + 1}",
          textScaleFactor: 1.0,
          style: R.textStyle.subCaption.copyWith(fontSize: 12),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RankManager.showImage(context, data['uid'], const PageRefer('RankHot'));
      },
      child: SizedBox(
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsetsDirectional.only(
                  end: index <= 2 ? 6.0 : 0.0, start: 8.0, bottom: 3.0),
              alignment: Alignment.center,
              child: showRankByKey(homeHotKey)
                  ? _renderIndex()
                  : const SizedBox.shrink(),
            ),
            ClipOval(
              child: data['icon'].toString().isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: "${System.imageDomain}${data['icon']}",
                      errorWidgetType: ErrorWidgetType.defaultUserIcon,
                      suffix: '!head150',
                      width: 56.0,
                      height: 56.0,
                    )
                  : R.img(
                      BaseAssets.shared$ic_user_none_png,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      width: 56.0,
                      height: 56.0,
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 2.0),
                              child: Text(
                                data['name'] ?? '',
                                maxLines: 1,
                                textScaleFactor: 1.0,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          _buildTitle(),
                        ],
                      ),
                    ),
                    _renderInfo(context),
                    _renderMisc(context)
                  ],
                ),
              ),
            ),
            if (showRankScoreByKey(homeHotKey))
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.only(end: 16.0),
                child: Row(
                  children: <Widget>[
                    NumText(
                      data['score'].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xFFFF5353), fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: R.img(
                        BaseAssets.ic_fire_svg,
                        package: ComponentManager.MANAGER_BASE_CORE,
                        width: 18.0,
                        height: 18,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    String popularImage;
    switch (data['popular_type']) {
      case 'defend':
        bool level = Util.parseInt(data['level']) == 1;
        popularImage = level ? Assets.slp_cp_png : Assets.slp_sweet_png;
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 1.0),
          child: R.img(popularImage,
              height: 18, package: ComponentManager.MANAGER_RANK),
        );
      case 'title':
        int titleNew = Util.parseInt(data['title_new']);
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 1.0),
          child: UserNobilityWidget(titleNew: titleNew),
        );
      default:
        return Container();
    }
  }
}
