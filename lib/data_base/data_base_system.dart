import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DataBaseSystem {
  static Database? _db;

  static Future<Database> getDataBase() async {
    if (_db != null) return _db!;
     _db = await openDatabase(p.join(''));
  }
}
