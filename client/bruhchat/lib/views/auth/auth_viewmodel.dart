import 'package:bruhchat/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/hive/user_adapter.dart';
import '../../models/user_model.dart';

class AuthViewModel extends BaseViewModel {
  final AuthServices _authServices = AuthServices();
  final _navigationService = locator<NavigationService>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  registerNewUser() async {
    final response = await _authServices.registerUser(
        user: UserModel(
            username: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            createdAt: DateTime.now().toLocal().toString()));
    notifyListeners();
    _navigationService.replaceWith(Routes.homeScreen);
  }

  loginOldUser() async {
    final response = await _authServices.loginUser(
        user: UserModel(
            username: "",
            email: _emailController.text.toString(),
            password: _passwordController.text.toString(),
            createdAt: ""));
    notifyListeners();
    _navigationService.replaceWith(Routes.homeScreen);
  }

  hiveStatus() async {
    var box = await Hive.openBox<User>('user');
    print("Hive Current Status: ${box.isEmpty}");
  }
}
