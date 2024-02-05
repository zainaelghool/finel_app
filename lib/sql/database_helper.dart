import 'dart:async';
//import 'dart:io';

import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "real_estate.db";
  static const _databaseVersion = 1;

  static const tableUsers = 'users';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnPassword = 'password';
  static const columnStatus = 'status';

  static const tableProperties = 'properties';
  static const columnPropertyId = 'id';
  static const columnImagePath = 'imagePath';
  static const columnMorImagesUrl = 'morImagesUrl';
  static const columnPrice = 'price';
  static const columnAddress = 'address';
  static const columnPhone = 'Phone';
  static const columnBedroom = 'bedroom';
  static const columnBathroom = 'bathroom';
  static const columnGarages = 'garages';
  static const columnLivingroom = 'livingroom';
  static const columnKitchen = 'kitchen';
  static const columnDescription = 'description';
  static const columnSqfeet = 'sqfeet';
  static const columnTime = 'time';

  // Singleton instance
  static Database? _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUsers (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnPassword TEXT NOT NULL,
        $columnStatus TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE $tableProperties (
        $columnPropertyId INTEGER PRIMARY KEY,
        $columnImagePath TEXT NOT NULL,
        $columnMorImagesUrl BLOB NOT NULL,
        $columnPrice REAL NOT NULL,
        $columnAddress TEXT NOT NULL,
        $columnPhone TEXT NOT NULL,
        $columnBedroom INTEGER NOT NULL,
        $columnBathroom INTEGER NOT NULL,
        $columnGarages INTEGER NOT NULL,
        $columnLivingroom INTEGER NOT NULL,
        $columnKitchen INTEGER NOT NULL,
        $columnDescription TEXT NOT NULL,
        $columnSqfeet REAL NOT NULL,
        $columnTime TEXT NOT NULL
      )
      ''');
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(tableUsers, row);
  }

  Future<int> updateUser(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(tableUsers, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    Database? db = await instance.database;
    return await db!
        .delete(tableUsers, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database? db = await instance.database;
    return await db!.query(tableUsers);
  }

  Future<int> insertProperty(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(tableProperties, row);
  }

  Future<int> updateProperty(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnPropertyId];
    return await db!.update(tableProperties, row,
        where: '$columnPropertyId = ?', whereArgs: [id]);
  }

  Future<int> deleteProperty(int id) async {
    Database? db = await instance.database;
    return await db!.delete(tableProperties,
        where: '$columnPropertyId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getProperties() async {
    Database? db = await instance.database;
    return await db!.query(tableProperties);
  }
}
