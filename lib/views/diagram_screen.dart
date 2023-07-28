import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/view_models/transactions_view_model.dart';

import '../store/app_state.dart';
import 'components/donut/donut.dart';
import 'components/donut/donut_details_widget.dart';
import 'components/transactions/transations_empty_widget.dart';

class DiagramScreen extends StatelessWidget {
  const DiagramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TransactionsViewModel>(
        converter: TransactionsViewModel.converter,
        builder: (context, viewModel) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.transactions.isEmpty) {
            return const TransactionsEmptyWidget();
          }
          return OrientationBuilder(
            builder: (context, orientation) {
              return Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Flex(
                      direction: orientation == Orientation.portrait
                          ? Axis.vertical
                          : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Donut(viewModel.data),
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                        Expanded(
                          child: DonutDetailsWidget(viewModel.data),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
