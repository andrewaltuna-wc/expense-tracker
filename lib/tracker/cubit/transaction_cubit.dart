import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/tracker/mixins/double_formatter.dart';
import 'package:expense_tracker/tracker/models/transaction.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState());

  void addTransaction(Transaction transaction) {
    List<Transaction> transactions = [...state.transactions, transaction];

    emitChanges(transactions);
  }

  void removeTransaction(int index) {
    List<Transaction> transactions = [...state.transactions]..removeAt(index);

    emitChanges(transactions);
  }

  void emitChanges(List<Transaction> transactions) {
    double balance = 0;
    double income = 0;
    double expense = 0;

    for (Transaction trans in transactions) {
      double amount = trans.amount;
      balance += amount;
      if (amount >= 0) {
        income += amount;
      } else {
        expense += amount;
      }
    }

    emit(state.copyWith(
      transactions: transactions,
      balance: balance,
      income: income,
      expense: expense,
    ));
  }
}
