import 'package:bruhchat/services/auth_services.dart';
import 'package:bruhchat/views/auth/login_screen.dart';
import 'package:bruhchat/views/auth/register_screen.dart';
import 'package:bruhchat/views/home/home_screen.dart';
import 'package:bruhchat/views/onboarding/onboarding_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: RegisterScreen),
  MaterialRoute(page: LoginScreen),
  MaterialRoute(page: HomeScreen),
  MaterialRoute(page: OnboardingScreen),
], dependencies: [
  LazySingleton(classType: AuthServices),
  LazySingleton(classType: NavigationService),
])
class AppSetup {}
