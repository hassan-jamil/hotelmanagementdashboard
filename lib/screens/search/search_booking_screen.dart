import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/bottom_navbar.dart';

class SearchBookingScreen extends StatelessWidget {
  const SearchBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 45),

          const CustomHeader(
            title: "Search Booking",
            showProfile: false,
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by Room / Booking ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }
}
