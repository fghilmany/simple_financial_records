class Finance {
  final int total;
  final List<Transaction> transaction;

  Finance({
    required this.total,
    required this.transaction,
  });

}

class Transaction {
  final int id;
  final int nominal;
  final int date;
  final String? notes;

  Transaction({
    required this.id,
    required this.nominal,
    required this.date,
    this.notes,
  });

}
