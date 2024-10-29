import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import '../../k.dart';
import 'package:shared/k.dart' as CoreK;
import 'dart:math' as math;

class PersonalityLbsController extends GetxController {
  DataRsp? _data;
  TagCategoryModel? _selectedType;
  final List<PersonalTagModel> _selectedLbs = [];

  List<TagCategoryModel>? get lbs {
    if (_data == null || !(_data!.success == true)) {
      return null;
    }

    return _data!.data;
  }

  set setSelectedType(TagCategoryModel? tag) {
    _selectedType = tag;
    update();
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    String url = "${System.domain}go/yy/tag/getGsMatchTag";
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: true, formatJson: true);
      //Map res = response.value();
      _data =
          DataRsp<List<TagCategoryModel>?>.fromXhrResponse(response, (json) {
        if (json is List) {
          List<TagCategoryModel> tags =
              Util.parseList(json, (e) => TagCategoryModel.fromJson(e));
          return tags;
        }
        return null;
      });
    } catch (e) {
      _data = DataRsp(msg: e, success: false);
    }
    update();
  }

  void confirmTags(BuildContext context) async {
    if (_selectedType == null || _selectedLbs.isEmpty) {
      return;
    }

    String url = "${System.domain}go/yy/tag/setGsMatchTag";
    try {
      List<String> tags = [];
      for (var element in _selectedLbs) {
        tags.add(element.id);
      }
      XhrResponse response = await Xhr.post(
          url, {'tag': _selectedType!.id, 'tags': tags.join(',')},
          pb: true);
      NormalNull result = NormalNull.fromBuffer(response.bodyBytes);
      if (result.success) {
        Session.clearShowGsTags();
        Navigator.pop(context);
      } else {
        Toast.showCenter(
            context, result.msg.isNotEmpty ? result.msg : K.profile_list_error);
      }
    } catch (e) {
      Toast.showCenter(context, K.profile_list_error);
    }
  }

  void selectItem(PersonalTagModel lb) {
    bool select = !_selectedLbs.contains(lb);

    if (_selectedLbs.length == 3 && select) {
      return;
    }
    if (select) {
      _selectedLbs.add(lb);
    } else {
      _selectedLbs.remove(lb);
    }
    update();
  }
}

class PersonalityLbsDialog extends GetView<PersonalityLbsController> {
  const PersonalityLbsDialog({super.key});

  static Future<T?> show<T>(BuildContext context) async {
    Tracker.instance.track(TrackEvent.tag_pop_display);

    return await showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 250),
        transitionBuilder: _buildMaterialDialogTransitions,
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return const Material(
            color: Colors.transparent,
            child: PersonalityLbsDialog(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalityLbsController>(
      init: PersonalityLbsController(),
      builder: (controller) {
        return Center(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54.0),
              child: Stack(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      width: 312,
                      height: 380,
                      child: [
                        if (controller.lbs == null)
                          controller._data == null
                              ? const Loading()
                              : ErrorData(error: controller._data!.msg)
                        else
                          controller._selectedType == null
                              ? _buildMenuPage()
                              : _buildTagsPage(context),
                      ][0]),
                  PositionedDirectional(
                      top: 8,
                      end: 8,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ConfirmDialog(
                                title: CoreK.K.base_warm_prompt,
                                content:
                                    K.profile_recommend_tags_dialog_content,
                                negativeButton: NegativeButton(
                                  text: K.profile_close,
                                  onPressed: () {
                                    int count = 0;
                                    Navigator.of(context)
                                        .popUntil((_) => count++ >= 2);
                                  },
                                ),
                                positiveButton: PositiveButton(
                                  text: K.profile_continue_write,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.black.withOpacity(0.3),
                      )),
                  Visibility(
                    visible: controller._selectedType != null,
                    child: PositionedDirectional(
                        top: 8,
                        start: 8,
                        child: IconButton(
                          onPressed: () {
                            controller.setSelectedType = null;
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.black.withOpacity(0.3),
                        )),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller._selectedType == null,
              child: PositionedDirectional(
                top: 0,
                end: 0,
                child: IgnorePointer(
                  child: CachedNetworkImage(
                    width: 312,
                    imageUrl:
                        'static/profile/recommend_tags_dialog_bg.webp.webp',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          ],
        ));
      },
    );
  }

  Widget _buildMenuPage() {
    return Column(
      children: [
        const SizedBox(
          height: 54,
        ),
        Text(K.profile_tags_dialog_title,
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF4070FF),
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            K.profile_tags_dialog_desc,
            style: const TextStyle(fontSize: 14, color: Color(0xFF517CFF)),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ...List.generate(math.min(3, controller.lbs!.length), (index) {
          TagCategoryModel cate = controller.lbs![index];
          return Padding(
            padding: EdgeInsetsDirectional.only(
                start: 40, end: 40, bottom: index == 2 ? 0 : 16),
            child: Material(
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(27),
                  onTap: () {
                    controller.setSelectedType = cate;
                  },
                  child: SizedBox(
                    height: 53,
                    child: Center(
                      child: Text(cate.name,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  Widget _buildTagsPage(BuildContext context) {
    List<PersonalTagModel>? details = controller._selectedType?.detail;
    if (details == null || details.isEmpty) {
      return const EmptyWidget();
    }

    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(controller._selectedType!.name,
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF4070FF),
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 214,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Wrap(
              spacing: 9,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: [
                ...List.generate(details.length, (index) {
                  PersonalTagModel lb = details[index];
                  double opacity =
                      controller._selectedLbs.contains(lb) ? 1.0 : 0.5;
                  return GestureDetector(
                    onTap: () {
                      controller.selectItem(lb);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFF4659FF).withOpacity(opacity),
                                const Color(0xFF7684FF).withOpacity(opacity)
                              ],
                              begin: AlignmentDirectional.centerStart,
                              end: AlignmentDirectional.centerEnd)),
                      width: 88,
                      height: 46,
                      child: Center(
                        child: Text(lb.name ?? '',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Material(
          color: Colors.transparent,
          child: Ink(
            width: 232,
            height: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: LinearGradient(
                    colors: controller._selectedLbs.isEmpty
                        ? R.color.mainBrandGradientColors
                            .map((e) => e.withOpacity(0.5))
                            .toList()
                        : R.color.mainBrandGradientColors,
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd)),
            child: InkWell(
              onTap: () {
                controller.confirmTags(context);
              },
              child: Center(
                  child: Text(
                      K.profile_tags_dialog_btn_confirm(
                          [controller._selectedLbs.length.toString()]),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(
                              controller._selectedLbs.isEmpty ? 0.5 : 1.0),
                          fontWeight: FontWeight.w500))),
            ),
          ),
        )
      ],
    );
  }

  static Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutCubic,
      ),
      child: SlideTransition(
        position: animation
            .drive(Tween(begin: const Offset(0, 0.05), end: Offset.zero)),
        child: ScaleTransition(
          scale: animation.drive(Tween(begin: 0.9, end: 1.0)),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
