import 'package:shared/shared.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

import '../vip_seat/vip_seat_api.dart';
import 'cp_seat_widget.dart';

/// cp 麦位排行
class CPSeatRankPanel extends StatefulWidget {
  final int rid;

  const CPSeatRankPanel(this.rid, {Key? key}) : super(key: key);

  @override
  State<CPSeatRankPanel> createState() => _CPSeatRankPanelState();

  static Future show(BuildContext context, int rid) {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      settings: const RouteSettings(name: '/CPSeatRankPanel'),
      disableTapDismissible: true,
      maxHeightRatio: 0.8,
      builder: (BuildContext context) {
        return CPSeatRankPanel(rid);
      },
    );
  }
}

class _CPSeatRankPanelState extends State<CPSeatRankPanel> {
  static double expandedHeight = 230;
  VipMicCPInfoData? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    ApiVipMicCPInfoResponse rsp = await VipSeatRepo.getCpSeat(widget.rid);
    if (rsp.success) {
      _data = rsp.data;
    } else {
      _data = null;
    }
    if (mounted) {
      setState(() {});
    }
  }

  _onHelpTaped() {
    BaseWebviewScreen.show(context, url: Util.parseHelpUrl(107));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: showRankListByKey(roomCpDayKey)
          ? Column(
              children: [
                _buildTitle(),
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          pinned: false,
                          snap: false,
                          elevation: 0.0,
                          automaticallyImplyLeading: false,
                          primary: false,
                          floating: true,
                          expandedHeight: expandedHeight,
                          backgroundColor: Colors.transparent,
                          flexibleSpace: FlexibleSpaceBar(
                            background: SizedBox(
                              width: Util.width,
                              height: expandedHeight,
                              child: _buildBestCp(),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: _buildListTitle(),
                        )
                      ];
                    },
                    body: _buildList(),
                  ),
                ),
              ],
            )
          : _buildEmpty(),
    );
  }

  Widget _buildEmpty() {
    return const EmptyWidget();
  }

  Widget _buildList() {
    if (_data == null || !showRankListByKey(roomCpDayKey))
      return const SizedBox.shrink();
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 10),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _data!.todayLst.length,
      itemBuilder: (context, index) {
        return CpRankItem(index, _data!.todayLst[index]);
      },
    );
  }

  Widget _buildTitle() {
    return Container(
      width: Util.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [Color(0xFFFF4F93), Color(0xFFFD49B0)],
        ),
      ),
      height: 52,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            '最佳CP',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          PositionedDirectional(
            end: 0,
            child: GestureDetector(
              onTap: () => _onHelpTaped(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: R.img(
                  'ic_help.svg',
                  color: Colors.white.withOpacity(0.6),
                  width: 24,
                  height: 24,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBestCp() {
    return Container(
        height: expandedHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              R.imagePath('cp_seat/bg_decro.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ),
          ),
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Color(0xFFFD49B0), Color(0xFFF73DE9)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 7),
            CpSeatWidget(
              icon1: _data?.yesterday.user1.icon,
              icon2: _data?.yesterday.user2.icon,
              uid1: _data?.yesterday.user1.uid ?? 0,
              uid2: _data?.yesterday.user2.uid ?? 0,
            ),
            _buildUserName(),
            if (_data != null)
              NumText(
                "${_data?.yesterday.value ?? 0}",
                style: const TextStyle(
                    color: Color(0xFFFFEE71),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            const Spacer(),
            _buildBottomTips(),
          ],
        ));
  }

  Widget _buildListTitle() {
    return Column(
      children: [
        const SizedBox(height: 17),
        R.img('cp_seat/cp_rank_title.webp',
            height: 34,
            fit: BoxFit.fitHeight,
            package: ComponentManager.MANAGER_BASE_ROOM),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildUserName() {
    if (_data != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LimitedBox(
            maxWidth: 135,
            child: Text(
              _data?.yesterday.user1.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.1),
            ),
          ),
          const Text(
            ' & ',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.1),
          ),
          LimitedBox(
            maxWidth: 135,
            child: Text(
              _data?.yesterday.user2.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.1),
            ),
          ),
        ],
      );
    } else {
      return const Text(
        '虚位以待',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      );
    }
  }

  Widget _buildBottomTips() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            R.imagePath('cp_seat/bg_cp_rank_bottom.webp',
                package: ComponentManager.MANAGER_BASE_ROOM),
          ),
        ),
      ),
      alignment: AlignmentDirectional.center,
      height: 78,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img('cp_seat/ic_crown.svg',
                  width: 7,
                  height: 5,
                  package: ComponentManager.MANAGER_BASE_ROOM),
              const SizedBox(width: 4),
              const Text(
                '昨日最佳CP',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 4),
              R.img('cp_seat/ic_crown.svg',
                  width: 7,
                  height: 5,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ],
          ),
          const SizedBox(height: 4),
          EasyRichText(
            '昨日CP值最高的用户可于今日登上最佳CP专座，\n彼此每赠送100钻或1张应援票，CP值+1',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.fade,
            defaultStyle: const TextStyle(fontSize: 11, color: Colors.white),
            patternList: [
              EasyRichTextPattern(
                targetString: '\\d*',
                style: const TextStyle(fontSize: 11, color: Color(0xFFFFEE71)),
              ),
              EasyRichTextPattern(
                targetString: '\\+',
                style: const TextStyle(fontSize: 11, color: Color(0xFFFFEE71)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CpRankItem extends StatelessWidget {
  final VipMicCPInfo data;
  final int index;

  const CpRankItem(this.index, this.data, {Key? key}) : super(key: key);

  _onUserTaped(BuildContext context, int uid) {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, uid,
        refer: const PageRefer('CpRank'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Container(
            width: 32,
            alignment: Alignment.center,
            child: _buildRankWidget(index + 1),
          ),
          _buildAvatar(context),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfo(),
                Text(
                  data.user2.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: R.color.mainTextColor, fontSize: 17, height: 1.1),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildRankWidget(int rank) {
    if (!showRankByKey(roomCpDayKey)) {
      return const SizedBox.shrink();
    }
    if (rank < 4) {
      return R.img('ic_prize_cup_$rank.webp',
          width: 20, height: 20, package: ComponentManager.MANAGER_BASE_CORE);
    }

    return Text(
      rank > 99 ? '99+' : '$rank',
      style: TextStyle(fontSize: 15, color: R.color.thirdTextColor),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return SizedBox(
      width: 84,
      child: Stack(
        children: [
          PositionedDirectional(
            start: 36,
            child: GestureDetector(
              onTap: () => _onUserTaped(context, data.user2.uid),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1)),
                child: CommonAvatar(
                  path: data.user2.icon,
                  size: 48,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onUserTaped(context, data.user1.uid),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1)),
              child: CommonAvatar(
                path: data.user1.icon,
                size: 48,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      children: [
        UserNobilityWidget(
          titleNew: data.user1.title,
          padding: const EdgeInsetsDirectional.only(end: 2),
        ),
        UserVipWidget(
          vip: data.user1.vip,
          padding: const EdgeInsetsDirectional.only(end: 2),
        ),
        Expanded(
          child: Text(
            data.user1.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: R.color.mainTextColor, fontSize: 17, height: 1.1),
          ),
        ),
        const SizedBox(width: 6),
        if (showRankScoreByKey(roomCpDayKey))
          NumText(
            '${data.value}',
            maxLines: 1,
            style: const TextStyle(
                color: Color(0xFFFF5F7D),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}
