// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';
import 'package:flutter/material.dart';

/// 才艺品鉴榜单
///
class TalentRankTastingList extends StatefulWidget {
  const TalentRankTastingList({Key? key}) : super(key: key);

  @override
  State<TalentRankTastingList> createState() => _TalentRankTastingListState();

  static Future show(BuildContext context) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.transparent,
      disableTapDismissible: true,
      builder: (context) {
        return const TalentRankTastingList();
      },
    );
  }
}

class _TalentRankTastingListState extends State<TalentRankTastingList> {
  final IPersonalDataManager _manager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);
  ResBroadcasterContentRank? res;

  BroadcasterContentRankData? get data {
    if (res != null && res!.success) {
      return res!.data;
    }
    return null;
  }

  List<CommonRankMember>? get ranks {
    return data?.thisWeekMembers;
  }

  bool get isRankAvailable {
    return Util.validList(ranks);
  }

  bool get isRankTopAvailable {
    return Util.validList(data?.lastWeekTopN);
  }

  bool get isMeAvailable {
    return Util.parseInt(data?.me.rank) > 0;
  }

  void _loadData() async {
    try {
      String url = '${System.domain}go/yy/rank/broadcasterContent';
      XhrResponse response =
          await Xhr.post(url, null, pb: true, throwOnError: true);
      res = ResBroadcasterContentRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      res = ResBroadcasterContentRank(msg: e.toString(), success: false);
    }
    refresh();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF470D85)),
        height: Util.height * 0.75,
        alignment: AlignmentDirectional.topCenter,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                height: Util.width,
                imageUrl: Util.getRemoteImgUrl(
                    'static/room/room_talent_rank_tasting_bg.webp'),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 52,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Spacer(),
                        R.img(
                          'talent_rank_tasting_title.webp',
                          width: 120,
                          height: 24,
                          package: ComponentManager.MANAGER_BASE_ROOM,
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                BaseWebviewScreen.show(context,
                                    url: Util.getHelpUrlWithQStr('k145'));
                              },
                              child: Icon(
                                Icons.help_outline,
                                color: Colors.grey.withOpacity(0.4),
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: res != null && !res!.success
                      ? ErrorData(
                          error: res!.msg,
                          onTap: () => _loadData(),
                          fontColor: Colors.white,
                        )
                      : NestedScrollView(
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return [
                              SliverPadding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 10),
                                sliver: SliverToBoxAdapter(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 156,
                                        decoration: BoxDecoration(
                                          color: const Color(0x33573BFF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              height: 24,
                                              child: _partTitle('上周当红品鉴师'),
                                            ),
                                            if (isRankTopAvailable) ...[
                                              const SizedBox(height: 10),
                                              Expanded(
                                                child: ListView.separated(
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return _topItem(data!
                                                        .lastWeekTopN[index]);
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    double w =
                                                        ((Util.width - 32) -
                                                                66 * 5) /
                                                            4;
                                                    return SizedBox(
                                                        width: max(w, 0));
                                                  },
                                                  itemCount: min(
                                                      data!.lastWeekTopN.length,
                                                      5),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                ),
                                              ),
                                            ] else
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    K.room_et_rank_calculating,
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      IgnorePointer(
                                        child: GradientBorder(
                                          borderGradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFAA85FF),
                                              Color(0xFFAA85FF),
                                              Color(0xFFAA85FF),
                                            ],
                                            begin:
                                                AlignmentDirectional.topStart,
                                            end: AlignmentDirectional.bottomEnd,
                                          ),
                                          borderRadius: 8,
                                          borderWidth:
                                              1 / Util.devicePixelRatio,
                                          child: const SizedBox(height: 156),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ];
                          },
                          body: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0x33573BFF),
                                  borderRadius: BorderRadius.circular(8)),
                              child: GradientBorder(
                                borderGradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFAA85FF),
                                    Color(0xFFAA85FF),
                                    Color(0xFFAA85FF),
                                  ],
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd,
                                ),
                                borderRadius: 8,
                                borderWidth: 1 / Util.devicePixelRatio,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, bottom: 10),
                                      child: _partTitle('本周品鉴师'),
                                    ),
                                    Expanded(
                                      child: isRankAvailable
                                          ? ListView.builder(
                                              itemExtent: 56,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              itemCount: ranks!.length + 1,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                if (index >= ranks!.length) {
                                                  return const SizedBox
                                                      .shrink();
                                                }

                                                CommonRankMember item =
                                                    ranks![index];
                                                return _buildRankItem(
                                                    item, false);
                                              },
                                            )
                                          : Center(
                                              child: Text(
                                                K.room_et_rank_calculating,
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontSize: 12),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(height: 40)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF6543E6),
                    borderRadius: BorderRadius.circular(12)),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:
                        _buildRankItem(isMeAvailable ? data!.me : null, true),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankItem(CommonRankMember? item, bool isMe) {
    if (item == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 30,
              alignment: Alignment.center,
              child: const Text(
                '—',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            const SizedBox(width: 12),
            CommonAvatar(
              onTap: () {
                _manager.openImageScreen(context, Session.uid);
              },
              path: Session.icon,
              shape: BoxShape.circle,
              size: 40,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                Session.name,
                maxLines: 1,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }

    String rank = item.rank.toString();
    if (isMe && item.rank > 100) {
      rank = '100+';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 30,
            alignment: Alignment.center,
            child: item.rank <= 3
                ? R.img(
                    'common_rank_${item.rank}.webp',
                    width: 30,
                    height: 27,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  )
                : Text(
                    rank,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
          ),
          const SizedBox(width: 12),
          CommonAvatar(
            onTap: () {
              _manager.openImageScreen(context, item.uid);
            },
            path: item.icon,
            shape: BoxShape.circle,
            size: 40,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item.name,
              maxLines: 1,
              style: const TextStyle(color: Colors.white, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Text(item.score.toString(),
              style: const TextStyle(
                  color: Color(0xFFFFE5A3),
                  fontSize: 15,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _partTitle(String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 17,
              child: R.img('talent_rank_tasting_title_bg_side.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  fit: BoxFit.fitWidth),
            ),
            const SizedBox(width: 5),
            Column(
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xFF73DAFD),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 4,
                  child: R.img('talent_rank_tasting_title_bg_bottom.webp',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      fit: BoxFit.fill),
                )
              ],
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 17,
              child: R.img('talent_rank_tasting_title_bg_side.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  fit: BoxFit.fitWidth),
            ),
          ],
        ),
      ],
    );
  }

  Widget _topItem(CommonRankMember user) {
    if (user.rank > 5) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: 66,
      height: 97,
      child: Column(
        children: [
          SizedBox(
            height: 57,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CommonAvatar(
                    onTap: () {
                      _manager.openImageScreen(context, user.uid);
                    },
                    path: user.icon,
                    shape: BoxShape.circle,
                    size: 46,
                  ),
                ),
                PositionedDirectional(
                  top: 41,
                  start: 15,
                  end: 15,
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color([
                            0xFFFF7F02,
                            0xFFFF5E8D,
                            0xFF7252FD,
                            0xFFCD61FF,
                            0xFF74A7FD
                          ][user.rank - 1]),
                          Color([
                            0xFFFFC505,
                            0xFFFF9962,
                            0xFFAD56FF,
                            0xFFA741FF,
                            0xFF4158FF
                          ][user.rank - 1])
                        ],
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'NO.${user.rank}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            user.name,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            user.score.toString(),
            maxLines: 1,
            style: const TextStyle(color: Color(0xB3FFFFFF), fontSize: 11),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
