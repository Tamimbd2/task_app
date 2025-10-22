import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../assignment2/models/product_model.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('products.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        price INTEGER NOT NULL,
        description TEXT NOT NULL,
        images TEXT NOT NULL
      )
    ''');
  }

  // Insert product
  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      'products',
      {
        'id': product.id,
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'images': product.images.join(','),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert multiple products
  Future<void> insertProducts(List<Product> products) async {
    final db = await database;
    final batch = db.batch();

    for (var product in products) {
      batch.insert(
        'products',
        {
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'images': product.images.join(','),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  // Get all products
  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        images: (maps[i]['images'] as String).split(','),
      );
    });
  }

  // Delete all products
  Future<void> deleteAllProducts() async {
    final db = await database;
    await db.delete('products');
  }

  // Close database
  Future close() async {
    final db = await database;
    db.close();
  }
}