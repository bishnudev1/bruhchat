import 'package:bruhchat/services/auth_services.dart';
import 'package:bruhchat/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

import '../../data/hive/user_adapter.dart';
import '../../models/user_model.dart';

class AuthViewModel extends BaseViewModel {
  final AuthServices _authServices = AuthServices();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  registerNewUser(BuildContext context) async {
    final response = await _authServices.registerUser(
        user: UserModel(
            username: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            createdAt: DateTime.now().toLocal().toString()));
    notifyListeners();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            username: _usernameController.text,
          ),
        ));
  }

  hiveStatus() async {
    var box = await Hive.openBox<User>('user');
    print("Hive Current Status: ${box.isEmpty}");
  }
}
