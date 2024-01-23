import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';

import '../../../common/widget/list_transaction.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUiKit.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorUiKit.backgroundColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text("Transaction History"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_rounded),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Column(
            children: [
              Text(
                "01/01/2023",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 16.0),
                itemCount: 10,
                itemBuilder: (context, builder) {
                  return const ListTransaction();
                }),
          ),
          Positioned(
            bottom: 24.0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              color: ColorUiKit.backgroundColor,
              padding: const EdgeInsets.only(
                bottom: 24.0,
              ),
              child: const Column(
                children: [
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                          ),
                        ),
                        Text(
                          "Rp 1.000.000",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
