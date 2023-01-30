import 'package:expense_tracker/tracker/mixins/double_formatter.dart';
import 'package:expense_tracker/tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget with DoubleFormatter {
  const TransactionListItem(
      {required this.transaction, required this.function, super.key});

  final Transaction transaction;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 8,
            color: transaction.amount > 0 ? Colors.green : Colors.red,
          ),
          Expanded(
            child: Material(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
              color: Colors.black.withOpacity(0.05),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(transaction.name),
                    Row(
                      children: [
                        Text('₱ ${formatDouble(transaction.amount)}'),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: function,
                            splashRadius: 20,
                            iconSize: 18,
                            icon: const Icon(
                              Icons.highlight_remove,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
