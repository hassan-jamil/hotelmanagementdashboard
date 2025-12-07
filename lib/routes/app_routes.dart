import 'package:flutter/material.dart';

// Splash + Login
import '../screens/splash/splash_screen.dart';
import '../screens/login/login_screen.dart';

// Dashboard Module
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/search/search_booking_screen.dart';
import '../screens/booking_details/booking_details_screen.dart';
import '../screens/notifications/notification_screen.dart';

class AppRoutes {
  // --- AUTH ROUTES ---
  static const String splashScreen = '/';
  static const String loginScreen = '/login';

  // --- DASHBOARD ROUTES ---
  static const String dashboard = "/dashboard";
  static const String searchBookings = "/search-bookings";
  static const String bookingDetails = "/booking-details";
  static const String notifications = "/notifications";

  // --- ROUTE GENERATOR (Handles All Screens) ---
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

    /// --- AUTH SCREENS ---
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

    /// --- DASHBOARD MODULE SCREENS ---
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      case searchBookings:
        return MaterialPageRoute(builder: (_) => SearchBookingScreen());

      case bookingDetails:
        return MaterialPageRoute(builder: (_) => BookingDetailsScreen());

      case notifications:
        return MaterialPageRoute(builder: (_) => NotificationScreen());

    /// --- DEFAULT FALLBACK ---
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
