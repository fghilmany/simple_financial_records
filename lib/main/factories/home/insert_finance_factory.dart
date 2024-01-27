import 'package:simple_financial_records/features/home/domain/insert_finance.dart';
import 'package:simple_financial_records/framework/db_helper.dart';

import '../../../features/home/database/usecase/insert_finance_usecase.dart';

class InsertFinanceFactory{
  static InsertFinance createInsertFinanceUseCase() {
    return InsertFinanceUseCase(dbHelper: DbHelper());
  }
}