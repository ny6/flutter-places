import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import '../utils/constants.dart';

class DBHelper {
  static Future<sql.Database> _database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, kDBName),
      onCreate: (db, version) => db.execute(
        'CREATE TABLE $kPlacesTableName(id TEXT PRIMARY KEY, title TEXT, image TEXT)',
      ),
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await _database();

    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await _database();

    return db.query(table);
  }
}
