import 'package:flutter/material.dart';
import '../../widgets/bottom_navbar.dart';
import '../dashboard/dashboard_screen.dart';
import '../booking/bookings_screen.dart';
import '../search/search_booking_screen.dart';
class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int currentIndex = 0;

  final screens = const [
    DashboardScreen(),
    BookingsScreen(),
    SearchBookingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() => currentIndex = i);
        },
      ),
    );
  }
}
