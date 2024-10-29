part of 'moment_item.dart';

/// 剧本杀case
class _JuBenCase extends StatelessWidget {
  final TagsCase tagsCase;
  final EdgeInsetsGeometry? margin;

  const _JuBenCase({required this.tagsCase, this.margin});

  @override
  Widget build(BuildContext context) {
    return _buildCase(context, tagsCase);
  }

  Widget _buildCase(BuildContext context, TagsCase tagsCase) {
    double width = MediaQuery.of(context).size.width - 34.0;
    double height = width * 120 / 341;
    return InkWell(
      onTap: () {
        //todo
        //go to case
      },
      child: Container(
        width: width,
        height: height,
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: R.colors.mainBgColor,
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: CachedNetworkImage(
                width: width,
                height: height,
                imageUrl: System.imageDomain + '${tagsCase.icon}',
                fit: BoxFit.cover,
              ),
            ),
            PositionedDirectional(
              start: 13.0,
              bottom: 12.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  R.img(
                    'ic_case_list_watch.svg',
                    width: 12.0,
                    height: 12.0,
                    package: ComponentManager.MANAGER_MOMENT,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${tagsCase.userCount}',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: R.colors.secondTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  R.img(
                    'ic_case_list_comment.svg',
                    width: 12.0,
                    height: 12.0,
                    package: ComponentManager.MANAGER_MOMENT,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${tagsCase.commentCount}',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: R.colors.secondTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 运营数据
class _TestData extends StatelessWidget {
  final Moment moment;

  const _TestData({required this.moment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${moment.index}===>已曝光:${moment.exposure}  CTR:${moment.ctr} 状态:${moment.recommend == 1 ? '推荐' : '小样'} 推荐分: ${moment.sort_score}',
            maxLines: 10,
            style: TextStyle(fontSize: 10, color: R.colors.secondTextColor),
          ),
          const SizedBox(height: 6),
          Text(
            '动态id:${moment.topicId}',
            style: TextStyle(fontSize: 10, color: R.colors.secondTextColor),
          ),
        ],
      ),
    );
  }
}
