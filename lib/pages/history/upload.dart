import 'package:NAKSA/pages/bottom/bottonbar.dart';
import 'package:flutter/material.dart';

class AddHomeListingPage extends StatefulWidget {
  @override
  _AddHomeListingPageState createState() => _AddHomeListingPageState();
}

class _AddHomeListingPageState extends State<AddHomeListingPage> {
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController houseNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  List<String> selectedPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Home Listing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField(
              controller: locationController,
              label: 'Location',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: priceController,
              label: 'Price',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: houseNameController,
              label: 'House Name',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: phoneNumberController,
              label: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: descriptionController,
              label: 'Description',
              helperText: 'Enter a description of the house',
              maxLines: 4,
            ),
            SizedBox(height: 16),
            _buildPhotoUploadSection(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to save home listing here
                String location = locationController.text;
                String price = priceController.text;
                String houseName = houseNameController.text;
                String phoneNumber = phoneNumberController.text;
                String description = descriptionController.text;
                // Perform validation and save data to database or other storage
              },
              child: Text('Add Listing'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar( // Add the CustomBottomNavigationBar here
        selectedIndex: 3, // Set the initial selected index as desired
        
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    int? maxLines,
    String? helperText,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(color: Colors.black87, fontSize: 16.0),
      decoration: InputDecoration(
        labelText: label,
        hintText: helperText,
        helperText: maxLines == 4 ? null : helperText,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Color.fromARGB(244, 19, 109, 150), width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }

  Widget _buildPhotoUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Photos',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: _selectPhotos,
          child: Text('Select Photos'),
        ),
        SizedBox(height: 8.0),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: selectedPhotos.map((photo) => Image.network(photo)).toList(),
        ),
      ],
    );
  }

  void _selectPhotos() {
    // Add logic to select photos from gallery
    // Update selectedPhotos list with selected photo URLs
  }
}
