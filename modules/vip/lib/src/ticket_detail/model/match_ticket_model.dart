import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loading_more_list/loading_more_list.dart';

part 'match_ticket_model.g.dart';

@JsonSerializable()
class TicketDetailTab {
  final String name;
  @JsonKey(name: 'use_state')
  final int useState;

  TicketDetailTab(this.name, this.useState);

  factory TicketDetailTab.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailTabFromJson(json);
}

@JsonSerializable()
class TicketDetailItem {
  @JsonKey(name: 'image_bg', fromJson: Util.getRemoteImgUrl)
  final String imageBg;

  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String image;

  @JsonKey(name: 'period_end_desc')
  final String periodDesc;

  final String name;

  @JsonKey(name: 'source_type_desc')
  final String sourceDesc;

  @JsonKey(name: 'show_time_desc')
  final String timeDesc;

  final int num;

  TicketDetailItem(
    this.imageBg,
    this.image,
    this.periodDesc,
    this.name,
    this.sourceDesc,
    this.timeDesc,
    this.num,
  );

  factory TicketDetailItem.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailItemFromJson(json);
}

class TicketDetailSource extends LoadingMoreBase<TicketDetailItem> {
  final int state;
  final String type;
  static const int _firstPageIndex = 1;

  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';

  TicketDetailSource(this.state, this.type);

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _pageIndex = _firstPageIndex;
      _hasMore = true;
    }

    bool loadSuccess = false;
    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;
    DataRsp<List<TicketDetailItem>> response =
        await _getTicketList(page, state, type);
    if (response.success == true) {
      if (page == _firstPageIndex) {
        clear();
      }

      if (response.data != null && response.data!.isNotEmpty) {
        addAll(response.data!);
        _pageIndex = page;
      } else {
        _hasMore = false;
      }

      loadSuccess = true;
    } else {
      errorMsg = response.msg ?? '';
      loadSuccess = false;
    }

    return loadSuccess;
  }

  /// [state] 0：可使用，1已使用 2已过期
  /// [type]
  static Future<DataRsp<List<TicketDetailItem>>> _getTicketList(
      int page, int state, String type) async {
    String url =
        '${System.domain}commodity/useStateList?type=$type&use_state=$state&page=$page';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<List<TicketDetailItem>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object,
            (e) => TicketDetailItem.fromJson(e as Map<String, dynamic>)),
      );
    } catch (e) {
      return DataRsp<List<TicketDetailItem>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
