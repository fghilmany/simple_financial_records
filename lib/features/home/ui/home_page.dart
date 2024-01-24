import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';
import 'package:simple_financial_records/common/widget/list_transaction.dart';
import 'package:simple_financial_records/features/home/ui/add_transaction_dialog.dart';
import 'package:simple_financial_records/features/transaction_history/presentation/transaction_history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUiKit.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorUiKit.backgroundColor,
        title: const Text(
          "Personal Finance",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransactionHistoryPage()));
            },
            icon: const Row(
              children: [
                Icon(Icons.menu_book_rounded),
                Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Detail",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(
            thickness: 1.0,
            color: Colors.grey,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Text(
              "Rp 1.000.000",
              style: TextStyle(color: Colors.black, fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                    fixedSize:
                        MaterialStateProperty.all(const Size(80.0, 80.0)),
                    backgroundColor:
                        MaterialStateProperty.all(ColorUiKit.greenColor),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          side: BorderSide(width: 2.0, color: Colors.black)),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AddTransactionDialog(
                            isAddIncome: true,
                          );
                        });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    fixedSize:
                        MaterialStateProperty.all(const Size(80.0, 80.0)),
                    backgroundColor:
                        MaterialStateProperty.all(ColorUiKit.redColor),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          side: BorderSide(width: 2.0, color: Colors.black)),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AddTransactionDialog(
                            isAddIncome: false,
                          );
                        });
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Divider(
              thickness: 2.0,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                itemCount: 2,
                itemBuilder: (context, builder) {
                  return const ListTransaction();
                }),
          )
        ],
      ),
    );
  }
}
