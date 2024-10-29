import 'dart:async';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:message/src/auto_reply/model/gift_item.dart';

/// 选择礼物弹框
class GiftSelectDialog extends StatefulWidget {
  final List<int>? giftIds;
  final int maxCount;

  const GiftSelectDialog({Key? key, this.giftIds, required this.maxCount})
      : super(key: key);

  static Future show(BuildContext context, List<int>? giftIds, int maxCount) {
    return DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      duration: const Duration(milliseconds: 250),
      builder: (context) => GiftSelectDialog(
        giftIds: giftIds,
        maxCount: maxCount,
      ),
    );
  }

  @override
  _GiftSelectDialogState createState() => _GiftSelectDialogState();
}

class _GiftSelectDialogState extends State<GiftSelectDialog> {
  bool _loading = true;
  String? _errorMessage;
  List<GiftItem> _giftList = [];
  final Set<int> _selectSet = {};

  @override
  void initState() {
    super.initState();
    if (widget.giftIds != null) {
      for (var e in widget.giftIds!) {
        _selectSet.add(e);
      }
    }
    _load();
  }

  _load() async {
    DataRsp<List<GiftItem>> response = await MessageRepo.autoReplyGiftList();
    if (response.success == true && response.data != null) {
      _giftList = response.data!;
    } else {
      _errorMessage = response.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _reload() {
    setState(() {
      _errorMessage = null;
      _loading = true;
    });
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _reload();
        },
      );
    }

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: 312,
              height: 480,
              decoration: BoxDecoration(
                color: R.color.mainBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsetsDirectional.only(
                top: 32,
              ),
              child: Column(
                children: [
                  Text(
                    K.msg_select_designated_gift,
                    style: TextStyle(
                      fontSize: 18,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildContent(),
                ],
              ),
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: R.img(
                    'ic_close.svg',
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 16,
                    height: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  width: 312, height: 144,
                  alignment: AlignmentDirectional.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(16),
                      bottomEnd: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.bottomCenter,
                      end: AlignmentDirectional.topCenter,
                      colors: [
                        R.color.mainBgColor,
                        R.color.mainBgColor,
                        R.color.mainBgColor.withOpacity(0)
                      ],
                    ),
                  ),
                  // child: _buildCommitBtn(),
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 24,
              child: _buildCommitBtn(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SizedBox(
      width: 264,
      height: 320,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 12,
          childAspectRatio: 80 / 134,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _buildGiftItem(_giftList[index]);
        },
        itemCount: _giftList.length,
      ),
    );
  }

  Widget _buildGiftItem(GiftItem gift) {
    bool select = _selectSet.contains(gift.id);
    return GestureDetector(
      onTap: () {
        if (select) {
          _selectSet.remove(gift.id);
        } else {
          if (_selectSet.length >= widget.maxCount) {
            Fluttertoast.showToast(
                msg: K.msg_max_select_gift_num(['${widget.maxCount}']));
          } else {
            _selectSet.add(gift.id);
          }
        }
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F7FD),
              borderRadius: BorderRadiusDirectional.circular(12),
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(
                  placeholder: const CupertinoActivityIndicator(),
                  imageUrl:
                      '${System.imageDomain}static/$giftSubDir/${gift.id}.png',
                  width: 72,
                  height: 72,
                  fit: BoxFit.contain,
                  fadeInDuration: const Duration(microseconds: 0),
                  fadeOutDuration: const Duration(microseconds: 0),
                ),
                if (select)
                  PositionedDirectional(
                    top: 2,
                    start: 2,
                    child: R.img(
                      'ic_accost_ratio_sel.svg',
                      package: ComponentManager.MANAGER_MESSAGE,
                      width: 20,
                      height: 20,
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 80),
            child: Text(
              '${gift.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '${gift.price}${MoneyConfig.moneyName}',
            style: TextStyle(fontSize: 11, color: R.color.thirdTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildCommitBtn() {
    return GestureDetector(
      onTap: () {
        List<GiftItem> selectGifts = [];
        for (GiftItem item in _giftList) {
          if (_selectSet.contains(item.id)) {
            selectGifts.add(item);
          }
        }
        selectGifts.sort((a, b) => b.price.compareTo(a.price));
        List<int> rspList = selectGifts.map((e) => e.id).toList();
        Navigator.pop(context, rspList);
      },
      child: Container(
        width: 216,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Align(
          child: Text(
            BaseK.K.confirm,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
