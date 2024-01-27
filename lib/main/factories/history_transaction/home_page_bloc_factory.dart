import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_financial_records/main/factories/history_transaction/load_finance_factory.dart';

import '../../../features/transaction_history/presentation/history_transaction_page_bloc.dart';

class HistoryTransactionPageBlocFactory{
  static HistoryTransactionPageBloc createHistoryTransactionPageBloc(){
    return HistoryTransactionPageBloc(LoadFinanceFactory.createLoadFinanceUseCase());
  }
}