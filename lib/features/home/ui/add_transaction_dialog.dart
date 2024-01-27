

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';
import 'package:simple_financial_records/features/home/database/model/transaction_model.dart';
import 'package:simple_financial_records/features/home/domain/transaction_type.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key, required this.type, required this.onClick});

  final String type;
  final Function(TransactionModel transactionModel) onClick;

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {

  final TextEditingController nominalController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

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
              "Input ${widget.type == TransactionType.income.name ? "Income" : "Outcome"}",
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
                    widget.onClick(TransactionModel(id: UniqueKey().hashCode ,nominal: int.parse(nominalController.value.text), dates: DateTime.now().millisecondsSinceEpoch, notes: notesController.value.text, type: widget.type));
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
