import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';

import 'global_moment_item.dart';
import 'logic.dart';

class GlobalMomentListScreen extends StatefulWidget {
  const GlobalMomentListScreen({super.key});

  static Future openGlobalMomentScreen(BuildContext context, {Key? key}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GlobalMomentListScreen(key: key);
        },
        settings: const RouteSettings(name: '/global_moment_list'),
      ),
    );
  }

  @override
  _GlobalMomentListScreenState createState() => _GlobalMomentListScreenState();
}

class _GlobalMomentListScreenState extends State<GlobalMomentListScreen> {
  final GlobalMomentListLogic logic = Get.put(GlobalMomentListLogic());

  final PagingController<int, Moment> _pagingController = PagingController(
    firstPageKey: 0,
  );

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    eventCenter.addListener(EventRefreshBroadcastList, _onLocalRefresh);
  }

  @override
  void dispose() {
    Get.delete<GlobalMomentListLogic>();
    _pagingController.dispose();
    eventCenter.removeListener(EventRefreshBroadcastList, _onLocalRefresh);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.homeBgColor,
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar.custom(
          showShape: false,
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          title: Row(
            children: [
              Expanded(
                  child: Center(
                child: Text(K.moment_global_moment),
              )),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _sendGlobalMoment(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
                      K.moment_global_moment_send,
                      style: TextStyle(
                          color: R.color.mainBrandColor, fontSize: 16.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: RefreshIndicatorFactory.of(
          onRefresh: () => Future.sync(() => _fetchPage(1)),
          child: PagedListView<int, Moment>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Moment>(
                itemBuilder: (context, item, index) => _buildItem(item),
                noMoreItemsIndicatorBuilder: (_) => _buildNoMore(),
                firstPageErrorIndicatorBuilder: (_) => _buildNoItem(true),
                firstPageProgressIndicatorBuilder: (_) =>
                    _buildFullScreenBusy(),
                noItemsFoundIndicatorBuilder: (_) => _buildNoItem(false),
                newPageErrorIndicatorBuilder: (_) => _buildLoadMoreError(),
                newPageProgressIndicatorBuilder: (_) => _buildLoadMoreBusy(),
              )),
        ));
  }

  _buildItem(Moment moment) {
    return GlobalMomentItem(
      key: ValueKey(moment.topicId),
      moment: moment,
      page: MomentFlowPage.GlobalMoment,
      onMomentDelete: (int topicId) {
        List<Moment> newList = List.of(_pagingController.itemList ?? []);
        newList.removeWhere((element) => element.topicId == topicId);
        _pagingController.itemList = newList;
      },
    );
  }

  Widget _buildFullScreenBusy() {
    return const SizedBox(
      width: 300,
      height: 300,
      child: PreLoading(child: MomentLoadingWidget()),
    );
  }

  Widget _buildNoItem(bool hasError) {
    return ErrorData(
      error: hasError ? K.moment_net_error : K.moment_no_data,
      fontColor: R.colors.secondTextColor,
      onTap: () {
        _pagingController.refresh();
      },
    );
  }

  Widget _buildLoadMoreBusy() {
    return Container(
      height: 50.0,
      width: Util.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CupertinoActivityIndicator(animating: true),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              R.string('waitting_load'),
              style: TextStyle(
                color: R.color.secondTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoadMoreError() {
    return InkWell(
        onTap: () {
          _pagingController.retryLastFailedRequest();
        },
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              K.moment_net_error,
              style: TextStyle(
                color: R.color.secondTextColor,
              ),
            ),
          ),
        ));
  }

  Widget _buildNoMore() {
    return Container(
      height: 50.0,
      width: Util.width,
      alignment: Alignment.center,
      child: Text(
        R.string('not_any_more'),
        style: TextStyle(
          color: R.color.secondTextColor,
        ),
      ),
    );
  }

  /// Actions
  _fetchPage(int pageKey) async {
    try {
      DataRsp<RushMomentPage> response =
          await Api.getPlayList(pageKey, type: PageType.Broadcast);

      if (response.success == true && response.data != null) {
        RushMomentPage momentPage = response.data!;

        if (pageKey == 1) {
          _pagingController.value = PagingState(
            nextPageKey: momentPage.page + 1,
            error: null,
            itemList: momentPage.topics,
          );
        } else {
          if (momentPage.more > 0) {
            _pagingController.appendPage(
                momentPage.topics ?? [], momentPage.page + 1);
          } else {
            _pagingController.appendLastPage(momentPage.topics ?? []);
          }
        }
      } else {
        _pagingController.appendLastPage([]);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  _onLocalRefresh(String type, dynamic data) {
    if (data != null && data is Moment) {
      Moment item = data;
      if (item.tagType == TagType.broadcast) {
        List<Moment> newList = List.of(_pagingController.itemList ?? []);
        newList.insert(0, item);
        _pagingController.itemList = newList;
      }
      setState(() {});
    }
  }

  _sendGlobalMoment(BuildContext context) async {
    DataRsp<Map> rsp = await Api.getHasBroadcastCardOrNot();
    if (!(rsp.success == true)) {
      Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
    }

    bool hasTicket = rsp.data?["has_broadcast_ticket"] == 1;
    int minZhuanRecharge =
        Util.parseInt(rsp.data?["send_broadcast_ticket_diamond"], 25800);
    if (!hasTicket) {
      showDialog(
          context: Constant.context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: K.moment_get_hanhua_card,
              contentBuilder: (_) => _buildDialogDesc(minZhuanRecharge),
              negativeButton: NegativeButton(
                text: K.moment_cancel,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              positiveButton: PositiveButton(
                  text: K.moment_recharge_now,
                  onPressed: () {
                    Navigator.of(context).pop();
                    ISettingManager settingManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_SETTINGS);
                    settingManager.openBalanceScreen(context);
                  }),
            );
          });

      return;
    }

    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentPublishScreen(context,
        from: 'globalMoment', showGroupSelect: false);
  }

  _buildDialogDesc(int num) {
    String desp = K.moment_get_hanhua_card_desc
        .replaceFirst('0', Util.parseStr(num) ?? '');

    return RichText(
      text: TextSpan(
          style: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: desp.split('#').first,
            ),
            WidgetSpan(
              child: Image.asset(
                R.imagePath(
                  "ic_zuan.webp",
                  package: ComponentManager.MANAGER_MOMENT,
                ),
                width: 15,
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(
              text: desp.split('#').last,
            ),
          ]),
    );
  }
}
