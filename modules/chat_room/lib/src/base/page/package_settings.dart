import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/roomRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';

class PackageSettingsScreenV2 extends StatefulWidget {
  final int rid;
  final int packageConfig;

  const PackageSettingsScreenV2({super.key, required this.rid, required this.packageConfig});

  static show(int rid, {int? packageConfig}) {
    Navigator.of(Constant.context).push(
      MaterialPageRoute(
        builder: (context) => PackageSettingsScreenV2(rid: rid, packageConfig: packageConfig ?? PackageConfig.startMicWithMoney),
        settings: RouteSettings(
          name: '/PackageSettings/$rid',
          arguments: {'rid': rid, 'config': packageConfig},
        ),
      ),
    );
  }

  @override
  _PackageSettingsScreenStateV2 createState() => _PackageSettingsScreenStateV2();
}

class _PackageSettingsScreenStateV2 extends State<PackageSettingsScreenV2> {
  PackageStatisticType? _statisticType;
  PackageDataType? _dataType;

  @override
  void initState() {
    int packageConfig = widget.packageConfig;
    if (packageConfig < PackageConfig.startMicWithMoney) {
      packageConfig = PackageConfig.startMicWithMoney;
    }

    if (packageConfig == PackageConfig.startMicWithUserCount || packageConfig == PackageConfig.startMicWithMoney) {
      _statisticType = PackageStatisticType.kStatisticMic;
    } else if (packageConfig == PackageConfig.startUserWithMoney || packageConfig == PackageConfig.startUserWithUserCount) {
      _statisticType = PackageStatisticType.kStatisticGift;
    }

    if (packageConfig == PackageConfig.startMicWithUserCount || packageConfig == PackageConfig.startUserWithUserCount) {
      _dataType = PackageDataType.kDataUsers;
    } else if (packageConfig == PackageConfig.startUserWithMoney || packageConfig == PackageConfig.startMicWithMoney) {
      _dataType = PackageDataType.kDataMoney;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppBar(K.room_in_mic_package_statis),
      backgroundColor: R.color.mainBgColor,
      body: SafeArea(
        child: SizedBox(
          height: height - Util.iphoneXBottom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  _buildStatistColumn(),
                  SizedBox(height: 10.dp),
                  _buildDataColumn(),
                ],
              ),
              _buildBottomButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        int config = 0;
        if (_statisticType == PackageStatisticType.kStatisticMic) {
          if (_dataType == PackageDataType.kDataMoney) {
            config = PackageConfig.startMicWithMoney;
          } else {
            config = PackageConfig.startMicWithUserCount;
          }
        } else if (_statisticType == PackageStatisticType.kStatisticGift) {
          if (_dataType == PackageDataType.kDataMoney) {
            config = PackageConfig.startUserWithMoney;
          } else {
            config = PackageConfig.startUserWithUserCount;
          }
        }

        RoomRepository.opSetting(widget.rid, 'package', '$config');
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.only(bottom: 8.dp),
        height: 52.dp,
        width: 335.dp,
        decoration: BoxDecoration(color: R.color.mainBrandColor, borderRadius: BorderRadius.circular(26.dp)),
        child: Text(
          K.appraiser_confirm,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildStatistColumn() {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      color: R.color.mainBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 46.dp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  K.room_package_settings_statist_title,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  K.room_package_settings_statist_method,
                  style: TextStyle(color: R.color.secondTextColor, fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          PackageSettingsOption(
            title: K.room_package_settings_statist_mic,
            tips: K.room_package_settings_statist_mic_tips,
            checked: _statisticType == PackageStatisticType.kStatisticMic,
            callback: () {
              setState(() {
                _statisticType = PackageStatisticType.kStatisticMic;
              });
            },
          ),
          PackageSettingsOption(
            title: K.room_package_settings_statist_gift,
            tips: K.room_package_settings_statist_gift_tips,
            checked: _statisticType == PackageStatisticType.kStatisticGift,
            callback: () {
              setState(() {
                _statisticType = PackageStatisticType.kStatisticGift;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDataColumn() {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      color: R.color.mainBgColor,
      child: Column(
        children: [
          SizedBox(
            height: 46.dp,
            child: Row(
              children: [
                Text(
                  K.room_package_settings_data_title,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  K.room_package_settings_statist_method,
                  style: TextStyle(color: R.color.secondTextColor, fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          PackageSettingsOption(
            title: K.room_package_settings_money,
            tips: K.room_package_settings_money_tips,
            checked: _dataType == PackageDataType.kDataMoney,
            callback: () {
              setState(() {
                _dataType = PackageDataType.kDataMoney;
              });
            },
          ),
          PackageSettingsOption(
            title: K.room_package_settings_user_count,
            tips: K.room_package_settings_user_count_tips,
            checked: _dataType == PackageDataType.kDataUsers,
            callback: () {
              setState(() {
                _dataType = PackageDataType.kDataUsers;
              });
            },
          )
        ],
      ),
    );
  }
}

class PackageSettingsOption extends StatelessWidget {
  final bool checked;
  final String title;
  final String tips;
  final GestureTapCallback callback;

  const PackageSettingsOption({
    super.key,
    required this.title,
    required this.tips,
    required this.callback,
    this.checked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: callback,
      child: SizedBox(
        height: 62.dp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
                ),
                Text(
                  tips,
                  style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
                )
              ],
            ),
            Container(
              margin: EdgeInsetsDirectional.only(end: 15.dp),
              width: 20.dp,
              height: 20.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.dp),
                border: Border.all(width: checked ? 0 : 1.5.dp, color: R.color.thirdTextColor),
                color: checked ? R.color.mainBrandColor : Colors.transparent,
              ),
              child: checked
                  ? R.img(
                      BaseAssets.shared$ic_checkbox_selected_svg,
                      width: 11.dp,
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

enum PackageStatisticType {
  kStatisticMic,
  kStatisticGift,
}

enum PackageDataType {
  kDataMoney,
  kDataUsers,
}

class PackageConfig {
  static const int resume = -1; //恢复
  static const int stop = 0; //关闭
  static const int startGift = 1; //礼物统计中
  static const int pause = 2; //暂停
  static const int startCoin = 3; //金币+礼物统计中
  static const int startDistinct = 4; //礼物+投票统计中，按照uid去重统计
  static const int startCoinAndDistinct = 5; //金币+礼物+礼物投票统计中
  static const int startMicWithMoney = 6; // 按麦位统计以及打赏金额
  static const int startMicWithUserCount = 7; // 按麦位统计以及用户数
  static const int startUserWithMoney = 8; // 按用户统计以打赏金额
  static const int startUserWithUserCount = 9; // 按用户统计以及用户数
}
