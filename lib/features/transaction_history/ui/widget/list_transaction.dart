import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_financial_records/common/extension/common_extension.dart';
import 'package:simple_financial_records/features/transaction_history/domain/finance.dart';
import 'package:simple_financial_records/features/transaction_history/domain/transaction_type.dart';

import '../../../../common/color_ui_kit.dart';

class ListTransaction extends StatefulWidget {
  const ListTransaction({super.key, this.transaction, required this.deleteItem});

  final Transaction? transaction;
  final Function(Transaction transaction) deleteItem;

  @override
  State<ListTransaction> createState() => _ListTransactionState();
}

class _ListTransactionState extends State<ListTransaction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (value) {
                showDialog(context: context, builder: (buider){
                  return AlertDialog(
                    title: const Text("Delete Item"),
                    content: Text("Are you sure to delete \"${widget.transaction?.notes}\""),
                    backgroundColor: ColorUiKit.backgroundColor,
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text("Delete"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            widget.deleteItem(widget.transaction!);
                          });
                        },
                      ),
                    ],
                  );
                });
              },
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14.0),
                  bottomLeft: Radius.circular(14.0)),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
            ),
          ],
        ),
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (value) {},
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(14.0),
                  bottomRight: Radius.circular(14.0)),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              if (widget.transaction?.type == TransactionType.income.name)
                Container(
                  width: 40.0,
                  height: 40.0,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: ColorUiKit.greenColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              Expanded(
                flex: 5,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      side: BorderSide(color: Colors.black, width: 2.0)),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rp ${widget.transaction?.nominal}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          widget.transaction?.date
                                  .parseTimeMillisToDate("dd/MM/yyyy") ??
                              "",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12.0),
                        ),
                        Text(
                          widget.transaction?.notes ?? "",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (widget.transaction?.type == TransactionType.outcome.name)
                Container(
                  width: 40.0,
                  height: 40.0,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: ColorUiKit.redColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
