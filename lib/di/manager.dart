import 'package:get_it/get_it.dart';
import 'package:transactions/api/api.dart';
import 'package:transactions/auth/service.dart';

final GetIt getIt = GetIt.asNewInstance();

class Manager {
  void configureDependencies(
    GetIt getIt,
  ) {
    registerAuthService(getIt);
    registerApi(getIt);
  }

  void registerAuthService(GetIt getIt) {
    getIt.registerSingleton<AuthService>(
      MockAuthService(),
    );
  }

  void registerApi(GetIt getIt) {
    getIt.registerSingleton<Api>(
      MockApi(),
    );
  }
}
