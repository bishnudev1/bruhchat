import 'package:bruhchat/views/onboarding/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          backgroundColor: const Color(0xffcccccc),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "assets/images/logo/bruhchat.jpg",
                      // Add other image properties here if needed
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Discover Your\nDream Job Here",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                      " Only We Know How To Choose The Ideal Person For The Job",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            locator<NavigationService>()
                                .replaceWith(Routes.registerScreen);
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                              "Register",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            locator<NavigationService>()
                                .replaceWith(Routes.loginScreen);
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                                color: const Color(0xffeaeaea),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                              "Sign in",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
