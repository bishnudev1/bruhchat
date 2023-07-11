import 'package:bruhchat/views/onboarding/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OnboardingViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 60,
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: (){
                    locator<NavigationService>().replaceWith(Routes.registerScreen);
                  },
                    child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  )),
                )),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (){
                    locator<NavigationService>().replaceWith(Routes.loginScreen);
                  },
                    child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
                ))
              ],
            ),
          )),
        );
      },
    );
  }
}
