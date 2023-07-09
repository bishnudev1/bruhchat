import 'package:bruhchat/views/auth/register_screen.dart';
import 'package:bruhchat/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

import '../../data/hive/user_adapter.dart';

class OnboardingViewmodel extends BaseViewModel {
  fetchCurrentUser(BuildContext context) async {
    var box = await Hive.openBox<User>(
        'user'); 
    print("Block 1");// Open the existing box instead of opening it again
    try {
      print("Block 2");
      User? user = box.get("currentUser");
      if (user != null) {
        print("Block 3");
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(username: user.username),
              ));
        });
      } if (box.isEmpty) {
        print("Block 4");
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ));
        });
      }
      print("Block 5");
      notifyListeners();
      await box.close();
    } catch (e) {
      print("Block 6");
      print('Error retrieving user from Hive: $e');
      return e.toString();
    } finally {
      // Close the box if it's open
      if (box.isOpen) {
        await box.close();
      }
    }
  }

  
  hiveStatus() async {
    var box = await Hive.openBox<User>('user');
    print("Hive Current Status: ${box.isEmpty}");
  }
}
