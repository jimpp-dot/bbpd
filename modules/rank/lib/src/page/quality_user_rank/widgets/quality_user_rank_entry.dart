import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

import '../views/quality_user_rank_page.dart';

/// 首页优质用户入口

class QualityUserRankEntry extends StatefulWidget {
  const QualityUserRankEntry({super.key});

  @override
  State<QualityUserRankEntry> createState() => _QualityUserRankEntryState();
}

class _QualityUserRankEntryState extends State<QualityUserRankEntry> {
  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.quality_user_entry_exposure,
        properties: {'uid': Session.uid});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: GestureDetector(
        onTap: () {
          QualityUserRankPage.show(context);
          Tracker.instance.track(TrackEvent.quality_user_entry_click,
              properties: {'uid': Session.uid});
        },
        child: R.img(
          Assets.ic_quality_user_webp,
          package: ComponentManager.MANAGER_RANK,
          width: 82,
          height: 32,
        ),
      ),
    );
  }
}
