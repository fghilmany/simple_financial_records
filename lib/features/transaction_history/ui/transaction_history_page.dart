import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';
import 'package:simple_financial_records/features/transaction_history/presentation/history_transaction_page_bloc.dart';
import 'package:simple_financial_records/features/transaction_history/ui/widget/list_transaction.dart';

import '../../transaction_history/domain/finance.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {

  Finance finance = Finance();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HistoryTransactionPageBloc>(context)
        .add(const HistoryTransactionPageEvent.loadFinance());
  }

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
      body:
          BlocConsumer<HistoryTransactionPageBloc, HistoryTransactionPageState>(
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
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              const Column(
                children: [
                  Text(
                    "All",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              if(finance.transaction != null) Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 64.0),
                    itemCount: finance.transaction?.length,
                    itemBuilder: (context, index) {
                      return ListTransaction(transaction: finance.transaction?[index],);
                    }),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: ColorUiKit.backgroundColor,
                  padding: const EdgeInsets.only(
                    bottom: 24.0,
                  ),
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            Text(
                              "Rp ${finance.total ?? 0}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
