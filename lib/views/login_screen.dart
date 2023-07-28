import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/store/app_state.dart';
import 'package:transactions/view_models/login_screen_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final _usernameFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, LoginScreenViewModel>(
        converter: LoginScreenViewModel.converter,
        onWillChange: (previousViewModel, newViewModel) {
          if (previousViewModel != null && previousViewModel.isLoading) {
            if (newViewModel.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                _loginErrorSnackBar(newViewModel.errorMessage),
              );
            } else {
              newViewModel.loginPass('/dashboard');
            }
          }
        },
        distinct: true,
        builder: (context, viewModel) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return GestureDetector(
                onTap: () {
                  usernameFocusNode.unfocus();
                  passwordFocusNode.unfocus();
                },
                child: Material(
                  child: Center(
                    child: SizedBox(
                      width: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width - 100
                          : MediaQuery.of(context).size.height - 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            key: _usernameFormKey,
                            child: TextFormField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                labelText: "Username",
                              ),
                              focusNode: usernameFocusNode,
                              textInputAction: TextInputAction.next,
                              autocorrect: false,
                              onFieldSubmitted: (username) {
                                _usernameFormKey.currentState!.validate();
                                FocusScope.of(context)
                                    .requestFocus(passwordFocusNode);
                              },
                              onEditingComplete: () {
                                _usernameFormKey.currentState!.validate();
                              },
                              validator: _usernameValidator,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Form(
                            key: _passwordFormKey,
                            child: TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                labelText: "Password",
                              ),
                              focusNode: passwordFocusNode,
                              autocorrect: false,
                              obscureText: true,
                              validator: _passwordValidator,
                              onFieldSubmitted: (password) {
                                _passwordFormKey.currentState!.validate();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: orientation == Orientation.portrait
                                ? MediaQuery.of(context).size.width - 100
                                : MediaQuery.of(context).size.height - 100,
                            height: 50,
                            child: OutlinedButton(
                                onPressed: () {
                                  usernameFocusNode.unfocus();
                                  passwordFocusNode.unfocus();

                                  final usernameValid =
                                      _usernameFormKey.currentState!.validate();
                                  final passwordValid =
                                      _passwordFormKey.currentState!.validate();
                                  if (usernameValid && passwordValid) {
                                    viewModel.tryLogin(usernameController.text,
                                        passwordController.text);
                                  }
                                },
                                child: viewModel.isLoading
                                    ? const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text('Login')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Username';
    }
    if (value.contains(' ')) {
      return 'Username cannot contain any spaces';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Password';
    }
    return null;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

SnackBar _loginErrorSnackBar(String? errorMessage) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    content: Text(
      errorMessage ?? '',
      style: const TextStyle(color: Colors.white),
    ),
  );
}
