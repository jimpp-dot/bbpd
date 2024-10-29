import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/component/no_data.dart' as NoData;
import 'package:shared/k.dart' as BaseK;

import '../../k.dart';
import 'match_user_item_widget.dart';
import 'model/match_bean.dart';

class MatchUserListPage extends StatefulWidget {
  const MatchUserListPage({super.key});

  static Future show(
    BuildContext context,
  ) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MatchUserListPage(),
    ));
  }

  @override
  _MatchUserListPageState createState() => _MatchUserListPageState();
}

class _MatchUserListPageState extends State<MatchUserListPage> {
  late GlobalKey<PageLoadingListState> _pageLoadingKey;

  @override
  void initState() {
    super.initState();
    _pageLoadingKey = GlobalKey<PageLoadingListState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar.custom(
          title: Text(K.personal_match_list_title, style: R.textStyle.title),
          actions: [
            _buildListButton(),
          ],
        ),
        body: Column(
          children: [
            _buildList(),
          ],
        ));
  }

  _buildListButton() {
    return IconButton(
      padding: const EdgeInsetsDirectional.only(
        start: 16.0,
        end: 16.0,
        top: 10.0,
        bottom: 10.0,
      ),
      icon: R.img(
        'match/match_list_clear_button.webp',
        package: ComponentManager.MANAGER_PERSONALDATA,
        width: 24,
        height: 24,
        color: R.color.mainTextColor,
        fit: BoxFit.cover,
      ),
      onPressed: () => _onTapClear(),
    );
  }

  _onTapClear() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: K.personal_match_delete_all_message,
        );
      },
    );
    if (result != null && result) {
      BaseResponse response = await MatchRepository.clearMatchList();
      if (response.success == true && mounted) {
        setState(() {
          _pageLoadingKey.currentState?.refresh();
        });
      }
    }
  }

  _buildList() {
    return Expanded(
        child: PageLoadingList(
      key: _pageLoadingKey,
      scrollDirection: Axis.vertical,
      loadData: (page) => MatchRepository.getMatchUsers(page),
      onFirstPageData: (rsp) {
        if ((rsp.success)) {
          if (mounted) {
            setState(() {});
          }
        }
      },
      itemBuilder: (context, item, index) => MatchItemWidget(
        item: item,
        onTapCallBack: () {
          if (mounted) {
            setState(() {
              _pageLoadingKey.currentState?.refresh();
            });
          }
        },
      ),
      indicatorBuilder: _indicatorBuilder,
    ));
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return Container();
    } else if (status == IndicatorStatus.fullScreenError) {
      return Center(
        child: ErrorData(
          fontColor: R.color.thirdTextColor,
          error: _pageLoadingKey.currentState?.errorMsg(),
          onTap: () {
            _pageLoadingKey.currentState?.refresh();
          },
        ),
      );
    }
    if (status == IndicatorStatus.empty) {
      return Center(
        child: NoData.EmptyWidget(
          textColor: R.color.thirdTextColor,
          desc: BaseK.K.no_data,
          onTap: () {
            _pageLoadingKey.currentState?.refresh();
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
