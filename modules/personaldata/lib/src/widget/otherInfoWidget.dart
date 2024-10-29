import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/a.dart';
import '../../k.dart';
import '../theme/personaldata_themes.dart';

//个人资料其他信息
class OtherInfoWidget extends StatelessWidget {
  final HomeProfileData? profileBean;
  const OtherInfoWidget({Key? key, this.profileBean}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle infoStyle = TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: PersonaldataR.colors.secondTextColor);
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 24.0,
          ),
          Text(
            K.personal_other_info,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: R.colors.mainTextColor),
          ),
          const SizedBox(
            height: 16.0,
          ),
          if (profileBean?.base.uid != Session.uid)
            Text(
              '${K.personaldata_auction_title}：${A.relation_info_array[profileBean?.base.followRelation ?? 0]}',
              style: infoStyle,
            ),
          if (profileBean?.base.uid != Session.uid)
            const SizedBox(
              height: 8.0,
            ),
          Text(
            K.personal_registration_date +
                Utility.formatDateToDay(profileBean?.base.dateline ?? 0),
            style: infoStyle,
          ),
          Container(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
