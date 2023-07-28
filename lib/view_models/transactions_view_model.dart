import 'package:redux/redux.dart';
import 'package:transactions/models/donut_data.dart';
import 'package:transactions/models/transactions_type.dart';
import 'package:transactions/store/transactions/actions.dart';

import '../models/transaction.dart';
import '../store/app_state.dart';

class TransactionsViewModel {
  final Store<AppState> _store;

  final List<Transaction> transactions;

  final bool isLoading;

  final String? errorMessage;

  TransactionsViewModel(
    this._store,
    this.transactions,
    this.isLoading,
    this.errorMessage,
  );

  static TransactionsViewModel converter(Store<AppState> store) {
    return TransactionsViewModel(
      store,
      store.state.transactionsState.transactions,
      store.state.transactionsState.isLoading,
      store.state.transactionsState.errorMessage,
    );
  }

  void getTransactions() {
    _store.dispatch(LoadingTransactions());
  }

  void removeTransaction(int id) {
    _store.dispatch(DeleteTransaction(id));
  }

  List<DonutData> get data {
    return [
      DonutData(
          transactionType: TransactionType.deposit,
          total: transactions
              .where((t) => t.transactionType == TransactionType.deposit)
              .map((t) => t.finalAmount)
              .fold(0, (value, element) => value + element)),
      DonutData(
          transactionType: TransactionType.withdrawal,
          total: transactions
              .where((t) => t.transactionType == TransactionType.withdrawal)
              .map((t) => t.finalAmount)
              .fold(0, (value, element) => value + element)),
      DonutData(
          transactionType: TransactionType.transfer,
          total: transactions
              .where((t) => t.transactionType == TransactionType.transfer)
              .map((t) => t.finalAmount)
              .fold(0, (value, element) => value + element)),
    ];
  }
}
