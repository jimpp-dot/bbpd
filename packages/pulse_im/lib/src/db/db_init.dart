import 'dart:async';
import 'dart:io';
import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/im_config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseInit {
  final String _createConversationSql = '''CREATE TABLE `Conversation` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT,
                             `type` TEXT not null, `targetId` TEXT not null, `sentTime` INTEGER not null,
                             `unreadCount` INTEGER not null, `isTop` INTEGER not null, `lastMessage` TEXT not null, `notify` INTEGER DEFAULT 1,
                             `title`  TEXT, `atCount` INTEGER DEFAULT 0, `totalEarn` INTEGER DEFAULT 0,`CreateTime` INTEGER, `LastModifyTime` INTEGER,
                             `readTime` INTEGER DEFAULT 0, `draft` TEXT);''';
  final String _createMessageContentSql =
      '''CREATE TABLE `MessageContent` (`messageId` INTEGER PRIMARY KEY AUTOINCREMENT,
                             `type` TEXT not null, `conversationType` TEXT not null, `targetId` TEXT not null,
                             `senderUserId` TEXT not null, `senderName` TEXT not null, `senderPortraitUri` TEXT not null,
                             `messageUId` INTEGER not null, `messageDirection` TEXT not null, `content` TEXT not null,
                             `objectName` TEXT not null, `sentTime` INTEGER not null, `sentStatus` TEXT not null,
                             `receivedTime` INTEGER, `imageUrl` TEXT, `thumb` TEXT, `audioData` TEXT, `uri` TEXT,
                             `duration` INTEGER, `extra` TEXT, `inlineExtra` TEXT, `CreateTime` INTEGER, `LastModifyTime` INTEGER);''';

  final String _crateConversationIndex = 'CREATE INDEX `index_Conversation_sentTime` ON `Conversation` (`sentTime`)';

  final String _createMessageContentIndex =
      'CREATE INDEX `index_MessageContent_sentTime_messageUId` ON `MessageContent` (`sentTime`, `messageUId`)';

  static const DB_NAME = "pulse_im-sdk.db";

  static const DB_SUB_DIR = "pulse_im";

  Database? _db;

  static const LOG_TAG = "DatabaseInit";

  /// 伴伴1.6.5 新增 小号消息 需求；不再使用单例模式，统一由 DatabaseManager 管理
  // static final DatabaseInit _instance = DatabaseInit._internal();
  //
  // DatabaseInit._internal();
  //
  // factory DatabaseInit() => _instance;

  String userId = '';

  DatabaseInit(this.userId);

  Future<Database> get db async {
    IMLog.d(LOG_TAG, "getDb1 _db:${_db?.isOpen} , hashCode:${_db?.hashCode} , userId:$userId");
    if (_db != null && _db!.isOpen) {
      return _db!;
    }
    _db = await initDb();
    IMLog.d(LOG_TAG, "getDb2 _db:${_db?.isOpen} , hashCode:${_db?.hashCode} , userId:$userId");
    return _db!;
  }

  Future<Database> initDb() async {
    if (Platform.isWindows) {
      sqfliteFfiInit();
      var documentsDirectory = join(current, 'document', 'IM');
      String path;
      if (IMConfig.isChatPlugin) {
        path = join(documentsDirectory, 'plugin', userId, DB_NAME);
      } else {
        path = join(documentsDirectory, userId, DB_NAME);
      }
      IMLog.d(LOG_TAG, 'db_path = $path');
      var ourDb = await databaseFactoryFfi.openDatabase(path,
          options: OpenDatabaseOptions(version: 6, onCreate: _onCreate, onUpgrade: _onUpgrade));
      return ourDb;
    }
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DB_SUB_DIR, userId, DB_NAME);
    IMLog.d(LOG_TAG, 'db_path = $path');
    var ourDb = await openDatabase(path, version: 6, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return ourDb;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(_createConversationSql);
    IMLog.d(LOG_TAG, "Table [Conversation] is created");
    await db.execute(_createMessageContentSql);
    IMLog.d(LOG_TAG, "Table [MessageContent] is created");
    await db.execute(_crateConversationIndex);
    IMLog.d(LOG_TAG, "Conversation index is created");
    await db.execute(_createMessageContentIndex);
    IMLog.d(LOG_TAG, "MessageContent index is created");
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    IMLog.d(LOG_TAG, "_onUpgrade oldVersion = $oldVersion, newVersion = $newVersion");
    if (oldVersion == 1) {
      await _dbUpgradeV2(db);
    }
    if (oldVersion < 3) {
      _dbUpgradeV3(db);
    }
    if (oldVersion < 4) {
      _dbUpgradeV4(db);
    }
    if (oldVersion < 6) {
      _dbUpgradeV6(db);
    }
  }

  Future _dbUpgradeV2(Database db) async {
    await db.execute("alter table Conversation add atCount INTEGER DEFAULT 0 ");
  }

  void _dbUpgradeV3(Database db) async {
    await db.execute("alter table Conversation add totalEarn INTEGER DEFAULT 0 ");
  }

  void _dbUpgradeV4(Database db) async {
    await db.execute("alter table Conversation add `readTime` INTEGER DEFAULT 0");
  }

  void _dbUpgradeV6(Database db) async {
    await db.execute("alter table Conversation add `draft` Text");
  }

  Future closeByLogout() async {
    IMLog.d(LOG_TAG, "closeByLogout _db:${_db?.isOpen} , hashCode:${_db?.hashCode} , userId:$userId");
    if (_db != null) {
      await _db!.close();
    }
    _db = null;
    IMLog.d(LOG_TAG, "closeByLogout finish , userId:$userId");
  }
}
