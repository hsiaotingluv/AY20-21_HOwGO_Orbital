import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class SQLRooms {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'favRoom.db'),
        onCreate: (db, version) {
      return db.execute('CREATE TABLE favs_place(title TEXT PRIMARY KEY)');
    }, version: 1);
  }

  static Future<int> makeFav(Map<String, Object> data) async {
    final db = await SQLRooms.database();
    return await db.insert(
      'favs_place',
      data,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<List<Map<String, Object>>> getData() async {
    final db = await SQLRooms.database();
    final List<Map> result = await db.query('favs_place', columns: ['title']);
    print('START PRINTING');
    result.forEach((element) {
      print(element);
    });
    print('END PRINTING');
    return db.query('favs_place', columns: ['title']);
  }

  static Future<int> removeFav(String name) async {
    final db = await SQLRooms.database();
    return await db
        .delete('favs_place', where: 'title = ?', whereArgs: ['$name']);
  }
}
