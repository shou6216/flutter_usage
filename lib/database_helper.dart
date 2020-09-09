import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final table = 'monster';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnKill = 'kill';
  static final columnHeart = 'heart';
  static final columnCreatedAt = 'created_at';
  static final columnUpdatedAt = 'updated_at';

  // シングルトン用名前付きコンストラクタ
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // DBにアクセスするためのメソッド
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'dqw.db'),
        onCreate: (db, version) {
      return db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnKill INTEGER NOT NULL,
            $columnHeart INTEGER NOT NULL,
            $columnCreatedAt TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),
            $columnUpdatedAt TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime'))
          )
          ''');
    }, version: 1);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    print([id]);
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }
}
