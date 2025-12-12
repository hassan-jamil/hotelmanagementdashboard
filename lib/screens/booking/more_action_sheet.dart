import 'package:flutter/material.dart';

class MoreActionsSheet extends StatelessWidget {
  const MoreActionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "More Actions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 22),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade200,
              child: const Text(
                "B",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            title: const Text(
              "View customer details",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // add your navigation
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
