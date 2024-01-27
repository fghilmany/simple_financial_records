import 'package:simple_financial_records/framework/db_helper.dart';

import '../../../features/transaction_history/database/usecase/update_transaction_usecase.dart';
import '../../../features/transaction_history/domain/update_finance.dart';

class UpdateFinanceFactory{
  static UpdateFinance createUpdateFinanceUseCase() {
    return UpdateFinanceUseCase(dbHelper: DbHelper());
}
}