import 'package:flutter/material.dart';

class EditDaysSheet extends StatefulWidget {
  final int days;

  const EditDaysSheet({super.key, required this.days});

  @override
  State<EditDaysSheet> createState() => _EditDaysSheetState();
}

class _EditDaysSheetState extends State<EditDaysSheet> {
  late int selectedDays;

  @override
  void initState() {
    super.initState();
    selectedDays = widget.days;
  }

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
            children:  [
              Text("Edit no of days",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.close),),
            ],
          ),

          const SizedBox(height: 20),

          const Text("Number of days",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),

          const SizedBox(height: 8),

          DropdownButtonFormField<int>(
            value: selectedDays,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: List.generate(
              6,
                  (i) => DropdownMenuItem(
                value: i + 1,
                child: Text("${i + 1}"),
              ),
            ),
            onChanged: (v) => setState(() => selectedDays = v!),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.pop(context, selectedDays);
              },
              child: const Text("Proceed",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
