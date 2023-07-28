import 'package:redux/redux.dart';

import 'dashboard_state.dart';
import 'actions.dart';

final dashboardReducer =
    TypedReducer<DashboardState, ChangeTabAction>(changeTab);

DashboardState changeTab(DashboardState state, ChangeTabAction action) {
  return state.copyWith(
    currentIndex: action.index,
  );
}
