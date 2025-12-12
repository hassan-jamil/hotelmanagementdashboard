import 'package:flutter/material.dart';
import 'package:hotelmanagementapp/dummy/dummy_data.dart';
import 'package:hotelmanagementapp/screens/booking/booking_detail_screen.dart';
import 'package:hotelmanagementapp/widgets/booking_tile.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectedTab = 0; // 0 = Ongoing, 1 = Completed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Bookings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.add, color: Colors.black),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // 👉 Tabs (Ongoing / Completed)
            Container(
              padding: const EdgeInsets.all(4),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  _tabButton("Ongoing", 0),
                  _tabButton("Completed", 1),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 👉 Booking List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: dummyBookings.length,
                itemBuilder: (context, index) {
                  final booking = dummyBookings[index];

                  // ---------------- FILTER CORRECTLY ----------------
                  if (selectedTab == 0 && booking.status != "Ongoing") {
                    return const SizedBox.shrink();
                  }
                  if (selectedTab == 1 && booking.status != "Completed") {
                    return const SizedBox.shrink();
                  }

                  return GestureDetector(
                    onTap: () async {
                      final updated = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookingDetailsScreen(booking: booking),
                        ),
                      );

                      // REFRESH LIST AFTER UPDATE
                      if (updated == true || updated == "updated") {
                        setState(() {});
                      }
                    },
                    child: BookingTile(booking: booking),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------

  Widget _tabButton(String text, int index) {
    final bool isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
