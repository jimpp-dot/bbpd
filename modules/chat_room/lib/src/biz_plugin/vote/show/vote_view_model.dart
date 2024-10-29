import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/abs_room_model.dart';
import 'package:chat_room/src/base/abs_room_msg_handler.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/biz_plugin/base/room_plugin_beans.dart';
import 'package:chat_room/src/biz_plugin/vote/vote_repos.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';

/// 投票结束事件
const String VOTE_TIME_OUT_EVENT = 'room_vote_time_out_event';

/// 投票显示UI viewModel
class VoteViewModel extends AbsRoomModel {
  bool _isFirstLoadData = false; // 是否加载成功过
  bool end = false; // 投票时间结束
  Vote? vote;
  bool _isVote = false; // 当前用户是否已投票
  int remainTime = 0; // 投票剩余时间
  Timer? _timer;

  VoteViewModel(super.value);

  bool get isVote => _isVote;

  /// 是否可以多选
  bool get isMulti => vote?.base.selectType == 1;

  /// 该选项能否投票
  bool canVote(VoteOptions item) {
    if (item.isVote) return false;
    if (_isVote && !isMulti) return false;
    return true;
  }

  /// 获取选项的投票结果
  VoteDynamic? getVoteData(int id) {
    if (vote?.dynamic != null && vote!.dynamic.isNotEmpty) {
      for (VoteDynamic item in vote!.dynamic) {
        if (item.oId == id) {
          return item;
        }
      }
    }
    return null;
  }

  /// 获取选项
  VoteOptions? getVoteOption(int id) {
    if (vote?.base.options != null && vote!.base.options.isNotEmpty) {
      for (VoteOptions item in vote!.base.options) {
        if (item.id == id) {
          return item;
        }
      }
    }
    return null;
  }

  @override
  AbsRoomMsgHandler createMsgHandler(AbsRoomModel model, ChatRoomData room) {
    return VoteMsgHandler(this, room);
  }

  @override
  void loadData() async {
    await tryFirstLoadData();
  }

  Future<void> tryFirstLoadData() async {
    RoomPluginItem? pluginItem = room?.pluginItem(RoomPluginType.Vote);
    if (pluginItem?.inUse == true && !_isFirstLoadData) {
      _isFirstLoadData = true;
      await _loadVoteData();
    }
  }

  /// 加载投票数据
  Future<void> _loadVoteData() async {
    ResPluginVoteInfo? voteRes = await VoteRepos.getVoteInfo(room?.rid ?? 0);
    if (voteRes != null && voteRes.success) {
      _initAfterLoadData(voteRes.data);
    }
  }

  /// 加载数据后初始化
  void _initAfterLoadData(Vote newVote) {
    if (!mounted) return;
    vote = newVote;
    _isVote = false;
    for (VoteOptions option in vote!.base.options) {
      if (option.isVote) {
        _isVote = true;
        break;
      }
    }
    remainTime = vote!.base.duration;
    end = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (vote == null) return;
      remainTime = vote!.base.duration--;
      if (remainTime <= 0) {
        remainTime = 0;
        end = true;
        eventCenter.emit(VOTE_TIME_OUT_EVENT);
        _timer?.cancel();
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// 发送投票
  Future<void> requestVote(List<int> ids) async {
    bool result = await VoteRepos.vote(room?.rid ?? 0, vote?.base.id ?? 0, ids);
    if (result && mounted) {
      _isVote = true;
      for (VoteOptions option in vote!.base.options) {
        if (ids.contains(option.id)) {
          option.isVote = true;
        }
      }
      notifyListeners();
      Fluttertoast.showToast(msg: K.wolf_vote_success);
    }
  }

  /// socket中完整的投票数据
  void setVoteData(Vote newVote) {
    _initAfterLoadData(newVote);
    notifyListeners();
  }

  /// socket中投票动态数据
  void updateVoteData(Vote newVote) async {
    if (vote == null) {
      // 如果没有投票数据，尝试拉取
      await _loadVoteData();
    } else {
      if (newVote.dynamic.isNotEmpty) {
        vote!.dynamic.clear();
        vote!.dynamic.addAll(newVote.dynamic);
      }
    }
    notifyListeners();
  }
}

class VoteMsgHandler extends AbsRoomMsgHandler {
  VoteMsgHandler(VoteViewModel model, ChatRoomData room) : super(model, room);

  @override
  void handleMsg(String name, dynamic data) {
    Log.d('vote handleMsg name=$name data=$data');
    if (data is! Map) return;
    Map map = data;
    Vote? vote;
    try {
      vote = Vote.fromBuffer(map['vote_info'].cast<int>());
    } catch (e) {
      Log.d('vote handleMsg name:$name');
    }
    if (vote == null) return;
    if (name == RoomConstant.Event_Vote_Start) {
      // 创建投票
      (model as VoteViewModel).setVoteData(vote);
    } else if (name == RoomConstant.Event_Vote_Refresh) {
      // 投票数据更新
      (model as VoteViewModel).updateVoteData(vote);
    }
  }

  @override
  List<String> get msgList =>
      [RoomConstant.Event_Vote_Start, RoomConstant.Event_Vote_Refresh];
}
