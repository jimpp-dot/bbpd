import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/match_bean.dart';

class MatchItemWidget extends StatelessWidget {
  final MatchUserItem? item;
  final VoidCallback? onTapCallBack;
  const MatchItemWidget({Key? key, this.item, this.onTapCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(
            context, Util.parseInt(item?.uid ?? 0),
            fromMatch: !(item?.isAccepted ?? false));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 10, bottom: 10),
        child: Row(
          children: [
            CommonAvatar(
              path: item?.icon,
              shape: BoxShape.circle,
              size: 52,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item?.name ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: R.color.mainTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      UserSexAndAgeWidget(
                        sex: Util.parseInt(item?.sex),
                        age: Util.parseInt(item?.age),
                        width: 31,
                        height: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    item?.desText == null
                        ? '${item?.matchMessage}'
                        : '${item?.desText}',
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.secondTextColor,
                    ),
                  ),
                ],
              ),
            ),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  _buildConfirmButton() {
    return GestureDetector(
      onTap: () async {
        if (item?.isAccepted == true) return;
        DialogLoadingController controller = DialogLoadingController();
        controller.show(context: System.context);
        BaseResponse res =
            await MatchRepository.acceptMatch(item?.id ?? '', '1');
        controller.close();
        if (res.success == true && onTapCallBack != null) {
          onTapCallBack!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: _buttonGradientColor(),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsetsDirectional.only(
            start: 12, end: 12, top: 7, bottom: 7),
        child: Text(
          '${item?.buttonTitle}',
          style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
        ),
      ),
    );
  }

  LinearGradient _buttonGradientColor() {
    List<Color> colors;
    if (item?.isAccept == '0') {
      colors = R.color.mainBrandGradientColors;
    } else if (item?.isAccept == '1') {
      colors = [const Color(0xFFD5D8E0), const Color(0xFFE4E7EE)];
    } else {
      colors = [const Color(0xFFD5D8E0), const Color(0xFFE4E7EE)];
    }
    return LinearGradient(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        colors: colors);
  }
}
