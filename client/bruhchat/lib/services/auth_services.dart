import 'package:bruhchat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as oauth;
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

import '../data/hive/user_adapter.dart';

class AuthServices with ListenableServiceMixin {
  final auth = oauth.FirebaseAuth.instance;

  late String _username;

  String? get isSignedIn {
    if (auth.currentUser != null) {
      return auth.currentUser!.email;
    }
    return null;
  }

  String get currentUserName {
    return "";
  }

  final CollectionReference _collections =
      FirebaseFirestore.instance.collection("bruhchat");

  Future<UserModel> registerUser({required UserModel user}) async {
    try {
      final res = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      if (res != null) {
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

  Future logoutUser() async {
    final box = await Hive.openBox<User>('user');
    await auth.signOut();
    if (box.isOpen) {
      await box.delete("currentUser");
      await box.close();
    }
  }
}
