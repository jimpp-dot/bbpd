import 'dart:async';
import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

import '../../assets.dart';
import 'horizontal_price_selector.dart';
import 'limit_package_item.dart';
import 'model/time_limit_package_model.dart';

/// 限时礼包
///
class LimitPackageDialog extends StatefulWidget {
  final TimeLimitPackageModel? package;

  const LimitPackageDialog({Key? key, this.package}) : super(key: key);

  @override
  _LimitPackageDialogState createState() => _LimitPackageDialogState();

  static Future<bool> show(
      BuildContext context, TimeLimitPackageModel package) async {
    return await DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return LimitPackageDialog(package: package);
      },
    );
  }
}

class _LimitPackageDialogState extends State<LimitPackageDialog> {
  final List<String> _priceTags = [];

  int _selectedIndex = 0;

  final double _realRadio = 80 / 130;

  @override
  void initState() {
    super.initState();
    widget.package?.packages.forEach((item) {
      _priceTags.add('${_getPrice(item.recharge)}${BaseK.K.base_yuan}');
    });
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            end: 0,
            top: -62,
            child: R.img(
              Assets.limit_package_gift_top_png,
              width: 164,
              height: 74,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 312,
                child: _buildGiftPack(),
              ),
              const SizedBox(height: 15),
              _buildClose()
            ],
          ),
          PositionedDirectional(
            start: -16,
            top: -8,
            child: R.img(
              Assets.limit_package_ic_star_top_png,
              width: 48,
              height: 48,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          PositionedDirectional(
            bottom: 42,
            end: -16,
            child: R.img(
              Assets.limit_package_ic_star_bottom_png,
              width: 44,
              height: 45,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftPack() {
    return Container(
      height: 487,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(Assets.limit_package_bg_gift_webp,
                package: ComponentManager.MANAGER_GIFT),
          ),
        ),
      ),
      padding: const EdgeInsetsDirectional.only(top: 20, start: 8, end: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          const SizedBox(height: 14),
          HorizontalPriceSelector(
            tags: _priceTags,
            selectedIndex: _selectedIndex,
            onPriceSelected: _onPriceSelected,
          ),
          const SizedBox(height: 8),
          Text(
            K.gift_limit_package_tips([(_priceTags[_selectedIndex])]),
            style:
                TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11),
          ),
          const SizedBox(height: 12),
          Container(
            height: 236,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, top: 12, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: _buildItems(),
          ),
          const SizedBox(height: 12),
          _buildBottomBtn(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              widget.package?.introduction ?? '',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        const SizedBox(width: 2),
        R.img(Assets.limit_package_ic_gift_title_png,
            width: 152, height: 35, package: ComponentManager.MANAGER_GIFT),
        const SizedBox(width: 6),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TimerTicker(leftTime: widget.package?.leftDays ?? 0),
            const SizedBox(height: 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 32, height: 0.5, color: const Color(0xFFFFE0ED)),
                const SizedBox(width: 2),
                Text(K.gift_left_time_disappear,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 11)),
                const SizedBox(width: 2),
                Container(
                    width: 32, height: 0.5, color: const Color(0xFFFFE0ED)),
              ],
            )
          ],
        ),
      ],
    );
  }

  void _onPriceSelected(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      setState(() {});
    }
  }

  Widget _buildItems() {
    TimeLimitPackageItem? superPackItem =
        widget.package?.packages[_selectedIndex];

    List<Widget> children = [];
    if (superPackItem?.gifts.isNotEmpty == true) {
      for (int i = 0; i < superPackItem!.gifts.length; i++) {
        children.add(LimitPackageItem(
          data: superPackItem.gifts[i],
          size: 80,
          nameFontSize: 13,
          typeFontSize: 11,
          topTagWidth: 40,
          topTagHeight: 18,
          topTagFontSize: 11,
        ));
      }
    }

    return GridView.count(
      key: GlobalKey(),
      physics: const AlwaysScrollableScrollPhysics(),
      padding:
          const EdgeInsetsDirectional.only(start: 0, end: 0, bottom: 0, top: 0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 0,
      crossAxisSpacing: 12.0,
      childAspectRatio: _realRadio,
      children: children,
    );
  }

  Widget _buildBottomBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openRechargeScreen(context);
      },
      child: Container(
        width: 288,
        height: 48,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFFF4E4E), Color(0xFFFFA879)]),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          BaseK.K.base_charge_now,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildClose() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 2,
              style: BorderStyle.solid),
        ),
        alignment: AlignmentDirectional.center,
        child: R.img(BaseAssets.close_icon_svg,
            width: 20,
            height: 20,
            color: Colors.white,
            package: ComponentManager.MANAGER_BASE_CORE),
      ),
    );
  }

  String _getPrice(int price) {
    return (price / 100).toStringAsFixed(0);
  }
}

class _TimerTicker extends StatefulWidget {
  final int leftTime;

  const _TimerTicker({Key? key, this.leftTime = 0}) : super(key: key);

  @override
  __TimerTickerState createState() => __TimerTickerState();
}

class __TimerTickerState extends State<_TimerTicker> {
  Timer? _timer;

  int _leftTime = 0;

  @override
  void initState() {
    super.initState();
    _leftTime = widget.leftTime;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _leftTime--;
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTimer();
  }

  Widget _buildTimer() {
    int min = 0;
    int sec = 0;
    int hour = 0;
    _leftTime = max(0, _leftTime);
    min = (_leftTime ~/ 60).toInt();
    sec = (_leftTime % 60).toInt();
    hour = (min ~/ 60).toInt();
    min = (min % 60).toInt();
    double padding = 2;
    if (hour > 99) {
      padding = 0;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hour > 99) _buildTimerItem(hour ~/ 100),
        _buildTimerItem(hour % 100 ~/ 10),
        _buildTimerItem(hour % 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: const Text(
            ':',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
        _buildTimerItem(min ~/ 10),
        _buildTimerItem(min % 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: const Text(
            ':',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
        _buildTimerItem(sec ~/ 10),
        _buildTimerItem(sec % 10),
      ],
    );
  }

  Widget _buildTimerItem(int time) {
    return Container(
      width: 16,
      height: 20,
      margin: const EdgeInsetsDirectional.only(end: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              Color(0xFFFF6767),
              Color(0xFFFFA536),
            ]),
      ),
      alignment: AlignmentDirectional.center,
      child: NumText(
        '$time',
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
