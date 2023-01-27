import 'package:expense_tracker/tracker/cubit/input_cubit.dart';
import 'package:expense_tracker/tracker/cubit/transaction_cubit.dart';
import 'package:expense_tracker/tracker/models/transaction.dart';
import 'package:expense_tracker/tracker/widgets/balance_widget.dart';
import 'package:expense_tracker/tracker/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerView extends StatelessWidget {
  TrackerView({super.key});

  late Size screenSize;
  late InputCubit inputCubit;
  late TransactionCubit transactionCubit;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    inputCubit = context.read<InputCubit>();
    transactionCubit = context.read<TransactionCubit>();

    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mainHeaderWidget(),
              const SizedBox(height: 15.0),
              BalanceWidget(
                balance: transactionCubit.state.getTotal(TotalType.balance),
                income: transactionCubit.state.getTotal(TotalType.income),
                expense: transactionCubit.state.getTotal(TotalType.expense),
              ),
              const SizedBox(height: 15.0),
              ...historyHeaderWidget(),
              const SizedBox(height: 10.0),
              Expanded(child: transactionsWidget(state.transactions)),
              const SizedBox(height: 15.0),
              addTransactionHeaderWidget(),
              inputWidget(),
            ],
          ),
        );
      },
    );
  }

  Widget mainHeaderWidget() {
    return const Text(
      'Expense Tracker',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  List<Widget> historyHeaderWidget() {
    return [
      const Text(
        'Transaction History',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      const Divider(thickness: 1.0)
    ];
  }

  Widget addTransactionHeaderWidget() {
    return const Text(
      'Add a Transaction',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget inputWidget() {
    return BlocBuilder<InputCubit, InputState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(thickness: 1.0),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.abc),
                    label: const Text('Name'),
                    hintText: 'Enter name',
                    errorText: state.nameInputStatus != InputStatus.invalid
                        ? null
                        : 'Invalid name',
                  ),
                  onChanged: context.read<InputCubit>().nameChanged,
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                flex: 2,
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.onetwothree),
                    label: const Text('Amount'),
                    hintText: 'Enter amount',
                    errorText: state.amountInputStatus != InputStatus.invalid
                        ? null
                        : 'Invalid amount',
                  ),
                  onChanged: context.read<InputCubit>().amountChanged,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: !state.isValid
                ? null
                : () {
                    transactionCubit.addTransaction(
                      inputCubit.state.getTransaction(),
                    );
                    inputCubit.resetInputs();

                    nameController.clear();
                    amountController.clear();
                  },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(35),
            ),
            child: const Text('Add transaction'),
          ),
        ],
      );
    });
  }

  Widget transactionsWidget(List<Transaction> transactions) {
    return transactions.isEmpty
        ? Center(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(50)),
                child: const Text('No transactions yet :-)')),
          )
        : ListView.separated(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: ((context, index) {
              return TransactionListItem(
                  transaction: transactions[index],
                  function: () {
                    transactionCubit.removeTransaction(index);
                  });
            }),
            separatorBuilder: (context, index) => const SizedBox(height: 10.0),
          );
  }
}
