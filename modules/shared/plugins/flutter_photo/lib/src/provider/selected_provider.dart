import 'dart:async';

import 'package:photo_manager/photo_manager.dart';

import '../entity/options.dart';

abstract class SelectedProvider {
  List<AssetEntity> selectedList = [];

  int get selectedCount => selectedList.length;

  bool containsEntity(AssetEntity entity) {
    return selectedList.contains(entity);
  }

  int indexOfSelected(AssetEntity entity) {
    return selectedList.indexOf(entity);
  }

  bool isUpperLimit();

  bool addSelectEntity(AssetEntity entity, SelectIntercept? selectIntercept) {
    if (containsEntity(entity)) {
      return false;
    }
    if (selectIntercept != null && !selectIntercept(entity.title ?? '')) {
      return false;
    }
    if (isUpperLimit() == true) {
      return false;
    }
    selectedList.add(entity);
    return true;
  }

  bool removeSelectEntity(AssetEntity entity) {
    return selectedList.remove(entity);
  }

  void compareAndRemoveEntities(List<AssetEntity> previewSelectedList) {
    var srcList = List.of(selectedList);
    selectedList.clear();
    for (var entity in srcList) {
      if (previewSelectedList.contains(entity)) {
        selectedList.add(entity);
      }
    }
  }

  void sure();

  Future checkPickImageEntity() async {
    List<AssetEntity> notExistsList = [];
    for (var entity in selectedList) {
      var exists = await entity.exists;
      if (!exists) {
        notExistsList.add(entity);
      }
    }

    selectedList.removeWhere((e) {
      return notExistsList.contains(e);
    });
  }
}
