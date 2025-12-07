import 'package:flutter/material.dart';
import '../models/booking_model.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;

  BookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.blue.shade100),
        title: Text("Room ${booking.room}"),
        subtitle: Text(booking.id),
        trailing: Text(booking.date),
      ),
    );
  }
}
