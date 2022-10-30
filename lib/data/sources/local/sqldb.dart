import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    print("Database created");
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'sqlTutorial.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''

CREATE TABLE "expense" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "timestamp" INTEGER NOT NULL,
  "amount" REAL NOT NULL,
  "categoryType" TEXT NOT NULL)
 ''');

    await db.execute('''
CREATE TABLE "income" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "timestamp" INTEGER NOT NULL,
  "amount" REAL NOT NULL)
 ''');
    print("Create DATABASE AND TABLE =================");
  }

  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> writeData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
