import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:transactions/store/login/actions.dart';

import '../models/user.dart';
import '../store/app_state.dart';

class LoginScreenViewModel {
  final Store<AppState> _store;

  final bool isLoading;

  final String? errorMessage;

  final bool hasError;

  LoginScreenViewModel(
    this._store,
    this.isLoading,
    this.errorMessage,
    this.hasError,
  );

  static LoginScreenViewModel converter(Store<AppState> store) {
    return LoginScreenViewModel(
      store,
      store.state.loginState.isLoading,
      store.state.loginState.errorMessage,
      store.state.loginState.hasError,
    );
  }

  void tryLogin(String username, String password) =>
      _store.dispatch(LoginLoadingAction(
        user: User(
          username: username,
          password: password,
        ),
      ));

  void loginPass(String route) {
    _store.dispatch(NavigateToAction.push(route));
  }
}
