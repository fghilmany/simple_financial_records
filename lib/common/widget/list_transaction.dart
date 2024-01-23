import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color_ui_kit.dart';

class ListTransaction extends StatelessWidget {
  const ListTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
        const Expanded(
          flex: 5,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(14)),
                side:
                BorderSide(color: Colors.black, width: 2.0)),
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rp 100.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  Text(
                    "01/01/2023",
                    style: TextStyle(
                        color: Colors.black, fontSize: 12.0),
                  ),
                  Text(
                    "Jajan bakso",
                    style: TextStyle(
                        color: Colors.black, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
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
