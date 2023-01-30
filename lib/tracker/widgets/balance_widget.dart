import 'package:expense_tracker/tracker/widgets/animated_counter_widget.dart';
import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });

  final double balance, income, expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            const Text('TOTAL BALANCE'),
            AnimatedCount(
              count: balance,
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                incomeWidget(income),
                expenseWidget(expense),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget incomeWidget(double value) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_circle_up,
          color: Colors.green,
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Income',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            AnimatedCount(
              count: value,
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.green,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget expenseWidget(double value) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Expense',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            AnimatedCount(
              count: value,
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8.0),
        const Icon(
          Icons.arrow_circle_down,
          color: Colors.red,
        ),
      ],
    );
  }
}
