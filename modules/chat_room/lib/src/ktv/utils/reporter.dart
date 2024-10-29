import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

class KtvReporter {
  static const ROLE_OWNER = "owner";
  static const ROLE_MEMBER = "member";

  static const TAG = "KtvReporter";

  static void reportChoseSong(int rid, int songId, String songName,
      String roomFactoryType, String songRefer) {
    var p = {
      "rid": rid,
      "song_id": songId,
      "song_name": songName,
      "role": _getRole(),
      'room_factory_type': roomFactoryType,
      'song_refer': songRefer
    };
    Tracker.instance.track(TrackEvent.chose_song, properties: p);
    Log.d("reportChoseSong p = ${p.toString()}", tag: TAG);
  }

  static void reportSingSong(int rid, int songId, String songName,
      String roomFactoryType, String songRefer) {
    var p = {
      "rid": rid,
      "song_id": songId,
      "song_name": songName,
      "role": _getRole(),
      'room_factory_type': roomFactoryType,
      'song_refer': songRefer
    };
    Tracker.instance.track(TrackEvent.sing_song, properties: p);
    Log.d("reportSingSong P = ${p.toString()}", tag: TAG);
  }

  static void skipSong(int rid, int songId, int singUid, double restPercent,
      String roomFactoryType, String skipType) {
    ChatRoomData? room = ChatRoomData.getInstance();
    bool isCreator = false;
    if (room != null) {
      isCreator = room.createor?.uid == Session.uid;
    }
    int type;
    if (isCreator) {
      if (singUid == Session.uid) {
        type = 1; //房主切自己正在演唱的歌曲
      } else {
        type = 2; // 房主切其他演唱者正在演唱的歌曲
      }
    } else {
      type = 3; // 房间其他成员切自己正在演唱的歌曲
    }
    var p = {
      "rid": rid,
      "song_id": songId,
      "type": type,
      "rest_time_percent": restPercent,
      'room_factory_type': roomFactoryType,
      'skip_type': skipType,
    };
    Tracker.instance.track(TrackEvent.skip_song, properties: p);
    Log.d("skipSong p = ${p.toString()}", tag: TAG);
  }

  static void placeSongTop(int rid, int songId, int singUid) {
    int type;
    if (singUid == Session.uid) {
      type = 1; //房主置顶自己的歌曲
    } else {
      type = 2; //房主置顶其他成员的歌曲
    }
    var p = {"rid": rid, "song_id": songId, "type": type};
    Log.d("placeSongTop p = ${p.toString()}", tag: TAG);
  }

  static void deleteSong(int rid, int songId, int singUid) {
    ChatRoomData? room = ChatRoomData.getInstance();
    bool isCreator = false;
    if (room != null) {
      isCreator = room.createor?.uid == Session.uid;
    }
    int type;
    if (isCreator) {
      if (singUid == Session.uid) {
        type = 1; //房主删除自己点的歌曲
      } else {
        type = 2; // 房主删除其他成员点的歌曲
      }
    } else {
      type = 3; // 房间其他成员删除自己点的歌曲
    }

    var p = {"rid": rid, "song_id": songId, "type": type};
    Tracker.instance.track(TrackEvent.delete_song, properties: p);
    Log.d("deleteSong p = ${p.toString()}", tag: TAG);
  }

  static void applyOnMic(int rid) {
    var p = {"rid": rid, "room_type": "ktv"};
    Tracker.instance.track(TrackEvent.apply_on_mic, properties: p);
    Log.d("applyOnMic p = ${p.toString()}", tag: TAG);
  }

  static void reportJoinSong(
      int rid, int songId, String roomFactoryType, String songRefer) {
    var p = {
      "rid": rid,
      "song_id": songId,
      'room_factory_type': roomFactoryType,
      'song_refer': songRefer
    };
    Tracker.instance.track(TrackEvent.join_sing, properties: p);
  }

  static String _getRole() {
    ChatRoomData? room = ChatRoomData.getInstance();
    bool isCreator = false;
    if (room != null) {
      isCreator = room.createor?.uid == Session.uid;
    }
    return isCreator ? ROLE_OWNER : ROLE_MEMBER;
  }
}
