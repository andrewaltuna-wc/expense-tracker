import 'package:expense_tracker/tracker/cubit/input_cubit.dart';
import 'package:expense_tracker/tracker/cubit/transaction_cubit.dart';
import 'package:expense_tracker/tracker/view/tracker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => TransactionCubit()),
            BlocProvider(create: (_) => InputCubit()),
          ],
          child: TrackerView(),
        ),
      ),
    );
  }
}
