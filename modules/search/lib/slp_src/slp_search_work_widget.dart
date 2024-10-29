import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:search/assets.dart';

class SlpSearchWorkWidget extends StatelessWidget {
  final String? workIcon;
  final String? workName;
  final String? userIcon;
  final String? userName;
  final double width;
  final double height;
  final int likeNum;

  const SlpSearchWorkWidget({
    super.key,
    this.workIcon,
    this.workName,
    this.userIcon,
    this.userName,
    this.width = 140,
    this.height = 215,
    this.likeNum = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Rext.themeCardContainer(
      cornerRadius: 16,
      margin: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        bottom: 10,
      ),
      child: Container(
        padding:
            const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
        width: width,
        height: height,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(Util.getRemoteImgUrl(workIcon ?? '')),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workName ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                CommonAvatar(
                  path: userIcon ?? '',
                  size: 22,
                  shape: BoxShape.circle,
                ),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 56),
                  child: Text(
                    userName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: R.colors.mainTextColor.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                R.img(Assets.search$work_like_webp, width: 12, height: 12),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  _buildWorkLikeNum(likeNum),
                  style: TextStyle(
                      fontSize: 14,
                      color: R.colors.mainTextColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _buildWorkLikeNum(int like) {
    String num = '';
    if (like < 1000) {
      num = like.toString();
    } else if (like < 10000) {
      int kLike = (like / 1000).floor();
      num = '${kLike}k';
    } else {
      int wLike = (like / 10000).floor();
      num = '${wLike}w';
    }

    return num;
  }
}
