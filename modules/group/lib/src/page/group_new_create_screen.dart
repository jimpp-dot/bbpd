import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:group/assets.dart';
import 'package:group/src/repo/group_repo.dart';
import 'package:group/src/util/group_reporter.dart';
import 'package:image_picker/image_picker.dart';

import '../../k.dart';

/// 创建群组
class NewGroupCreateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewGroupCreateState();
  }

  static openCreateGroupScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewGroupCreateScreen(),
    ));
  }

  const NewGroupCreateScreen({Key? key}) : super(key: key);
}

class _NewGroupCreateState extends State<NewGroupCreateScreen> {
  String? _name;

  String? _cover;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        title: Text(
          K.create_group,
          style: R.textStyle.title.copyWith(color: R.colors.mainTextColor),
        ),
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        actions: [
          GestureDetector(
            onTap: _onCreate,
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: kToolbarHeight,
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.group_create,
                style: TextStyle(
                    fontSize: 16,
                    color: R.colors.mainBrandColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  void _onCreate() async {
    if (Util.isStringEmpty(_name)) {
      Fluttertoast.showToast(msg: K.group_name_must_not_empty);
      return;
    }

    if (Util.isStringEmpty(_cover)) {
      Fluttertoast.showToast(msg: K.group_cover_must_not_empty);
      return;
    }

    int groupId = await GroupRepo.createGroup(_cover!, _name!);
    if (groupId > 0) {
      Navigator.pop(context);
      IChatManager chatManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(context, targetId: groupId, type: 'group');
      GroupReporter.createdGroup();
      Tracker.instance.track(TrackEvent.create_group_complete,
          properties: {'uid': Session.uid, "group_id": groupId});
    }
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            K.group_set_group_cover,
            style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 14),
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: R.colors.secondBgColor),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: ImageUpload(
                source: ImageSource.gallery,
                uploadUrl: '${System.domain}upload/image/',
                child: _renderIcon(),
                onComplete: (String name, int width, int height, Map origin) {
                  if (!Util.isStringEmpty(name)) {
                    _cover = name;
                    setState(() {});
                  }
                  return true;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: Util.width,
            height: 0.5,
            color: R.colors.dividerColor,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            K.group_set_group_name,
            style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(
                top: 4, bottom: 12, start: 12, end: 8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: R.colors.secondBgColor),
            child: TextField(
              onChanged: (v) {
                _name = v;
              },
              maxLines: 1,
              maxLength: 20,
              style: TextStyle(color: R.colors.mainTextColor, fontSize: 15),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                hintText: K.group_input_group_name,
                hintStyle:
                    TextStyle(color: R.colors.thirdTextColor, fontSize: 15),
                isDense: true,
                border: InputBorder.none,
              ),
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderIcon() {
    Log.d("_cover = $_cover");
    if (Util.isStringEmpty(_cover)) {
      return Container(
        width: 84,
        height: 84,
        padding: const EdgeInsetsDirectional.only(
            start: 30, end: 30, bottom: 30, top: 30),
        child: R.img(
          Assets.group$group_ic_add_svg,
          package: ComponentManager.MANAGER_GROUP,
          color: R.colors.thirdTextColor.withOpacity(0.2),
          width: 24.0,
          height: 24.0,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        child: CachedNetworkImage(
          imageUrl: "${System.imageDomain}$_cover",
          suffix: '!head150',
          fit: BoxFit.cover,
          width: 84.0,
          height: 84.0,
          fadeOutDuration: const Duration(microseconds: 0),
          fadeInDuration: const Duration(microseconds: 0),
        ),
      );
    }
  }
}
