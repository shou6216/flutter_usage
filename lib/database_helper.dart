import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'monster.dart';

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
      db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnKill INTEGER NOT NULL,
            $columnHeart INTEGER NOT NULL,
            $columnCreatedAt TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),
            $columnUpdatedAt TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime'))
          )
          ''');

      final values = Monster.v1
          .map((e) => '(${e.id},\'${e.name}\',${e.kill},${e.heart})')
          .join(',');

      db.execute('''
          INSERT INTO $table($columnId, $columnName, $columnKill, $columnHeart) 
          VALUES$values
      ''');
    }, version: 1);
  }

  Future<List<Monster>> findBySearchType(final int searchType) async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> results = await db.query(table);
    return results.map((map) => Monster(
        id: map['id'],
        name: map['name'],
        kill: map['kill'],
        heart: map['heart']));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    print([id]);
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }
}
