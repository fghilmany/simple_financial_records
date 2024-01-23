import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';
import 'package:simple_financial_records/features/home/presentation/add_transaction_dialog.dart';

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Row(
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
          )
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
                    showDialog(context: context, builder: (context){
                      return const AddTransactionDialog(isAddIncome: true,);
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
                      showDialog(context: context, builder: (context){
                        return const AddTransactionDialog(isAddIncome: false,);
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
                }),
          )
        ],
      ),
    );
  }
}
