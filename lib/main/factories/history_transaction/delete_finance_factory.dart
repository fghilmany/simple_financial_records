import 'package:simple_financial_records/framework/db_helper.dart';

import '../../../features/transaction_history/database/usecase/delete_finance_usecase.dart';
import '../../../features/transaction_history/domain/delete_finance.dart';

class DeleteFinanceFactory{
  static DeleteFinance createDeleteFinanceUseCase() {
    return DeleteFinanceUseCase(dbHelper: DbHelper());
}
}