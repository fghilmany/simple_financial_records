import 'package:simple_financial_records/features/transaction_history/database/finance_mapper.dart';

import '../../../../framework/db_helper.dart';
import '../../domain/finance.dart';
import '../queries/transaction_query.dart';
import '../../domain/update_finance.dart';

class UpdateFinanceUseCase implements UpdateFinance {
  DbHelper dbHelper;
  UpdateFinanceUseCase({required this.dbHelper});

  @override
  void updateFinance(Transaction transaction) {
    dbHelper.executeRawQuery(
      TransactionQuery.UPDATE_TRANSACTION(
          FinanceMapper.mapTransactionToModel(transaction))
    );
  }

}
