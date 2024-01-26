import 'dart:convert';

import 'package:simple_financial_records/features/home/database/model/transaction_model.dart';
import 'package:simple_financial_records/features/home/database/queries/transaction_query.dart';

import '../../../../framework/db_helper.dart';
import '../../domain/insert_finance.dart';
import '../../domain/transaction_type.dart';

class InsertFinanceUseCase implements InsertFinance{

  DbHelper dbHelper;
  InsertFinanceUseCase({required this.dbHelper});

  @override
  void insertFinance() {
    dbHelper.insert(TransactionQuery.TRANSACTION_TABLE_NAME, Map<String, Object>.from(TransactionModel(nominal: 10000, dates: 29999, notes: "notes", type: TransactionType.income.name).toJson()));
    dbHelper.insert(TransactionQuery.TRANSACTION_TABLE_NAME, Map<String, Object>.from(TransactionModel(nominal: 10000, dates: 29999, notes: "notes", type: TransactionType.outcome.name).toJson()));
    dbHelper.insert(TransactionQuery.TRANSACTION_TABLE_NAME, Map<String, Object>.from(TransactionModel(nominal: 10000, dates: 29999, notes: "notes", type: TransactionType.outcome.name).toJson()));
    dbHelper.insert(TransactionQuery.TRANSACTION_TABLE_NAME, Map<String, Object>.from(TransactionModel(nominal: 10000, dates: 29999, notes: "notes", type: TransactionType.income.name).toJson()));
    dbHelper.insert(TransactionQuery.TRANSACTION_TABLE_NAME, Map<String, Object>.from(TransactionModel(nominal: 10000, dates: 29999, notes: "notes", type: TransactionType.income.name).toJson()));
  }

}