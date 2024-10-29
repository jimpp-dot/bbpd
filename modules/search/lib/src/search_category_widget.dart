import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search/k.dart';

import 'model/search_category_controller.dart';

class SearchCategoryWidget extends StatelessWidget {
  const SearchCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SearchCategoryController>(SearchCategoryController());
    return GetBuilder<SearchCategoryController>(
      builder: (controller) {
        if (Session.showSkill && controller.hasCategory) {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              _buildSingleCategory(context, controller.games, K.search_games),
              if (!Util.isVerify)
                _buildSingleCategory(context, controller.funs, K.search_fun),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSingleCategory(
      BuildContext context, List? items, String categoryName) {
    if (items != null && items.isNotEmpty) {
      List<Widget> widgets = [];
      String navUrl =
          categoryName == K.search_games ? '/list/game' : '/list/funs';

      for (var item in items) {
        widgets.add(_buttonItem(context, item, navUrl));
      }

      return Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsetsDirectional.only(
                top: categoryName == K.search_games ? 20 : 2,
                bottom: 10.0,
                start: 20.0),
            child: Text(
              categoryName,
              style: TextStyle(
                  fontSize: 15.0,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(0.0),
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 12.0,
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1.2,
              children: items
                  .map((item) => _buttonItem(
                      context,
                      item,
                      categoryName == K.search_games
                          ? '/list/game'
                          : '/list/funs'))
                  .toList(),
            ),
          )
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buttonItem(BuildContext context, Map item, String navUrl) {
    return GestureDetector(
      onTap: () => _onTapCategoryItem(item, navUrl, context),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 48.0,
                margin: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                child: CommonAvatar(
                  path: item['icon'],
                  size: 48,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ],
          ),
          Text(
            item['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
          )
        ],
      ),
    );
  }

  _onTapCategoryItem(Map item, String navUrl, BuildContext context) {
    IRankManager? rankManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
    if (rankManager == null) return;

    Tracker.instance.track(TrackEvent.search_hot_click,
        properties: {'tab': '${item['name'] ?? ''}'});
  }
}
