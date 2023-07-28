import 'package:flutter/material.dart';
import 'package:transactions/utils/extensions/extensions.dart';

import '../../../view_models/transactions_view_model.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.viewModel,
    required this.index,
  }) : super(key: key);

  final TransactionsViewModel viewModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(viewModel.transactions[index].id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        viewModel.removeTransaction(viewModel.transactions[index].id);
      },
      background: Container(
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
      child: ExpansionTile(
        title: Text(viewModel.transactions[index].type.toUpperCase()),
        subtitle: Text('id: ${viewModel.transactions[index].id}'),
        trailing: Text(
          viewModel.transactions[index].amount.toStringAsFixed(2),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: viewModel.transactions[index].transactionType.color(),
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title:
                Text('Date & Time: ${viewModel.transactions[index].dateTime}'),
          ),
          ListTile(
            title: Text(
                'Commission: ${(viewModel.transactions[index].commission * 100)}%'),
          ),
          ListTile(
            title: Text(
              'Actual amount: ${viewModel.transactions[index].finalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
