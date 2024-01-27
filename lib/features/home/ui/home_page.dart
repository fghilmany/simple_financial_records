import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';
import 'package:simple_financial_records/features/home/domain/transaction_type.dart';
import 'package:simple_financial_records/features/home/presentation/home_page_bloc.dart';
import 'package:simple_financial_records/features/home/ui/add_transaction_dialog.dart';
import 'package:simple_financial_records/features/home/ui/widget/list_transaction.dart';
import 'package:simple_financial_records/features/transaction_history/ui/transaction_history_page.dart';

import '../domain/finance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Finance finance = Finance();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomePageBloc>(context)
        .add(const HomePageEvent.loadFinance());
  }

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
                  builder: (context) => const TransactionHistoryPage(),
                ),
              ).then((value) {
                BlocProvider.of<HomePageBloc>(context)
                    .add(const HomePageEvent.loadFinance());
              });
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
      body: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          state.when(
            initial: () {
              log("orElse");
            },
            isLoading: () {
              log("isLoading");
            },
            isLoadFinance: (finance) {
              this.finance = finance;
              log("data: ${finance.total}");
            },
            isError: (errorMessage) {
              log("errorMessage");
            },
          );
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Rp ${finance.total}",
                  style: const TextStyle(color: Colors.black, fontSize: 40.0),
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
                              side:
                                  BorderSide(width: 2.0, color: Colors.black)),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AddTransactionDialog(
                                type: TransactionType.income.name,
                                onClick: (transactionModel) {
                                  BlocProvider.of<HomePageBloc>(context).add(
                                      HomePageEvent.insertFinance(
                                          transactionModel));
                                  BlocProvider.of<HomePageBloc>(context)
                                      .add(const HomePageEvent.loadFinance());
                                },
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
                              side:
                                  BorderSide(width: 2.0, color: Colors.black)),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AddTransactionDialog(
                                type: TransactionType.outcome.name,
                                onClick: (transactionModel) {
                                  BlocProvider.of<HomePageBloc>(context).add(
                                      HomePageEvent.insertFinance(
                                          transactionModel));
                                  BlocProvider.of<HomePageBloc>(context)
                                      .add(const HomePageEvent.loadFinance());
                                },
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
              if (finance.transaction != null)
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                      itemCount: finance.transaction!.length,
                      itemBuilder: (context, index) {
                        return ListTransaction(
                            transaction: finance.transaction?[index]);
                      }),
                )
            ],
          );
        },
      ),
    );
  }
}
