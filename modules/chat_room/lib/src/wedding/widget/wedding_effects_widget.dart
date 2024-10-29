import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 婚礼特效
class WeddingEffectsWidget extends StatefulWidget {
  const WeddingEffectsWidget(
      {super.key, required this.vapUrl, required this.vapSize});

  final String vapUrl;
  final int vapSize;

  @override
  _WeddingEffectsWidgetState createState() => _WeddingEffectsWidgetState();
}

class _WeddingEffectsWidgetState extends State<WeddingEffectsWidget> {
  @override
  Widget build(BuildContext context) {
    Log.d(
        '_WeddingEffectsWidgetState build vapUrl: ${widget.vapUrl} vapSize: ${widget.vapSize}');
    return VapDisplayWidget(
      vap: Vap(url: widget.vapUrl, size: widget.vapSize),
      onComplete: () => Log.d('WeddingEffectsWidget complete'),
      onError: () => Log.d('WeddingEffectsWidget error'),
    );
  }
}
