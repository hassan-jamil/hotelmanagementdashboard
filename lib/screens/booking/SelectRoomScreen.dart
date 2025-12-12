import 'package:flutter/material.dart';

class SelectRoomScreen extends StatelessWidget {
  final String categoryName;

  const SelectRoomScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Rooms for example — you will load dynamically later from backend
    final rooms = [
      {"number": "Room 401", "status": "Open", "image": "assets/r1.jpg"},
      {"number": "Room 402", "status": "Open", "image": "assets/r2.jpg"},
      {"number": "Room 403", "status": "Open", "image": "assets/r3.jpg"},
      {"number": "Room 404", "status": "Open", "image": "assets/r4.jpg"},
      {"number": "Room 405", "status": "Open", "image": "assets/r5.jpg"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Room"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  room["image"]!,
                  height: 60,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(room["number"]!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(room["status"]!,
                        style: TextStyle(
                            color: room["status"] == "Open"
                                ? Colors.green
                                : Colors.red)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, room["number"]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                ),
                child: const Text("Book"),
              )
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemCount: rooms.length,
      ),
    );
  }
}
