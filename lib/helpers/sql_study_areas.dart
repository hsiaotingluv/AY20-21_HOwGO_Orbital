import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class SQLStudyAreas {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'favStudyAreas.db'),
        onCreate: (db, version) {
      return db.execute('CREATE TABLE favs_study(title TEXT PRIMARY KEY)');
    }, version: 1);
  }

  static Future<int> makeFav(Map<String, Object> data) async {
    final db = await SQLStudyAreas.database();
    return await db.insert(
      'favs_study',
      data,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<List<Map<String, Object>>> getData() async {
    final db = await SQLStudyAreas.database();
    final List<Map> result = await db.query('favs_study', columns: ['title']);
    print('START PRINTING');
    result.forEach((element) {
      print(element);
    });
    print('END PRINTING');
    return db.query('favs_study', columns: ['title']);
  }

  static Future<int> removeFav(String name) async {
    final db = await SQLStudyAreas.database();
    return await db
        .delete('favs_study', where: 'title = ?', whereArgs: ['$name']);
  }
}
