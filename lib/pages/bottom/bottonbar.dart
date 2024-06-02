import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  CustomBottomNavigationBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/map');
            break;
            case 2:
            Navigator.pushNamed(context, '/upload');
            break;
            case 4:
            Navigator.pushNamed(context, '/profile');
            break;
          // Add cases for other indices if needed
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map,color: Colors.black,),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud_upload,color: Colors.black,),
          label: 'Upload',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite,color: Colors.black,),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Colors.black,),
          label: 'Profile',
        ),

        // Add other BottomNavigationBarItems as needed
      ],
    );
  }
}



















