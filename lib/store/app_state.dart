import 'package:flutter/material.dart';
import 'package:transactions/store/dashboard/dashboard_state.dart';

import 'login/login_state.dart';
import 'transactions/transactions_state.dart';

@immutable
class AppState {
  final LoginState loginState;
  final DashboardState dashboardState;
  final TransactionsState transactionsState;

  const AppState(
    this.loginState,
    this.dashboardState,
    this.transactionsState,
  );

  factory AppState.initial() => AppState(
        LoginState.initial(),
        DashboardState.initial(),
        TransactionsState.initial(),
      );

  AppState copyWith(
    LoginState? loginState,
    DashboardState? dashboardState,
    TransactionsState? transactionsState,
  ) {
    return AppState(
      loginState ?? this.loginState,
      dashboardState ?? this.dashboardState,
      transactionsState ?? this.transactionsState,
    );
  }

  @override
  int get hashCode => hashValues(
        loginState,
        dashboardState,
        transactionsState,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AppState &&
            loginState == other.loginState &&
            dashboardState == other.dashboardState &&
            transactionsState == other.transactionsState);
  }
}
