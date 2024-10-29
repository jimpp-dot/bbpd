import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

class RankInfo {
  final int uid;
  final String icon;
  final String name;
  final int score; // 分数
  final int thumbs; // 被点赞次数
  bool followed = false; // 关注状态

  RankInfo.fromJson(Map<String, dynamic> data)
      : uid = Util.parseInt(data['origin']),
        icon = data['icon'],
        name = data['name'],
        score = Util.parseInt(data['score']),
        thumbs = Util.parseInt(data['thumbs_up']);
}

/// 全场游戏结束后，展示排行榜
class RankDialog extends StatefulWidget {
  final List<RankInfo> ranks;

  const RankDialog({super.key, required this.ranks});

  @override
  _RankDialogState createState() => _RankDialogState();
}

class _RankDialogState extends State<RankDialog> {
  @override
  void initState() {
    super.initState();
    _queryFollowStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 查询关注状态
  _queryFollowStatus() async {
    XhrResponse response = await Xhr.postJson(
      "${System.domain}go/yy/friend/isFollow",
      {'uids': widget.ranks.map((rank) => rank.uid).join(',')},
      throwOnError: false,
      formatJson: true,
    );
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        List<Map> results = List<Map>.from(res['data']);
        for (var rankInfo in widget.ranks) {
          Map item = results
              .firstWhere((item) => Util.parseInt(item['uid']) == rankInfo.uid);
          rankInfo.followed = item.containsKey('follow') && item['follow'] == 1;
        }

        refresh();
      } else {
        if (res['msg'] != null) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } else {
      Fluttertoast.showToast(
          msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  /// 关注
  _onFollow(RankInfo rankInfo) async {
    NormalNull response =
        await BaseRequestManager.onFollow(rankInfo.uid.toString());
    if (response.success) {
      rankInfo.followed = true;
      refresh();
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  /// 贡献题目
  _onContribute() async {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openContributeWordScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              border: Border.all(color: const Color(0xFFFFE3CC), width: 4),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _buildRows(),
            ),
          ),
          R.img(
            RoomAssets.chat_room$guess_rank_title_png,
            width: 251,
            height: 75,
            fit: BoxFit.contain,
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: _buildContribution(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRows() {
    List<Widget> rows = [];
    for (int i = 0; i < widget.ranks.length; i++) {
      RankInfo rankInfo = widget.ranks[i];
      rows.add(
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildRanking(i),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: Util.getUserSmallIcon(rankInfo.icon),
                    fit: BoxFit.cover,
                    width: 44,
                    height: 44,
                  ),
                ),
              ),
              _buildDetail(rankInfo),
              _buildFollow(rankInfo),
            ],
          ),
        ),
      );
    }

    return rows;
  }

  Widget _buildRanking(int i) {
    return Container(
      width: 21,
      alignment: Alignment.center,
      child: i < 3
          ? R.img(
              RoomAssets.chat_room$guess_rank_x_svg(i + 1),
              width: 21,
              height: 17,
              fit: BoxFit.contain,
            )
          : NumText(
              '${i + 1}',
              style: const TextStyle(
                color: Color(0xFF9B9B9B),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

  Widget _buildDetail(RankInfo rankInfo) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              rankInfo.name,
              style: const TextStyle(color: Color(0xFF242528), fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                R.string('room_guess_score', args: [rankInfo.score.toString()]),
                style: const TextStyle(fontSize: 12, color: Color(0xFF9B9B9B)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  R.string('room_guess_thumbs',
                      args: [rankInfo.thumbs.toString()]),
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xFF9B9B9B)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFollow(RankInfo rankInfo) {
    if (rankInfo.uid == Session.uid) {
      return const SizedBox(width: 56);
    }
    if (rankInfo.followed == true) {
      return Material(
        color: Colors.white,
        child: Ink(
          width: 56,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFFFAB1D),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: Text(
                R.string('followed'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.white,
        child: Ink(
          width: 56,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFFFAB1D), width: 2),
          ),
          child: InkWell(
            onTap: () => _onFollow(rankInfo),
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: Text(
                R.string('follow'),
                style: const TextStyle(
                  color: Color(0xFFFFAB1D),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildContribution() {
    return Container(
      height: 24,
      decoration: const BoxDecoration(
        color: Color(0xFFFFE3CC),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(4),
          bottomEnd: Radius.circular(4),
        ),
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: _onContribute,
        child: Text(
          K.room_want_to_contribute,
          style: const TextStyle(color: Color(0xFFAE703C), fontSize: 13),
        ),
      ),
    );
  }
}
