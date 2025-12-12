import 'package:flutter/material.dart';
import 'payment_confirmation_sheet.dart';

class BookingStatusSheet extends StatefulWidget {
  final String currentStatus;

  const BookingStatusSheet({
    super.key,
    required this.currentStatus,
  });

  @override
  State<BookingStatusSheet> createState() => _BookingStatusSheetState();
}

class _BookingStatusSheetState extends State<BookingStatusSheet> {
  late String selectedStatus;

  // All valid statuses
  final List<String> statuses = [
    "Paid",
    "Unpaid",
    "Pending",
    "Cancel",
    "Refund",
  ];

  @override
  void initState() {
    super.initState();

    // ⭐ Prevent crash: Ensure status exists in dropdown list
    if (statuses.contains(widget.currentStatus)) {
      selectedStatus = widget.currentStatus;
    } else {
      selectedStatus = statuses.first; // Default = Paid
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
          // ---------------- HEADER ----------------
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

          // ----------- DROPDOWN -----------
          DropdownButtonFormField<String>(
            value: statuses.contains(selectedStatus)
                ? selectedStatus
                : statuses.first, // safe
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
            onChanged: (value) {
              setState(() {
                selectedStatus = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          // ----------- BUTTON: PROCEED -----------
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
              onPressed: () async {
                // Close this sheet
                Navigator.pop(context);

                // 1️⃣ If Paid → return instantly
                if (selectedStatus == "Paid") {
                  Navigator.pop(context, "Paid");
                  return;
                }

                // 2️⃣ Unpaid / Pending → Show Payment Confirmation Sheet
                if (selectedStatus == "Unpaid" ||
                    selectedStatus == "Pending") {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (_) => const PaymentConfirmationSheet(),
                  );

                  if (result == "Paid") {
                    Navigator.pop(context, "Paid");
                  }
                  return;
                }

                // 3️⃣ Cancel or Refund → send selected value back
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
