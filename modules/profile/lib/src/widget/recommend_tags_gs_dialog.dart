import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import '../../k.dart';

class RecommendTagsGsGroupModel {
  final int id;
  final String? name;
  final List<RecommendTagsGsModel>? gs;

  RecommendTagsGsGroupModel(this.id, this.name, this.gs);

  factory RecommendTagsGsGroupModel.fromJson(Map<String, dynamic> json) {
    return RecommendTagsGsGroupModel(
        Util.parseInt(json['Id']),
        Util.notNullStr(json['Name']),
        (json['GsInfos'] as List)
            .expand((element) => [RecommendTagsGsModel.fromJson(element)])
            .toList());
  }
}

class RecommendTagsGsModel {
  final int id;
  final int uid;
  final String? name;
  final String? icon;
  final String? tagName;

  RecommendTagsGsModel(this.id, this.uid, this.name, this.icon, this.tagName);

  factory RecommendTagsGsModel.fromJson(Map json) {
    return RecommendTagsGsModel(
      Util.parseInt(json['Id']),
      Util.parseInt(json['Uid']),
      Util.notNullStr(json['Name']),
      Util.notNullStr(json['Icon']),
      Util.notNullStr(json['TagName']),
    );
  }
}

class RecommendTagsGsController extends GetxController {
  final List<RecommendTagsGsGroupModel> dataList;
  bool maleStyle = false;
  RecommendTagsGsGroupModel? _selectedItem;
  String? topImg = '';

  RecommendTagsGsController(this.dataList) {
    //默认性别互看
    maleStyle = Session.sex == 1 ? false : true;
  }

  RecommendTagsGsGroupModel? get selectedItem => _selectedItem;

  set selectedItem(RecommendTagsGsGroupModel? item) {
    _selectedItem = item;
    update();
  }

  void sendHi(BuildContext context) async {
    if (_selectedItem == null || _selectedItem!.gs!.isEmpty) {
      return;
    }

    String url = "${System.domain}go/yy/im/sendGreetToMatchGs";
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'send_uids': _selectedItem!.gs!
                .expand((element) => [element.uid])
                .toList()
                .join(','),
          },
          pb: true);
      NormalNull result = NormalNull.fromBuffer(response.bodyBytes);
      if (result.success) {
        Navigator.pop(context);
      } else {
        Toast.showCenter(context, K.profile_list_error);
      }
    } catch (e) {
      Toast.showCenter(context, K.profile_list_error);
    }
  }
}

class RecommendTagsGsPage extends GetView<RecommendTagsGsController> {
  final List<RecommendTagsGsGroupModel> dataList;

  const RecommendTagsGsPage(this.dataList, {super.key});

  static Future<T?> show<T>(BuildContext context, List jsonData) async {
    List<RecommendTagsGsGroupModel>? dataList;
    try {
      dataList = jsonData
          .expand((element) => [RecommendTagsGsGroupModel.fromJson(element)])
          .toList();
    } catch (e) {
      dataList = null;
    }

    if (dataList == null || dataList.isEmpty) {
      return null;
    }

    Tracker.instance.track(TrackEvent.jingxi_pop_display);

    return await showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 250),
        // transitionBuilder: _buildMaterialDialogTransitions,
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Material(
            color: Colors.transparent,
            child: RecommendTagsGsPage(dataList!),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendTagsGsController>(
        init: RecommendTagsGsController(dataList),
        builder: (controller) {
          return Center(
              child: SizedBox(
            width: 335,
            height: 582 + 65,
            child: Stack(alignment: Alignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Stack(
                  children: [
                    Container(
                      width: 335,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: controller.maleStyle
                                ? [
                                    const Color(0xFFEBF2FF),
                                    const Color(0xFF85A3FF)
                                  ]
                                : [
                                    const Color(0xFFFFF0F0),
                                    const Color(0xFFF2D5FF)
                                  ]),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 36,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 42),
                            child: Text(
                              K.profile_recommend_tag_gs_title,
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xFF517CFF)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Expanded(
                              child: Container(
                            width: 303,
                            alignment: Alignment.topCenter,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.separated(
                                  itemBuilder: ((context, index) {
                                    RecommendTagsGsGroupModel item =
                                        controller.dataList[index];
                                    return _buidItem(item, index);
                                  }),
                                  separatorBuilder: ((context, index) {
                                    return const SizedBox(
                                      height: 8,
                                    );
                                  }),
                                  itemCount:
                                      min(3, controller.dataList.length)),
                            ),
                          )),
                          Material(
                            color: Colors.transparent,
                            child: Ink(
                              width: 311,
                              height: 52,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  gradient: LinearGradient(
                                      colors: controller.selectedItem == null
                                          ? R.color.mainBrandGradientColors
                                              .map((e) => e.withOpacity(0.5))
                                              .toList()
                                          : R.color.mainBrandGradientColors,
                                      begin: AlignmentDirectional.centerStart,
                                      end: AlignmentDirectional.centerEnd)),
                              child: InkWell(
                                onTap: () {
                                  controller.sendHi(context);
                                },
                                child: Center(
                                    child: Text(K.profile_recommend_tag_gs_btn,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white.withOpacity(
                                                controller.selectedItem == null
                                                    ? 0.5
                                                    : 1.0),
                                            fontWeight: FontWeight.w500))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    PositionedDirectional(
                        top: 0,
                        end: 0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          color: Colors.black.withOpacity(0.3),
                        )),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${System.imageDomain}static/profile/${controller.maleStyle ? 'recommend_tags_gs_bg_male' : 'recommend_tags_gs_bg_female'}.webp',
                    width: 260,
                    height: 110,
                  )),
            ]),
          ));
        });
  }

  Widget _buidItem(RecommendTagsGsGroupModel item, int columnIndex) {
    bool selected = controller.selectedItem == item;
    return GestureDetector(
      onTap: () {
        controller.selectedItem = item;
      },
      child: Container(
        height: 132,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: GradientBorderBox(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          gradientColors: const [
            Color(0xFF7599FF),
            Color(0xFFE35DFF),
          ],
          borderWidth: selected ? 2 : 0,
          borderRadius: 16,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(item.name ?? '',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4070FF),
                          fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: item.gs == null
                        ? const SizedBox.shrink()
                        : Wrap(
                            spacing: 18,
                            // alignment: WrapAlignment.spaceBetween,
                            children: [
                                ...List.generate(min(3, item.gs!.length),
                                    (index) {
                                  RecommendTagsGsModel gs = item.gs![index];
                                  return SizedBox(
                                    width: 76,
                                    height: 76,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CommonAvatar(
                                          path: gs.icon ?? '',
                                          shape: BoxShape.circle,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.bottomStart,
                                          child: SizedBox(
                                            height: 14,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned.fill(
                                                    child: R.img(
                                                        'profile_recommend_gs_tag_bg_$columnIndex.webp',
                                                        package: ComponentManager
                                                            .MANAGER_PROFILE,
                                                        fit: BoxFit.fill)),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 6),
                                                  child: Text(gs.tagName ?? '',
                                                      style: const TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                })
                              ]),
                  )
                ],
              ),
              PositionedDirectional(
                  top: 4,
                  end: 4,
                  child: Icon(
                    !selected
                        ? Icons.radio_button_unchecked
                        : Icons.check_circle,
                    color: R.color.mainBrandColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
