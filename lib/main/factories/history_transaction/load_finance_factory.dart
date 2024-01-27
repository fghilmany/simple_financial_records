import 'package:simple_financial_records/features/transaction_history/database/usecase/load_finance_usecase.dart';
import 'package:simple_financial_records/framework/db_helper.dart';

import '../../../features/transaction_history/domain/load_finance.dart';

class LoadFinanceFactory{
  static LoadFinance createLoadFinanceUseCase() {
    return LoadFinanceUseCase(dbHelper: DbHelper());
}
}