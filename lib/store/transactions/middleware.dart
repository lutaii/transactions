import 'package:redux/redux.dart';
import 'package:transactions/api/api.dart';
import 'package:transactions/store/app_state.dart';
import 'package:transactions/store/transactions/actions.dart';
import 'package:transactions/utils/exceptions/exceptions.dart';

class TransactionsMiddleware implements MiddlewareClass<AppState> {
  final Api api;

  TransactionsMiddleware(this.api);

  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    if (action is LoadingTransactions) {
      try {
        final transactions = await api.getTransactions();
        store.dispatch(LoadingTransactionsSucceeded(transactions));
      } on ApiException catch (e) {
        store.dispatch(LoadingTransactionsFailed(e.message));
      }
    }
  }
}
