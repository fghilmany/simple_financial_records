

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';
import 'package:simple_financial_records/features/transaction_history/database/model/transaction_model.dart';
import 'package:simple_financial_records/features/transaction_history/domain/finance.dart';
import 'package:simple_financial_records/features/transaction_history/domain/transaction_type.dart';

class EditTransactionDialog extends StatefulWidget {
  const EditTransactionDialog({super.key, required this.type, required this.onClick, required this.transaction});

  final String type;
  final Transaction transaction;
  final Function(Transaction transaction) onClick;

  @override
  State<EditTransactionDialog> createState() => _EditTransactionDialogState();
}

class _EditTransactionDialogState extends State<EditTransactionDialog> {

  final TextEditingController nominalController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nominalController.text = widget.transaction.nominal.toString();
    notesController.text = widget.transaction.notes .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorUiKit.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Edit your ${widget.type == TransactionType.income.name ? "Income" : "Outcome"}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            TextFormField(
              controller: nominalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefix: Text("Rp"),
                border: UnderlineInputBorder(),
                labelText: "Nominal",
              ),
            ),
            TextFormField(
              controller: notesController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Notes",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.sizeOf(context).width, 40.0)),
                  backgroundColor:
                      MaterialStateProperty.all(ColorUiKit.buttonColor),
                ),
                onPressed: () {
                  setState(() {
                    widget.onClick(
                      Transaction(
                        id: widget.transaction.id ,
                        nominal: int.parse(nominalController.value.text),
                        date: DateTime.now().millisecondsSinceEpoch,
                        notes: notesController.value.text,
                        type: widget.type,
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
