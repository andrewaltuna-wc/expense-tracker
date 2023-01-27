import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    required this.balance,
    required this.income,
    required this.expense,
    super.key,
  });

  final String balance, income, expense;

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
            Text(
              '₱ $balance',
              style: const TextStyle(
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

  Widget incomeWidget(String value) {
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
            Text(
              '₱ $value',
              style: const TextStyle(
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

  Widget expenseWidget(String value) {
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
            Text(
              '₱ $value',
              style: const TextStyle(
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
