import 'package:flutter/material.dart';

import 'SelectCategoriesScreen.dart';

class CreateBookingScreen extends StatefulWidget {
  const CreateBookingScreen({super.key});

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  // Controllers
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  // Booking Data
  String? selectedRoomType;
  String? selectedRoomNumber;
  String selectedDays = "1";
  DateTime? selectedDate;

  // Dummy Data
  final List<String> roomTypes = [
    "Standard Rooms",
    "Standard King Rooms",
    "Executive Rooms",
    "Presidential Suite",
  ];

  final Map<String, List<String>> rooms = {
    "Standard Rooms": ["Room 401", "Room 402", "Room 403"],
    "Standard King Rooms": ["Room 501", "Room 502"],
    "Executive Rooms": ["Room 601", "Room 602"],
    "Presidential Suite": ["Room 701"],
  };

  // Date Picker
  Future<void> pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Create Booking",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NAME
            const Text("Name", style: labelStyle),
            const SizedBox(height: 6),
            inputField(nameCtrl, "Enter your full name"),

            const SizedBox(height: 20),

            // EMAIL
            const Text("Email address", style: labelStyle),
            const SizedBox(height: 6),
            inputField(emailCtrl, "Enter your email"),

            const SizedBox(height: 20),

            // PHONE
            const Text("Phone number", style: labelStyle),
            const SizedBox(height: 6),
            inputField(phoneCtrl, "Enter your phone number"),

            const SizedBox(height: 20),

            // ROOM TYPE
            const Text("Room type", style: labelStyle),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: boxDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text("Select a room type"),
                  value: selectedRoomType,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedRoomType = value;
                      selectedRoomNumber = null;
                    });
                  },
                  items:
                      roomTypes
                          .map(
                            (t) => DropdownMenuItem(value: t, child: Text(t)),
                          )
                          .toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ROOM NUMBER
            const Text("Room number", style: labelStyle),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: boxDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text("Select a room"),
                  value: selectedRoomNumber,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedRoomNumber = value;
                    });
                  },
                  items:
                      selectedRoomType == null
                          ? []
                          : rooms[selectedRoomType]!
                              .map(
                                (r) =>
                                    DropdownMenuItem(value: r, child: Text(r)),
                              )
                              .toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NUMBER OF DAYS
            const Text("Number of days", style: labelStyle),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: boxDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedDays,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedDays = value!;
                    });
                  },
                  items:
                      ["1", "2", "3", "4", "5"]
                          .map(
                            (d) => DropdownMenuItem(value: d, child: Text(d)),
                          )
                          .toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DATE OF ARRIVAL
            const Text("Date of arrival", style: labelStyle),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: boxDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select a date"
                          : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Icon(Icons.calendar_today, size: 20),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => SelectCategoriesScreen(
                            categoryName: categoryName,
                          ),
                    ),
                  );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Reusable Input Field
  Widget inputField(TextEditingController ctrl, String hint) {
    return Container(
      decoration: boxDecoration,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}

// Common Styles
const labelStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

const boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(6)),
  border: Border.fromBorderSide(BorderSide(color: Color(0xFFE5E5E5))),
);
