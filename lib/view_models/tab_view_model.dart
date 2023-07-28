import 'package:redux/redux.dart';

import '../store/app_state.dart';
import '../store/dashboard/actions.dart';

class TabViewModel {
  final Store<AppState> _store;

  final int currentIndex;

  TabViewModel(
    this._store,
    this.currentIndex,
  );

  static TabViewModel converter(Store<AppState> store) {
    return TabViewModel(
      store,
      store.state.dashboardState.currentIndex,
    );
  }

  void changeTab(int index) => _store.dispatch(ChangeTabAction(index));
}
