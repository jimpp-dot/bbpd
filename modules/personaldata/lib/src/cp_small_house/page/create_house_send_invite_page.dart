import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:personaldata/k.dart';

import '../model/cp_small_house_repo.dart';
import '../model/pb/generated/slp_cp_house_friend.pb.dart';
import '../model/send_invite_data_source.dart';
import '../widget/create_house_invite_item_widget.dart';

class CreateHouseSendInvitePage extends StatefulWidget {
  const CreateHouseSendInvitePage({Key? key}) : super(key: key);

  @override
  State<CreateHouseSendInvitePage> createState() =>
      CreateHouseSendInvitePageState();
}

class CreateHouseSendInvitePageState extends State<CreateHouseSendInvitePage> {
  late SendInviteDataSource _source;

  @override
  void initState() {
    super.initState();
    _source = SendInviteDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.personaldata_invite_me_desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: R.color.unionRankText1.withOpacity(0.4), fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: RefreshIndicatorFactory.of(
              onRefresh: () async {
                _source.refresh();
              },
              child: LoadingMoreList(
                ListConfig(
                  itemBuilder:
                      (BuildContext context, FriendUser item, int index) {
                    return _buildItem(item, index);
                  },
                  sourceList: _source,
                  indicatorBuilder: _indicatorBuilder,
                  lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(FriendUser item, int index) {
    return CreateHouseInviteItemWidget(
      Util.parseInt(item.uid),
      item.icon,
      item.name,
      item.vipLevel,
      K.personaldata_send_invite,
      item.titleNew,
      inviteCallback: (int id) async {
        NormalNull resp = await CpSmallHouseRepo.postCpHouseInvite(id);
        if (resp.success) {
          Fluttertoast.showCenter(msg: K.personaldata_send_invite_succeed);
          _sendInviteMessage(id);
          _source.refresh();
          Tracker.instance
              .track(TrackEvent.send_house_together_build, properties: {
            'uid': Session.uid,
          });
        } else {
          Fluttertoast.showCenter(msg: resp.msg);
        }
      },
    );
  }

  /// 发送邀请消息
  void _sendInviteMessage(int targetUid) {
    MessageContent content = MessageContent(MessageType.Text,
        SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = K.personaldata_invite_create_cp_house;
    Map extra = {'type': 'cp.house.invite'};
    content.extra = json.encode(extra);
    Im.sendMessage(ConversationType.Private, targetUid.toString(), content);
  }
}
