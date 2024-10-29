import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

/// 新注册用户推荐关注其他用户
class UserRecommend extends StatefulWidget {
  final List data;

  const UserRecommend({Key? key, required this.data}) : super(key: key);

  @override
  _UserRecommendState createState() {
    return _UserRecommendState();
  }

  static Future show(BuildContext context) async {
    String url = '${System.domain}home/newuserRec';
    XhrResponse response = await Xhr.getJson(url);
    Map res = response.value();
    if (response.error == null) {
      if (res['success'] == true) {
        if (res['data'] != null &&
            res['data'] is List &&
            res['data'].isNotEmpty) {
          List data = res['data'];
          for (var item in data) {
            item['selected'] = true;
          }
          await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => UserRecommend(data: data));
        }
      } else {
        Log.d(res['msg'] ?? '');
      }
    }
  }
}

class _UserRecommendState extends State<UserRecommend> {
  _onFollow(_) async {
    List<String> uids = widget.data
        .where((item) => item['selected'] != false)
        .map((item) => item['uid'].toString())
        .toList();
    if (uids.isEmpty) {
      Navigator.pop(context);
      return;
    }
    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': 'recommend_follow',
    });
    NormalNull response = await BaseRequestManager.followAll(uids);
    if (response.success) {
      Toast.show(context, K.followed);
      Navigator.pop(context);
    } else {
      Toast.show(context, response.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: R.color.mainBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: Util.height * 3 / 5,
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              end: 4,
              top: 4,
              child: IconButton(
                padding: const EdgeInsets.all(4),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 10),
                  child: Text(
                    K.base_recommend_for_you,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
//                            mainAxisSpacing: 8,
//                            crossAxisSpacing: 8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Map item = widget.data[index];
                      return _buildItem(item);
                    },
                    itemCount: widget.data.length,
                  ),
                ),
                Container(
                  height: 92,
                  alignment: Alignment.center,
                  child: BaseButton(
                    K.base_one_key_follow,
                    _onFollow,
                    minWidth: 250,
                    height: 48,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Map item) {
    String name = item['name'] ?? '';
    name = name.runes.length <= 6 ? name : '${Util.subString(name, 0, 6)}...';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          if (item['selected'] == null) {
            item['selected'] = true;
          } else if (item['selected'] == true) {
            item['selected'] = false;
          } else if (item['selected'] == false) {
            item['selected'] = true;
          }
        });
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipOval(
                  child: CachedNetworkImage(
                    errorWidgetType: ErrorWidgetType.defaultUserIcon,
                    imageUrl: '${System.imageDomain}${item['icon']}',
                    suffix: '!head150',
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                if (item['selected'] == null || item['selected'] == true)
                  PositionedDirectional(
                    end: 0,
                    bottom: 0,
                    child: R.img(
                      'ic_checkbox_selected.svg',
                      width: 24,
                      height: 24,
                      package: ComponentManager.MANAGER_BASE_CORE,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 3),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.mainTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            UserSexAndAgeWidget(
              sex: Util.parseInt(item['sex']),
              age: Util.parseInt(item['age']),
              width: 31,
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
