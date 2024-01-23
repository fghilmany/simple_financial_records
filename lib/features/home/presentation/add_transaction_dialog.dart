import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';

class AddTransactionDialog extends StatelessWidget {
  const AddTransactionDialog({super.key, required this.isAddIncome});

  final bool isAddIncome;

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
              "Input ${isAddIncome ? "Income" : "Outcome"}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefix: Text("Rp"),
                border: UnderlineInputBorder(),
                labelText: "Nominal",
              ),
            ),
            TextFormField(
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
