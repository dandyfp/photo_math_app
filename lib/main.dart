import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_math_app/src/presentation/home/pages/home_page.dart';
import 'package:photo_math_app/src/presentation/image/bloc/add_data_calculation_bloc.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AddDataCalculationBloc(),
        child: const HomePage(),
      ),
    );
  }
}
