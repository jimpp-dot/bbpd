import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:search/assets.dart';
import 'package:search/slp_src/slp_search_work_widget.dart';
import 'package:search/k.dart';
import 'package:search/src/model/pb/generated/pretty_user.pb.dart';

import 'slp_search_person_info_widget.dart';

typedef TapCallback = void Function(int rid);
typedef ItemTapCallback = void Function(JointSearchItem item);

final Map _fleetNames = {
  'none': K.search_join,
  'verify': K.search_verify,
  'reject': K.search_reject,
  'normal': K.search_joined,
  'delete': K.search_join,
  'quite': K.search_join,
  'black': K.search_blacklist,
};

/// 搜索结果item
class SlpSearchResultItem extends StatelessWidget {
  final JointSearchItem item;
  final ItemTapCallback? onTapItem;
  final ItemTapCallback? onFollow;
  final TapCallback? onGoRoom;
  final int rid;
  final Map<String, dynamic>? boxStatus;
  final PrettyInfo? prettyInfo;
  final Function(JointSearchItem, int)? onJoinSingerClub;

  const SlpSearchResultItem(
    this.item,
    this.onTapItem,
    this.onFollow,
    this.onGoRoom,
    this.rid, {
    super.key,
    this.boxStatus,
    this.prettyInfo,
    this.onJoinSingerClub,
  });

  // 关注按钮
  Widget _buildFollowButton(BuildContext context) {
    if (item.type == JointSearchItemType.ItemTypeUser) {
      bool followed = false;
      Log.d(item);

      if (item.user.follow != JointSearchFollowType.FollowTypeNotFollow) {
        followed = true;
      }

      return InkWell(
        onTap: () {
          if (rid > 0) {
            onGoRoom?.call(rid);
          } else {
            onTapItem?.call(item);
          }
        },
        child: rid > 0
            ? Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: R.colors.mainBrandGradientColors),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(K.search_bad_room,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 3.0),
                      child: R.img(
                        BaseAssets.shared$living_small_webp,
                        width: 16.0,
                        height: 16.0,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: followed
                          ? R.colors.darkGradientColors
                          : R.colors.mainBrandGradientColors),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    if (!followed) onFollow?.call(item);
                  },
                  child: Text(
                    followed ? K.search_followed : K.search_follow,
                    style: followed
                        ? const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)
                        : const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                  ),
                ),
              ),
      );
    } else if (item.type == JointSearchItemType.ItemTypeFleet) {
      String state = item.fleet.hasState() ? item.fleet.state : '';
      String text = _fleetNames[state] ?? '';

      if (text.isNotEmpty) {
        bool followed = (state == 'normal' || state == 'verify');
        return InkWell(
          onTap: () => onTapItem?.call(item),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: followed
                      ? R.colors.darkGradientColors
                      : R.colors.mainBrandGradientColors),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: followed
                  ? const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
            ),
          ),
        );
      }
    } else if (item.type == JointSearchItemType.ItemTypeRoom) {
      return InkWell(
          onTap: () => onGoRoom?.call(Util.parseInt(item.id)),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: R.colors.mainBrandGradientColors),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(K.search_bad_room,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: R.img(
                    BaseAssets.shared$living_small_webp,
                    width: 16.0,
                    height: 16.0,
                  ),
                )
              ],
            ),
          ));
    } else if (item.type == JointSearchItemType.ItemTypeUnion) {
      return InkWell(
        onTap: () => onTapItem?.call(item),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          alignment: Alignment.center,
          child: Text(
            K.search_look,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      );
    } else if (item.type == JointSearchItemType.ItemTypeGroup) {
      bool joined = Util.parseBool(item.group.isInGroup);
      return InkWell(
          onTap: () => _clickGroup(context, Util.parseInt(item.id), joined),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: R.colors.mainBrandGradientColors),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(joined ? K.search_go_chat : K.search_join,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ));
    } else if (item.type == JointSearchItemType.ItemTypeBag) {
      return InkWell(
        onTap: () {
          if (!(boxStatus?['${item.id}'] ?? false)) {
            onTapItem?.call(item);
          }
        },
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: boxStatus?['${item.id}'] == true
                  ? R.colors.darkGradientColors
                  : R.colors.mainBrandGradientColors,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          alignment: Alignment.center,
          child: Text(
            boxStatus?['${item.id}'] == true
                ? K.search_giftbox_has_get
                : K.search_giftbox_get,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      );
    } else if (item.type == JointSearchItemType.ItemTypeMusic) {
      return InkWell(
        onTap: () => onTapItem?.call(item),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: R.colors.mainBrandColor,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          alignment: Alignment.center,
          child: Text(
            K.search_isong_sing,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  void _clickGroup(BuildContext context, int groupId, bool joined) {
    if (joined) {
      IChatManager chatManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(context, targetId: groupId, type: 'group');
    } else {
      IGroupManager groupManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);
      groupManager.openUserApplyScreen(context, groupId);
    }
  }

  Widget _renderInfo(BuildContext context, JointSearchItem item) {
    String numText = item.hasId() ? item.id.toString() : '';

    if (item.type == JointSearchItemType.ItemTypeUser) {
      if (item.user.hasPrettyId()) {
        numText = item.user.prettyId;
      } else {
        numText = Utility.uidToString('${item.id}');
      }
    } else if (item.type == JointSearchItemType.ItemTypeRoom) {
      //服务端的proto更新为pretty_id没有同步客户端 wtf
      if (item.room.hasPrettyId()) {
        numText = item.room.prettyId;
      } else {
        numText = '${item.id}';
      }
    } else if (item.type == JointSearchItemType.ItemTypeFleet) {
      if (item.fleet.hasPrefix()) {
        numText = item.fleet.prefix;
      } else {
        numText = '${item.id}';
      }
    } else if (item.type == JointSearchItemType.ItemTypeBag) {
      if (item.bag.hasBagPretty()) {
        numText = item.bag.bagPretty;
      }
    } else if (item.type == JointSearchItemType.ItemTypeMusic) {
      numText = '';

      if (item.music.hasArtistNames()) {
        numText = item.music.artistNames;
      }

      if (item.music.hasDuration()) {
        numText += ' ${Util.formatTimeToMinute(item.music.duration)}';
      }
    }

    return Container(
      constraints: const BoxConstraints(maxWidth: 200.0),
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 3),
            child: (item.type == JointSearchItemType.ItemTypeBag)
                ? Text(
                    K.search_giftbox_word,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: R.colors.thirdTextColor),
                  )
                : R.img(BaseAssets.shared$ic_id_webp,
                    height: 16, fit: BoxFit.fitHeight),
          ),
          NumText(
            numText,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: R.colors.thirdTextColor),
          )
        ],
      ),
    );
  }

  Widget _buildAvatar(JointSearchItem item) {
    if (item.type == JointSearchItemType.ItemTypeMusic) {
      return CommonAvatar(
        path: item.hasIcon() ? item.icon : '',
        shape: BoxShape.rectangle,
        size: 56,
        borderRadius: BorderRadius.circular(12),
      );
    }

    return CommonAvatar(
      size: 52,
      shape: BoxShape.circle,
      path: item.hasIcon() ? item.icon : '',
      onlyFirstFrame: item.type == JointSearchItemType.ItemTypeRoom,
    );
  }

  /// 音乐作品
  Widget _buildWork(JointSearchItem item) {
    return SlpSearchWorkWidget(
      width: 140,
      height: 215,
      workIcon: item.work.videoCover,
      workName: item.work.workTitle,
      userIcon: item.work.userIcon,
      userName: item.work.userName,
      likeNum: item.work.likeNum,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (prettyInfo != null && item.type == JointSearchItemType.ItemTypeUser) {
      // 带扩展信息的靓号用户
      return SlpSearchPersonInfoWidget(
        data: prettyInfo!,
        item: item,
        onFollow: onFollow,
      );
    }

    return InkWell(
      onTap: () => onTapItem?.call(item),
      child: item.type == JointSearchItemType.ItemTypeWork
          ? _buildWork(item)
          : Rext.themeCardContainer(
              cornerRadius: 16,
              margin: const EdgeInsetsDirectional.only(
                start: 16,
                end: 16,
                bottom: 10,
              ),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildAvatar(item),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 8, top: 13.5, bottom: 13.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              if (item.type ==
                                      JointSearchItemType.ItemTypeGroup &&
                                  Util.parseBool(item.group.isOfficial))
                                const GroupOfficialTag(),
                              Flexible(
                                child: Text(
                                  item.hasName() ? item.name : '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: (item.type ==
                                          JointSearchItemType.ItemTypeBag)
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: const Color(0xFFFDA252))
                                      : Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: R.colors.mainTextColor),
                                ),
                              ),
                              if (item.type ==
                                      JointSearchItemType.ItemTypeUser &&
                                  Util.parseBool(item.user.isHot))
                                Container(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 4, end: 4),
                                  child: R.img(
                                    Assets.search$hot_person_png,
                                    width: 35,
                                    height: 14,
                                  ),
                                ),
                            ],
                          ),
                          _renderInfo(context, item)
                        ],
                      ),
                    ),
                  ),
                  _buildFollowButton(context)
                ],
              ),
            ),
    );
  }
}
