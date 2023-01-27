import 'package:equatable/equatable.dart';
import 'package:expense_tracker/tracker/mixins/double_formatter.dart';

class Transaction extends Equatable with DoubleFormatter {
  const Transaction({
    required this.name,
    required this.amount,
  });

  final String name;
  final double amount;

  @override
  List<Object> get props => [name, amount];
}
