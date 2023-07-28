import 'package:redux/redux.dart';
import 'package:transactions/auth/service.dart';
import 'package:transactions/store/app_state.dart';
import 'package:transactions/store/login/actions.dart';
import 'package:transactions/utils/exceptions/exceptions.dart';

class LoginMiddleware implements MiddlewareClass<AppState> {
  final AuthService service;

  LoginMiddleware(this.service);

  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    if (action is LoginLoadingAction) {
      try {
        await service.tryLogin(action.user);
        store.dispatch(LoginSucceededAction());
      } on AuthException catch (e) {
        store.dispatch(LoginFailedAction(e.message));
      }
    }
  }
}
