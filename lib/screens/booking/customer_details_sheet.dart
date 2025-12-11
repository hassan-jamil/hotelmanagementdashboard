import 'package:flutter/material.dart';
import 'package:hotelmanagementapp/models/booking_model.dart';

class CustomerDetailsSheet extends StatelessWidget {
  final BookingModel booking;

  const CustomerDetailsSheet({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Customer Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.close),),
            ],
          ),

          const SizedBox(height: 20),

          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("asset/img_1.png"),
          ),

          const SizedBox(height: 10),

          Text(
            booking.customerName,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600),
          ),

          Text(
            booking.email,
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              // call phone
            },
            child: const Icon(Icons.phone, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }
}
