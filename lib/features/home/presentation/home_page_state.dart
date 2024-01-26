part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;
  const factory HomePageState.isLoading() = _IsLoading;
  const factory HomePageState.isError(String errorMessage) =
  _IsError;
  const factory HomePageState.isLoadFinance(Finance finance) = _IsLoadFinance;
}