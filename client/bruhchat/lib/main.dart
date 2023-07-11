import 'dart:io';
import 'package:bruhchat/app/app.locator.dart';
import 'package:bruhchat/app/app.router.dart';
import 'package:bruhchat/services/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked_services/stacked_services.dart';
import 'data/hive/user_adapter.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  if (!kIsWeb) {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }
  Hive.registerAdapter(UserAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authServices = locator<AuthServices>();
  print("Currently signed in status: ${authServices.isSignedIn}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = locator<AuthServices>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute:
          authService.isSignedIn == null || authService.isSignedIn == ""
              ? Routes.onboardingScreen
              : Routes.homeScreen,
      //home: OnboardingScreen(),
    );
  }
}
