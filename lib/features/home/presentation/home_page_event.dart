part of 'login_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;
  const factory HomePageState.isLoading() = _IsLoading;
  const factory HomePageState.isError(String errorMessage) =
  _IsError;
}