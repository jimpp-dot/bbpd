import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComboFullEffectWidget extends StatefulWidget {
  const ComboFullEffectWidget({super.key});

  @override
  ComboFullEffectWidgetState createState() => ComboFullEffectWidgetState();
}

class ComboFullEffectWidgetState extends State<ComboFullEffectWidget> {
  String? _filePath;

  set filePath(String? path) {
    if (path != _filePath) {
      _filePath = path;
      refreshState();
    }
  }

  String? get currentPath => _filePath;

  refreshState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Util.validStr(_filePath)) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: Util.width,
      height: Util.height,
      child: IgnorePointer(
        child: MultiframeImage.network(
          Util.getRemoteImgUrl(_filePath),
          'combo_large_effect',
          onComplete: () {
            filePath = null;
          },
        ),
      ),
    );
  }
}
