import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';

import '../model/birthday_list_data_source.dart';
import '../model/birthday_type.dart';
import '../model/generated/gs_birthday.pb.dart';
import 'birthday_reminder_settings_page.dart';
import 'birthday_send_blessings_page.dart';

/// 生日列表

class BirthdayListPage extends StatefulWidget {
  const BirthdayListPage({Key? key}) : super(key: key);

  @override
  State<BirthdayListPage> createState() => _BirthdayListPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayListPage(),
        settings: const RouteSettings(name: '/BirthdayListPage'),
      ),
    );
  }
}

class _BirthdayListPageState extends State<BirthdayListPage> {
  late BirthdayListDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = BirthdayListDataSource();
    _dataSource.type = BirthdayType.BirthdayList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.room_birthday_list,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Tracker.instance.track(TrackEvent.click,
                  properties: {'click_page': 'click_noticesetting'});
              BirthdayReminderSettingsPage.show(context);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 14, bottom: 14, start: 5, end: 10),
              child: R.img(
                'ic_settings.svg',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_PROFILE,
              ),
            ),
          )
        ],
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
        error: BaseK.K.no_data,
        onTap: () {
          _dataSource.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(GsBirthdayListItem item, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD9A4), Color(0xFFFF6356)],
              ),
              image: DecorationImage(
                image: NetworkImage(
                  Util.getRemoteImgUrl(
                      'static/birthday_housekeeper/birthday_list_item_bg.webp'),
                ),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              border: Border.all(color: const Color(0x80FFF0C5), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 16, start: 16, end: 20, bottom: 12),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.white,
                          alignment: AlignmentDirectional.center,
                          child: CommonAvatar(
                            path: item.icon,
                            size: 58,
                            shape: BoxShape.circle,
                            onTap: () {
                              IPersonalDataManager personalDataManager =
                                  ComponentManager.instance.getManager(
                                      ComponentManager.MANAGER_PERSONALDATA);
                              personalDataManager.openImageScreen(
                                  context, item.uid);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${K.room_birthday}${formatDateTime(item.extra.friend.birthday)}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Tracker.instance.track(TrackEvent.click,
                              properties: {'click_page': 'click_sendblessing'});
                          BirthdaySendBlessingsPage.show(
                              context, item.uid, item.extra.friend.birthday);
                        },
                        child: Container(
                          width: 68,
                          height: 32,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors,
                            ),
                          ),
                          child: Text(
                            K.room_to_bless,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 18),
                  child: Text(
                    K.room_friend_how_many_days_birthday(
                        [' ${getBirthday(item.extra.friend.awayBirthday)}']),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  String formatDateTime(int time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    String day = dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    return '$month.$day';
  }

  String getBirthday(int awayBirthday) {
    if (awayBirthday == 0) {
      return '${K.room_today} ';
    } else if (awayBirthday > 0) {
      return '$awayBirthday ${K.room_day_after}';
    } else {
      return '$awayBirthday ${K.room_day_front}';
    }
  }
}
