import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:personaldata/k.dart';

import '../model/cp_small_house_repo.dart';
import '../model/invite_me_data_source.dart';
import '../model/pb/generated/slp_cp_house.pb.dart';
import '../widget/create_house_invite_item_widget.dart';

class CreateHouseInviteMePage extends StatefulWidget {
  final String refer;

  const CreateHouseInviteMePage(this.refer, {Key? key}) : super(key: key);

  @override
  State<CreateHouseInviteMePage> createState() =>
      CreateHouseInviteMePageState();
}

class CreateHouseInviteMePageState extends State<CreateHouseInviteMePage> {
  late InviteMeDataSource _source;

  @override
  void initState() {
    super.initState();
    _source = InviteMeDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 46,
            alignment: AlignmentDirectional.center,
            child: Text(
              K.personaldata_invite_me_desc,
              style: TextStyle(
                  color: R.color.unionRankText1.withOpacity(0.4), fontSize: 12),
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
                      (BuildContext context, HouseInviteItem item, int index) {
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

  Widget _buildItem(HouseInviteItem item, int index) {
    return CreateHouseInviteItemWidget(
      item.id,
      item.icon,
      item.name,
      item.vipLevel,
      K.accept,
      item.title,
      disabled: item.status == 1,
      inviteCallback: (int id) async {
        NormalNull resp = await CpSmallHouseRepo.postCpHouseAccept(id);
        if (resp.success) {
          _source.refresh();
          Fluttertoast.showCenter(msg: K.personaldata_accept_invite_succeed);
          Tracker.instance.track(TrackEvent.success_house_togethe_build,
              properties: {'uid': Session.uid, 'another_house_uid': item.uid});
          if (widget.refer == 'cp_house_detail') {
            Navigator.of(context).popUntil(ModalRoute.withName('/image'));
            eventCenter.emit(EventConstant.EventCpHouseDataChanged);
          }
        } else {
          Fluttertoast.showCenter(msg: resp.msg);
        }
      },
    );
  }
}
