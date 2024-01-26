import '../../../common/state/result_data.dart';
import 'finance.dart';

abstract interface class LoadFinance{
  Future<ResultData<Finance>> loadFinance();
}