import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/bottom_navbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [  BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        )],
      ),
      body: Column(
        children: [
          const SizedBox(height: 45),
          const CustomHeader(
            title: "Notifications",
            showProfile: false,
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("New booking created"),
                  subtitle: Text("2 hours ago"),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Room 402 has been vacated"),
                  subtitle: Text("Yesterday"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
