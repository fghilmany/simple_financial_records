import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_financial_records/features/home/presentation/home_page_bloc.dart';
import 'package:simple_financial_records/main/factories/home_page_bloc_factory.dart';

import '../features/home/ui/home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomePageBloc>(create: (context) => HomePageBlocFactory.createHomePageBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
