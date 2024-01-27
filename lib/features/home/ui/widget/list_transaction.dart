import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_financial_records/common/extension/common_extension.dart';
import 'package:simple_financial_records/features/home/domain/finance.dart';
import 'package:simple_financial_records/features/home/domain/transaction_type.dart';

import '../../../../common/color_ui_kit.dart';

class ListTransaction extends StatelessWidget {
  const ListTransaction({super.key, this.transaction});

  final Transaction? transaction;

  @override
  Widget build(BuildContext context) {
    print("debug: ${transaction?.date}");
    return Row(
      children: [
        if (transaction?.type == TransactionType.income.name) Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: ColorUiKit.greenColor,
            borderRadius:
            const BorderRadius.all(Radius.circular(12.0)),
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
                borderRadius:
                BorderRadius.all(Radius.circular(14)),
                side:
                BorderSide(color: Colors.black, width: 2.0)),
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rp ${transaction?.nominal}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  Text(
                    transaction?.date.parseTimeMillisToDate("dd/MM/yyyy") ?? "",
                    style: const TextStyle(
                        color: Colors.black, fontSize: 12.0),
                  ),
                  Text(
                    transaction?.notes ?? "",
                    style: const TextStyle(
                        color: Colors.black, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (transaction?.type == TransactionType.outcome.name) Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: ColorUiKit.redColor,
            borderRadius:
            const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(color: Colors.black, width: 2.0),
          ),
          child: const Icon(
            Icons.remove,
            size: 24,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
