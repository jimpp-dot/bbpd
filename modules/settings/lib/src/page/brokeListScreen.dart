import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import 'package:settings/src/model/setting_repository.dart';

/// 公会列表
class BrokeListScreen extends StatefulWidget {
  const BrokeListScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<BrokeListScreen> {
  final List<BrokerItem> _brokers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future _load() async {
    String url = "${System.domain}broker/h5list";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (response.error == null) {
        Map res = response.response as Map;

        if (res['success'] == true) {
          List? data = res['data'];
          if (data != null && data.isNotEmpty) {
            for (var element in data) {
              BrokerItem brokerItem = BrokerItem.fromJson(element);
              _brokers.add(brokerItem);
            }
          }
        }
      }
    } catch (e) {
      if (mounted) Toast.showCenter(context, e.toString());
    }
    _loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future onRefresh() async {
    setState(() {
      _loading = true;
    });
    await _load();
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    }
    if (_brokers.isEmpty) {
      return ErrorData(
        error: K.settings_no_recommend_broker,
        onTap: () {
          onRefresh();
        },
      );
    }

    return ListView.builder(
      itemCount: _brokers.length,
      itemExtent: 127.0, //115+12
      itemBuilder: (BuildContext context, int index) {
        BrokerItem item = _brokers[index];
        return InkWell(
          child: Container(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0,
            ),
            margin: const EdgeInsetsDirectional.only(bottom: 12.0),
            child: _BrokeItemWidget(item: item, onRefresh: onRefresh),
          ),
          onTap: () {
            // IPersonalDataManager personalDataManager =
            //     ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
            // personalDataManager.openImageScreen(context, Util.parseInt(item['uid']), refer: PageRefer('BlackListScreen'));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsetsDirectional.only(
            start: 20.0,
            end: 20.0,
            top: 25.0,
            bottom: 9.0,
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            K.settings_recommend_broker,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: _buildBody(),
        ),
      ],
    );
  }
}

typedef OnAwaitRemoveList = Future<void> Function();

class _BrokeItemWidget extends StatefulWidget {
  final BrokerItem? item;
  final OnAwaitRemoveList? onRefresh;

  const _BrokeItemWidget({Key? key, this.item, this.onRefresh})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BrokeItemWidgetState();
  }
}

class _BrokeItemWidgetState extends State<_BrokeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.item?.bName ?? '',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: R.color.mainTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.item?.bType ?? '',
                            style: TextStyle(
                                fontSize: 12.0, color: R.color.secondTextColor),
                          ),
                          Container(
                            width: 6.0,
                          ),
                          Text(
                            K.settings_broker_level(
                                ['${widget.item?.bLevel ?? ''}']),
                            style: TextStyle(
                                fontSize: 12.0, color: R.color.secondTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await SettingRepository.brokerJoin(widget.item?.bId);
                  },
                  child: Container(
                    height: 32.0,
                    width: 58.0,
                    decoration: BoxDecoration(
                      color: R.color.mainBrandColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      K.settings_broker_join,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 12.0,
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: R.color.dividerColor,
            margin: const EdgeInsetsDirectional.only(
                start: 16.0, end: 16.0, top: 3.0),
          ),
          SizedBox(
            height: 50.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 16.0,
                ),
                ClipOval(
                  child: Image.network(
                    widget.item?.icon ?? '',
                    width: 32,
                    height: 32,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.item?.name ?? '',
                          style: TextStyle(
                              fontSize: 12.0, color: R.color.secondTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'ID：${widget.item?.uid ?? ''}',
                          style: TextStyle(
                              fontSize: 12.0, color: R.color.secondTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    IChatManager chatManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_CHAT);
                    chatManager.openUserChatScreen(
                      context,
                      type: 'private',
                      targetId: widget.item?.uid ?? 0,
                      title: widget.item?.name ?? '',
                    );
                  },
                  child: Container(
                    height: 36.0,
                    alignment: Alignment.center,
                    child: Text(
                      K.settings_contact_broker_creator,
                      style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 12.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BrokerItem {
  final int uid; //用户id
  final String name; //用户名称
  final String icon; //用户头像
  final int bId; //公会id
  final String bName; //公会名称
  final String bType; //公会类型
  final int bLevel; //公会等级

  BrokerItem.fromJson(Map json)
      : uid = Util.parseInt(json['uid'], 0),
        name = '${json['uname']}',
        icon = '${json['uicon']}',
        bId = Util.parseInt(json['bid'], 0),
        bName = '${json['ghname']}',
        bType = '${json['types']}',
        bLevel = Util.parseInt(json['level'], 0);
}
