import 'dart:io';

import 'package:NAKSA/pages/bottom/bottonbar.dart';
import 'package:NAKSA/pages/chat/AllChat.dart';
import 'package:NAKSA/pages/home/Custom_notify_button.dart';
import 'package:NAKSA/pages/home/Location_home_ma.dart';
import 'package:NAKSA/pages/app_text.dart';
import 'package:NAKSA/pages/repository/hotel_repository.dart';
// import 'package:NAKSA/pages/colors.gen.dart';
import'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
 Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 19, 109, 150),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: size.height * 0.25),
              color: Color.fromARGB(255, 175, 137,137),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: size.height * 0.01),
                  Expanded(
                    

                   child: NearbyPlacesList(), // Display NearbyPlacesList widget here
                  ),
                  

                  
                  ]
                  )
              
              
              
              
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _HeaderSection(),
                  _SearchCard(),
                  
                  
                  SizedBox(height: 0), 
                  
                  // Add some spacing
                  //Expanded(
                  //  
//
                  // child: NearbyPlacesList(), // Display NearbyPlacesList widget here
                  //),
                ],
              ),
            ),
            
            
          ],
          
        ),
      ),
     //bottomNavigationBar: Bottombar(),
     bottomNavigationBar: CustomBottomNavigationBar( // Add the CustomBottomNavigationBar here
        selectedIndex: 0, // Set the initial selected index as desired
        
      ),
    );
  }
}


class _HeaderSection extends StatelessWidget {
  const _HeaderSection({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
            radius: 35.0,
            backgroundImage: ExactAssetImage('lib/images/Final logo naksa.png',),
            
          ),
          Spacer(),
          //chat notification
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: IconButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MessagePage(),
                ),
              );

            }, 
            icon: ImageIcon(
              AssetImage('lib/images/icons_naksa/bubble-chat.png',),
              size: 24,
              ),
              ),
          ),
          SizedBox(width: 8.0),
          //notification icon code
          Custom_notify_button(image_path: 'lib/images/icons_naksa/noti_back_remove.png'),
          SizedBox(width: 8.0),
          ],

        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppText.large(
            "You need we provide",
            color: Colors.white,
            ),
          //Text(
          //  "You need we provide",
          //  style: TextStyle(
          //    fontWeight: FontWeight.bold,
          //    fontSize: 25,
          //    color: Colors.white,
          //  ),
          ),
      ],

    );
  }
}

class _SearchCard extends StatelessWidget {
  _SearchCard({Key? key}) : super(key: key);
  final TextEditingController _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey ,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row: Location and Map
          Row(
            children: [
              Icon(
                Icons.place,
                color: Colors.blue,
              ),
              SizedBox(width: 20.0),
              Location_C(),
            ],
          ),
          SizedBox(height: 10.0), // Added spacing between location and search icon

          // Second Row: Search Icon and Text Field
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.blue,
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: CustomTextField(
                  label: 'Search Location',
                  controller: _textEditController,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0), // Added spacing between text field and submit button

          // Third Row: Submit Button
          ElevatedButton(
            onPressed: () {
              // Access text field value
              final enteredText = _textEditController.text;
              print('Entered text: $enteredText');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}












class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(),
      ),
    );
  }
}













