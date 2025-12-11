import 'package:flutter/material.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/bottom_navbar.dart';

class SearchEmptyScreen extends StatelessWidget {
  const SearchEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Bookings", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: EmptyState(message: "No search result!", icon: Icons.search_off),
      ),
    );
  }
}
