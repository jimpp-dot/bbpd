import 'model/guess_queue_beans.dart';

/// 画猜接龙阶段
enum GuessQueueState {
  Preparation, //准备阶段 游戏开始之前
  BeginCountDown, //倒计时阶段
  SelectWord, //选词
  Drawing, //画画
  WaitDrawing, //等待别人画画
  GuessWord, //猜词
  WaitGuessWord, //等待别人猜词
  BeginReplay, //开始复盘
  ReplayingDraw, //复盘画画/猜词
  Judgment, //复盘一轮结束 判断是否合格
  SelectPicture, //选择最喜欢的画
  SelectPictureEnd, //选择完成
  End, //游戏结束
}

const GUESS_QUEUE_PLAYING_STATE = [
  GuessQueueState.BeginCountDown,
  GuessQueueState.SelectWord,
  GuessQueueState.Drawing,
  GuessQueueState.WaitDrawing,
  GuessQueueState.GuessWord,
  GuessQueueState.WaitGuessWord
];

/// 画猜---普通模式

class GuessQueueData {
  GuessQueueState state;

  /// 词库id
  int? catId;

  /// 要画的词
  DrawWordResp? drawWordResp;

  /// 要猜的画
  GuessImgResp? guessImgResp;

  /// 选词数据
  GuessQueueConfirmWordRsp? confirmWorResp;

  int? lineId;

  GuessQueueData.state(this.state);
}

const MODE_GUESS_NORMAL = 'guess';

/// 画猜---接龙模式
const MODE_GUESS_QUEUE = 'guess-queue';
