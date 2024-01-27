part of 'history_transaction_page_bloc.dart';

@freezed
class HistoryTransactionPageEvent with _$HistoryTransactionPageEvent{
  const factory HistoryTransactionPageEvent.loadFinance() = _HistoryTransactionPageLoaded;
}