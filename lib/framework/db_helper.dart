import 'dart:developer';

import 'package:simple_financial_records/features/home/database/queries/transaction_query.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._singleton();

  factory DbHelper() {
    return _dbHelper;
  }

  DbHelper._singleton();

  final tables = [
    TransactionQuery.CREATE_TRANSACTION_TABLE
  ];

  Future<Database> openDB() async {
    final dbPath = await sqlite.getDatabasesPath();
    return sqlite.openDatabase(path.join(dbPath, 'simple_finance.db'),
        onCreate: (db, version) async {
      for (var table in tables) {
        await db.execute(table).then((value) {
          log("success ");
        }).catchError((err) {
          log("error: ${err.toString()}");
        });
      }
    }, version: 1);
  }

  insert(String table, Map<String, Object> data) {
    openDB().then((db) {
      db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    }).catchError((err) {
      log("error $err");
    });
  }

  Future<List> executeRawQuery(String query) async {
    final db = await openDB();
    var result = await db.rawQuery(query);
    return result.toList();
  }
}
