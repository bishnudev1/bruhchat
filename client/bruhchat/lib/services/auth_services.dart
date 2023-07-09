import 'package:bruhchat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as oauth;
import 'package:hive/hive.dart';

import '../data/hive/user_adapter.dart';

class AuthServices {
  final auth = oauth.FirebaseAuth.instance;
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

        if (box.isEmpty) {
          await box.put("currentUser", user0);
        } else if (box.isNotEmpty) {
          await box.clear();
          await box.put("currentUser", user0);
        }
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
    final res = await auth.signOut();
    if (box.isOpen) {
      await box.clear();
      await box.close();
    }
  }
}
