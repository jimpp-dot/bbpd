import 'package:provider/provider.dart' hide Selector;
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/chatRoomData.dart';
import '../gpk_constants.dart';
import '../widget/check_widget.dart';

import '../gpk_helper.dart';
import 'gpk_select_model.dart';

/// 显示分组Pk选人页面
showGpkSelectDialog(
    BuildContext context, GPKSelPosModel model, GPKCamp targetCamp) async {
  await showDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider<GPKSelPosModel>.value(
            value: model, child: GPKSelectDialog(targetCamp));
      });
}

/// 分组pk选人对话框页面
class GPKSelectDialog extends StatefulWidget {
  final GPKCamp targetCamp;

  const GPKSelectDialog(this.targetCamp, {super.key});

  @override
  _GPKSelectDialogState createState() => _GPKSelectDialogState();
}

class _GPKSelectDialogState extends State<GPKSelectDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 312,
        height: 295,
        child: Consumer<GPKSelPosModel>(
          builder: (context, posModel, child) {
            return Column(
              children: [
                if (!(ChatRoomData.getInstance()?.isEightPosition ?? false))
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: GPKSelPosWidget(
                        posModel: posModel,
                        isHeader: true,
                        targetCamp: widget.targetCamp,
                        item: posModel.getHead(),
                      ),
                    ),
                  ),
                GridView.count(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  crossAxisCount: 4,
                  childAspectRatio: 0.94,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _buildGPKSelPosList(posModel),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// 构建分组Pk列表项
  List<Widget> _buildGPKSelPosList(GPKSelPosModel posModel) {
    return posModel
        .getContentPosList()
        .map((e) => GPKSelPosWidget(
              posModel: posModel,
              item: e,
              targetCamp: widget.targetCamp,
            ))
        .toList();
  }
}

/// 分组选人页面位置
class GPKSelPosWidget extends StatefulWidget {
  final GPKSelPosModel posModel;
  final GPKSelPosItem item;
  final GPKCamp targetCamp;
  final bool isHeader; //头部尺寸不同

  const GPKSelPosWidget({
    super.key,
    required this.posModel,
    required this.item,
    required this.targetCamp,
    this.isHeader = false,
  });

  @override
  _GPKSelPosWidgetState createState() => _GPKSelPosWidgetState();
}

/// 座位Widget
class _GPKSelPosWidgetState extends State<GPKSelPosWidget> {
  @override
  Widget build(BuildContext context) {
    var isIdle = widget.item.isIdle;
    String text;
    if (isIdle) {
      text = K.room_gpk_idle;
    } else {
      text = widget.item.name;
    }
    return SizedBox(
      width: widget.isHeader ? 120 : 64,
      height: widget.isHeader ? 74 : 68,
      child: InkWell(
        onTap: () {
          _onClickItem();
        },
        child: Column(
          children: [
            isIdle ? _buildChair() : _buildAvatar(),
            _buildText(text),
          ],
        ),
      ),
    );
  }

  /// 头像&选中态
  Widget _buildAvatar() {
    var isIdle = widget.item.isIdle;
    String url;
    bool hasCamp;
    if (isIdle) {
      url = RoomAssets.chat_room$gpk_gpk_chair_svg; // 沙发
      hasCamp = false;
    } else {
      url = widget.item.avatarUrl;
      hasCamp = widget.item.camp != null;
    }
    return Stack(
      children: [
        CommonAvatar(
          path: url,
          size: _getImgSize(),
          shape: BoxShape.circle,
        ),
        if (hasCamp)
          PositionedDirectional(
              end: 0,
              bottom: 0,
              child: CheckedWidget(
                  gradientColors:
                      GPKHelper.getCampColorList(widget.item.camp))),
      ],
    );
  }

  // 空闲沙发
  Widget _buildChair() {
    return Container(
      width: _getImgSize(),
      height: _getImgSize(),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: R.img(RoomAssets.chat_room$gpk_gpk_chair_svg,
            width: 24, height: 24),
      ),
    );
  }

  double _getImgSize() {
    return widget.isHeader ? 52 : 48;
  }

  // 底部文字
  _buildText(String text) {
    return Container(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: R.color.mainTextColor,
          fontWeight: FontWeight.w500,
          fontSize: _getTextSize(),
        ),
      ),
    );
  }

  double _getTextSize() {
    return widget.isHeader ? 11 : 10;
  }

  /// 点击条目事件
  void _onClickItem() {
    if (widget.item.isIdle) {
      return;
    }

    // 只能点击相应阵营的人，切换选中与不选中状态
    if (widget.item.camp == null) {
      if (widget.posModel.isReachMaxCampNum(widget.targetCamp)) {
        Fluttertoast.showCenter(
            msg: K.room_gpk_person_num_limit(['$MAX_SELECT_NUM']));
        return;
      }
      widget.item.camp = widget.targetCamp;
      widget.posModel.notify();
    } else if (widget.item.camp == widget.targetCamp) {
      widget.item.camp = null;
      widget.posModel.notify();
    }
  }
}
