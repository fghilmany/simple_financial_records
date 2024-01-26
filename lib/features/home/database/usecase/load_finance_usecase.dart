import 'dart:developer';

import 'package:simple_financial_records/common/state/result_data.dart';
import 'package:simple_financial_records/features/home/database/finance_mapper.dart';
import 'package:simple_financial_records/features/home/database/model/finance_model.dart';
import 'package:simple_financial_records/features/home/database/model/transaction_model.dart';
import 'package:simple_financial_records/features/home/database/queries/transaction_query.dart';
import 'package:simple_financial_records/features/home/domain/finance.dart';
import 'package:simple_financial_records/features/home/domain/load_finance.dart';

import '../../../../framework/db_helper.dart';

class LoadFinanceUseCase implements LoadFinance {
  DbHelper dbHelper;
  LoadFinanceUseCase({required this.dbHelper});

  @override
  Future<ResultData<Finance>> loadFinance() async {

    return dbHelper
        .getData(TransactionQuery.TRANSACTION_TABLE_NAME)
        .then((values){
          final Finance finance = Finance();
          int total = 0;
          var transactions = <TransactionModel>[];
          for (var value in values){
            final result = TransactionModel.fromJson(value);
            transactions.add(result);
            total += result.nominal;
          }

          return ResultData.success(Finance(total: total, transaction: FinanceMapper.mapTransactionToDomain(transactions)));
    }).onError((error, stackTrace){
      log("error: $error");
      return ResultData.failure(error as String);
    });
  }
}
