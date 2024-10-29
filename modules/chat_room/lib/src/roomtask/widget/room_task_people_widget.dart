import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomtask/model/room_task_light_rank.dart';

class RoomTaskPeopleWidget extends StatefulWidget {
  const RoomTaskPeopleWidget(this.uid, this.rid, {super.key});

  final int uid;
  final int rid;

  @override
  _RoomTaskPeopleWidgetState createState() => _RoomTaskPeopleWidgetState();
}

class _RoomTaskPeopleWidgetState extends State<RoomTaskPeopleWidget> {
  late RoomRankListRepo _repository;
  String? _errorMessage;

  bool get showSelfInfo =>
      _repository.selfInfo != null && _repository.selfInfo!.complete == false;

  @override
  void initState() {
    super.initState();
    _repository = RoomRankListRepo(
        package: Constant.packageName, rid: widget.rid, uid: Session.uid);
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {}

  _onGoLight() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BaseAppBar.custom(
            showBack: true,
            onBackPressedCallback: () {
              Navigator.of(context).pop(context);
            },
            title: Text(K.room_task_rank_list),
            backgroundColor: Colors.transparent,
          ),
          _buildRankList(),
          if (showSelfInfo)
            _buildFooter(
                icon: _repository.selfInfo!.icon,
                name: _repository.selfInfo!.name,
                btnText: K.room_go_light_task),
        ],
      ),
    );
  }

  Widget _buildRankList() {
    return SizedBox(
      height: showSelfInfo ? 342 : 418,
      child: LoadingMoreList(
        ListConfig<RoomLightUpUser>(
          cacheExtent: 0,
          itemBuilder: _itemBuilder,
          physics: const AlwaysScrollableScrollPhysics(),
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
          extendedListDelegate: ExtendedListDelegate(
            viewportBuilder: _handleExposureReport,
          ),
          //isLastOne: false
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, RoomLightUpUser user, int index) {
    return InkWell(
      onTap: () {
        // _onTap(friend);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 14, height: 72),
          index >= 0 && index <= 2
              ? R.img(
                  'ic_task_light_rank_${index + 1}.svg',
                  width: 20,
                  height: 23,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                )
              : Container(
                  width: 20,
                  height: 23,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    index.toString(),
                    style:
                        TextStyle(color: R.color.thirdTextColor, fontSize: 13),
                  ),
                ),
          const SizedBox(
            width: 8,
          ),
          _renderImage(context, user),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            user.name,
            style: const TextStyle(fontSize: 16),
          )),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: K.room_task_continu_light,
                ),
                TextSpan(
                  text: ' ${user.continuousDay.toString()} ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFDA252),
                    fontFamily: Util.fontFamily,
                  ),
                ),
                TextSpan(
                  text: K.room_day,
                )
              ],
            ),
            style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(
            width: 12,
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
      // return LoadingFooter(hasMore: false);
      return Container(
        height: 0,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMessage, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return _buildEmpty();
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildEmpty() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Util.height / 3),
      child: Text(
        base.K.no_result,
        style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
      ),
    );
  }

  Widget _buildFooter(
      {required String icon, required String name, required String btnText}) {
    if (name.isNotEmpty && btnText.isNotEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 16, bottom: 11, top: 13),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(12),
            topEnd: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF202020).withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
                width: 7,
                child: Divider(
                  color: const Color(0xFF202020).withOpacity(0.4),
                  height: 16,
                )),
            const SizedBox(
              width: 15,
            ),
            _renderImage(context, _repository.selfInfo!),
            const SizedBox(
              width: 8,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                color: R.color.mainTextColor,
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: _onGoLight,
              child: Container(
                width: 63,
                height: 28,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: R.color.mainBrandGradientColors,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                ),
                alignment: Alignment.center,
                child: Text(
                  btnText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _renderImage(BuildContext context, RoomLightUpUser item) {
    return CommonAvatar(
      path: item.icon,
      size: 52,
      shape: BoxShape.circle,
    );
  }
}
