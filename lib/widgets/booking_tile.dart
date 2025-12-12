import 'package:flutter/material.dart';
import '../models/booking_model.dart';
import '../screens/booking/booking_detail_screen.dart';

class BookingTile extends StatelessWidget {
  final BookingModel booking;

  const BookingTile({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final updated = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookingDetailsScreen(booking: booking),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "asset/img.png",
                height: 55,
                width: 55,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Room ${booking.room}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    booking.id,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              booking.date,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
