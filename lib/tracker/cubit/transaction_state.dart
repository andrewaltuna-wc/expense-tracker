part of 'transaction_cubit.dart';

enum TotalType { balance, income, expense }

class TransactionState extends Equatable with DoubleFormatter {
  const TransactionState({
    this.transactions = const <Transaction>[],
    this.balance = 0.0,
    this.income = 0.0,
    this.expense = 0.0,
  });

  final List<Transaction> transactions;
  final double balance, income, expense;

  TransactionState copyWith({
    List<Transaction>? transactions,
    double? balance,
    double? income,
    double? expense,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      balance: balance ?? this.balance,
      income: income ?? this.income,
      expense: expense ?? this.expense,
    );
  }

  @override
  List<Object?> get props => [transactions];
}
