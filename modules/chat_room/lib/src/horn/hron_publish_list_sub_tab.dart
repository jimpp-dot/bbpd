import 'package:shared/shared.dart';
import 'package:chat_room/src/horn/widget/confirm_dialog_normal.dart';
import 'package:chat_room/src/horn/widget/confirm_dialog_with_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

import '../../chat_room.dart';
import '../../k.dart';
import '../protobuf/generated/horn.pb.dart';
import 'api/api.dart';
import 'global_horn_repo.dart';

class HornPublishListSubTab extends StatefulWidget {
  final int index;

  const HornPublishListSubTab({super.key, required this.index});

  @override
  State<HornPublishListSubTab> createState() => _HornPublishListSubTabState();
}

class _HornPublishListSubTabState extends State<HornPublishListSubTab>
    with AutomaticKeepAliveClientMixin {
  late final GlobalHornRepo _repo;

  @override
  void initState() {
    super.initState();
    _repo = GlobalHornRepo(widget.index + 1);
    eventCenter.addListener(EventConstant.EventGlobalHorn, _onEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventGlobalHorn, _onEvent);
    super.dispose();
  }

  void _onEvent(String type, dynamic data) {
    if (type == EventConstant.EventGlobalHorn) {
      // 提交喊话时触发，此时需要刷新待审核列表
      _repo.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 16),
      child: RefreshIndicatorFactory.of(
        onRefresh: _repo.refresh,
        child: LoadingMoreList(
          ListConfig<Horn>(
            itemBuilder: (_, item, index) => _buildItem(item),
            sourceList: _repo,
            indicatorBuilder: _indicatorBuilder,
            itemExtent: 79,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Horn item) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(item.background),
            width: Util.width - 40,
            height: 63,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: Util.width - 40,
          height: 63,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 2),
                    Text(Utility.formatDateToDay(item.createdAt.toInt()),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (_showBtn(item)) _buildActionBtn(item),
            ],
          ),
        ),
      ],
    );
  }

  bool _showBtn(Horn item) {
    if (widget.index == 1) {
      return true;
    } else if (widget.index == 2) {
      if (item.deleted == 0 && item.lastNum <= 0) {
        return false;
      }
      return true;
    }
    return false;
  }

  Widget _buildActionBtn(Horn item) {
    return GestureDetector(
      onTap: () async {
        switch (widget.index) {
          case 1: //发送
            HornSendRes res = await Api.send(
                item.id.toInt(), ChatRoomData.getInstance()?.rid ?? 0);
            if (res.success) {
              Fluttertoast.showCenter(msg: K.horn_send_success);
              if (mounted) {
                Navigator.pop(context);
              }
            } else {
              Fluttertoast.showCenter(msg: res.msg);
            }
            break;
          case 2: //再次发送
            bool? confirm;
            if (item.lastNum > 0) {
              //有剩余喇叭
              confirm = await ConfirmDialogWithImg.show(
                context,
                type: TYPE.TYPE_RE_AVAILABLE,
                price: item.price,
                name: item.name,
              );
            } else {
              confirm = await ConfirmDialogWithImg.show(
                context,
                type: TYPE.TYPE_RE_PURCHASE,
                price: item.price,
                name: item.name,
              );
            }

            if (confirm == true) {
              _realSend(item);
            }
            break;
          default:
            break;
        }
      },
      child: Container(
        height: 28,
        constraints: const BoxConstraints(minWidth: 48),
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(16),
            color: Colors.white.withOpacity(0.2)),
        child: Text(
          getBtnName(widget.index),
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _realSend(Horn item) async {
    HornSendRes res =
        await Api.send(item.id.toInt(), ChatRoomData.getInstance()?.rid ?? 0);
    if (res.success) {
      eventCenter.emit(EventConstant.EventUserMoneyChange);
      Fluttertoast.showCenter(msg: K.horn_send_success);
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      /// 余额不足，去充值
      if (res.errCode == 40001) {
        ConfirmDialogNormal.show(
          context,
          content: K.horn_dialog_content_recharge,
          btnName: K.horn_dialog_btn_recharge,
          onConfirm: () {
            Navigator.pop(context);
            ISettingManager settingManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            settingManager.openRechargeScreen(context);
          },
        );
      } else {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
  }

  String getBtnName(int index) {
    String name = "";
    switch (index) {
      case 1:
        name = K.horn_btn_send;
        break;
      case 2:
        name = K.horn_btn_resend;
        break;
    }
    return name;
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    switch (status) {
      case IndicatorStatus.none:
        return LoadingFooter(
          hasMore: _repo.hasMore,
          loadMore: _repo.loadMore,
          textColor: Colors.white70,
        );
      case IndicatorStatus.loadingMoreBusying:
        return const LoadingFooter(
          hasMore: true,
          textColor: Colors.white70,
        );
      case IndicatorStatus.fullScreenBusying:
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      case IndicatorStatus.error:
        return LoadingFooter(
          errorMessage: _repo.errorMsg,
          loadMore: _repo.loadMore,
          textColor: Colors.white70,
        );
      case IndicatorStatus.fullScreenError:
        return Center(
          child: ErrorData(
            error: _repo.errorMsg,
            onTap: _repo.refresh,
            fontColor: Colors.white70,
          ),
        );
      case IndicatorStatus.noMoreLoad:
        return const LoadingFooter(
          hasMore: false,
          textColor: Colors.white70,
        );
      case IndicatorStatus.empty:
        return Center(
          child: EmptyWidget(
            onTap: _repo.refresh,
            textColor: Colors.white70,
            paddingBottom: 60,
          ),
        );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
