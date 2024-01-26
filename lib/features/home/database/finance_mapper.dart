import 'package:simple_financial_records/features/home/database/model/finance_model.dart';
import 'package:simple_financial_records/features/home/database/model/transaction_model.dart';
import 'package:simple_financial_records/features/home/domain/finance.dart';

class FinanceMapper {
  static List<Transaction> mapTransactionToDomain(
          List<TransactionModel> transactionModel) =>
      transactionModel.map((transactionModel){
        return Transaction(
          nominal: transactionModel.nominal,
          date: transactionModel.dates,
          notes: transactionModel.notes,
          type: transactionModel.type
        );
      }).toList();
}
