import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:group/src/model/group_setting_beans.dart';
import 'package:group/src/repo/group_repo.dart';
import 'package:group/src/util/group_reporter.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../k.dart';

/// 群申请列表(for 群主)
class GroupApplyListScreen extends StatefulWidget {
  final int? groupId;

  static Future openGroupApplyListScreen(BuildContext context, int? groupId) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GroupApplyListScreen(groupId: groupId),
    ));
  }

  const GroupApplyListScreen({Key? key, this.groupId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GroupApplyListScreenState();
  }
}

class _GroupApplyListScreenState extends State<GroupApplyListScreen> {
  GlobalKey<PageLoadingListState>? _listKey;

  bool _showAllAgree = false;

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey<PageLoadingListState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.group_apply,
          style: R.textStyle.title,
        ),
        actions: [
          if (_showAllAgree)
            GestureDetector(
              onTap: _onAllAgree,
              child: Container(
                height: kToolbarHeight,
                margin: const EdgeInsetsDirectional.only(end: 20),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.group_apply_all_agree,
                  style: TextStyle(
                    fontSize: 14,
                    color: R.color.mainBrandColor,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Future<GroupApplyListResp> _loadData(int page) async {
    GroupApplyListResp resp =
        await GroupRepo.getGroupApplyList(widget.groupId, page);
    if (resp.success == true &&
        !Util.isCollectionEmpty(resp.items) &&
        _showAllAgree == false) {
      _showAllAgree = true;
      setState(() {});
    }
    return resp;
  }

  Widget _buildBody() {
    return PageLoadingList<GroupApplyItem>(
      key: _listKey!,
      loadData: (page) => _loadData(page),
      onFirstPageData: (_) {
        if (mounted) {
          setState(() {});
        }
      },
      indicatorBuilder: (context, status) {
        if (status == IndicatorStatus.noMoreLoad)
          return const LoadingFooter(hasMore: false);
        return null;
      },
      itemBuilder: (context, item, index) {
        return _buildApplyItem(item);
      },
    );
  }

  Widget _buildApplyItem(GroupApplyItem item) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                CommonAvatar(
                  path: item.icon,
                  size: 52,
                  shape: BoxShape.circle,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          item.name,
                          style: TextStyle(
                              color: R.color.secondTextColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Text(
                          Utility.getDateDiff(item.updateTime),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: R.color.thirdTextColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      K.group_apply_join,
                      style:
                          TextStyle(color: R.color.mainTextColor, fontSize: 16),
                    ),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const SizedBox(
                width: 60,
              ),
              GestureDetector(
                onTap: () {
                  _handleApply(item, true);
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 18, end: 18, top: 8, bottom: 8),
                  alignment: AlignmentDirectional.center,
                  decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                      )),
                  child: Text(
                    K.group_apply_agree,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  _handleApply(item, false);
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 18, end: 18, top: 6, bottom: 6),
                  alignment: AlignmentDirectional.center,
                  decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      gradient: LinearGradient(
                        colors: R.color.darkGradientColors,
                      )),
                  child: Text(
                    K.group_apply_refuse,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 60),
            color: R.color.dividerColor,
            height: 0.5,
          )
        ],
      ),
    );
  }

  void _handleApply(GroupApplyItem item, bool agree) async {
    bool result = await GroupRepo.handleApply(widget.groupId, [item.id], agree);
    GroupReporter.dealWithGroupApply(agree);
    if (result && mounted) {
      _listKey?.currentState?.refresh(true);
      eventCenter.emit(IGroupManager.EVENT_REFRESH_GROUP_INFO);
    }
  }

  void _onAllAgree() async {
    List<GroupApplyItem> listData =
        _listKey?.currentState?.data as List<GroupApplyItem>;
    if (!Util.isCollectionEmpty(listData)) {
      List<int> ids = [];
      for (var item in listData) {
        ids.add(item.id);
      }

      bool result = await GroupRepo.handleApply(widget.groupId, ids, true);
      if (result && mounted) {
        _listKey?.currentState?.refresh(true);
        eventCenter.emit(IGroupManager.EVENT_REFRESH_GROUP_INFO);
      }
    }
  }
}
