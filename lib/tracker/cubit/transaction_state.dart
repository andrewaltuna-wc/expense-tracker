part of 'transaction_cubit.dart';

enum TotalType { balance, income, expense }

class TransactionState extends Equatable with DoubleFormatter {
  const TransactionState({
    this.transactions = const <Transaction>[],
  });

  final List<Transaction> transactions;

  TransactionState copyWith({
    List<Transaction>? transactions,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
    );
  }

  String getTotal(TotalType type) {
    double amount = 0.0;
    for (Transaction trans in transactions) {
      switch (type) {
        case TotalType.balance:
          amount += trans.amount;
          break;
        case TotalType.income:
          if (trans.amount > 0) {
            amount += trans.amount;
          }
          break;
        case TotalType.expense:
          if (trans.amount < 0) {
            amount += trans.amount;
          }
          break;
      }
    }
    return formatDouble(amount);
  }

  @override
  List<Object?> get props => [transactions];

  // String formatDouble(double value) {
  //   return value.toString().replaceAllMapped(
  //       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  // }
}
