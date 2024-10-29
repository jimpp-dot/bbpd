import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';

/// 动态点赞列表
class MomentLikesScreen extends StatefulWidget {
  final int topicUid;
  final int topicId;

  static Future openMomentLikesScreen(BuildContext context,
      {Key? key, required int topicUid, required int topicId}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MomentLikesScreen(
              key: key, topicUid: topicUid, topicId: topicId);
        },
        settings: const RouteSettings(name: '/moment_likes_screen'),
      ),
    );
  }

  const MomentLikesScreen(
      {super.key, required this.topicUid, required this.topicId});

  @override
  _MomentLikesScreenState createState() => _MomentLikesScreenState();
}

class _MomentLikesScreenState extends State<MomentLikesScreen> {
  bool _loading = true;

  String? _errorMessage;

  List<LikeListUser> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    LikesResponse response =
        await Api.getLikeList(widget.topicId, widget.topicUid);
    if (response.success == true) {
      _data = response.likes;
    } else {
      _errorMessage = response.msg;
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        (!_loading && _errorMessage == null)
            ? '${_data == null ? 0 : _data.length}人觉得赞'
            : '',
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
      );
    }

    if (_data.isEmpty) {
      return EmptyWidget(
          desc: K.moment_no_likes, textColor: R.colors.secondTextColor);
    }

    return RefreshIndicatorFactory.of(
      onRefresh: () => _loadData(),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _data.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _LikeItem(
              likeBean: _data[index],
            );
          },
        ),
      ),
    );
  }
}

class _LikeItem extends StatefulWidget {
  final LikeListUser likeBean;

  const _LikeItem({required this.likeBean});

  @override
  __LikeItemState createState() => __LikeItemState();
}

class __LikeItemState extends State<_LikeItem> {
  _onFollowTap() async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    if (widget.likeBean.isfollow == 0) {
      NormalNull response = await BaseRequestManager.onFollow(
          widget.likeBean.uid.toString(),
          refer: 'like_list');
      if (response.success) {
        widget.likeBean.isfollow = 1;
        _refresh();
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
        _refresh();
      }
    } else {
      NormalNull response =
          await BaseRequestManager.unFollow(widget.likeBean.uid.toString());
      if (response.success) {
        widget.likeBean.isfollow = 0;
        _refresh();
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
        _refresh();
      }
    }
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _gotoImageScreen(context),
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            end: 20, start: 20, top: 12, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RoundNetIcon(url: widget.likeBean.userIcon, size: 52),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 4),
                  Text(
                    widget.likeBean.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: R.colors.mainTextColor, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  UserSexAndAgeWidget(
                    sex: widget.likeBean.sexInt,
                    age: widget.likeBean.age,
                  ),
                ],
              ),
            ),

            /// 关注按钮
            _buildFollow(),
          ],
        ),
      ),
    );
  }

  /// 关注按钮
  Widget _buildFollow() {
    if (widget.likeBean.uid != Session.uid) {
      return Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: GestureDetector(
          onTap: _onFollowTap,
          child: Container(
            width: 50,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: widget.likeBean.isfollow == 0
                      ? const Color(0xFF9EFF4E)
                      : Colors.white),
              borderRadius: BorderRadius.circular(13),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.likeBean.isfollow == 0
                      ? K.moment_attention
                      : K.moment_already_follow,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  _gotoImageScreen(BuildContext context) async {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, widget.likeBean.uid,
        refer: const PageRefer('MomentLikesScreen'));
  }
}
