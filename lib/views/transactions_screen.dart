import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/view_models/transactions_view_model.dart';

import '../store/app_state.dart';
import 'components/transactions/total_transaction_avatar.dart';
import 'components/transactions/transaction_tile.dart';
import 'components/transactions/transations_empty_widget.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TransactionsViewModel>(
      converter: TransactionsViewModel.converter,
      onInitialBuild: (viewModel) {
        viewModel.getTransactions();
      },
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              viewModel.transactions.isNotEmpty && !viewModel.isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TotalTransactionsAvatar(
                        transactionsCount: viewModel.transactions.length,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          body: Builder(builder: (context) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.transactions.isEmpty) {
              return const TransactionsEmptyWidget();
            }

            if (viewModel.errorMessage != null) {
              return Center(
                child: Text(viewModel.errorMessage ?? ''),
              );
            }
            return ListView.builder(
              itemCount: viewModel.transactions.length,
              itemBuilder: (context, index) {
                return TransactionTile(
                  viewModel: viewModel,
                  index: index,
                );
              },
            );
          }),
        );
      },
    );
  }
}
