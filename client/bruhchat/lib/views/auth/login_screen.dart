import 'package:bruhchat/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../utils/themes/appstyles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Appstyles.backgroundColor,
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Appstyles.backgroundColor,
              title: const Text(
                "Welcome back",
                style: Appstyles.appBarHeadingStyle,
              ),
              elevation: 0,
              actions: [
                InkWell(
                  onTap: () {},
                  child:
                      const Icon(Icons.logout, color: Appstyles.highlightColor),
                ),
                const SizedBox(
                  width: 10,
                )
              ]),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: viewModel.emailController,
                        validator: (value) {
                          return value!.isEmpty ? "Required fields" : null;
                        },
                      ),
                      TextFormField(
                        controller: viewModel.passwordController,
                        validator: (value) {
                          return value!.isEmpty ? "Required fields" : null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            viewModel.loginOldUser();
                          }
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
