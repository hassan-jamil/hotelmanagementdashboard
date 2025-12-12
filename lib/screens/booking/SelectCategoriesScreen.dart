import 'package:flutter/material.dart';
import 'package:hotelmanagementapp/screens/booking/SelectRoomScreen.dart';

class SelectCategoriesScreen extends StatelessWidget {
  const SelectCategoriesScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "name": "Standard Rooms",
        "price": "₦0.00",
        "rooms": "50 rooms",
        "image": "asset/img.png",
      },
      {
        "name": "Standard King Rooms",
        "price": "₦25,000",
        "rooms": "22 rooms",
        "image": "asset/img.png",
      },
      {
        "name": "Executive Rooms",
        "price": "₦35,000",
        "rooms": "5 rooms",
        "image": "asset/img.png",
      },
      {
        "name": "Presidential Suite",
        "price": "₦55,000",
        "rooms": "1 room",
        "image": "asset/img.png",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Categories"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = categories[index];

          return InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SelectRoomScreen(categoryName: categoryName),
                ),
              );
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item["image"]!,
                    height: 60,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["price"]!,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    item["rooms"]!,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemCount: categories.length,
      ),
    );
  }
}
