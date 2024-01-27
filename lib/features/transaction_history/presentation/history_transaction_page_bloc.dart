import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_financial_records/features/transaction_history/domain/finance.dart';

import '../domain/load_finance.dart';

part 'history_transaction_page_bloc.freezed.dart';

part 'history_transaction_event.dart';

part 'history_transaction_page_state.dart';

class HistoryTransactionPageBloc extends Bloc<HistoryTransactionPageEvent, HistoryTransactionPageState> {
  final LoadFinance loadFinanceUseCase;

  HistoryTransactionPageBloc(this.loadFinanceUseCase)
      : super(const _Initial()) {
    on<HistoryTransactionPageEvent>((events, emit) async {
      emit(const _IsLoading());
      await events.when(
        loadFinance: () async {
          var result = await loadFinanceUseCase.loadFinance(null, null);
          result.when(
            success: (value) async {
              emit(_IsLoadFinance(value));
            },
            failure: (errorMessage) {
              emit(_IsError(errorMessage));
            },
          );
        },
        loadFinanceRangeByDate: (startDate, endDate) async {
          var result = await loadFinanceUseCase.loadFinance(startDate, endDate);
          result.when(
            success: (value) async {
              emit(_IsLoadFinance(value));
            },
            failure: (errorMessage) {
              emit(_IsError(errorMessage));
            },
          );
        }
      );
    });
  }
}
