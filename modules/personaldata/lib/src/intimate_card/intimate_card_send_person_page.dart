import 'package:personaldata/k.dart';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/api/intimate_card_api.dart';
import 'package:personaldata/src/intimate_card/intimate_card_bind_page.dart';

class IntimateCardSendPersonPage extends StatefulWidget {
  final IntimateCardRelationInfo relationInfo;
  final VoidCallback? finishBindCard;
  const IntimateCardSendPersonPage(
      {super.key, required this.relationInfo, this.finishBindCard});

  @override
  State<IntimateCardSendPersonPage> createState() =>
      _IntimateCardSendPersonPageState();

  static Future show(
      BuildContext context, IntimateCardRelationInfo relationInfo,
      {VoidCallback? finishBindCard}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: '/IntimateCardSendPersonPage'),
            builder: (_) => IntimateCardSendPersonPage(
                relationInfo: relationInfo, finishBindCard: finishBindCard)));
  }
}

class _IntimateCardSendPersonPageState
    extends State<IntimateCardSendPersonPage> {
  bool _isLoading = false;

  ///是否是其他类型
  bool _isOther = false;

  ResCardRelationUserList? _cardRelationUserList;

  @override
  void initState() {
    super.initState();
    _isOther = widget.relationInfo.id == 0;
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: BaseAppBar(
        K.choose_relation_user_list([widget.relationInfo.name]),
        titleColor: Colors.black.withOpacity(0.9),
        backColor: Colors.black.withOpacity(0.9),
      ),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: Loading(),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _cardRelationUserList?.msg,
        fontColor: Colors.white,
        onTap: () {
          _requestData();
        },
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return _loadingWidget();
    }

    if (!(_cardRelationUserList?.success ?? false)) {
      return _errorWidget();
    }

    if ((_cardRelationUserList?.data.length ?? 0) == 0) {
      return _emptyWidget();
    }

    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      itemCount: _cardRelationUserList?.data.length ?? 0,
      itemExtent: 82,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(_cardRelationUserList!.data[index]);
      },
    );
  }

  Widget _buildItem(IntimateCardRelationUserInfo relationUserInfo) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 18.dp, bottom: 18.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonAvatar(
            path: relationUserInfo.icon,
            size: 44.dp,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  relationUserInfo.name,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                    fontSize: 16.dp,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    if (_isOther) ...[
                      Text(
                        relationUserInfo.relationName,
                        style: TextStyle(
                          color: Util.parseColor(relationUserInfo.fontColor,
                              Colors.black.withOpacity(0.9)),
                          fontSize: 11.dp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                    Expanded(
                      child: Text(
                        K.personal_defend_core +
                            relationUserInfo.defendValue.toString(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontSize: 11.dp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              IntimateCardBindPage.launch(context,
                  toUserParam: relationUserInfo,
                  message: widget.relationInfo.desc,
                  finishBindCard: widget.finishBindCard);
            },
            child: Container(
              width: 63.dp,
              height: 28.dp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8FA),
                  borderRadius: BorderRadius.circular(16.dp),
                  gradient: const LinearGradient(
                      colors: [Color(0xffDD7AE6), Color(0xff8C35FF)])),
              child: Text(
                K.choose_ta,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.dp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.no_relation_user([(_cardRelationUserList?.name ?? '')]),
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 14.dp,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () async {
              if (_isLoading) return;
              _isLoading = true;
              ResIntimateCardAuctionRoom auctionRoom =
                  await IntimateCardApi.getIntimateCardAuctionRoom();
              _isLoading = false;
              if (auctionRoom.success && auctionRoom.rid > 0) {
                IRoomManager roomManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                roomManager.openChatRoomScreenShow(
                    Constant.context, auctionRoom.rid,
                    refer: 'intimacy_card');
              } else {
                Fluttertoast.showCenter(msg: auctionRoom.msg);
              }
            },
            child: Container(
              width: 110.dp,
              height: 48.dp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8FA),
                  borderRadius: BorderRadius.circular(24.dp),
                  gradient: const LinearGradient(
                      colors: [Color(0xffDD7AE6), Color(0xff8C35FF)])),
              child: Text(
                K.to_invite,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.dp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 88,
          ),
        ],
      ),
    );
  }

  Future<void> _requestData() async {
    if (_isLoading) return;
    _isLoading = true;
    _cardRelationUserList =
        await IntimateCardApi.getIntimacyCardRelationUserList(
            widget.relationInfo.id);
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}
