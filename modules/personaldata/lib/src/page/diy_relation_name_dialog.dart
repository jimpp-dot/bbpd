import 'package:shared/shared.dart';
import 'package:chat_room/k.dart' as RoomK;
import 'package:flutter/material.dart';
import 'package:personaldata/src/model/defend_relation_detail_bean.dart';
import 'package:personaldata/src/page/model/RelationRepo.dart';

class DiyRelationNameDialog extends StatefulWidget {
  final DefendRelationDetailBean? data;

  const DiyRelationNameDialog({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DiyRelationNameState();

  static Future show(BuildContext context, DefendRelationDetailBean? data) {
    return showDialog(
      context: context,
      builder: (context) => DiyRelationNameDialog(data: data),
    );
  }
}

class DiyRelationNameState extends State<DiyRelationNameDialog> {
  late TextEditingController _textController;

  bool enable = false;

  DefendRelationDetailBean? get data => widget.data;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 312,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                _buildTitle(),
                const SizedBox(height: 24),
                _buildAuctionIcons(),
                const SizedBox(height: 12),
                _buildAuctionNames(),
                const SizedBox(height: 30),
                _buildInputDiy(),
                const SizedBox(height: 24),
                _buildBtnByCommit(),
                const SizedBox(height: 20),
              ],
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBtnByCommit() {
    return InkWell(
      onTap: _onTapDiyCommit,
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: enable
                ? R.color.mainBrandGradientColors
                : R.color.mainBrandGradientColors
                    .map((e) => e.withOpacity(0.5))
                    .toList(),
          ),
          shape: const StadiumBorder(),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          RoomK.K.submit,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _onTapDiyCommit() async {
    String diyText = _textController.text.trim();
    if (diyText.isNotEmpty) {
      NormalNull res = await RelationRepo.commitDiyRelation(
          toUid: data?.uid ?? 0,
          position: data?.position ?? 0,
          diyName: diyText);
      if (res.success) {
        Navigator.of(context).pop(1);
      } else {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
  }

  Widget _buildInputDiy() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data?.levelName ?? '',
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 177,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            onChanged: _onChangeValue,
            cursorColor: R.color.mainBrandColor,
            decoration: InputDecoration(
              hintText: data?.title ?? '',
              border: InputBorder.none,
              hintStyle: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              isDense: true,
              counterText: '',
            ),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w600),
            controller: _textController,
            autocorrect: false,
            maxLength: 4,
            minLines: 1,
            textInputAction: TextInputAction.done,
            keyboardAppearance: Brightness.light,
          ),
        ),
      ],
    );
  }

  void _onChangeValue(String text) {
    enable = (text.isNotEmpty == true);
    refresh();
  }

  Widget _buildAuctionNames() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 160,
          ),
          child: Text(
            data?.toName ?? '',
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          "&",
          style: TextStyle(
            color: Color(0xFFFF5F7D),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 160,
          ),
          child: Text(
            data?.name ?? '',
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAuctionIcons() {
    return SizedBox(
      width: 108,
      height: 56,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: _buildAvatar(data?.icon ?? ''),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: _buildAvatar(data?.toIcon ?? ''),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFFF95D6),
          width: 1,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: url,
        size: 56,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      RoomK.K.room_auction_diy_title,
      style: TextStyle(
        color: R.color.mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
