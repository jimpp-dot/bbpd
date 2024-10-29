import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:personaldata/src/page/imageModify.dart';
import '../../k.dart';
import '../theme/personaldata_themes.dart';

class InterestWidget extends StatelessWidget {
  final HomeProfileData? profileBean;
  final int uid;
  final bool aboutMe;
  final VoidCallback? toImageModifyScreen;

  const InterestWidget(
      {Key? key,
      this.profileBean,
      this.uid = 0,
      this.aboutMe = false,
      this.toImageModifyScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildInterest();
  }

  bool get isSelf {
    return Session.uid == profileBean?.base.uid;
  }

  Widget _buildInterest() {
    List<PersonalTagModel> tags = [];
    if (aboutMe) {
      if (Util.validList(profileBean?.tag.tags)) {
        for (var element in profileBean!.tag.tags) {
          tags.add(
              PersonalTagModel(element.id.toString(), '', element.name, false));
        }
      }

      //添加一个'添加标签'
      if (isSelf &&
          (tags.isEmpty ||
              (tags.length < MAX_TAG_NUM && tags.last.id != '-1'))) {
        PersonalTagModel addTag =
            PersonalTagModel('-1', '', K.personal_add_tag, false);
        tags.add(addTag);
      }
    } else {
      if (Util.validList(profileBean?.tag.friendTags)) {
        for (var element in profileBean!.tag.friendTags) {
          tags.add(
              PersonalTagModel(element.id.toString(), '', element.name, false));
        }
      }

      //添加一个'添加标签'
      if (isSelf &&
          (tags.isEmpty ||
              (tags.length < MAX_TAG_NUM && tags.last.id != '-1'))) {
        PersonalTagModel addTag =
            PersonalTagModel('-1', '', K.personal_add_tag, false);
        tags.add(addTag);
      }
    }

    String personal = BaseK.K.common_he;
    if (profileBean?.base.uid == Session.uid) {
      personal = BaseK.K.common_me;
    } else {
      if (profileBean?.base.sex == 2) {
        personal = BaseK.K.common_she;
      }
    }

    String buildTagTrailText() {
      if (isSelf) {
        return ' ${tags.last.id == '-1' ? (tags.length - 1).toString() : tags.length.toString()}/$MAX_TAG_NUM';
      }

      return '';
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 24.0,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: Text(
              (aboutMe
                      ? (K.personal_about + personal)
                      : (K.personal_hope_meet)) +
                  buildTagTrailText(),
              style: TextStyle(
                  fontSize: 14,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Wrap(
            runSpacing: 6.0,
            spacing: 12,
            children: tags.map((item) {
              PersonalTagModel config = item;
              return IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                    start: 15.0,
                    end: 15.0,
                  ),
                  height: 32.5,
                  decoration: BoxDecoration(
                      // color: config.id == '-1' ? PersonaldataR.colors.tagAddBgColor : R.colors.tagBgColor,
                      // color: config.id == '-1' ? PersonaldataR.colors.tagAddBgColor : R.colors.tagBgColor,
                      // border: Border.all(
                      //     width: (config.id == '-1' && !darkMode) ? 0 : 0.5,
                      //     color: config.id == '-1'
                      //         ? (darkMode ? PersonaldataR.colors.tagBorderColor : Colors.transparent)
                      //         : PersonaldataR.colors.tagBorderColor),

                      color: Colors.transparent,
                      border: Border.all(
                          width: 0.5,
                          color: PersonaldataR.colors.tagBorderColor),
                      borderRadius: BorderRadius.circular(17)),
                  alignment: Alignment.center,
                  child: config.id == '-1'
                      ? GestureDetector(
                          child: Row(
                            children: [
                              Rext.autoStyleImg(
                                'icon_tag_add.webp',
                                width: 10,
                                height: 10,
                                color: PersonaldataR.colors.tagBorderColor,
                                package: ComponentManager.MANAGER_PERSONALDATA,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                config.name,
                                style: TextStyle(
                                    color: PersonaldataR.colors.tagBorderColor,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          onTap: () {
                            if (toImageModifyScreen != null) {
                              toImageModifyScreen!();
                            }
                          })
                      : Text(
                          config.name,
                          style: TextStyle(
                              color: PersonaldataR.colors.tagBorderColor,
                              fontSize: 12.0),
                        ),
                ),
              );
            }).toList(),
          ),
          Container(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
