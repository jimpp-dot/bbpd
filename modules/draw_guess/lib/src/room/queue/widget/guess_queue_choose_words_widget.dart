import 'package:draw_guess/k.dart';
import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_beans.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:flutter/material.dart';

class GuessQueueChooseWordWidget extends StatefulWidget {
  final int rid;
  final int? cid;

  const GuessQueueChooseWordWidget({super.key, required this.rid, this.cid});

  @override
  _GuessQueueChooseWordWidgetState createState() =>
      _GuessQueueChooseWordWidgetState();

  static Future<WordCategory?> show(BuildContext context, int rid, {int? cid}) {
    return displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      maxHeightRatio: 0.52,
      builder: (context) => GuessQueueChooseWordWidget(rid: rid, cid: cid),
    );
  }
}

class _GuessQueueChooseWordWidgetState
    extends BaseScreenState<GuessQueueChooseWordWidget> {
  late List<WordCategory> _wordList;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    WordCategoryDataResp categoryDataResp =
        await GuessQueueRepo.getTextCategories(widget.rid);
    if (categoryDataResp.success == true) {
      if (categoryDataResp.data != null &&
          !Util.isCollectionEmpty(categoryDataResp.data?.list)) {
        _wordList = categoryDataResp.data!.list!;
        setScreenReady();
      } else {
        setScreenEmpty();
      }
    } else {
      setScreenError(errorMsg: categoryDataResp.msg ?? '');
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16), topEnd: Radius.circular(16)),
            color: Colors.white),
        padding: const EdgeInsetsDirectional.only(top: 8, start: 16, end: 16),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 5,
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: Colors.black.withOpacity(0.2)),
            ),
            const SizedBox(height: 12),
            Text(
              K.guess_choose_word_desc,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF313131)),
            ),
            const SizedBox(height: 12),
            Expanded(child: buildStatusContent())
          ],
        ),
      ),
    );
  }

  List<Widget> _getWords() {
    List<Widget> children = [];
    for (int i = 0; i < _wordList.length; i++) {
      WordCategory category = _wordList[i];
      bool se = false;
      if (widget.cid == null) {
        if (i == 0) {
          se = true;
        }
      } else {
        se = widget.cid == category.cid;
      }

      children.add(_buildWordItem(category, se));
    }
    return children;
  }

  Widget _buildWordItem(WordCategory category, bool selected) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(category);
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: BoxDecoration(
            border: Border.all(
                color: selected ? const Color(0xFF6A5BFF) : Colors.transparent,
                width: 3),
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFBCC2FC).withOpacity(0.4)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                category.name ?? '',
                style: const TextStyle(
                    color: Color(0xFF313131),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              category.num > 0 ? '${category.num}' : '',
              style: const TextStyle(color: Color(0xFF313131), fontSize: 13),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildContent() {
    return GridView.count(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      childAspectRatio: 166 / 48,
      children: _getWords(),
    );
  }
}
