import 'package:transactions/utils/logger.dart';

import '../models/user.dart';
import '../utils/exceptions/exceptions.dart';

abstract class AuthService {
  Future<bool> tryLogin(User user);
}

class MockAuthService extends AuthService {
  @override
  Future<bool> tryLogin(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    logger.d('User with username ${user.username} try to login');
    if (user.username == 'test' && user.password == 'test') {
      logger.d('User with username ${user.username} log in succsessfully');
      return true;
    } else {
      logger.d('User with username ${user.username} log in failed');
      throw AuthException('Username/password are invalid');
    }
  }
}
