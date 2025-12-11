import 'package:flutter/material.dart';
import 'package:hotelmanagementapp/models/booking_model.dart';
import 'package:hotelmanagementapp/screens/booking/booking_status_sheet.dart';
import 'package:hotelmanagementapp/screens/booking/edit_days_sheet.dart';

import 'customer_details_sheet.dart';

class BookingDetailsScreen extends StatelessWidget {
  final BookingModel booking;

  const BookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Booking Details",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showMoreActions(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                "asset/img.png",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              booking.id,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(
              "Standard Rooms • Room ${booking.room}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            /// DETAILS CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: Column(
                children: [
                  _row("Status", booking.status),
                  _row("Booking ID", booking.id),
                  _row("Room no", booking.room),
                  _row("Reservation type", booking.paymentType),
                  _row("Booking Status", booking.paymentStatus),
                  _row("Customer Name", booking.customerName),
                  _row("Phone No", booking.phone),
                  _row("Email Address", booking.email),
                  _row("Number of days", booking.days.toString()),
                  _row("Date of arrival", booking.date),
                  _row("No of Check-In", "0"),
                  _row("Amount in Naira", "₦${booking.amount}"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// CHECK-IN BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _showMoreActions(context);
                },
                child: const Text(
                  "Check - In",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------------------------------------------------
  /// 🔥 CUSTOM BOTTOM SHEET (Exact UI from your screenshot)
  /// ---------------------------------------------------------
  void _showMoreActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "More Actions",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 IconButton(onPressed: () {
                   Navigator.pop(context);
                 }, icon: Icon(Icons.close),),
                ],
              ),

              const SizedBox(height: 20),

              _BottomItem(
                icon: Icons.person,
                text: "View customer details",
                onTap: ()  {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => CustomerDetailsSheet(booking: booking),
                  );
                },
              ),

              _BottomItem(
                icon: Icons.edit_calendar_outlined,
                text: "Edit no of days",
                onTap: ()  {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => EditDaysSheet(days: booking.days,),
                  );
                },
              ),

              _BottomItem(
                icon: Icons.sync_alt,
                text: "Change Booking Status",
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => BookingStatusSheet(currentStatus: booking.paymentType,),
                  );
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  /// UI for each detail row
  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------
/// Bottom Sheet Buttons UI
/// ---------------------------------------------------------
class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _BottomItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: Colors.black87),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 15),
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 17),
          ],
        ),
      ),
    );
  }
}
