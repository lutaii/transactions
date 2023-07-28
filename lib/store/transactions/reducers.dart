import 'package:redux/redux.dart';
import 'package:transactions/store/transactions/actions.dart';

import 'transactions_state.dart';

final transactionsReducer = combineReducers<TransactionsState>([
  TypedReducer<TransactionsState, LoadingTransactions>(transactionsLoading),
  TypedReducer<TransactionsState, LoadingTransactionsSucceeded>(
      loadingSucceeded),
  TypedReducer<TransactionsState, LoadingTransactionsFailed>(loadingFailed),
  TypedReducer<TransactionsState, DeleteTransaction>(deleteTransaction),
]);

TransactionsState transactionsLoading(
  TransactionsState state,
  LoadingTransactions action,
) {
  return state.copyWith(isLoading: true);
}

TransactionsState loadingSucceeded(
  TransactionsState state,
  LoadingTransactionsSucceeded action,
) {
  return state.copyWith(
    isLoading: false,
    transactions: action.transactions,
  );
}

TransactionsState loadingFailed(
  TransactionsState state,
  LoadingTransactionsFailed action,
) {
  return state.copyWith(
    isLoading: false,
    errorMessage: action.errorMessage,
  );
}

TransactionsState deleteTransaction(
  TransactionsState state,
  DeleteTransaction action,
) {
  return state.copyWith(
    transactions: state.transactions
        .where((transaction) => transaction.id != action.id)
        .toList(),
  );
}
