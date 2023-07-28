import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
// ignore: depend_on_referenced_packages
import 'package:redux_logging/redux_logging.dart' as redux_logging;

import 'package:transactions/api/api.dart';
import 'package:transactions/auth/service.dart';
import 'package:transactions/di/manager.dart';
import 'package:transactions/store/login/middleware.dart';
import 'package:transactions/store/transactions/middleware.dart';
import 'package:transactions/views/dashboard.dart';
import 'package:transactions/views/login_screen.dart';

import 'store/app_state.dart';
import 'store/reducer.dart';

void main() async {
  Manager().configureDependencies(getIt);

  final store = Store<AppState>(
    reducer,
    initialState: AppState.initial(),
    middleware: [
      const NavigationMiddleware<AppState>(),
      LoginMiddleware(getIt<AuthService>()),
      TransactionsMiddleware(getIt<Api>()),
      redux_logging.LoggingMiddleware.printer(),
    ],
  );

  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              overlayColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              overlayColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        themeMode: ThemeMode.system,
        navigatorKey: NavigatorHolder.navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/dashboard': (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
