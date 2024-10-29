import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';

import '../../chatRoomData.dart';
import '../model/birthday_list_data_source.dart';
import '../model/birthday_type.dart';
import '../model/generated/gs_birthday.pb.dart';

/// 房间生日派对列表

class BirthdayPartyPage extends StatefulWidget {
  final ChatRoomData room;

  const BirthdayPartyPage({Key? key, required this.room}) : super(key: key);

  @override
  State<BirthdayPartyPage> createState() => _BirthdayPartyPageState();

  static Future show(BuildContext context, ChatRoomData room) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BirthdayPartyPage(
          room: room,
        ),
        settings: const RouteSettings(name: '/BirthdayPartyPage'),
      ),
    );
  }
}

class _BirthdayPartyPageState extends State<BirthdayPartyPage> {
  late BirthdayListDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = BirthdayListDataSource();
    _dataSource.type = BirthdayType.BirthdayParty;
    _dataSource.rid = widget.room.rid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.room_menu_birthday_party,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: RefreshIndicatorFactory.of(
        onRefresh: () async {
          _dataSource.refresh();
        },
        child: LoadingMoreList(
          ListConfig(
            itemBuilder:
                (BuildContext context, GsBirthdayListItem item, int index) {
              return _buildItem(item, index);
            },
            sourceList: _dataSource,
            indicatorBuilder: _indicatorBuilder,
            lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
          ),
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _dataSource.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _dataSource.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        bgImg: 'bb_null.webp',
        error: K.room_recently_no_one_birthday,
        onTap: () {
          _dataSource.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(GsBirthdayListItem item, int index) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonAvatar(
            path: item.icon,
            size: 52,
            shape: BoxShape.circle,
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid);
            },
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style:
                      TextStyle(color: R.color.mainTextColor, fontSize: 16.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formatDateTime(item.extra.room.birthday),
                      style: TextStyle(
                          color: R.color.mainTextColor.withOpacity(0.6),
                          fontSize: 13.0),
                    ),
                    const SizedBox(width: 32),
                    Container(
                      width: 1,
                      height: 13,
                      color: const Color(0x33313131),
                    ),
                    const SizedBox(width: 22),
                    if (item.extra.room.awayBirthday == 0)
                      Text(
                        K.room_today_birthday,
                        style: const TextStyle(
                            color: Color(0xFFFDA252),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500),
                      )
                    else ...[
                      Text(
                        K.room_distance_birthday,
                        style: TextStyle(
                            color: R.color.mainTextColor.withOpacity(0.6),
                            fontSize: 13.0),
                      ),
                      Text(
                        ' ${item.extra.room.awayBirthday} ',
                        style: const TextStyle(
                            color: Color(0xFFFDA252),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        K.room_day,
                        style: TextStyle(
                            color: R.color.mainTextColor.withOpacity(0.6),
                            fontSize: 13.0),
                      ),
                    ]
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDateTime(int time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    String day = dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    return K.room_birthday_month_day([month, day]);
  }
}
