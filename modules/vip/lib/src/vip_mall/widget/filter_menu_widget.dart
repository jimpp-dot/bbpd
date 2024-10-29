import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class FilterMenuWidget extends StatefulWidget {
  final List<String> filterInfo;
  final ValueChanged<Set<String>> onValueChanged;
  final VoidCallback? onHide;

  const FilterMenuWidget(
      {super.key,
      required this.filterInfo,
      required this.onValueChanged,
      this.onHide});

  @override
  State<FilterMenuWidget> createState() => FilterMenuWidgetState();
}

class FilterMenuWidgetState extends State<FilterMenuWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _filterMenuAniController;

  final Set<String> _selected = {};

  double _itemWidth = 104;
  bool _show = false;

  @override
  void initState() {
    super.initState();
    _filterMenuAniController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _filterMenuAniController.addStatusListener(_onStatus);
    _itemWidth = (Util.width - 40 - 2 * 12) / 3;
  }

  @override
  void dispose() {
    _filterMenuAniController.dispose();
    super.dispose();
  }

  _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _show = true;
    } else if (status == AnimationStatus.dismissed) {
      _show = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  void showFilter(Set<String> last) {
    if (_show) return;
    _selected.addAll(last);
    setState(() {
      _show = true;
    });
    _filterMenuAniController.forward();
  }

  void hideFilter() {
    _filterMenuAniController.reverse();
    _selected.clear();
  }

  _onResetTaped() {
    hideFilter();
    _selected.clear();
    widget.onValueChanged(_selected);
  }

  _onConfirmTaped() {
    widget.onValueChanged(Set.from(_selected));
    hideFilter();
  }

  _onItemTaped(String info) {
    if (_selected.contains(info)) {
      _selected.remove(info);
    } else {
      _selected.add(info);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.filterInfo.isEmpty) return const SizedBox.shrink();
    return Stack(
      children: [
        if (_show) ...[
          FadeTransition(
            opacity: _filterMenuAniController,
            child: GestureDetector(
              onTap: () {
                hideFilter();
                widget.onHide;
              },
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _filterMenuAniController,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: _buildFilterMenu(),
          ),
        ]
      ],
    );
  }

  Widget _buildFilterMenu() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(16))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: widget.filterInfo.map((e) => _buildItem(e)).toList(),
          ),
          const SizedBox(height: 16),
          _buildBtn(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildItem(String info) {
    bool isSelect = _selected.contains(info);

    return GestureDetector(
      onTap: () => _onItemTaped(info),
      child: Container(
        height: 48,
        width: _itemWidth,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelect
                ? R.color.mainBrandColor.withOpacity(0.1)
                : R.color.secondBgColor),
        child: Text(
          info,
          style: TextStyle(
              color: isSelect ? R.color.mainBrandColor : R.color.thirdTextColor,
              fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildBtn() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: GestureDetector(
            onTap: _onResetTaped,
            child: Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: R.color.dividerColor, width: 1),
              ),
              height: 48,
              child: Text(
                '重置',
                style: TextStyle(color: R.color.secondTextColor, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 6,
          child: GestureDetector(
            onTap: _onConfirmTaped,
            child: Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 48,
              child: const Text(
                '确认',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
