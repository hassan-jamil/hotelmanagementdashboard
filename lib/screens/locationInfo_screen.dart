import 'package:flutter/material.dart';
import 'package:hotelmanagementapp/screens/hotel_picture_screen.dart';

class LocationInfoSimple extends StatefulWidget {
  @override
  State<LocationInfoSimple> createState() => _LocationInfoSimpleState();
}

class _LocationInfoSimpleState extends State<LocationInfoSimple> {
  TextEditingController addressController = TextEditingController();

  String? selectedState;
  String? selectedCity;

  List<String> states = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
  ];

  Map<String, List<String>> cities = {
    "Cross River": [
      "Calabar",
      "Ikom",
      "Ogoja",
      "Obudu",
      "Ugep",
      "Odukpani",
      "Akampa",
      "Akpabuyo",
      "Etung",
      "Bekwarra",
      "Obanliku",
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_new, size: 18),
        centerTitle: true,
        title: Text(
          "Location Info",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Top blue line
            Container(height: 3, width: 100, color: Colors.blue),
            SizedBox(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "State of Location",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: 8),

            // Address TextField
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            SizedBox(height: 20),

            // State Label
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "State of Location",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 8),

            // State Box
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Select a State",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(),

                        Expanded(
                          child: ListView.builder(
                            itemCount: states.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(states[index]),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  setState(() {
                                    selectedState = states[index];
                                    selectedCity = null;
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedState ?? "Select State"),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // City Label
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "City of Location",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 8),

            // City Box
            GestureDetector(
              onTap: () {
                if (selectedState == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select state first")),
                  );
                  return;
                }

                List<String> cityList = cities[selectedState] ?? [];

                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Select a City",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Divider(),

                        Expanded(
                          child: ListView.builder(
                            itemCount: cityList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(cityList[index]),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  setState(() {
                                    selectedCity = cityList[index];
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedCity ?? "Select City"),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),

            Spacer(),

            // Proceed Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotelPicturesScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
