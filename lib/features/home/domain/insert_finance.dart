import '../database/model/transaction_model.dart';
import 'finance.dart';

abstract interface class InsertFinance{
  void insertFinance(TransactionModel transactionModel);
}