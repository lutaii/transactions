import '../../models/user.dart';

class LoginLoadingAction {
  final User user;

  LoginLoadingAction({required this.user});

  @override
  String toString() {
    return '$LoginLoadingAction(${user.username})';
  }
}

class LoginSucceededAction {}

class LoginFailedAction {
  final String? errorMessage;

  LoginFailedAction(this.errorMessage);

  @override
  String toString() {
    return '$LoginFailedAction($errorMessage)';
  }
}
