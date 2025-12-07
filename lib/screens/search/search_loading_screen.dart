import 'package:flutter/material.dart';
import '../../widgets/bottom_navbar.dart';

class SearchLoadingScreen extends StatelessWidget {
  const SearchLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Bookings", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(child: CircularProgressIndicator()),
      bottomNavigationBar:  BottomNavBar(currentIndex: 1),
    );
  }
}
