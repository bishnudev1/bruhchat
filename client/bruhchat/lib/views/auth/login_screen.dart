import 'dart:ui';

import 'package:bruhchat/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xffcccccc),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text("Hello Again !",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: const Color(0xff000000),
                                fontSize: 40,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Welcome Back You've\n been missed",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 60,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 0.20000000298023224,
                              sigmaY: 0.20000000298023224),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xffe6e6e6),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: TextFormField(
                              controller: viewModel.emailController,
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Required fields"
                                    : null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter email",
                                  contentPadding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  hintStyle: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 0.20000000298023224,
                              sigmaY: 0.20000000298023224),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xffe6e6e6),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: TextFormField(
                              controller: viewModel.passwordController,
                              obscureText: true,
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Required fields"
                                    : null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter password",
                                  contentPadding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  hintStyle: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(""),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "Forget Password ?",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 0.20000000298023224,
                              sigmaY: 0.20000000298023224),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: InkWell(
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  viewModel.loginOldUser();
                                }
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: const Color(0xfff2f2f2),
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  "Sign in",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text("or",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            height: 57,
                            width: 57,
                            decoration: BoxDecoration(
                                color: const Color(0xffdfdfdf),
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.apple,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const Spacer(),
                        // The last Padding widget with "Not a Member?" text and "Register Now" text
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Not a Member? ",
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text("Register Now",
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff00f6f6),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Spacer to push the last widget to the bottom
                      ],
                    ),
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
