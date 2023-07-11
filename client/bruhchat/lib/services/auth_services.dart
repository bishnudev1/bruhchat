import 'package:bruhchat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as oauth;
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

import '../data/hive/user_adapter.dart';

class AuthServices with ListenableServiceMixin {
  final auth = oauth.FirebaseAuth.instance;

  String? _currentUserEmail;
  String? get currentUserEmail => _currentUserEmail;

  String? _currentUsername;
  String? get currentUsername => _currentUsername;

  String? get isSignedIn {
    if (auth.currentUser != null) {
      return auth.currentUser!.email;
    }
    return null;
  }

  fetchCurrentUser() async {
    var box = await Hive.openBox<User>('user');
    print(box
        .get("currentUser")!
        .createdAt); // Open the existing box instead of opening it again
    try {
      if (box.isNotEmpty) {
        // Check if the box is not empty
        User? user = box.get("currentUser");
        if (user != null) {
          _currentUserEmail = user.email;
          _currentUsername = user.username;
        } else {
          _currentUserEmail = null;
          print('User not found in Hive');
        }
      } else {
        _currentUserEmail = null;
        print('Hive box is empty');
      }
      print(_currentUserEmail);
      notifyListeners();
      await box.close();
    } catch (e) {
      print('Error retrieving user from Hive: $e');
      return e.toString();
    } finally {
      // Close the box if it's open
      if (box.isOpen) {
        await box.close();
      }
    }
  }

  final CollectionReference _collections =
      FirebaseFirestore.instance.collection("bruhchat");

  Future<UserModel> registerUser({required UserModel user}) async {
    try {
      final res = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      if (res != null) {
        print(res);
        final resp = await _collections.add(user.toJson());

        User user0 = User(
            username: user.username,
            email: user.email,
            password: user.password,
            createdAt: user.createdAt);
        final box = await Hive.openBox<User>('user');

        await box.put("currentUser", user0);
        await box.close();

        return user;
      } else {
        return UserModel(
            username: "", email: "", password: "", createdAt: null.toString());
      }
    } catch (e) {
      print(e.toString());
      return UserModel(
          username: "", email: "", password: "", createdAt: null.toString());
    }
  }

  Future<UserModel> loginUser({required UserModel user}) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      if (res != null) {
        final getUser =
            await _collections.where("email", isEqualTo: user.email).get();
        final data = UserModel.fromJson(
            getUser.docs.first.data() as Map<String, dynamic>);

        User user0 = User(
            username: data.username,
            email: user.email,
            password: user.password,
            createdAt: data.createdAt);
        final box = await Hive.openBox<User>('user');

        await box.put("currentUser", user0);
        await box.close();

        return user;
      } else {
        return UserModel(
            username: "", email: "", password: "", createdAt: null.toString());
      }
    } catch (e) {
      print(e.toString());
      return UserModel(
          username: "", email: "", password: "", createdAt: null.toString());
    }
  }

  Future logoutUser() async {
    final box = await Hive.openBox<User>('user');
    await auth.signOut();
    if (box.isOpen) {
      await box.delete("currentUser");
      await box.close();
    }
  }
}
