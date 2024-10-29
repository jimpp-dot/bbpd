import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

/// 黑名单
class BlackListScreen extends StatefulWidget {
  const BlackListScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BlackListScreen(),
      settings: const RouteSettings(name: '/blacklist'),
    ));
  }
}

class _State extends State<BlackListScreen> {
  List _members = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future _load() async {
    String url = "${System.domain}block/blacklist";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (mounted) {
        setState(() {
          Map res = response.response as Map;
          _members = res['data'];
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) Toast.showCenter(context, e.toString());
    }
  }

  Future onRefresh() async {
    await _load();
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    }
    if (_members.isEmpty) {
      return ErrorData(
        error: K.setting_noone_in_blacklist,
        onTap: () {
          _load();
        },
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: ListView.builder(
        itemCount: _members.length,
        itemExtent: 72.0,
        itemBuilder: (BuildContext context, int index) {
          Map item = _members.elementAt(index);
          return InkWell(
            child: Container(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
              ),
              child: _BlackUserItem(data: item, onRefresh: onRefresh),
            ),
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(
                  context, Util.parseInt(item['uid']),
                  refer: const PageRefer('BlackListScreen'));
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(R.string('blacklist_screen_title')),
      body: _buildBody(),
    );
  }
}

typedef OnAwaitRemoveList = Future<void> Function();

class _BlackUserItem extends StatefulWidget {
  final Map? data;
  final OnAwaitRemoveList? onRefresh;

  const _BlackUserItem({Key? key, this.data, this.onRefresh}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlackUserItemState();
  }
}

class _BlackUserItemState extends State<_BlackUserItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipOval(
          child: Image.network(
            "${System.imageDomain}${widget.data?['icon'] ?? ''}!head375",
            width: 56,
            height: 56,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.data?['name'] ?? '',
                  style: R.textStyle.subhead,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(top: 5, end: 6),
                    child: Text(
                      widget.data?['sign'].toString() ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: R.color.secondTextColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await _blockAction(Util.parseInt(widget.data?['uid']));
          },
          child: Container(
            height: 32.0,
            width: 58.0,
            decoration: BoxDecoration(
              color: R.color.mainBrandColor,
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            alignment: Alignment.center,
            child: Text(
              K.setting_remove,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }

  _blockAction(int uid) async {
    BaseResponse response =
        await BaseRequestManager.blockAction(uid.toString(), false);
    if (response.success == true) {
      Fluttertoast.showToast(msg: R.string('operate_completed'));
      if (widget.onRefresh != null) {
        await widget.onRefresh!();
      }
    } else {
      Fluttertoast.showToast(msg: response.msg);
    }
  }
}
