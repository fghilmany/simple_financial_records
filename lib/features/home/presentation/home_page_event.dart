part of 'home_page_bloc.dart';

@freezed
class HomePageEvent with _$HomePageEvent{
  const factory HomePageEvent.loadFinance() = _HomePageLoaded;
  const factory HomePageEvent.insertFinance(TransactionModel transactionModel) = _HomePageInserted;
}