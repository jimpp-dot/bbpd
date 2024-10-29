## 3.1.1

* fix closeToTrailing issue. extended_list#6.

## 3.1.0

* add autoRefresh (whether auto call sourceList.refresh when first load).
  
## 3.0.1

* Fix issue that lastChildLayoutType is not work for Sliver.

## 3.0.0

* breaking change: fix typo(fullCrossAxisExtend => fullCrossAxisExtent)
* breaking change: use extendedListDelegate replace viewportBuilder, collectGarbage, closeToTrailing and waterfallFlowDelegate. You can use WaterfallFlow layout by set extendedListDelegate to SliverWaterfallFlowDelegateWithFixedCrossAxisCount or SliverWaterfallFlowDelegateWithMaxCrossAxisExtent.

## 2.0.0

* Fix analysis_options
* Support ScrollViewKeyboardDismissBehavior(breaking change 1.17.0)
* Support DragStartBehavior

## 1.0.5

* Web support

## 1.0.4

* Issues:
  Fix issue about setState throw exception

* Improve:
  Remove io.platform to support web

## 1.0.3

* Issues:
  Fix issue about empty sliver list throw exception

## 1.0.2

* Issues:
  Fix issue about LoadingMoreCustomScrollView miss slivers

## 1.0.1

* Features:
  Support SliverFixedExtentList

* Breaking change:
  Change values of IndicatorStatus to lowercase

* Improve:
  Extract core codes to loading_more_list_library

## 1.0.0

* Features:
  Support WaterfallFlow
  Support to layout no more item as foot
  Support to track collect garbage
  Support to track viewport indexes
  Support to layout close to trailing

* Issues:
  Fix issue about reverse is true with LoadingMoreCustomScrollView

## 0.3.7

* set list StreamBuilder's initialData
* index range check for LoadingMoreBase

## 0.3.4

* set notifyStateChanged default value: false
  clear list when notifyStateChanged is true.

## 0.2.7

* add notifyStateChanged parameter for LoadingMoreBase's refresh method to notify state changed or not
  (you can not rebuild ui before complete refresh)

## 0.2.6

* fix LoadingMoreList not listen onScrollNotification
* add onScrollNotification listen call back for LoadingMoreList and LoadingMoreCustomScrollView

## 0.1.9

* update CustomIndicatorDemo in case sliver indicator.

## 0.1.8

* export 'src/glow_notification_widget.dart'.

## 0.1.7

* add GlowNotificationWidget for overscroll glow.

## 0.1.6

* add isloadMoreAction parameter for LoadData method.

## 0.1.5

* fix issue about full screen status in IndicatorWidget

## 0.1.4

* make all loading_more_list darts as library loading_more_list

## 0.1.3

* fix issue about IndicatorWidget.

## 0.1.2

* Add FullScreenError status.
* Fix issues for sliver list in NestedScrollView.
* Add NestedScrollView demo for loading more list

## 0.1.1

* Correct try again when it has error.

## 0.1.0

* Upgrade Some Commments.

## 0.0.1

* Initial Open Source release.

