import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,

      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/dashboard");
            break;
          case 1:
            Navigator.pushNamed(context, "/searchBookings");
            break;
          case 2:
          // Dummy middle button like Figma
            break;
          case 3:
            Navigator.pushNamed(context, "/rooms");
            break;
          case 4:
            Navigator.pushNamed(context, "/account");
            break;
        }
      },

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Booking"),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.meeting_room), label: "Rooms"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
      ],
    );
  }
}
