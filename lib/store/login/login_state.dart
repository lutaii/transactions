import 'package:flutter/material.dart';

@immutable
class LoginState {
  final String username;
  final String password;
  final bool hasError;
  final bool isLoading;
  final String? errorMessage;

  const LoginState({
    required this.username,
    required this.password,
    required this.hasError,
    required this.isLoading,
    required this.errorMessage,
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? hasError,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory LoginState.initial() {
    return const LoginState(
      username: '',
      password: '',
      hasError: false,
      isLoading: false,
      errorMessage: null,
    );
  }

  @override
  int get hashCode => hashValues(
        username,
        password,
        hasError,
        isLoading,
        errorMessage,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LoginState &&
            username == other.username &&
            password == other.password &&
            hasError == other.hasError &&
            isLoading == other.isLoading &&
            errorMessage == other.errorMessage);
  }
}
