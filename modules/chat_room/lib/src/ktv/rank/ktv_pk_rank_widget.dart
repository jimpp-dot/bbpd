import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/rank/ktv_rank_desk.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/ktv/utils/time_util.dart';
import 'package:chat_room/src/protobuf/generated/common_rank_pk.pb.dart';
import 'package:flutter/material.dart';

class KtvPkRankWidget extends StatefulWidget {
  final ChatRoomData room;

  const KtvPkRankWidget({Key? key, required this.room}) : super(key: key);

  @override
  State<KtvPkRankWidget> createState() => _KtvPkRankWidgetState();

  static show(BuildContext context, ChatRoomData room) {
    return displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      maxHeightRatio: 0.7,
      builder: (BuildContext context) {
        return KtvPkRankWidget(room: room);
      },
    );
  }
}

class _KtvPkRankWidgetState extends BaseScreenState<KtvPkRankWidget> {
  GlobalKey rank2DeskKey = GlobalKey();

  double _rank2DeskHeight = 0.0;

  ResKtvPkRank? _resData;

  List<KtvPkRankData> _listData = [];

  @override
  void initState() {
    super.initState();
    _loadData();

    WidgetsBinding.instance.addPostFrameCallback((duration) {
      if (!mounted || rank2DeskKey.currentContext == null) return;
      RenderBox deskBox =
          rank2DeskKey.currentContext!.findRenderObject() as RenderBox;
      double deskHeight = deskBox.size.height;
      if (deskHeight > 0) {
        _rank2DeskHeight = deskHeight;
        refresh();
      }
    });
  }

  void _loadData() async {
    ResKtvPkRank resp = await KtvRepo.getPkRankData(widget.room.rid);

    if (resp.success) {
      if (!Util.isCollectionEmpty(resp.data)) {
        _resData = resp;
        if (resp.data.length < 4) {
          _listData = resp.data;
        } else {
          _listData = resp.data.sublist(3);
        }
        setScreenReady();
      } else {
        setScreenEmpty();
      }
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget buildContent() {
    return _buildListView();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              image: _showTopThreeUsers
                  ? DecorationImage(
                      image: AssetImage(R.imagePath('ktv/ktv_pk_rank_bg.webp',
                          package: ComponentManager.MANAGER_BASE_ROOM)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitleBar(),
                if (isScreenReady() && _showTopThreeUsers) _buildTopUsersRow(),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  color: R.color.mainBgColor, child: buildStatusContent()))
        ],
      ),
    );
  }

  bool get _showTopThreeUsers => ((_resData?.data.length ?? 0) > 3);

  Widget _buildTitleBar() {
    return Container(
      height: 57.dp,
      width: Util.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        color: _showTopThreeUsers ? Colors.transparent : R.color.mainBgColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            K.room_pk_rank,
            style: TextStyle(
                color:
                    _showTopThreeUsers ? Colors.white : R.color.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          PositionedDirectional(end: 4, child: _buildHelpWidget())
        ],
      ),
    );
  }

  Widget _buildHelpWidget() {
    return InkWell(
      onTap: () {
        String url = Util.getHelpUrlWithQStr('k79');
        BaseWebviewScreen.show(context, url: url);
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
        alignment: Alignment.center,
        child: R.img(
          'titlebar/ic_titlebar_question.svg',
          color: _showTopThreeUsers
              ? Colors.white.withOpacity(0.7)
              : R.color.mainTextColor,
          package: ComponentManager.MANAGER_BASE_CORE,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildRankTopUser(int rank) {
    KtvPkRankData data = _resData!.data[rank - 1];

    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72.0 : 64.0;
    double start = rank == 1 ? -18.5 : -20.0;
    double angle = rank == 1 ? -0.20 : -0.20;
    double desk1Height = 0;
    if (rank == 1 && _rank2DeskHeight > 0) {
      desk1Height = _rank2DeskHeight * 1.16;
    }

    BorderRadiusGeometry? borderRadius;

    if (rank == 1) {
      borderRadius =
          const BorderRadiusDirectional.vertical(top: Radius.circular(12));
    } else if (rank == 2) {
      borderRadius =
          const BorderRadiusDirectional.only(topStart: Radius.circular(12));
    } else if (rank == 3) {
      borderRadius =
          const BorderRadiusDirectional.only(topEnd: Radius.circular(12));
    }

    return Flexible(
      flex: rank == 1 ? 132 : 106,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GradientBorder(
                borderGradient: LinearGradient(colors: borderColor),
                borderWidth: 2,
                borderRadius: (avatarSize + 4) / 2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CommonAvatar(
                        path: data.icon,
                        size: avatarSize,
                        shape: BoxShape.circle,
                        onTap: () => _openUserProfile(data.uid),
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                start: start,
                top: start,
                child: Transform.rotate(
                  angle: angle,
                  child: R.img('ktv/ktv_rank_$rank.png',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      width: 52,
                      height: 49),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          _buildDesk2(rank, desk1Height, borderRadius, data),
        ],
      ),
    );
  }

  Widget _buildDesk2(int rank, double desk1Height,
      BorderRadiusGeometry? borderRadius, KtvPkRankData data) {
    return KtvRankDeskWidget(
      rank: rank,
      desk1Height: desk1Height,
      borderRadius: borderRadius,
      data: data,
      scoreWidget: _getScoreWidget(data.score, Colors.white),
      onLayout: _onLayout,
      onTapSupport: () => _openGiftPanel(data.uid),
    );
  }

  void _onLayout(double? height) {
    if (height != null && height > 0) {
      _rank2DeskHeight = height;
      refresh();
    }
  }

  List<Color> topThreeBorderColor(int rank) {
    if (rank == 1) {
      return [const Color(0xFFFAD961), const Color(0xFFF7B01C)];
    } else if (rank == 2) {
      return [
        const Color(0xFFE6E6E6),
        const Color(0xFFCDD5E8),
        const Color(0xFFD8D8D8)
      ];
    } else if (rank == 3) {
      return [const Color(0xFFFFE9D6), const Color(0xFFFFAB81)];
    }
    return [const Color(0xFFFFE9D6), const Color(0xFFFFAB81)];
  }

  Widget _buildTopUsersRow() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRankTopUser(2),
          _buildRankTopUser(1),
          _buildRankTopUser(3),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: _buildListItem,
          padding: EdgeInsetsDirectional.only(
              bottom: Util.iphoneXBottom + 62, top: 8),
          itemCount: _listData.length,
          itemExtent: 72,
        ),
        PositionedDirectional(bottom: 0, child: _buildSelfInfo()),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    KtvPkRankData itemData = _listData[index];

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        children: [
          Text(
            '${itemData.rank}',
            style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
          ),
          const SizedBox(width: 14),
          CommonAvatar(
            path: itemData.icon,
            size: 52,
            shape: BoxShape.circle,
            onTap: () => _openUserProfile(itemData.uid),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        itemData.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 16),
                      ),
                    ),
                    ..._getUserTags(itemData)
                  ],
                ),
                const SizedBox(height: 1),
                _getScoreWidget(itemData.score, R.color.thirdBrightColor)
              ],
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => _openGiftPanel(itemData.uid),
            child: Container(
              width: 64,
              height: 28,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              child: Center(
                child: Text(
                  K.room_talent_support,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getUserTags(KtvPkRankData itemData) {
    double padding = 4.0;

    List<Widget> tagList = [];

    //Log.d(LOG_TAG, "${_userItem.toString()}");

    //人气等级
    if (itemData.popularLevel > 0) {
      tagList.add(Padding(
        padding: EdgeInsetsDirectional.only(start: padding),
        child: UserPopularity(popularityLevel: itemData.popularLevel),
      ));
    }

    // 爵位
    if (!NobilityUtil.titleIsInvalid(itemData.title)) {
      tagList.add(Padding(
        padding: EdgeInsetsDirectional.only(start: padding),
        child: UserNobilityWidget(titleNew: itemData.title),
      ));
    }
    return tagList;
  }

  Widget _buildSelfInfo() {
    KtvPkRankData? itemData =
        _resData?.data.firstWhereOrNull((item) => item.uid == Session.uid);
    int rank = itemData?.rank ?? 0;
    bool notRank = false;
    if (rank <= 0 || rank > (_resData?.data.length ?? 0)) {
      notRank = true;
    }

    return Container(
      height: 76 + Util.iphoneXBottom,
      width: Util.width,
      padding: EdgeInsetsDirectional.only(
          start: 16, end: 16, bottom: Util.iphoneXBottom),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 4.0),
            blurRadius: 8.0,
            spreadRadius: 2.0,
            color: R.color.mainTextColor.withOpacity(0.3),
          )
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        color: R.color.mainBgColor,
      ),
      child: Row(
        children: [
          Text(
            notRank ? '-' : '$rank',
            style: TextStyle(
                color: R.color.secondTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 14),
          CommonAvatar(
            path: Session.icon,
            size: 52,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              Session.name,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          _getScoreWidget(_resData?.myScore ?? 0, R.color.thirdBrightColor),
        ],
      ),
    );
  }

  Widget _getScoreWidget(int score, Color color) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: KtvTimeUtil.getMusicNum(score),
            style: TextStyle(
                color: color, fontSize: 12, fontFamily: Util.fontFamily),
          ),
          const WidgetSpan(child: SizedBox(width: 4)),
          TextSpan(
            text: K.room_ktv_star_value,
            style: TextStyle(
                color: color,
                fontSize: 12,
                fontFamily: Util.fontFamily,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  void _openGiftPanel(int uid) {
    if (uid == Session.uid) {
      Fluttertoast.showToast(
          msg: K.room_can_not_support_self, gravity: ToastGravity.CENTER);
      return;
    }
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showRoomGiftPanel(context, room: widget.room, uid: uid);
  }

  void _openUserProfile(int uid) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, uid,
        refer: const PageRefer('ktv_pk_rank'));
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }
}
