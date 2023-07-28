import '../../models/transaction.dart';

class LoadingTransactions {}

class LoadingTransactionsFailed {
  final String? errorMessage;

  LoadingTransactionsFailed(this.errorMessage);

  @override
  String toString() {
    return '$LoadingTransactionsFailed($errorMessage)';
  }
}

class LoadingTransactionsSucceeded {
  final List<Transaction> transactions;

  LoadingTransactionsSucceeded(this.transactions);
  @override
  String toString() {
    return '$LoadingTransactionsSucceeded(${transactions.length})';
  }
}

class DeleteTransaction {
  final int id;

  DeleteTransaction(this.id);

  @override
  String toString() {
    return '$DeleteTransaction($id)';
  }
}
