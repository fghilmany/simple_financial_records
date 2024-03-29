import 'package:simple_financial_records/features/transaction_history/database/model/transaction_model.dart';

class TransactionQuery{

  static const String TRANSACTION_TABLE_NAME = "transactions";
  static const String CREATE_TRANSACTION_TABLE = "CREATE TABLE IF NOT EXISTS $TRANSACTION_TABLE_NAME (id INTEGER, nominal INTEGER, dates INTEGER, notes TEXT, type TEXT)";
  static const String SELECT_TRANSACTION = "Select * from $TRANSACTION_TABLE_NAME ORDER BY dates DESC";
  static String SELECT_TRANSACTION_BETWEEN_BY_DATE(int startDate, int endDate) => "SELECT * FROM $TRANSACTION_TABLE_NAME WHERE dates BETWEEN $startDate AND $endDate ORDER BY dates DESC";
  static String DELETE_TRANSACTION(int id) => "DELETE FROM $TRANSACTION_TABLE_NAME WHERE id = $id";
  static String UPDATE_TRANSACTION(TransactionModel transactionModel) => "UPDATE $TRANSACTION_TABLE_NAME SET nominal = ${transactionModel.nominal}, notes = '${transactionModel.notes}' WHERE id = ${transactionModel.id}";

}