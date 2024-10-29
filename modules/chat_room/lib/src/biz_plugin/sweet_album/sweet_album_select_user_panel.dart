import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/model/sweet_album_user_source.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

///甜蜜相册选择其他陪伴面板
class SweetAlbumSelectUserPanel extends StatefulWidget {
  final int currUid;
  final int rid;

  const SweetAlbumSelectUserPanel(
      {super.key, required this.currUid, required this.rid});

  static Future<int?> show(BuildContext context, int currUid, int rid) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 1.0,
      builder: (context) {
        return SweetAlbumSelectUserPanel(currUid: currUid, rid: rid);
      },
    );
  }

  @override
  State<SweetAlbumSelectUserPanel> createState() =>
      _SweetAlbumSelectUserPanelState();
}

class _SweetAlbumSelectUserPanelState extends State<SweetAlbumSelectUserPanel> {
  late SweetAlbumUserSource _source;

  @override
  initState() {
    super.initState();
    _source = SweetAlbumUserSource(widget.rid);
  }

  @override
  Widget build(BuildContext context) {
    double height = Util.isIphoneX ? 604.dp : 604.dp - 20;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(21.dp), topEnd: Radius.circular(21.dp)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildTitleBar(),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildTitleBar() {
    return BaseAppBar.custom(
      title: Text(K.room_view_all_companion,
          style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.w600)),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _source.refresh();
      },
      child: LoadingMoreList(
        ListConfig<SweetImprintUser>(
            shrinkWrap: true,
            sourceList: _source,
            padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
            indicatorBuilder: _indicatorBuilder,
            itemBuilder: (context, item, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 16.dp, end: 16.dp, top: 5.dp, bottom: 25.dp),
                child: _buildItem(item, index),
              );
            }),
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
      return const SizedBox();
    } else if (status == IndicatorStatus.error) {
      return const SizedBox();
    } else if (status == IndicatorStatus.empty) {
      return const EmptyWidget();
    } else if (status == IndicatorStatus.none) {
      return const SizedBox();
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(SweetImprintUser item, int index) {
    bool select = widget.currUid == item.uid;
    return Row(
      children: [
        CommonAvatar(path: item.icon, size: 44.dp, shape: BoxShape.circle),
        SizedBox(width: 9.dp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 4.dp),
                  UserSexAndAgeWidget(sex: item.sex, age: item.age),
                ],
              ),
              SizedBox(height: 3.dp),
              Text(
                K.room_curr_companion_level_x(['${item.currentLevel}']),
                style: TextStyle(
                    color: Colors.black.withOpacity(0.9), fontSize: 11),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.dp),
        select
            ? Text(K.room_has_selected,
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)))
            : GestureDetector(
                onTap: () {
                  Navigator.pop(context, item.uid);
                },
                child: Container(
                  width: 63.dp,
                  height: 28.dp,
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF7D2EE6),
                        Color(0xFFFF6BB3),
                        Color(0xFFFFC4CF)
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      stops: [0, 0.76, 1],
                    ),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(K.room_select_ta,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
              ),
      ],
    );
  }
}
