import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

class AppreciatorTagWidget extends StatefulWidget {
  final String icon;
  final String label;
  final double? scale;

  const AppreciatorTagWidget(
      {super.key, required this.icon, required this.label, this.scale});

  @override
  State<AppreciatorTagWidget> createState() => _AppreciatorTagWidgetState();
}

class _AppreciatorTagWidgetState extends State<AppreciatorTagWidget> {
  double ratio = 0;
  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;

  @override
  void initState() {
    super.initState();

    getImageSize();
  }

  @override
  dispose() {
    if (_imageStreamListener != null) {
      _imageStream?.removeListener(_imageStreamListener!);
      _imageStreamListener = null;
    }
    super.dispose();
  }

  void getImageSize() async {
    Image imageNetwork = Image(
        image: CachedNetworkImageProvider(Util.getRemoteImgUrl(widget.icon)));
    _imageStream = imageNetwork.image.resolve(const ImageConfiguration());
    _imageStreamListener = ImageStreamListener(
      (ImageInfo info, bool _) {
        ratio = info.image.width / info.image.height;
        if (mounted) {
          setState(() {});
        }
      },
    );
    _imageStream?.addListener(_imageStreamListener!);
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (ratio == 0) {
      child = CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(widget.icon),
        height: 26,
        fit: BoxFit.fitHeight,
      );
    } else {
      child = Container(
        width: ratio * 26,
        height: 26,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                CachedNetworkImageProvider(Util.getRemoteImgUrl(widget.icon)),
            fit: BoxFit.fitHeight,
          ),
        ),
        padding:
            EdgeInsetsDirectional.only(start: _isAppreciator ? 20 : 25, end: 4),
        alignment: AlignmentDirectional.centerStart,
        child: YouSheText(
          widget.label,
          style: TextStyle(
              height: 1.2,
              color: Colors.white,
              fontSize: _isAppreciator ? 9 : 10),
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      );
    }
    return widget.scale == null
        ? child
        : Transform.scale(scale: widget.scale, child: child);
  }

  bool get _isAppreciator => widget.label.contains('鉴赏家');
}
