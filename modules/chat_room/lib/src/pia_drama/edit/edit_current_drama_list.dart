import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import '../pia_drama_repo.dart';
import 'edit_drama_item.dart';
import 'edit_drama_repo.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'edit_drama_widget.dart';

/// 已有剧本
/// rid: 房间id
/// uid: 查询单个人的剧本时，待查询人的uid
/// type: 查询类型,1:指定用户的单人本 3:指定用户的单人本+房间的多人本
class EditCurrentDramaList extends StatefulWidget {
  final int rid;
  final int uid;
  final int type;

  const EditCurrentDramaList(
      {Key? key, required this.rid, required this.uid, required this.type})
      : super(key: key);

  @override
  EditCurrentDramaListState createState() {
    return EditCurrentDramaListState();
  }
}

class EditCurrentDramaListState extends State<EditCurrentDramaList> {
  late EditDramaRepository _repo;

  @override
  void initState() {
    super.initState();
    _repo = EditDramaRepository(
        rid: widget.rid, uid: widget.uid, type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingMoreList(
      ListConfig<PiaJuBen>(
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        indicatorBuilder: _indicatorBuilder,
        itemBuilder: _itemBuilder,
        sourceList: _repo,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, PiaJuBen item, int index) {
    return EditDramaItem(
      item: item,
      index: index,
      onItemEdit: onItemEdit,
      onItemDelete: onItemDelete,
      editCv: true,
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
      type: PiaEditType.EditCv,
      juben: _repo.elementAt(index),
    );

    if (edit == true) {
      /// 编辑成功，刷新界面
      _repo.refresh();
    }
  }

  bool isDeleting = false;

  /// 删除
  void onItemDelete(int index) async {
    if (isDeleting) {
      return;
    }
    isDeleting = true;

    PiaJuBen juben = _repo.elementAt(index);
    bool? agree = await showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            content: K.room_delete_drama_title([juben.name]),
          );
        });

    if (agree != true) {
      isDeleting = false;
      return;
    }

    NormalNull res = await PiaDramaRepo.editJuben(
      rid: widget.rid,
      operate: 3,
      jid: juben.jid,
      type: juben.type == PiaJuBenType.PiaJuBenTypeSingle ? 1 : 2,
      name: juben.name,
      paycreator: '${juben.payCreator.giftId}:${juben.payCreator..giftNum}',
      payreceptor:
          '${juben.payRecepition.giftId}:${juben.payRecepition.giftNum}',
      paygs: '${juben.payGs.giftId}:${juben.payGs.giftNum}',
    );

    if (res.success) {
      Fluttertoast.showCenter(msg: K.ktv_del_song_success);

      /// 删除成功，刷新界面
      _repo.refresh();
    } else if (Util.validStr(res.msg)) {
      Fluttertoast.showCenter(msg: res.msg);
    }

    isDeleting = false;
  }
}
