import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';

import '../../../k.dart';
import '../club_detail_screen.dart';

/// 推荐圈子
class ClubCircleItemWidget extends StatefulWidget {
  final RecommendCircle data;

  const ClubCircleItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ClubCircleItemState();
  }
}

class _ClubCircleItemState extends State<ClubCircleItemWidget> {
  bool _requesting = false;

  @override
  void initState() {
    super.initState();
  }

  /// 点击加入或退出
  void _onJoinTaped() async {
    if (_requesting) {
      return;
    }
    _requesting = true;
    if (widget.data.joined == false) {
      NormalNull response = await ClubRepo.joinClub(widget.data.id);
      _requesting = false;
      if (response.success && mounted) {
        setState(() {
          widget.data.joined = !widget.data.joined;
        });
      } else {
        Fluttertoast.showToast(msg: response.msg);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => ClubDetailScreen.show(context, widget.data.id),
          child: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 16, bottom: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeader(),
                const SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Text(
                      K.moment_joined_number(
                          [widget.data.joinedNumber.toString()]),
                      style: TextStyle(
                        fontSize: 11,
                        color: R.color.thirdTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    if (widget.data.avatarList.isNotEmpty)
                      UserListWidget(widget.data.avatarList),
                  ],
                ),
                _buildImageList(widget.data.imageList),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        R.img(
          'circle/ic_recommend_circle_name.svg',
          width: 12,
          height: 12,
          package: ComponentManager.MANAGER_MOMENT,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            '${widget.data.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, color: R.color.mainTextColor),
          ),
        ),
        _buildJoinButton(),
      ],
    );
  }

  Widget _buildJoinButton() {
    return GestureDetector(
      onTap: _onJoinTaped,
      child: Container(
        width: 50,
        height: 24,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            colors: widget.data.joined
                ? R.color.darkGradientColors
                : R.color.mainBrandGradientColors,
          ),
        ),
        child: Text(
          widget.data.joined ? K.moment_circle_joined : K.moment_circle_join,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildImageList(List<ImageBean> images) {
    if (Util.isCollectionEmpty(images)) return const SizedBox.shrink();
    //左右20dp固定的，中间的大小和间距动态去算
    double ratio = (Util.width - 40 - 8) / (3 * 109);
    double imageSize = 109 * ratio;

    return Container(
      margin: const EdgeInsetsDirectional.only(top: 8),
      height: imageSize,
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 4,
        childAspectRatio: 1.0,
        children: images.take(3).map((e) => _buildImage(e, imageSize)).toList(),
      ),
    );
  }

  Widget _buildImage(ImageBean bean, double imageSize) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: bean.cover375,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.cover,
      ),
    );
  }
}
