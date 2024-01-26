import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_data.freezed.dart';

@freezed
abstract class ResultData<T> with _$ResultData<T>{
  const factory ResultData.success(T data) = Success<T>;
  const factory ResultData.failure(String errorMessage) = Failure<T>;
}
