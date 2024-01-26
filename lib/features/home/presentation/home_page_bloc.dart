import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_financial_records/features/home/database/model/transaction_model.dart';
import 'package:simple_financial_records/features/home/domain/finance.dart';

import '../domain/insert_finance.dart';
import '../domain/load_finance.dart';

part 'home_page_bloc.freezed.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final LoadFinance loadFinanceUseCase;
  final InsertFinance insertFinanceUseCase;

  HomePageBloc(this.loadFinanceUseCase, this.insertFinanceUseCase)
      : super(const _Initial()) {
    on<HomePageEvent>((events, emit) async {
      emit(const _IsLoading());
      await events.when(
        loadFinance: () async {
          var result = await loadFinanceUseCase.loadFinance();
          result.when(
            success: (value) {
              emit(_IsLoadFinance(value));
            },
            failure: (errorMessage) {
              emit(_IsError(errorMessage));
            },
          );
        },
        insertFinance: (transactionModel) {
          insertFinanceUseCase.insertFinance(transactionModel);
        },
      );
    });
  }
}
