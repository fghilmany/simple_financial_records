class Finance {
  int? total;
  List<Transaction>? transaction;

  Finance({
    this.total,
    this.transaction,
  });

}

class Transaction {
  final int id;
  final int nominal;
  final int date;
  final String? notes;
  final String type;

  Transaction({
    required this.id,
    required this.nominal,
    required this.date,
    this.notes,
    required this.type,
  });

}
