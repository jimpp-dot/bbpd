import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rank/k.dart';

part 'ranking_list_user_bean.g.dart';

String _contributeValueString({int? value, int fractionDigits = 0}) {
  if (value == null) return '0';
  if (value < 1000) {
    return value.toString();
  } else if (value < 1000 * 1000) {
    return '${(value / 1000).toStringAsFixed(fractionDigits)}K';
  } else if (value < 1000 * 1000 * 1000) {
    return '${(value / 1000000).toStringAsFixed(fractionDigits)}M';
  } else {
    return '${(value / 1000000000).toStringAsFixed(fractionDigits)}B';
  }
}

@JsonSerializable(createToJson: false)
class RankingListUserItem {
  int uid;
  int rank;

  @JsonKey(name: 'user_name')
  String userName;

  @JsonKey(name: 'user_icon')
  String userIcon;

  int score;

  @JsonKey(name: 'before_diff')
  int beforeDiff;

  RankingListUserItem(this.uid, this.rank, this.userName, this.userIcon,
      this.score, this.beforeDiff);

  factory RankingListUserItem.fromJson(Map<String, dynamic> json) =>
      _$RankingListUserItemFromJson(json);

  String get contributeValueText {
    String value = _contributeValueString(value: score, fractionDigits: 1);
    return '$value ${K.rank_achieve_score}';
  }

  String get contributeValue {
    String value = _contributeValueString(value: score, fractionDigits: 1);
    return value;
  }
}

@JsonSerializable(createToJson: false)
class RankingUserListData {
  final List<RankingListUserItem> list;
  final RankingListUserItem? self;
  final int page;
  final int more;

  RankingUserListData(this.list, this.self, this.page, this.more);

  factory RankingUserListData.fromJson(Map<String, dynamic> json) =>
      _$RankingUserListDataFromJson(json);

  int get listLength {
    if (list.isEmpty) return 0;
    if (list.length > 3) return list.length - 2;
    return 1;
  }

  List<RankingListUserItem> dataAtIndex(int index) {
    if (list.isEmpty) return [];
    if (index == 0) {
      if (list.length > 2) {
        return list.sublist(0, 3);
      } else {
        return list;
      }
    } else if (index == 1 || index == 2) {
      return [];
    } else {
      return [list[index]];
    }
  }
}

@JsonSerializable(createToJson: false)
class RankingUserListResponse extends BaseResponse {
  final RankingUserListData? data;

  RankingUserListResponse({super.success, super.msg, this.data});

  factory RankingUserListResponse.fromJson(Map<String, dynamic> json) =>
      _$RankingUserListResponseFromJson(json);
}
