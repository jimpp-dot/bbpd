import 'package:flutter/material.dart';

typedef BaseAnimatedWidgetBuilder<T> = Widget Function(
    BuildContext context, T item);

class BaseAnimatedList<T> extends StatefulWidget {
  final Widget? listHeader;
  final BaseAnimatedWidgetBuilder<T> animatedItemBuilder;
  final List<T> listData;
  final ScrollController scrollController;
  final ScrollPhysics? scrollPhysics;

  const BaseAnimatedList(
      {required this.animatedItemBuilder,
      this.listHeader,
      required this.listData,
      required this.scrollController,
      this.scrollPhysics,
      super.key});

  @override
  BaseAnimatedListState<T> createState() => BaseAnimatedListState<T>();
}

class BaseAnimatedListState<T> extends State<BaseAnimatedList<T>> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<T> _list;

  @override
  void initState() {
    super.initState();
    _list = ListModel<T>(
      listKey: _listKey,
      initialItems: widget.listData,
      removedItemBuilder: _buildRemovedItem,
      hasHeader: widget.listHeader != null,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
//    Log.d('_BaseAnimatedListState._buildItem index = $index');
    if (widget.listHeader != null && index == 0) {
      return widget.listHeader!;
    }

    int dataIndex = _getDataIndex(index);
    return CardItem(
      animation: animation,
      item: _list[dataIndex],
      child: widget.animatedItemBuilder(context, _list._items[dataIndex]),
    );
  }

  // Used to build an item after it has been removed from the list. This method is
  // needed because a removed item remains  visible until its animation has
  // completed (even though it's gone as far this ListModel is concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
      T item, BuildContext context, Animation<double> animation, int index) {
    return CardItem<T>(
      animation: animation,
      item: item,
      child: widget.animatedItemBuilder(context, item),
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  int _getDataIndex(int index) {
    return widget.listHeader == null ? index : index - 1;
  }

  int _getRealLength() {
    return widget.listHeader == null ? _list.length : _list.length + 1;
  }

  int getDataLength() {
    return _list.length;
  }

  List<T> getDataList() {
    return _list._items;
  }

  // Insert the "next item" into the list model.
  void insert(int index, T item) {
    _list.insert(index, item);
  }

  // Remove the selected item from the list model.
  void remove(int index) {
    _list.removeAt(index);
    setState(() {});
  }

  void removeLast() {
    _list.removeLast();
    setState(() {});
  }

  void update(int index, T item) {
    _list.update(index, item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: AnimatedList(
          controller: widget.scrollController,
          physics: widget.scrollPhysics,
          key: _listKey,
          initialItemCount: _getRealLength(),
          itemBuilder: _buildItem,
        ),
      ),
    );
  }
}

/// Keeps a Dart List in sync with an AnimatedList.
///
/// The [insert] and [removeAt] methods apply to both the internal list and the
/// animated list that belongs to [listKey].
///
/// This class only exposes as much of the Dart List API as is needed by the
/// sample app. More list methods are easily added, however methods that mutate the
/// list must make the same changes to the animated list in terms of
/// [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<T> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    required this.hasHeader,
    required List<T> initialItems,
  })  : assert(removedItemBuilder != null),
        _items = initialItems;

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<T> _items;
  final bool hasHeader;

  AnimatedListState? get _animatedList => listKey.currentState;

  int _getPositionIndex(int index) {
    return hasHeader ? index + 1 : index;
  }

  void insert(int index, T item) {
    _items.insert(index, item);
    _animatedList?.insertItem(_getPositionIndex(index));
  }

  T? removeAt(int index) {
    int positionIndex = _getPositionIndex(index);
    if (_items.isEmpty || index >= _items.length || index < 0) {
      return null;
    }

    final T removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList?.removeItem(positionIndex,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(
            removedItem, context, animation, positionIndex);
      }, duration: const Duration(milliseconds: 100));
    }
    return removedItem;
  }

  T? removeLast() {
    if (_items.isNotEmpty) {
      return removeAt(_items.length - 1);
    }
    return null;
  }

  void update(int index, T item) {
    _items[index] = item;
    _animatedList?.setState(() {});
  }

  int get length => _items.length;

  T operator [](int index) => _items[index];

  int indexOf(T item) => _items.indexOf(item);
}

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value. The text is displayed in bright green if selected is true.
/// This widget's height is based on the animation parameter, it varies
/// from 0 to 128 as the animation varies from 0.0 to 1.0.
class CardItem<T> extends StatelessWidget {
  const CardItem({
    super.key,
    required this.child,
    required this.animation,
    this.onTap,
    required this.item,
  }) : assert(item != null);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final T item;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
//            height: 128.0,
            child: child,
          ),
        ),
      ),
    );
  }
}
