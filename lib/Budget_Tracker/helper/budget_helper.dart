import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BudgetTrackerHelper {
  static BudgetTrackerHelper budgetTrackerHelper = BudgetTrackerHelper._();

  BudgetTrackerHelper._();

  Database? _db;

  Future<Database?> get database async => _db ?? await initDataBase();
  // Future<Database?> getDatabase() async {
  //   if (_db != null) {
  //     return _db;
  //   } else {
  //     return await initDataBase();
  //   }
  // }
  //init database - create table
  Future<Database?> initDataBase() async {
    //1. create path to store dataBase
    final path = await getDatabasesPath();
    final dbPath = join(path, 'finance.db');
    //call openDataBase method to create table
     _db = await openDatabase(
         dbPath,
         version: 1,
         onCreate: (db, version) async {
           String sql = '''
        CREATE TABLE finance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account REAL NOT NULL,
        isIncome INTEGER NOT NULL,
        category TEXT );
        ''';
           await _db!.execute(sql);
           },
     );
    return _db;
  }
  Future<void> insertData()
   async {
    Database? db = await database;
    String sql = '''
        INSERT INTO finance(account,isIncome,category) VALUES(200,0,'T-shirt')''';
    await db?.rawInsert(sql);
  }

}
