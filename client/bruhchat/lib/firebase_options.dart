// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCli-3sPKVJqkA8UqKycKx56kdySRqi7Is',
    appId: '1:991719487566:web:5f2c04123c5d5df484eb1f',
    messagingSenderId: '991719487566',
    projectId: 'bruhchat-a6e6e',
    authDomain: 'bruhchat-a6e6e.firebaseapp.com',
    storageBucket: 'bruhchat-a6e6e.appspot.com',
    measurementId: 'G-YD5ZMFV5BT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPmAghUuB2ZUMrWuXJozLZ0F0uI3Tbn7Y',
    appId: '1:991719487566:android:50944112b6716ed884eb1f',
    messagingSenderId: '991719487566',
    projectId: 'bruhchat-a6e6e',
    storageBucket: 'bruhchat-a6e6e.appspot.com',
  );
}
