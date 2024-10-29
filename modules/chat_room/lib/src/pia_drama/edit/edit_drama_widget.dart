import 'dart:ui';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import '../pia_drama_repo.dart';
import 'edit_gift_list.dart';

enum PiaEditType {
  AddSingle,
  AddSingleAndMul,
  EditCv,
  EditReception,
}

/// pia戏剧本编辑Widget
/// 1.支持新增剧本：
///   1.1.普通GS只能新增自己的单人本；
///   1.2.接待/房主，新增自己的单人本+房间的多人本；
/// 2.修改剧本：
///   2.1.修改剧本名称+CV费用（普通GS修改自己的单人本，接待/房主，修改自己的单人本+房间的多人本）
///   2.2.修改剧本接待费（接待/房主修改麦上所有人的单人本+房间所有多人本）
class EditDramaWidget extends StatefulWidget {
  final int rid;
  final PiaEditType type;
  final PiaJuBen? juben;

  const EditDramaWidget(
      {Key? key, required this.rid, required this.type, this.juben})
      : super(key: key);

  @override
  EditDramaState createState() {
    return EditDramaState();
  }

  /// 弹出编辑已有剧本价格sheet
  static Future<bool?> showEditSheet(
    BuildContext context, {
    required int rid,
    required PiaEditType type,
    required PiaJuBen juben,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      settings: const RouteSettings(name: '/edit_drama_widget'),
      builder: (BuildContext context) {
        return EditDramaWidget(
          rid: rid,
          type: type,
          juben: juben,
        );
      },
    );
  }
}

class EditDramaState extends State<EditDramaWidget>
    with AutomaticKeepAliveClientMixin {
  late PiaJuBenPayNeed editPayNeed;
  late TextEditingController _textEditingController;
  int editJid = 0;

  /// 剧本类型：1.单人本，2.多人本
  int editType = 1;
  PiaJuBenPayNeed? defaultPayNeed;

  double paddingHorizon = 16;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();

    if (widget.juben != null) {
      if (widget.type == PiaEditType.EditCv) {
        /// 修改CV费（GS表演费用）
        editPayNeed = widget.juben!.payGs;
      } else {
        /// 修改接待费（房主及接待）
        editPayNeed = widget.juben!.payRecepition;
      }
      editJid = widget.juben!.jid;
      _textEditingController.text = widget.juben!.name;
      editType = widget.juben!.type == PiaJuBenType.PiaJuBenTypeSingle ? 1 : 2;
    } else {
      editPayNeed = PiaJuBenPayNeed(
        giftNum: 1,
      );
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.type == PiaEditType.AddSingle ||
        widget.type == PiaEditType.AddSingleAndMul) {
      return _buildBody();
    }

    return wrapBlurBg(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: widget.type == PiaEditType.EditCv ? 383 : 291,
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
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.type == PiaEditType.AddSingle ||
                  widget.type == PiaEditType.AddSingleAndMul
              ? 16
              : 20,
        ),
        if (widget.type == PiaEditType.AddSingleAndMul) ...[
          _buildEditType(),
          const SizedBox(
            height: 12,
          ),
          _buildTypeField(),
          const SizedBox(
            height: 30,
          ),
        ],
        if (widget.type == PiaEditType.AddSingle ||
            widget.type == PiaEditType.AddSingleAndMul ||
            widget.type == PiaEditType.EditCv) ...[
          _buildEditTitle(),
          const SizedBox(
            height: 12,
          ),
          _buildTitleField(),
          const SizedBox(
            height: 30,
          ),
        ],
        if (widget.type == PiaEditType.EditReception) ...[
          /// 修改接待费，展示剧本名称及接待费用
          _buildEditReceptionTitle(),
        ] else ...[
          /// 剧本价格
          _buildJubenCvTitle(),
        ],
        EditGiftList(
          selectGiftAndNum: editPayNeed,
          type: widget.type == PiaEditType.EditReception ? 1 : 2,
          onDefaultPay: (PiaJuBenPayNeed defaultGift) {
            defaultPayNeed = defaultGift;
          },
          onGiftChange: onGiftChange,
        ),
        SizedBox(height: widget.type == PiaEditType.AddSingle ? 132 : 9),
        GestureDetector(
          onTap: edit,
          child: Container(
            width: Util.width - 40,
            height: 52,
            margin: const EdgeInsetsDirectional.only(start: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
              ),
              borderRadius: BorderRadiusDirectional.circular(26),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              (widget.type == PiaEditType.AddSingle ||
                      widget.type == PiaEditType.AddSingleAndMul)
                  ? K.room_add
                  : K.room_confirm,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJubenCvTitle() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: paddingHorizon, bottom: 12),
      child: Text(
        K.room_drama_cv_price,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildEditReceptionTitle() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: paddingHorizon, bottom: 25),
      child: Text(
        '《${widget.juben!.name}》${K.room_edit_drama_reception_fee}',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildEditType() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: paddingHorizon),
      child: Text(
        K.room_drama_type,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildTypeField() {
    return GestureDetector(
      onTap: () {
        _editDramaType();
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(
            start: paddingHorizon, end: paddingHorizon),
        padding: const EdgeInsetsDirectional.only(start: 20, end: 9),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Text(
              editType == 1 ? K.room_single_person : K.room_drama_type_multi,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            R.img(
              'ic_arrow_down.png',
              width: 16,
              height: 16,
              color: Colors.white70,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditTitle() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: paddingHorizon),
      child: Text(
        K.room_drama_title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return Container(
      margin: EdgeInsetsDirectional.only(
          start: paddingHorizon, end: paddingHorizon),
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      height: 48,
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.white.withOpacity(0.1),
      ),
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: K.room_drama_title_hint,
          isDense: true,
          border: InputBorder.none,
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
        ),
        maxLines: 1,
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
        ],
      ),
    );
  }

  Widget wrapBlurBg({required Widget child}) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: child,
      ),
    );
  }

  void _editDramaType() async {
    List<SheetItem> res = [
      SheetItem(K.room_single_person + K.room_drama, '1'),
      SheetItem(K.room_drama_type_multi + K.room_drama, '2'),
    ];
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            title: '',
            showTitle: false,
            data: res,
          );
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (mounted) {
      setState(() {
        editType = Util.parseInt(result.value?.key);
      });
    }
  }

  void onGiftChange(PiaJuBenPayNeed gift) {
    editPayNeed = gift;
  }

  bool editing = false;
  void edit() async {
    if (editing) return;
    editing = true;

    if (!Util.validStr(_textEditingController.text)) {
      Fluttertoast.showCenter(msg: K.room_drama_title + K.room_cant_empty);
      editing = false;
      return;
    }

    late PiaJuBenPayNeed gs;
    PiaJuBenPayNeed? reception;
    if (widget.type == PiaEditType.AddSingle ||
        widget.type == PiaEditType.AddSingleAndMul) {
      gs = editPayNeed;
      reception = defaultPayNeed;
    } else {
      if (widget.type == PiaEditType.EditCv) {
        gs = editPayNeed;
        reception = widget.juben!.payRecepition;
      } else {
        gs = widget.juben!.payGs;
        reception = editPayNeed;
      }
    }

    NormalNull res = await PiaDramaRepo.editJuben(
      rid: widget.rid,
      operate: editJid == 0 ? 1 : 2,
      jid: editJid,
      type: editType,
      name: _textEditingController.text,
      paycreator: '${reception?.giftId}:${reception?.giftNum}',
      payreceptor: '${reception?.giftId}:${reception?.giftNum}',
      paygs: '${gs.giftId}:${gs.giftNum}',
    );

    if (res.success) {
      Fluttertoast.showCenter(
          msg: widget.type == PiaEditType.AddSingle ||
                  widget.type == PiaEditType.AddSingleAndMul
              ? K.room_gmic_add_album_success
              : K.room_quick_reply_modify_success);

      if (mounted &&
          (widget.type == PiaEditType.EditReception ||
              widget.type == PiaEditType.EditCv)) {
        Navigator.of(context).pop(true);
      } else if (widget.type == PiaEditType.AddSingleAndMul ||
          widget.type == PiaEditType.AddSingle) {
        /// 重置
        if (mounted) {
          setState(() {
            _textEditingController.clear();
            editPayNeed = PiaJuBenPayNeed(
              giftNum: 1,
            );
          });
        }
      }
    } else if (Util.validStr(res.msg)) {
      Fluttertoast.showCenter(msg: res.msg);
    }

    editing = false;
  }

  @override
  bool get wantKeepAlive => true;
}
