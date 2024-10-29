import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:profile/assets.dart';
import 'package:profile/src/launch_audio/launch_audio_api.dart';
import 'package:profile/src/launch_audio/launch_audio_play_page.dart';
import 'package:profile/src/model/pb/generated/api_tone.pb.dart';

/// 启动音频列表
class LaunchAudioListPage extends StatefulWidget {
  final String title;
  final int groupId;

  const LaunchAudioListPage({
    super.key,
    required this.title,
    required this.groupId,
  });

  static Future launch(BuildContext context, String title, int groupId) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LaunchAudioListPage(title: title, groupId: groupId);
    }));
  }

  @override
  _LaunchAudioListPageState createState() {
    return _LaunchAudioListPageState();
  }
}

class _LaunchAudioListPageState extends State<LaunchAudioListPage> {
  late LaunchAudioListSource _source;

  @override
  void initState() {
    super.initState();
    _source = LaunchAudioListSource(widget.groupId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        showBack: true,
        toolbarHeight: 44,
        title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: LoadingMoreList<ToneAudio>(
        ListConfig<ToneAudio>(
          sourceList: _source,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsetsDirectional.only(top: 4),
          indicatorBuilder: _indicatorBuilder,
          itemBuilder: (BuildContext context, ToneAudio item, int index) {
            return _renderItem(item, index);
          },
        ),
      ),
    );
  }

  Widget _renderItem(ToneAudio item, int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          LaunchAudioPlayPage.launch(context, item).whenComplete(() {
            if (item.isUse) {
              // 同时只能使用一个，当前使用，其他的置为非使用
              for (ToneAudio audio in _source) {
                if (audio.id != item.id) {
                  audio.isUse = false;
                }
              }
            }
            refresh();
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.nickname,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0x4D000000)),
            ),
            Container(
              width: double.infinity,
              height: 52,
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                children: [
                  CommonAvatar(
                      path: item.icon, size: 32, shape: BoxShape.circle),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      item.hotWord,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xE6000000)),
                    ),
                  ),
                  if (item.isUse)
                    Padding(
                        padding: const EdgeInsetsDirectional.only(start: 45),
                        child: R.img(
                            Assets.profile$launch_audio_ic_selected_webp,
                            width: 16,
                            height: 16)),
                ],
              ),
            ),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: Colors.grey.withOpacity(0.6),
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        fontColor: Colors.grey.withOpacity(0.6),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: BaseK.K.data_error,
        loadMore: _source.loadMore,
        textColor: Colors.grey.withOpacity(0.6),
      );
    } else if (status == IndicatorStatus.empty) {
      return EmptyWidget(
        textColor: Colors.grey.withOpacity(0.6),
      );
    }
    return LoadingFooter(
      hasMore: true,
      textColor: Colors.grey.withOpacity(0.6),
    );
  }
}

class LaunchAudioListSource extends LoadingMoreBase<ToneAudio> {
  final int limit = 20;
  int page = 0;
  int groupId;
  bool _hasMore = true;
  bool forceRefresh = false;

  LaunchAudioListSource(this.groupId);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 0;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      ResToneAudioList result =
          await LaunchAudioApi.getAudioList(groupId, page);
      // Log.d('ResToneAudioList page=$page result=${result.toProto3Json()}');
      if (result.success && page == 0) {
        clear();
      }
      addAll(result.data.audios);
      _hasMore = result.data.audios.length >= limit;
      page++;
      isSuccess = true;
    } catch (e, stack) {
      isSuccess = false;
      Log.e(e, stackTrace: stack);
    }
    return isSuccess;
  }
}
