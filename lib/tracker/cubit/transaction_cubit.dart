import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/tracker/mixins/double_formatter.dart';
import 'package:expense_tracker/tracker/models/transaction.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState());

  void addTransaction(Transaction transaction) {
    emit(state.copyWith(
      transactions: [...state.transactions, transaction],
    ));
  }

  void removeTransaction(int index) {
    List<Transaction> newList = [...state.transactions];
    newList.removeAt(index);

    emit(state.copyWith(
      transactions: newList,
    ));
  }
}
