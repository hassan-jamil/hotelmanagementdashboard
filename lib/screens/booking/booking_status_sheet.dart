import 'package:flutter/material.dart';

class BookingStatusSheet extends StatefulWidget {
  final String currentStatus;

  const BookingStatusSheet({super.key, required this.currentStatus});

  @override
  State<BookingStatusSheet> createState() => _BookingStatusSheetState();
}

class _BookingStatusSheetState extends State<BookingStatusSheet> {
  late String selectedStatus;

  // VALID STATUSES FOR DROPDOWN
  final List<String> statuses = ["Paid", "Unpaid", "Pending","Cancel","Refund"];

  @override
  void initState() {
    super.initState();

    if (statuses.contains(widget.currentStatus)) {
      selectedStatus = widget.currentStatus;
    } else {
      selectedStatus = statuses.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------------------ HEADER ------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Booking Status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CloseButton(),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Booking Status",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            value: selectedStatus,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: statuses
                .map(
                  (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
                .toList(),
            onChanged: (value) =>
                setState(() => selectedStatus = value ?? statuses.first),
          ),

          const SizedBox(height: 20),

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
                Navigator.pop(context, selectedStatus);
              },
              child: const Text(
                "Proceed",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
