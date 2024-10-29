import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/K.dart';

/// 展开更多按钮
class ExpandMoreButton extends StatelessWidget {
  final bool hasMore;

  final VoidCallback? onTap;

  const ExpandMoreButton({Key? key, this.hasMore = true, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    if (hasMore) {
      title = K.personal_cr_load_more;
    } else {
      title = K.personal_cr_load_less;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 96,
        height: 30,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.only(top: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: R.textStyle.medium14
                  .copyWith(fontSize: 13, color: const Color(0xFFFFE735)),
            ),
            const SizedBox(
              width: 2,
            ),
            RotatedBox(
              quarterTurns: hasMore ? 0 : 2,
              child: R.img(
                'collection_room/ic_dropdown.webp',
                package: ComponentManager.MANAGER_PERSONALDATA,
                width: 12,
                height: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
