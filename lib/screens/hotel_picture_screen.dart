import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HotelPicturesScreen extends StatefulWidget {
  @override
  State<HotelPicturesScreen> createState() => _HotelPicturesScreenState();
}

class _HotelPicturesScreenState extends State<HotelPicturesScreen> {
  final ImagePicker picker = ImagePicker();

  // 4 containers → store 4 images
  List<File?> images = [null, null, null, null];

  Future<void> pickImage(int index) async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        images[index] = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonActive = images.any((img) => img != null);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
        centerTitle: true,
        title: Text(
          "Hotel Pictures",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 3, width: 110, color: Colors.blue),
            SizedBox(height: 20),

            Text(
              "Please upload your hotel profile pictures, so that customers can see you better!",
              style: TextStyle(fontSize: 14),
            ),

            SizedBox(height: 20),

            // Grid of Image Boxes
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => pickImage(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: images[index] == null
                        ? Center(
                      child: Icon(Icons.add, size: 30),
                    )
                        : Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            images[index]!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Small + button on top
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            Spacer(),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isButtonActive ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  isButtonActive ? Colors.blue : Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    color: isButtonActive ? Colors.white : Colors.grey.shade600,
                  ),
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
