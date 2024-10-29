import 'package:shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:search/slp_src/slp_search_result_item.dart';
import 'package:search/k.dart';
import 'package:search/src/model/pb/generated/pretty_user.pb.dart';

/// 个人靓号扩展信息
class SlpSearchPersonInfoWidget extends StatelessWidget {
  final PrettyInfo data;
  final JointSearchItem item;
  final ItemTapCallback? onFollow;

  const SlpSearchPersonInfoWidget(
      {super.key, required this.data, required this.item, this.onFollow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 72.dp,
            child: Row(
              children: [
                _buildAvatar(data.icon, data.uid, 52.dp),
                SizedBox(
                  width: 12.dp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: Util.width - 200.dp,
                      ),
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.dp,
                            color: R.colors.mainTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 4.dp,
                    ),
                    _buildPrettyId(item.user.prettyId),
                  ],
                ),
                const Spacer(),
                if (data.rid > 0) ...[
                  _buildPlayWithHer(data.rid, data.sex),
                ] else ...[
                  _buildFollowButton(),
                ],
              ],
            ),
          ),
          SizedBox(
            height: 8.dp,
          ),
          Text(
            K.search_pretty_user_info,
            style: TextStyle(
                fontSize: 14.dp,
                fontWeight: FontWeight.w500,
                color: R.colors.mainTextColor),
          ),
          if (!Util.isStringEmpty(data.birthday)) ...[
            SizedBox(
              height: 8.dp,
            ),
            _buildAstro(data.birthday),
          ],
          if (!Util.isStringEmpty(data.sign)) ...[
            SizedBox(
              height: 8.dp,
            ),
            Row(
              children: [
                Text(
                  K.search_pretty_user_sign,
                  style: TextStyle(
                      fontSize: 12.dp,
                      color: R.colors.mainTextColor.withOpacity(0.4)),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 110.dp),
                  child: Text(
                    data.sign,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12.dp,
                        color: R.colors.mainTextColor.withOpacity(0.4)),
                  ),
                ),
              ],
            ),
          ],
          if (!Util.isCollectionEmpty(data.tags)) ...[
            SizedBox(
              height: 7.dp,
            ),
            Row(
              children: [
                Text(
                  K.search_pretty_user_tag([Util.getSexDesc(data.sex)]),
                  style: TextStyle(
                      fontSize: 12.dp, color: R.colors.thirdTextColor),
                ),
                _buildTags(data.tags),
              ],
            ),
          ],
          if (!Util.isCollectionEmpty(data.photos)) ...[
            SizedBox(
              height: 16.dp,
            ),
            _buildPersonImage(data.photos),
          ],
          if (!Util.isCollectionEmpty(data.girlsGroup)) ...[
            SizedBox(
              height: 16.dp,
            ),
            Text(
              data.sex == 1
                  ? K.search_pretty_user_boys
                  : K.search_pretty_user_sisters,
              style: TextStyle(
                  fontSize: 14.dp,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8.dp,
            ),
            _buildSisters(data.girlsGroup),
          ],
        ],
      ),
    );
  }

  Widget _buildFollowButton() {
    bool followed =
        item.user.follow != JointSearchFollowType.FollowTypeNotFollow;

    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: followed
            ? R.colors.mainTextColor.withOpacity(0.3)
            : R.colors.mainBrandColor,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
            width: followed ? 2.0 : 0.0, color: const Color(0x0F313131)),
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          if (!followed) onFollow?.call(item);
        },
        child: Text(
          followed ? K.search_followed : K.search_follow,
          style: followed
              ? TextStyle(
                  color: const Color(0xFF212121).withOpacity(0.4),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)
              : const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildAvatar(String icon, int uid, double size) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(System.context, uid);
      },
      child: CommonAvatar(
        path: icon,
        size: size,
        shape: BoxShape.circle,
      ),
    );
  }

  /// 找他/她玩
  Widget _buildPlayWithHer(int rid, int sex) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(System.context, rid);
      },
      child: Container(
        width: 86.dp,
        height: 32.dp,
        decoration: BoxDecoration(
          color: R.colors.mainBrandColor,
          borderRadius: BorderRadius.circular(16.dp),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RepaintBoundary(
              child: R.img('ic_room_live.webp',
                  color: Colors.white,
                  package: ComponentManager.MANAGER_RANK,
                  width: 10.dp,
                  height: 10.dp),
            ),
            SizedBox(
              width: 4.dp,
            ),
            Text(
              K.search_pretty_user_play_with_her([Util.getSexDesc(sex)]),
              style: TextStyle(
                  fontSize: 14.dp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  /// 星座
  Widget _buildAstro(String birthday) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    String astro = manager.getConstellationByBirthday(birthday);

    if (astro.isNotEmpty) {
      return Text(
        K.search_pretty_user_play_with_astro([astro]),
        style: TextStyle(
            fontSize: 12.dp, color: R.colors.mainTextColor.withOpacity(0.4)),
      );
    }

    return const SizedBox.shrink();
  }

  /// 靓号信息
  Widget _buildPrettyId(String prettyId) {
    return Container(
      constraints: BoxConstraints(maxWidth: Util.width - 200.dp),
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 3),
            child: R.img(BaseAssets.shared$ic_id_webp,
                height: 12.dp, fit: BoxFit.fitHeight),
          ),
          NumText(
            prettyId,
            maxLines: 1,
            style: TextStyle(
                fontSize: 12.dp,
                fontWeight: FontWeight.w500,
                color: R.colors.thirdTextColor),
          )
        ],
      ),
    );
  }

  /// 标签
  Widget _buildTags(List<PrettyInfoTag> tags) {
    return SizedBox(
      width: Util.width - 92.dp,
      height: 28.dp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                    start: 10.dp, top: 5.dp, end: 10.dp, bottom: 5.dp),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8.dp),
                ),
                child: Text(
                  tags[index].name,
                  style:
                      TextStyle(fontSize: 12.dp, color: R.colors.mainTextColor),
                ),
              ),
              SizedBox(
                width: 8.dp,
              ),
            ],
          );
        },
      ),
    );
  }

  /// 个人图片
  Widget _buildPersonImage(List<String> images) {
    double width = (Util.width - 16.dp * 2 - 8.dp * 2) / 3;

    return Container(
      height: width,
      alignment: AlignmentDirectional.centerStart,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonAvatar(
                path: images[index],
                size: width,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.dp),
              ),
              SizedBox(
                width: 8.dp,
              ),
            ],
          );
        },
      ),
    );
  }

  /// 闺蜜团
  Widget _buildSisters(List<PrettyInfoGirl> girls) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: girls.map((e) {
        return SizedBox(
          height: 72.dp,
          child: Row(
            children: [
              _buildAvatar(e.icon, e.uid, 52.dp),
              SizedBox(width: 12.dp),
              Container(
                constraints: BoxConstraints(
                  maxWidth: Util.width - 250.dp,
                ),
                child: Text(
                  e.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.dp,
                      fontWeight: FontWeight.w500,
                      color: R.colors.mainTextColor),
                ),
              ),
              SizedBox(
                width: 2.dp,
              ),
              UserSexAndAgeWidget(
                sex: e.sex,
                age: e.age,
              ),
              const Spacer(),
              if (e.rid > 0) _buildPlayWithHer(e.rid, e.sex),
            ],
          ),
        );
      }).toList(),
    );
  }
}
