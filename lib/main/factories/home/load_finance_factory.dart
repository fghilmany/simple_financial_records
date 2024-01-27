import 'package:simple_financial_records/features/home/database/usecase/load_finance_usecase.dart';
import 'package:simple_financial_records/framework/db_helper.dart';

import '../../../features/home/domain/load_finance.dart';

class LoadFinanceFactory{
  static LoadFinance createLoadFinanceUseCase() {
    return LoadFinanceUseCase(dbHelper: DbHelper());
}
}