import 'package:transactions/store/app_state.dart';
import 'package:transactions/store/dashboard/reducers.dart';
import 'package:transactions/store/login/reducers.dart';
import 'package:transactions/store/transactions/reducers.dart';

AppState reducer(AppState state, action) {
  return AppState(
    loginReducer(state.loginState, action),
    dashboardReducer(state.dashboardState, action),
    transactionsReducer(state.transactionsState, action),
  );
}
