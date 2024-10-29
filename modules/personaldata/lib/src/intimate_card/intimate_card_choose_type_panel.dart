import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/intimate_card/intimate_card_send_person_page.dart';
import 'package:personaldata/src/api/intimate_card_api.dart';
import '../../k.dart';

class IntimateCardChooseTypePanel extends StatefulWidget {
  final VoidCallback? finishBindCard;
  const IntimateCardChooseTypePanel({super.key, this.finishBindCard});

  @override
  State<IntimateCardChooseTypePanel> createState() =>
      _IntimateCardChooseTypePanelState();

  static Future<void> show(BuildContext context,
      {VoidCallback? finishBindCard}) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 0.7,
      builder: (context) {
        return IntimateCardChooseTypePanel(finishBindCard: finishBindCard);
      },
    );
  }
}

class _IntimateCardChooseTypePanelState
    extends State<IntimateCardChooseTypePanel> {
  bool _isLoading = false;
  ResIntimateCardRelation? _cardRelation;

  final List<Color> _bgColor = [Colors.white, Colors.white];

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: 605.dp,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(21.dp), topEnd: Radius.circular(21.dp)),
      ),
      child: _buildWidget(),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: Loading(),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _cardRelation?.msg,
        fontColor: Colors.white,
        onTap: () {
          _requestData();
        },
      ),
    );
  }

  Widget _buildWidget() {
    if (_isLoading) {
      return _loadingWidget();
    }

    if (!(_cardRelation?.success ?? false)) {
      return _errorWidget();
    }

    return Column(
      children: [
        const SizedBox(
          height: 21,
        ),
        Text(
          K.choose_send_card_user,
          style: TextStyle(
            color: Colors.black.withOpacity(0.9),
            fontSize: 16.dp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          K.intimate_card_send_des,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 12.dp,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: ListView.builder(
          padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
          itemCount: _cardRelation?.data.length ?? 0,
          itemExtent: 82,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(_cardRelation!.data[index]);
          },
        )),
      ],
    );
  }

  Widget _buildItem(IntimateCardRelationInfo relationInfo) {
    List<Color>? gradientColors;
    if (relationInfo.color.isEmpty ||
        Util.parseColors(relationInfo.color).length < 2) {
      gradientColors = _bgColor;
    } else {
      List<Color> colorList = Util.parseColors(relationInfo.color);
      gradientColors = colorList.map((e) => e.withOpacity(0.4)).toList();
    }
    return GestureDetector(
      onTap: () {
        IntimateCardSendPersonPage.show(context, relationInfo,
            finishBindCard: widget.finishBindCard);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 6.dp, bottom: 6.dp),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.dp),
            gradient: LinearGradient(
              colors: gradientColors,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    relationInfo.name,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 16.dp,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (relationInfo.desc.isNotEmpty)
                    Text(
                      relationInfo.desc,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12.dp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            R.img(Assets.personaldata$gift_wall_ic_next_webp,
                width: 14, height: 14, color: const Color(0xff617664)),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Future<void> _requestData() async {
    if (_isLoading) return;
    _isLoading = true;
    _cardRelation = await IntimateCardApi.getIntimacyCardRelationList();
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}
