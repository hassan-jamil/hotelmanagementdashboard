import 'package:flutter/material.dart';

class PaymentConfirmationSheet extends StatelessWidget {
  const PaymentConfirmationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Payment Confirmation",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              CloseButton(),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "This customer has not paid yet. Do you wish to check-in? "
                "This will automatically change the booking status to Paid.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Paid");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Proceed",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
