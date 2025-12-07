import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import 'package:hotelmanagementapp/screens/login/login_screen.dart';
class AppRoutes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
