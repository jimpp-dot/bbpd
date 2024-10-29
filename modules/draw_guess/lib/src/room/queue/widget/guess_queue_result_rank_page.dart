import 'package:shared/assets.dart';
import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_beans.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;

/// 画猜接龙游戏结束排行榜
class GuessQueueResultRankPage extends StatefulWidget {
  final int rid;

  const GuessQueueResultRankPage({super.key, required this.rid});

  @override
  _GuessQueueResultRankPageState createState() =>
      _GuessQueueResultRankPageState();

  static Future<void> show(BuildContext context, int rid) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1.0,
      builder: (BuildContext context) {
        return GestureDetector(
          child: GuessQueueResultRankPage(rid: rid),
        );
      },
    );
  }
}

class _GuessQueueResultRankPageState extends State<GuessQueueResultRankPage> {
  GuessQueueResultRankRsp? _rsp;
  bool _alreadyPop = false;

  @override
  void initState() {
    super.initState();

    eventCenter.addListener(
        EventConstant.EventGuessQueueResultPageClose, _close);

    _load();

    Future.delayed(const Duration(seconds: 8), _pop);
  }

  void _pop() {
    if (mounted && Navigator.canPop(context) && _alreadyPop == false) {
      _alreadyPop = true;
      Navigator.of(context).pop();
    }
  }

  void _close(String type, dynamic value) => _pop();

  _load() async {
    // 测试rid 193190862
    _rsp = await GuessQueueRepo.getQueueResultRank(widget.rid);
    refresh();
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.EventGuessQueueResultPageClose, _close);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_rsp == null) {
      return const Center(child: CupertinoActivityIndicator());
    }

    if (_rsp!.success == false || (_rsp!.data?.list?.isEmpty ?? true)) {
      return EmptyWidget(
        onTap: _load,
        desc: _rsp?.msg ?? BaseK.K.no_data,
      );
    }

    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 24,
        top: 140 * Util.ratio,
        end: 24,
        bottom: 151 * Util.ratio + Util.iphoneXBottom,
      ),
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 21),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildList(),
          const SizedBox(height: 12),
          _buildBottomBtn(),
        ],
      ),
    );
  }

  _buildHeader() {
    return SizedBox(
      height: 32,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
            top: -46,
            child: R.img(Assets.draw_guess$guess_queue_success_header_bg_webp,
                width: 266, height: 92),
          ),
          PositionedDirectional(
            top: 8,
            end: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _pop,
              child: R.img(Assets.draw_guess$guess_queue_result_rank_close_webp,
                  width: 24, height: 24),
            ),
          ),
        ],
      ),
    );
  }

  _buildList() {
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildItem(_rsp!.data!.list![index], index),
          itemCount: _rsp!.data!.list!.length,
        ),
      ),
    );
  }

  _buildItem(GuessQueueResultRankData data, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (data.uid > 0) {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, data.uid);
        }
      },
      child: SizedBox(
        height: 68,
        child: Row(
          children: [
            _buildRankWidget(index),
            const SizedBox(width: 16),
            SizedBox(
              width: 44,
              height: 44,
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  CommonAvatar(
                    path: data.icon,
                    size: 44,
                    shape: BoxShape.circle,
                  ),
                  if (data.queueSucess) ...[
                    PositionedDirectional(
                      top: 26,
                      child: R.img(
                          Assets.draw_guess$guess_queue_success_item_bg_webp,
                          width: 57,
                          height: 20),
                    ),
                    PositionedDirectional(
                      top: 30,
                      child: Text(
                        K.guess_queue_result_success,
                        style: const TextStyle(
                            fontSize: 9,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 250),
                  child: Text(
                    data.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF242528),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 250),
                  child: Text(
                    K.guess_queue_result_like_num(['${data.likedNum}']),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xFF5955FA)),
                  ),
                ),
              ],
            ),
            const Spacer(),
            _buildFollowBtn(data),
          ],
        ),
      ),
    );
  }

  // type: 0 未关注 1 已关注
  _buildFollowBtn(GuessQueueResultRankData data) {
    bool follow = data.follow;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        NormalNull response;
        if (follow == false) {
          response = await BaseRequestManager.onFollow(data.uid.toString());
        } else {
          response = await BaseRequestManager.unFollow(data.uid.toString());
        }
        if (response.success) {
          _load();
        }
      },
      child: Container(
        width: 63,
        height: 32,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: follow == false
              ? const Color(0xFF737BFF)
              : const Color(0xFFF5F5F5),
        ),
        child: Text(
          follow == false
              ? K.guess_queue_result_follow
              : K.guess_queue_result_followed,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: follow == false ? Colors.white : const Color(0x66202020),
          ),
        ),
      ),
    );
  }

  _buildRankWidget(int rank) {
    if (rank < 3) {
      return R.img(BaseAssets.shared$ic_prize_cup_x_webp(rank + 1),
          width: 28, height: 28);
    }

    return Container(
      width: 28,
      height: 28,
      alignment: AlignmentDirectional.center,
      child: Text(
        rank > 98 ? '99+' : '${rank + 1}',
        style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF9B9B9B),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  _buildBottomBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (mounted && Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: (Util.width - 48) / 2.0,
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: const Color(0xFF737BFF),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(width: 3, color: const Color(0xFF343434)),
        ),
        child: Text(
          K.guess_queue_result_once_more,
          style: const TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
