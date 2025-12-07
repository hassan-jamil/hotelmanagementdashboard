import 'package:flutter/material.dart';
import '../../models/booking_model.dart';
import '../../widgets/bottom_navbar.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = ModalRoute.of(context)!.settings.arguments as BookingModel?;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        title: const Text(
          "Booking Details",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: booking == null
          ? const Center(child: Text("No booking details"))
          : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- ROOM IMAGE ----------------
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.shade300,
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Dots Indicator (dummy)


            const SizedBox(height: 20),
            Text(
              booking.id,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              "Standard Rooms · Room ${booking.room}",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 20),

            // ---------------- DETAILS CARD ----------------
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  _labelValue("Status", booking.status,
                      valueColor: Colors.green),
                  _labelValue("Booking ID", booking.id),
                  _labelValue("Room no", booking.room),
                  _labelValue("Reservation type", booking.paymentType),
                  _labelValue("Booking Status", booking.paymentStatus),
                  _labelValue("Customer Name", booking.customerName),
                  _labelValue("Phone No", booking.phone),
                  _labelValue("Email Address", booking.email),
                  _labelValue("Number of days", booking.days),
                  _labelValue("Date of arrival", booking.arrivalDate),
                  _labelValue("Last checkout", booking.lastCheckout),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ---------------- BUTTON ----------------
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "Re-Book",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
_labelValue(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500)),

          Text(
            value,
            style: TextStyle(
                fontSize: 14,
                color: valueColor ?? Colors.black,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
