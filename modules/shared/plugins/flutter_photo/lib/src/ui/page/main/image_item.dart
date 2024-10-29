part of '../photo_main_page.dart';

class ImageItem extends StatelessWidget {
  final AssetEntity entity;

  final Color themeColor;

  final int size;

  final LoadingDelegate loadingDelegate;

  final BadgeDelegate? badgeDelegate;

  final bool pauseLoading;

  const ImageItem({
    Key? key,
    required this.entity,
    required this.themeColor,
    this.size = 64,
    required this.loadingDelegate,
    this.badgeDelegate,
    this.pauseLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List? thumb = ImageLruCache.getData(entity, size);
    if (thumb != null) {
      return _buildImageItem(context, thumb);
    }

    return FutureBuilder<Uint8List?>(
      future: entity.thumbnailDataWithSize(ThumbnailSize(size, size)),
      builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
        Uint8List? futureData = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done &&
            futureData != null) {
          ImageLruCache.setData(entity, size, futureData);
          if (!pauseLoading) {
            return _buildImageItem(context, futureData);
          }
        }
        return _buildLoading(context);
      },
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: loadingDelegate.buildPreviewLoading(
        context,
        entity,
        themeColor,
      ),
    );
  }

  Widget _buildImageItem(BuildContext context, Uint8List data) {
    var image = Image.memory(
      data,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
    Widget badge;
    final badgeBuilder =
        badgeDelegate?.buildBadge(context, entity.type, entity.videoDuration);
    if (badgeBuilder == null) {
      badge = Container();
    } else {
      badge = badgeBuilder;
    }

    return Stack(
      children: <Widget>[
        image,
        IgnorePointer(
          child: badge,
        ),
      ],
    );
  }
}
