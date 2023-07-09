import 'package:bruhchat/views/onboarding/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OnboardingViewmodel(),
      onViewModelReady: (viewModel) {
        viewModel.fetchCurrentUser(context);
      },
      builder: (context, viewModel, child) {
        return  Scaffold(
          body: const FlutterLogo(),
                    floatingActionButton: FloatingActionButton(onPressed: (){
            viewModel.hiveStatus();
          },child: const Icon(Icons.send),),
        );
      },
    );
  }
}