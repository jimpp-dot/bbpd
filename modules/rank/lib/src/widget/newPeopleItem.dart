import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import '../../k.dart';

/// 新人榜
class NewPeopleItem extends StatelessWidget {
  final Map data;
  final int index;
  final BuildContext context;

  const NewPeopleItem(
      {super.key,
      required this.data,
      required this.index,
      required this.context});

  // 签名
  Widget _renderInfo() {
    if (data['sign'] == null || data['sign'].isEmpty) {
      return Container(
        margin: const EdgeInsets.only(bottom: 4),
      );
    }
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 3, bottom: 4),
        child: Text(
          data['sign'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 13.0),
        ),
      ),
    );
  }

  // 在线时间
  Widget _renderMisc(BuildContext context) {
    var onlineText = Util.parseInt(data['online_status']) > 0
        ? data['online_dateline_diff'] + ' ' + (data['city'] ?? '')
        : K.rank_online_now + (data['city'] ?? '');

    return Flexible(
      child: Text(
        onlineText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: R.color.thirdTextColor, fontSize: 10.0),
      ),
    );
  }

  // 排名序号
  Widget _renderIndex() {
    if (index <= 2) {
      return R.img(
        Assets.rank_rank_x_png(index + 1),
        width: 20.0,
        height: 22,
        package: ComponentManager.MANAGER_RANK,
      );
    } else {
      return NumText(
        "${index + 1}",
        textScaleFactor: 1.0,
        style: R.textStyle.subCaption.copyWith(fontSize: 12),
      );
    }
  }

  /// 上报服务端
  void _report(int uid) async {
    try {
      Xhr.getJson('${System.domain}mate/report/newbie/?vuid=$uid');
    } catch (e) {
      Log.d(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return showRankListByKey(userNewKey)
        ? InkWell(
            onTap: () {
              int targetId = Util.parseInt(data['uid']);

              IChatManager chatManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_CHAT);
              chatManager.openUserChatScreen(
                context,
                type: 'private',
                targetId: targetId,
                title: data['name'] ?? '',
              );

              _report(targetId);
            },
            child: SizedBox(
              height: 76.0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 35,
                    alignment: Alignment.center,
                    child: showRankByKey(userNewKey)
                        ? _renderIndex()
                        : const SizedBox(width: 12),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      SizedBox(
                        width: 56.0,
                        height: 56.0,
                        child: CommonAvatarWithFrame(
                          uid: Util.parseInt(data['uid']),
                          overflow: -3.0,
                          childWidget: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(28.0)),
                            child: CommonAvatar(
                              path: data['icon'] ?? '',
                              shape: BoxShape.circle,
                              size: 56,
                            ),
                          ),
                        ),
                      ),
                      if (data['frame_icon'] != null &&
                          '${data['frame_icon']}'.isNotEmpty &&
                          !UserImageCacheHelper.instance().showLocalFrame)
                        PositionedDirectional(
                          top: -5,
                          start: -5,
                          child: IgnorePointer(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${System.imageDomain}${data['frame_icon']}",
                              width: 66.0,
                              height: 66.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          _renderInfo(),
                          _renderMisc(context)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
