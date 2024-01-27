import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_financial_records/common/color_ui_kit.dart';
import 'package:simple_financial_records/common/extension/common_extension.dart';
import 'package:simple_financial_records/features/transaction_history/presentation/history_transaction_page_bloc.dart';
import 'package:simple_financial_records/features/transaction_history/ui/widget/list_transaction.dart';

import '../../transaction_history/domain/finance.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage>
    with RestorationMixin {
  Finance finance = Finance();

  final RestorableDateTimeN _startDate = RestorableDateTimeN(null);
  final RestorableDateTimeN _endDate = RestorableDateTimeN(null);

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
            onPressed: () {
              _restorableDateRangePickerRouteFuture.present();
            },
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
              Column(
                children: [
                  Text(
                    _startDate.value != null
                        ? "${_startDate.value!.millisecondsSinceEpoch.parseTimeMillisToDate("dd/MM/yyyy")} - ${_endDate.value!.millisecondsSinceEpoch.parseTimeMillisToDate("dd/MM/yyyy")}"
                        : "All",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  const Divider(
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              if (finance.transaction != null)
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 64.0),
                      itemCount: finance.transaction?.length,
                      itemBuilder: (context, index) {
                        return ListTransaction(
                          transaction: finance.transaction?[index],
                          deleteItem: (transaction){
                            BlocProvider.of<HistoryTransactionPageBloc>(context)
                              .add(HistoryTransactionPageEvent.deleteTransaction(transaction.id),
                            );
                            BlocProvider.of<HistoryTransactionPageBloc>(context)
                                .add(const HistoryTransactionPageEvent.loadFinance(),
                            );
                          },
                          updateItem: (transaction){
                            BlocProvider.of<HistoryTransactionPageBloc>(context)
                                .add(HistoryTransactionPageEvent.updateTransaction(transaction),
                            );
                            BlocProvider.of<HistoryTransactionPageBloc>(context)
                                .add(const HistoryTransactionPageEvent.loadFinance(),
                            );
                          },
                        );
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

  late final RestorableRouteFuture<DateTimeRange?>
      _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange?>(
    onComplete: _selectDateRange,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator
          .restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
        'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
        'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
      });
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTimeRange?> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange?>(
      context: context,
      builder: (BuildContext context) {
        return DateRangePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDateRange:
              _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
          firstDate: DateTime(2021),
          currentDate: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1,
              DateTime.now().day),
        );
      },
    );
  }

  void _selectDateRange(DateTimeRange? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _startDate.value = newSelectedDate.start;
        _endDate.value = newSelectedDate.end.add(const Duration(hours: 23, minutes: 59));
        BlocProvider.of<HistoryTransactionPageBloc>(context)
            .add(HistoryTransactionPageEvent.loadFinanceRangeByDate(
          _startDate.value!.millisecondsSinceEpoch,
          _endDate.value!.millisecondsSinceEpoch,
        ));
      });
    }
  }

  @override
  String? get restorationId => "main";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null &&
        arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialEndDate'] as int),
      );
    }

    return null;
  }
}
