import 'dart:async';
import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    _instance ??= DatabaseHelper._internal();
    return _instance!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'agenda.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE calculate(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        input TEXT,
        result TEXT,
        imagePath BLOB
      )
    ''');
  }

  Future<int> insertData({
    required String input,
    required String result,
    required List<int> imagePath,
  }) async {
    Database db = await database;

    return await db.insert('calculate', {
      'input': input,
      'result': result,
      'imagePath': Uint8List.fromList(imagePath),
    });
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database db = await database;
    return await db.query('calculate');
  }
}
