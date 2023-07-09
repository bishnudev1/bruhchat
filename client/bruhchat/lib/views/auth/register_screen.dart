import 'package:bruhchat/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Register Here!"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: viewModel.usernameController,
                        validator: (value) {
                          return value!.isEmpty ? "Required fields" : null;
                        },
                      ),
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
                      const SizedBox(height: 30,),
                      InkWell(
                        onTap: (){
                          if(_key.currentState!.validate()){
                            viewModel.registerNewUser(context);
                          }
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: Text(
                            "Register",
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
          floatingActionButton: FloatingActionButton(onPressed: (){
            viewModel.hiveStatus();
          },child: const Icon(Icons.send),),
        );
      },
    );
  }
}
