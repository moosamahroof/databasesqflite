import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLhelper {

  static Future<void> creatTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
    
    """);
  }

  //createdAT // THE TIME THAT ITEM WAS CREATED

  static Future<sql.Database> db() async {
    return sql.openDatabase("kindacode.db", version: 1,
      onCreate: (sql.Database database, int version) async {
        await creatTables(database);
      },
    );
  }

//read all items from db
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLhelper.db();
    return db.query('items', orderBy: "id");
  }

//create new item

  static Future<int> createItem(String title, String? description) async {
    final db = await SQLhelper.db();
    final data = {'title': title, "description": description};
    final id = await db.insert("items", data);
    return id;
  }

// READ A SINGLE ITEM BY ID
  static Future<int> updateItem(int id, String title,
      String? description) async {
    final db = await SQLhelper.db();
    final data = {
      'title': title,
      "description": description,
      'createdAt': DateTime.now().toString()
    };
    final result = await db.update(
        'items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLhelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}