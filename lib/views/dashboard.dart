import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/store/app_state.dart';
import 'package:transactions/view_models/tab_view_model.dart';
import 'package:transactions/views/diagram_screen.dart';
import 'package:transactions/views/transactions_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TabViewModel>(
        converter: TabViewModel.converter,
        builder: (context, viewModel) {
          return Scaffold(
            body: IndexedStack(
              index: viewModel.currentIndex,
              children: const [
                TransactionsScreen(),
                DiagramScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: viewModel.changeTab,
              currentIndex: viewModel.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.attach_money,
                  ),
                  label: 'Transactions',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.donut_large,
                  ),
                  label: 'Diagram',
                ),
              ],
            ),
          );
        });
  }
}
