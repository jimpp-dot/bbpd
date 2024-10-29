import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import 'edit_drama_item.dart';
import 'edit_drama_repo.dart';
import 'edit_drama_widget.dart';

/// 编辑所有剧本的接待费
class EditDramaReceptionFee extends StatefulWidget {
  final int rid;

  const EditDramaReceptionFee({Key? key, required this.rid}) : super(key: key);

  static Future<void> show(
    BuildContext context, {
    required int rid,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      settings: const RouteSettings(name: '/edit_drama_reception_fee'),
      builder: (BuildContext context) {
        return EditDramaReceptionFee(
          rid: rid,
        );
      },
    );
  }

  @override
  EditDramaReceptionFeeState createState() {
    return EditDramaReceptionFeeState();
  }
}

class EditDramaReceptionFeeState extends State<EditDramaReceptionFee> {
  late EditDramaRepository _repo;

  @override
  void initState() {
    super.initState();
    _repo = EditDramaRepository(rid: widget.rid, uid: 0, type: 4);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            height: 550,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xB26968FF), Color(0xB29274FF)],
              ),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
            ),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopBar(),
        Expanded(
          child: LoadingMoreList(
            ListConfig<PiaJuBen>(
              padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
              indicatorBuilder: _indicatorBuilder,
              itemBuilder: _itemBuilder,
              sourceList: _repo,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 44,
      margin: const EdgeInsetsDirectional.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.5, color: Colors.white.withOpacity(0.1))),
      ),
      child: BaseAppBar.custom(
        backgroundColor: Colors.transparent,
        title: Text(
          K.room_edit_drama_fee,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backColor: Colors.white.withOpacity(0.6),
        actions: [
          IconButton(
            onPressed: () {
              /// 编辑剧本说明页h5
              BaseWebviewScreen.show(context, url: Util.parseHelpUrl(157));
            },
            icon: Icon(
              Icons.help_outline,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, PiaJuBen item, int index) {
    return EditDramaItem(
      item: item,
      index: index,
      onItemEdit: onItemEdit,
      editCv: false,
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(
        hasMore: true,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: R.string('data_error'),
        onTap: () {
          _repo.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: R.string('data_error'), loadMore: _repo.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: R.string('no_data'),
        onTap: () {
          _repo.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  /// 编辑
  void onItemEdit(int index) async {
    bool? edit = await EditDramaWidget.showEditSheet(
      context,
      rid: widget.rid,
      type: PiaEditType.EditReception,
      juben: _repo.elementAt(index),
    );

    if (edit == true) {
      /// 编辑成功，刷新界面
      _repo.refresh();
    }
  }
}
