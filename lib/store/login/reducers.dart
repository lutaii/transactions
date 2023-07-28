import 'package:redux/redux.dart';
import 'package:transactions/store/login/actions.dart';

import 'login_state.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState, LoginLoadingAction>(loginLoading),
  TypedReducer<LoginState, LoginSucceededAction>(loginSucceeded),
  TypedReducer<LoginState, LoginFailedAction>(loginFailed),
]);

LoginState loginLoading(
  LoginState state,
  LoginLoadingAction action,
) {
  return state.copyWith(isLoading: true);
}

LoginState loginSucceeded(
  LoginState state,
  LoginSucceededAction action,
) {
  return state.copyWith(
    isLoading: false,
    hasError: false,
  );
}

LoginState loginFailed(
  LoginState state,
  LoginFailedAction action,
) {
  return state.copyWith(
    isLoading: false,
    hasError: true,
    errorMessage: action.errorMessage,
  );
}
