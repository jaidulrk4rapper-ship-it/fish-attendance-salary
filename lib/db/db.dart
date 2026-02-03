import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), "fish_labour.db");
    return openDatabase(path, version: 1, onCreate: _createTables);
  }

  static Future _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE workers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        rate INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE attendance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        worker_id INTEGER,
        date TEXT,
        status TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE advance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        worker_id INTEGER,
        date TEXT,
        amount INTEGER
      )
    ''');
  }
}
