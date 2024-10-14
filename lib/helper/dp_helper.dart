import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../modal/shopping_list.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();
  DbHelper._();

  static Database? _database;

  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'shopping.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE shopping (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            itemName TEXT,
            quantity INTEGER,
            category TEXT,
            purchased INTEGER
          )
        ''');
      },
    );
  }

  // Create operation
  Future<int> insertShoppingItem(ShoppingModel shoppingModel) async {
    var dbClient = await db;
    return await dbClient.insert('shopping', shoppingModel.toMap());
  }

  Future<List<ShoppingModel>> getShoppingItems() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('shopping');

    return List.generate(maps.length, (i) {
      return ShoppingModel.fromMap(maps[i]);
    });
  }

  Future<int> updateShoppingItem(ShoppingModel shoppingModel) async {
    var dbClient = await db;
    return await dbClient!.update(
      'shopping',
      shoppingModel.toMap(),
      where: 'id = ?',
      whereArgs: [shoppingModel.id],
    );
  }

  Future<int> deleteShoppingItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'shopping',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
