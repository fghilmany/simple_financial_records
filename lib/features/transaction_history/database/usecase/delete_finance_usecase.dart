import '../../../../framework/db_helper.dart';
import '../../domain/delete_finance.dart';
import '../queries/transaction_query.dart';

class DeleteFinanceUseCase implements DeleteFinance {

  DbHelper dbHelper;
  DeleteFinanceUseCase({required this.dbHelper});

  @override
  void deleteTransactionById(int id) {
    dbHelper.getDataWithQuery(TransactionQuery.DELETE_TRANSACTION(id));
  }

}