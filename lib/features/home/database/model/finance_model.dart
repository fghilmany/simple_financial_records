import 'package:freezed_annotation/freezed_annotation.dart';

part 'finance_model.freezed.dart';
part 'finance_model.g.dart';


@freezed
class FinanceModel with _$FinanceModel {
  const factory FinanceModel({
    required int total,
    required int id,
  }) = _FinanceModel;

  factory FinanceModel.fromJson(Map<String, dynamic> json) => _$FinanceModelFromJson(json);

}
