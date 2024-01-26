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
  void insertFinance(TransactionModel transactionModel) {
    dbHelper.insert(TransactionQuery.TRANSACTION_TABLE_NAME, Map<String, Object>.from(transactionModel.toJson()));
  }

}