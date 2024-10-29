import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../shared.dart';

Database? _db;

const String musicTable = 'music';
const String zegoV2MusicTable = 'zego_v2_music';

class LocalStorage {
  static Future<bool> init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "yy.db");

    // await deleteDatabase(path);

    ///创建足迹表
    ///uid + rid 构成唯一标示
    createSlpUserTable(Database db) async {
      String slpUser =
          'CREATE TABLE yy_user (uid INTEGER PRIMARY KEY,name TEXT,mark TEXT,portraitUri TEXT,version INTEGER,members TEXT,official INTEGER,degree INTEGER,starVerifyTag INTEGER,title_new INTEGER,lv_icon TEXT, frame TEXT)';
      try {
        await db.execute(slpUser);
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }

    createKTVSongTable(Database db) async {
      String ktvSong =
          'CREATE TABLE ktv_song (id INTEGER PRIMARY KEY,original_mp3 TEXT,size INTEGER,hq_music TEXT,hq_size INTEGER,brc TEXT,extra TEXT,platform TEXT,playtime INTEGER,midi TEXT)';
      try {
        await db.execute(ktvSong);
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }

    /// 创建私聊输入框上方表情缓存数据表
    createEmoticonTable(Database db) async {
      StringBuffer sql = StringBuffer()
        ..write('CREATE TABLE IF NOT EXISTS emoticon(')
        ..write('id TEXT PRIMARY KEY, ')
        ..write('_key TEXT NOT NULL, ')
        ..write('gif TEXT, ')
        ..write('webp TEXT, ')
        ..write('width INTEGER DEFAULT(0), ')
        ..write('height INTEGER DEFAULT(0), ')
        ..write('_time LONG DEFAULT(0)')
        ..write(')');
      try {
        await db.execute(sql.toString());
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }

    /// 创建用户头像缓存数据表
    createUserImageCacheTable(Database db) async {
      String userImageCache =
          'CREATE TABLE user_image (uid INTEGER,time INTEGER,icon TEXT,frame TEXT,UNIQUE(uid))';
      try {
        await db.execute(userImageCache);
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }

    // open the database
    Database _ = await openDatabase(
      path,
      version: 17,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        Log.d("Database onCreate $version");

        createSlpUserTable(db);

        //音乐下载数据
        String musicMessage =
            'CREATE TABLE $musicTable (id INTEGER PRIMARY KEY,type TEXT,path TEXT,name TEXT,author TEXT,dateline INTEGER)';
        await db.execute(musicMessage);

        //需要执行的消息
        String bookMessage =
            'CREATE TABLE book_message (msgId INTEGER PRIMARY KEY,cmd INTEGER,extra TEXT,num INTEGER,dateline INTEGER)';
        await db.execute(bookMessage);

        //ktv点唱歌曲
        createKTVSongTable(db);

        /// 创建表情表
        createEmoticonTable(db);

        ///创建用户图片缓存标
        createUserImageCacheTable(db);

        /// 创建zego v2 music table
        _createZegoMusicSearchDb(db);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        Log.d("Database onUpgrade old=" +
            oldVersion.toString() +
            ' new=' +
            newVersion.toString());

        ///数据库从15升级到16
        if (oldVersion <= 15) {
          _createZegoMusicSearchDb(db);
        }

        ///数据库从16升级到17
        if (oldVersion <= 16) {
          _upgradeToV17(db);
        }
      },
      onDowngrade: (Database db, int oldVersion, int newVersion) async {
        Log.d("Database onDowngrade old=" +
            oldVersion.toString() +
            ' new=' +
            newVersion.toString());
      },
      onOpen: (Database db) {
        Log.d("Database onOpen");
        _db = db;
      },
    );
    return true;
  }

  static Database? get db {
    return _db;
  }

  /// 创建zego v2 music table
  static _createZegoMusicSearchDb(db) async {
    //音乐下载数据
    String musicMessage =
        'CREATE TABLE $zegoV2MusicTable (id INTEGER PRIMARY KEY,type TEXT,name TEXT,author TEXT,musicId TEXT,dateline INTEGER)';
    await db.execute(musicMessage);
  }

  /// 数据库16升级到17
  /// yy_user表新增列levelIcon
  static _upgradeToV17(Database db) async {
    Batch batch = db.batch();
    batch.execute('ALTER TABLE yy_user ADD COLUMN lv_icon TEXT');
    try {
      await batch.commit(continueOnError: true);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }
}
