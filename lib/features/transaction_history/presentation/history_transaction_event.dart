part of 'history_transaction_page_bloc.dart';

@freezed
class HistoryTransactionPageEvent with _$HistoryTransactionPageEvent{
  const factory HistoryTransactionPageEvent.loadFinance() = _HistoryTransactionPageLoaded;
  const factory HistoryTransactionPageEvent.loadFinanceRangeByDate(int startDate, int endDate) = _HistoryTransactionPageLoadedRangeByDate;
  const factory HistoryTransactionPageEvent.deleteTransaction(int id) = _HistoryTransactionPageDeleted;
}