import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared/shared.dart';

Database? _db;

class TagConfigDb {
  static String columnId = 'id';
  static String columnLabel = 'label';
  static String columnIcon = 'icon';
  static String columnProperty = 'property';
  static String columnOnMicShow = 'onMicShow';
  static String columnShowUserRole = 'showUserRole';
  static String columnRoomFactoryType = 'roomFactoryType';
  static String columnChannel = 'channel';
  static String columnType = 'type';
  static String columnWhiteListRids = 'whiteListRids';
  static String columnTextStartPx = 'textStartPx';
  static String columnFontStyle = 'fontStyle';
  static String columnProfileShow = 'profileShow';
  static String columnFontColor = 'fontColor';
  static String columnLocation = 'location';

  static Future<bool> init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "tag_config.db");

    /// 创建标签表(房间公屏/个人资料页通用标签)
    createTagConfigTable(Database db) async {
      String tagConfig =
          'CREATE TABLE tag_config ($columnId INTEGER PRIMARY KEY,$columnLabel TEXT,$columnIcon TEXT,$columnProperty TEXT,$columnOnMicShow INTEGER,$columnShowUserRole INTEGER,$columnRoomFactoryType TEXT,$columnChannel TEXT,$columnType INTEGER,$columnWhiteListRids TEXT,$columnTextStartPx INTEGER,$columnFontStyle INTEGER,$columnProfileShow INTEGER,$columnFontColor TEXT,$columnLocation INTEGER DEFAULT 0)';
      try {
        await db.execute(tagConfig);
      } catch (e) {
        Log.d(
            "TagConfigDb createTagConfigTable ${e == null ? " e is null" : e.toString()}");
      }
    }

    // open the database
    Database _ = await openDatabase(path, version: 3,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      Log.d("TagConfigDb onCreate $version");

      createTagConfigTable(db);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      Log.d("TagConfigDb onUpgrade old=" +
          oldVersion.toString() +
          ' new=' +
          newVersion.toString());
      if (oldVersion <= 1) {
        DbUpgradeToV2(db);
      } else if (oldVersion <= 2) {
        DbUpgradeToV3(db);
      }
    }, onDowngrade: (Database db, int oldVersion, int newVersion) async {
      Log.d("TagConfigDb onDowngrade old=" +
          oldVersion.toString() +
          ' new=' +
          newVersion.toString());
    }, onOpen: (Database db) {
      Log.d("TagConfigDb onOpen");
      _db = db;
    });
    return true;
  }

  static DbUpgradeToV2(Database db) async {
    Batch batch = db.batch();
    batch.execute('ALTER TABLE tag_config ADD COLUMN $columnFontColor TEXT');
    try {
      await batch.commit(continueOnError: true);
    } catch (e) {
      Log.d(
          "LocalStorage updateUserTable ${e == null ? " e is null" : e.toString()}");
    }
  }

  ///增加location字端，用于控制tag展示位置
  static DbUpgradeToV3(Database db) async {
    Batch batch = db.batch();
    batch.execute(
        'ALTER TABLE tag_config ADD COLUMN $columnLocation INTEGER DEFAULT 0');
    try {
      await batch.commit(continueOnError: true);
    } catch (e) {
      Log.d(
          "LocalStorage updateUserTable ${e == null ? " e is null" : e.toString()}");
    }
  }

  static Database? get db {
    return _db;
  }

  static Future<void> queryConfigNum() async {
    List datas = await _db?.query(
          'tag_config',
          columns: [columnId],
        ) ??
        [];

    Log.d('TagConfig queryConfigNum: ${datas.length}');
  }

  static Future<Map<String, dynamic>> queryConfigById(int configId) async {
    List<Map<String, dynamic>> data = await _db?.query(
          'tag_config',
          columns: null,
          where: '$columnId = ? ',
          whereArgs: [configId],
          limit: 1,
        ) ??
        [];

    return data.isNotEmpty ? data[0] : {};
  }

  /// 删除表里所有数据，目前暂支持config的全量更新
  static Future<void> deleteAllData() async {
    String sql = "DELETE FROM tag_config";
    return await _db?.execute(sql);
  }

  /// 批量插入TagConfig
  static Future<void> batchInsertData(List<ScreenTagConfig> data) async {
    if (data.isEmpty) {
      return;
    }
    Log.d('TagConfig batch insert : ${data.length}');

    try {
      Batch? batch = _db?.batch();
      for (var element in data) {
        batch?.insert('tag_config', dataToMap(element));
      }
      await batch?.commit(noResult: true, continueOnError: true);
    } catch (e) {
      Log.d('batchInsertData error: $e');
    }
  }

  static Map<String, dynamic> dataToMap(ScreenTagConfig item) {
    return {
      columnId: item.id,
      columnLabel: item.label,
      columnIcon: item.icon,
      columnProperty: item.property,
      columnOnMicShow: item.onMicShow,
      columnShowUserRole: item.showUserRole,
      columnRoomFactoryType: item.roomFactoryType,
      columnChannel: item.channel,
      columnType: item.type,
      columnWhiteListRids: item.whiteListRids,
      columnTextStartPx: item.textStartPx,
      columnFontStyle: item.frontStyle,
      columnProfileShow: item.profileShow,
      columnFontColor: item.fontColor,
      columnLocation: item.location,
    };
  }
}
