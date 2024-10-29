import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/trueword/model/true_word_beans.dart';
import 'package:chat_room/src/biz_plugin/trueword/model/true_word_repo.dart';

class TrueWordSheet extends StatefulWidget {
  final int rid;

  const TrueWordSheet({super.key, required this.rid});

  static void show(BuildContext context, int rid, int targetUid) async {
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return TrueWordSheet(
            rid: rid,
          );
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    } else {
      TrueWordRepo.selectSheet(rid, targetUid, result.value?.key)
          .then((rsp) => BaseResponse.toast(rsp));
    }
  }

  @override
  _TrueWordSheetState createState() => _TrueWordSheetState();

  static List<TrueWordSheetItem> sheetItems = [];
}

class _TrueWordSheetState extends State<TrueWordSheet> {
  List<TrueWordSheetItem>? sheetItems;

  @override
  Widget build(BuildContext context) {
    if (sheetItems?.isEmpty ?? true) return const SizedBox();
    return RadioBottomSheet(
        title: K.choose_truth_word_type,
        data: sheetItems!.map((_) => SheetItem(_.desc, _.type)).toList());
  }

  @override
  void initState() {
    super.initState();

    sheetItems = TrueWordSheet.sheetItems;
    TrueWordRepo.getSheetItems(widget.rid).then((rsp) {
      if (rsp.success) {
        sheetItems = TrueWordSheet.sheetItems = rsp.data!;
        if (mounted) setState(() {});
      }
    });
  }
}
