import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../../models/transaction.dart';

@immutable
class TransactionsState {
  final List<Transaction> transactions;
  final bool isLoading;
  final String? errorMessage;

  const TransactionsState({
    required this.transactions,
    required this.isLoading,
    required this.errorMessage,
  });

  TransactionsState copyWith({
    List<Transaction>? transactions,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory TransactionsState.initial() {
    return const TransactionsState(
      transactions: [],
      isLoading: false,
      errorMessage: null,
    );
  }

  @override
  int get hashCode => hashValues(
        transactions,
        isLoading,
        errorMessage,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TransactionsState &&
            transactions == other.transactions &&
            isLoading == other.isLoading &&
            errorMessage == other.errorMessage);
  }
}
