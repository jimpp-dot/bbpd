import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/model/vindicate_record_history.dart';
import 'package:chat_room/src/vindicate/model/vindicate_square_view_model.dart';
import 'package:chat_room/src/vindicate/model/vindicate_view_model.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_card_box.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_gift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:provider/provider.dart' hide Selector;

/// 表白活动--表白广场页面
class VindicateSquarePage extends StatelessWidget {
  const VindicateSquarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          _onlySelfLabelAndSwitchBtn(context),
          const SizedBox(
            height: 18,
          ),
          Expanded(child: _body(context)),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    final history =
        context.select<VindicateSquareViewModel, VindicateRecordHistory>(
            (model) => model.currentShowRecordHistory);

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        history.refresh();
      },
      child: LoadingMoreList(
        ListConfig<VindicateRecordData>(
            shrinkWrap: true,
            sourceList: history,
            indicatorBuilder: _indicatorBuilder,
            itemBuilder: (context, item, index) {
              EdgeInsetsGeometry padding = EdgeInsetsDirectional.only(
                  bottom: index < history.length - 1 ? 10 : 0);
              return _ConfessionRecordListViewItem(recordData: item);
            }),
      ),
    );
  }

  /// 只关注自己的消息
  Widget _onlySelfLabelAndSwitchBtn(BuildContext context) {
    bool isShowMeOnly = context.select<VindicateSquareViewModel, bool>(
        (model) => model.isShowMeGiftRecordOnly);

    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: const Color(0xFFF448B3)),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              K.room_vindicate_mine_history_only,
              style: R.textStyle.regular16
                  .copyWith(color: const Color(0xFF313131)),
            ),
          ),
          CupertinoSwitch(
            value: isShowMeOnly,
            activeColor: const Color(0xFFC36FFE),
            trackColor: const Color(0xFFC36FFE).withOpacity(0.4),
            onChanged: (bool value) {
              context
                  .read<VindicateSquareViewModel>()
                  .actionForShowMeRecordOnly(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    Log.d('status = $status');

    // final vindicateModel = context.read<VindicateViewModel>();

    final vindicateModel = context.read<VindicateSquareViewModel>();

    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return Container();
    } else if (status == IndicatorStatus.error) {
      return Container();
    } else if (status == IndicatorStatus.empty) {
      return Container();
    } else if (status == IndicatorStatus.none) {
      return Container();
    }
    return const LoadingFooter(hasMore: true);
  }
}

/// 皮队友表白记录列表item
class _VindicateRecordListViewItem extends StatelessWidget {
  final VindicateRecordData recordData;

  const _VindicateRecordListViewItem({Key? key, required this.recordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            Color(0xFFFFA0DB),
            Color(0xFFFF71CA),
          ],
        ),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(12.0)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(11.0)),
          color: Colors.white,
        ),
        margin: const EdgeInsetsDirectional.all(1.5),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            VindicateCardBox.squareBox(
              height: 134,
              backgroundColor: Colors.transparent,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  PositionedDirectional(
                    child: _userNameRow,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _userAvatar(context, recordData.fromIcon,
                            uid: recordData.fromUid),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                start: 5, end: 9),
                            child: _pinkLine(),
                          ),
                        ),
                        _giftSendTimeLabel,
                        Expanded(
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                start: 9, end: 5),
                            child: _pinkLine(isMirror: true),
                          ),
                        ),
                        _userAvatar(context, recordData.toIcon,
                            uid: recordData.toUid),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              bottom: -10,
              child: R.img(
                  RoomAssets.chat_room$vindicate_vindicate_gift_bg_mask_webp,
                  width: 220,
                  height: 176,
                  fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _userNameRow {
    Widget userNameWidget(String name) {
      return Container(
        constraints: const BoxConstraints(
          maxWidth: 90,
        ),
        alignment: AlignmentDirectional.bottomCenter,
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        child: Text(
          name,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: R.textStyle.regular14
              .copyWith(fontSize: 13, color: const Color(0x99202020)),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        userNameWidget(recordData.fromName),
        const Spacer(),
        userNameWidget(recordData.toName),
      ],
    );
  }

  /// 用户头像和名称
  Widget _userAvatar(BuildContext context, String url, {int? uid}) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(32)),
                border: Border.all(width: 1, color: const Color(0xFFFCBBE3)),
              ),
              child: CommonAvatar(
                path: Util.parseIcon(url),
                size: 62,
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(31)),
                onTap: () {
                  /// 打开用户资料面板
                  if (uid != null && uid > 0) {
                    context
                        .read<VindicateViewModel>()
                        .actionForShowPersonalProfileBottomSheetDialog(uid);
                  }
                },
              ),
            ),
            Container(
              height: 18,
            )
          ],
        ),
      ],
    );
  }

  /// 赠送礼物的内容和时间
  Widget get _giftSendTimeLabel {
    const textColor = Color(0xFFF448B3);

    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 0,
      children: [
        VindicateGift(
          url: recordData.url,
          width: 59,
          height: 62,
          showBgMask: false,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.end,
          direction: Axis.vertical,
          spacing: 0,
          children: [
            Text(
              recordData.timeFormat,
              style: R.textStyle.regular12
                  .copyWith(fontSize: 11, color: textColor),
            ),
            Text(
              recordData.text,
              style: R.textStyle.regular12
                  .copyWith(fontSize: 13, color: textColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget _pinkLine({bool isMirror = false}) => Container(
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsetsDirectional.only(bottom: 36, top: 15),
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 0),
          child: R.img(
              isMirror
                  ? RoomAssets
                      .chat_room$vindicate_vindicate_pink_line_mirror_webp
                  : RoomAssets.chat_room$vindicate_vindicate_pink_line_webp,
              fit: BoxFit.fitWidth),
        ),
      );
}

/// 表白记录列表item
class _ConfessionRecordListViewItem extends StatelessWidget {
  final VindicateRecordData recordData;
  const _ConfessionRecordListViewItem({Key? key, required this.recordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                Color(0xFFFF73CA),
                Color(0xFFFFA3DC),
                Color(0xFFFF61C3),
              ],
            ),
            borderRadius: BorderRadiusDirectional.all(Radius.circular(12.0)),
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            margin: const EdgeInsetsDirectional.all(2),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PositionedDirectional(
                  child: R.img(RoomAssets
                      .chat_room$confession_confession_gift_bg_mask_webp),
                ),
                VindicateCardBox.squareBox(
                    // height: 136,
                    backgroundColor: Colors.transparent,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 116,
                          height: 62,
                          child: Stack(
                            children: [
                              PositionedDirectional(
                                top: 0,
                                end: 0,
                                child: _userAvatar(context, recordData.toIcon,
                                    uid: recordData.toUid),
                              ),
                              PositionedDirectional(
                                top: 0,
                                start: 0,
                                child: _userAvatar(context, recordData.fromIcon,
                                    uid: recordData.fromUid),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  recordData.text,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: R.textStyle.regular14.copyWith(
                                      fontSize: 13, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  /// 用户头像和名称
  Widget _userAvatar(BuildContext context, String url, {int? uid}) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(31)),
                border: Border.all(width: 1, color: const Color(0xFFFCBBE3)),
              ),
              child: CommonAvatar(
                path: Util.parseIcon(url),
                size: 60,
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(30)),
                onTap: () {
                  /// 打开用户资料面板
                  if (uid != null && uid > 0) {
                    context
                        .read<VindicateViewModel>()
                        .actionForShowPersonalProfileBottomSheetDialog(uid);
                  }
                },
              ),
            ),

            /// TODO:
            Container(
              height: 18,
            )
          ],
        ),
      ],
    );
  }
}
