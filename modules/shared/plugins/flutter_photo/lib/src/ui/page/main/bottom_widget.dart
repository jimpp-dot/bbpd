part of '../photo_main_page.dart';

class _BottomWidget extends StatefulWidget {
  final ValueChanged<AssetPathEntity> onGalleryChange;

  final Options options;

  final I18nProvider provider;

  final SelectedProvider selectedProvider;

  final String galleryName;

  final GalleryListProvider galleryListProvider;
  final VoidCallback? onTapPreview;

  const _BottomWidget({
    Key? key,
    required this.onGalleryChange,
    required this.options,
    required this.provider,
    required this.selectedProvider,
    this.galleryName = "",
    required this.galleryListProvider,
    this.onTapPreview,
  }) : super(key: key);

  @override
  __BottomWidgetState createState() => __BottomWidgetState();
}

class __BottomWidgetState extends State<_BottomWidget> {
  Options get options => widget.options;

  I18nProvider get i18nProvider => widget.provider;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 14.0, color: options.textColor);
    const textPadding = EdgeInsets.symmetric(horizontal: 16.0);
    return Container(
      color: options.themeColor,
      child: SafeArea(
        bottom: true,
        top: false,
        child: SizedBox(
          height: 52.0,
          child: Row(
            children: <Widget>[
              TextButton(
                onPressed: _showGallerySelectDialog,
                child: Container(
                  alignment: Alignment.center,
                  height: 44.0,
                  padding: textPadding,
                  child: Text(
                    widget.galleryName,
                    style: textStyle.copyWith(color: options.textColor),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              TextButton(
                onPressed: widget.onTapPreview,
                child: Container(
                  height: 44.0,
                  alignment: Alignment.center,
                  padding: textPadding,
                  child: Text(
                    i18nProvider.getPreviewText(
                        options, widget.selectedProvider),
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showGallerySelectDialog() async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (ctx) => ChangeGalleryDialog(
        galleryList: widget.galleryListProvider.galleryPathList,
        i18n: i18nProvider,
        options: options,
      ),
    );

    if (result != null) widget.onGalleryChange.call(result);
  }
}
