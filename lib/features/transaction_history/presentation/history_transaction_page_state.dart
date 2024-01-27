part of 'history_transaction_page_bloc.dart';

@freezed
class HistoryTransactionPageState with _$HistoryTransactionPageState {
  const factory HistoryTransactionPageState.initial() = _Initial;
  const factory HistoryTransactionPageState.isLoading() = _IsLoading;
  const factory HistoryTransactionPageState.isError(String errorMessage) =
  _IsError;
  const factory HistoryTransactionPageState.isLoadFinance(Finance finance) = _IsLoadFinance;
}