import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

class MatchFilterConditionWidget extends StatefulWidget {
  final VoidCallback? clickFinishButtonCallback;

  const MatchFilterConditionWidget({Key? key, this.clickFinishButtonCallback})
      : super(key: key);

  @override
  _MatchFilterConditionWidgetState createState() =>
      _MatchFilterConditionWidgetState();

  static show(BuildContext context, {VoidCallback? callback}) async {
    await displayModalBottomSheet(
        maxHeightRatio: 1,
        context: context,
        builder: (BuildContext context) {
          return MatchFilterConditionWidget(
            clickFinishButtonCallback: callback,
          );
        });
  }
}

class _MatchFilterConditionWidgetState
    extends State<MatchFilterConditionWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        Config.getInt('match.condition.sex', Session.sex == 1 ? 2 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: R.color.secondBgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: Text(
                      '我想匹配',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: R.color.mainTextColor),
                    )),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 28,
                    height: 28,
                    child: R.img(
                      'match/match_filter_close.webp',
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      width: 12,
                      height: 12,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _buildFilterWidget(),
            const SizedBox(
              height: 50,
            ),
            _buildMatchButton(),
            SizedBox(
              height: Util.iphoneXBottom + 50,
            ),
          ],
        ),
      ),
    );
  }

  _buildFilterWidget() {
    return Row(
      children: [
        // SizedBox(width: 20,),
        // _buildSelectItem(0, '不限'),
        const SizedBox(
          width: 20,
        ),
        _buildSelectItem(2, '女生'),
        const SizedBox(
          width: 20,
        ),
        _buildSelectItem(1, '男生'),
      ],
    );
  }

  _buildMatchButton() {
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.center,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          if (widget.clickFinishButtonCallback != null) {
            widget.clickFinishButtonCallback!();
          }
        },
        child: Container(
          width: 260,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
                colors: [Color(0xFFFF53F3), Color(0xFF3E86FF)],
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.personal_confirm,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  _buildSelectItem(int index, String str) {
    return GestureDetector(
      onTap: () {
        _selectedIndex = index;
        if (mounted) {
          Config.set('match.condition.sex', '$index');
          setState(() {});
        }
      },
      child: Container(
        width: 80,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.red, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          color: _selectedIndex == index ? Colors.white : R.color.thirdBgColor,
        ),
        child: Text(
          str,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _selectedIndex == index
                  ? const Color(0xFF6236FF)
                  : R.color.secondTextColor),
        ),
      ),
    );
  }
}
