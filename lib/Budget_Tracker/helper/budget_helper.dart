//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DbHelper {
//   static DbHelper dbHelper = DbHelper._();
//
//   DbHelper._();
//
//   Database? _db;
//
//   Future<Database?> get database async => _db ?? await initDatabase();
//
//   //init database-create table
//
//   Future<Database?> initDatabase() async {
//     //1.create path to store database
//     final path = await getDatabasesPath();
//     final dbpath = join(path, 'finance.db');
//
//     _db = await openDatabase(
//       dbpath,
//       version: 1,
//       onCreate: (db, version) async {
//      String sql = '''
//      CREATE TABLE finance(
//      id INTEGER PRIMARY KEY AUTOINCREMENT ,
//      amount INTEGER NOT NULL,
//      isIncome INTEGER NOT NULL,
//      category TEXT )''';
//         await db.execute(sql);
//       },
//     );
//     return _db;
//   }
//
//   Future<void> insertData() async {
//     Database? db =await database;
//     String sql='''INSERT INTO finance(amount,isIncome,category)
//     VALUES (122,0,"Radha")''';
//     await db!.rawInsert(sql);
//   }
// }
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper dbHelper = DbHelper._();
  DbHelper._();

  Database? _db;

  Future<Database?> get database async => _db ?? await initDatabase();

  Future<Database?> initDatabase() async {
    try {
      // Create path to store the database
      final path = await getDatabasesPath();
      final dbpath = join(path, 'finance.db');

      _db = await openDatabase(
        dbpath,
        version: 1,
        onCreate: (db, version) async {
          String sql = '''
          CREATE TABLE finance(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          amount INTEGER NOT NULL,
          isIncome INTEGER NOT NULL,
          category TEXT);
          ''';
          await db.execute(sql);
        },
      );
      return _db;
    } catch (e) {
      print('Error database: $e');
      return null;
    }
  }


  // Future<void> insertData(double amount,int isIncome,String category) async {
  //   try {
  //     Database? db = await database;
  //     if (db == null) {
  //       throw Exception('Database not initialized');
  //     }
  //     String sql = '''INSERT INTO finance(amount, isIncome, category)
  //     VALUES (?,?,?);''';
  //     List agrs = [amount,isIncome,category];
  //     await db.rawInsert(sql,agrs);
  //   } catch (e) {
  //     print('Error inserting data: $e');
  //   }
  // }
  Future<void> insertData() async {
    try {
      Database? db = await database;
      if (db == null) {
        throw Exception('Database not initialized');
      }
      String sql = '''INSERT INTO finance(amount, isIncome, category)
      VALUES (122,0,"t-shirt");''';
      await db.rawInsert(sql);
    } catch (e) {
      print('Error inserting data: $e');
    }
  }
  Future<List<Map<String, Object?>>> readData()
  async {
    Database? db = await database;
    String sql='''
    SELECT * FROM finance
    ''';
    return await db!.rawQuery(sql);

  }
}
