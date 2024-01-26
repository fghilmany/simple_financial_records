import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_financial_records/features/home/presentation/home_page_bloc.dart';
import 'package:simple_financial_records/main/factories/insert_finance_factory.dart';
import 'package:simple_financial_records/main/factories/load_finance_factory.dart';

class HomePageBlocFactory{
  static HomePageBloc createHomePageBloc(){
    return HomePageBloc(LoadFinanceFactory.createLoadFinanceUseCase(), InsertFinanceFactory.createInsertFinanceUseCase());
  }
}