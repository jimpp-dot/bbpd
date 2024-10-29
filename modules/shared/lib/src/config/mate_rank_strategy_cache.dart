import 'dart:async';
import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_rank_strategy.pb.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class MateRankStrategyCache {
  static MateRankStrategyCache? _instance;
  MateRankStrategyCache._();
  static MateRankStrategyCache get instance {
    _instance ??= MateRankStrategyCache._();
    return _instance!;
  }

  int _cacheTime = 0;
  List<HomeRankStrategy> _cacheList = [];
  bool _dataLoaded = false;

  Database? _db;
  StoreRef<String, Map>? _store;

  int get cacheTime {
    return _cacheTime;
  }

  set cacheTime(int time) {
    _cacheTime = time;
    _saveTimeToDB();
  }

  List<HomeRankStrategy> get cacheList {
    return _cacheList;
  }

  set cacheList(List<HomeRankStrategy> list) {
    _cacheList = list;
    _saveListToDB();
  }

  Future<void> initCache() async {
    if (!_dataLoaded) {
      await _initDb();
      await _loadFromDB();
      _dataLoaded = true;
    }
  }

  Future _initDb() async {
    String dbFilePath = join(
        Constant.documentsDirectory.path, 'sembast', 'mate_rank_strategy.db');
    _db = await databaseFactoryIo.openDatabase(dbFilePath);
    _store = stringMapStoreFactory.store('mate_rank_strategy_db');
  }

  final String _time_key = 'time_key';
  final String _list_key = 'list_key';

  Future _loadFromDB() async {
    var records = await _store?.find(_db!);
    records?.forEach((record) {
      try {
        if (record.key == _time_key) {
          Map map = record.value;
          _cacheTime = Util.parseInt(map['data']);
        } else if (record.key == _list_key) {
          Map map = record.value;
          List? data = map['data'];
          try {
            if (data is List) {
              _cacheList = data
                  .map((e) => HomeRankStrategy.fromBuffer(Util.parseIntList(e)))
                  .toList();
            }
          } catch (e) {
            Log.d(e);
          }
        }
      } catch (e) {
        Log.d(e);
      }
    });
  }

  Future _saveTimeToDB() async {
    Map map = {
      'data': _cacheTime,
    };
    await _store?.record(_time_key).put(_db!, map, merge: true);
  }

  Future _saveListToDB() async {
    Map map = {'data': _cacheList.map((e) => e.writeToBuffer()).toList()};
    await _store?.record(_list_key).put(_db!, map, merge: true);
  }
}
