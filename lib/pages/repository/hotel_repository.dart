import 'package:flutter/material.dart';

class NearbyPlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Color.fromARGB(255, 175, 137,137),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 80.0, 20.0, 20.0),
              child: Text(
                'Explore Nearby',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
          child: ListView.builder(
            itemCount: nearbyPlaces.length,
            itemBuilder: (context, index) {
        final place = nearbyPlaces[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
          child: Card(
            elevation: 2.0,
            child: ListTile(
              leading: Image.asset(
                place.imagePath,
                height: double.infinity,
                width: 70.0,
                fit: BoxFit.cover,
              ),
              title: Text(
                place.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20.0,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        place.location,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16.0,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        place.rating.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.price_change_outlined,
                        size: 16.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        place.price.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                // Handle tap on nearby place
              },
            ),
          ),
        );
            },
          ),
        ),
        
          ],
        ),
      ),
    );
  }
}

class NearbyPlace {
  final String name;
  final String imagePath;
  final String location;
  final double rating;
  final double price;

  NearbyPlace({
    required this.name,
    required this.imagePath,
    required this.location,
    required this.rating,
    required this.price,
  });
}

final List<NearbyPlace> nearbyPlaces = [
  NearbyPlace(
    name: 'Park',
    imagePath: 'lib/images/thumbnail image.png',
    location: 'Central Park, New York',
    rating: 4.5,
    price: 2300,
  ),
  NearbyPlace(
    name: 'Museum',
    imagePath: 'lib/images/thumbnail image.png',
    location: 'Metropolitan Museum, New York',
    rating: 4.8,
    price: 2300,
  ),
  NearbyPlace(
    name: 'Restaurant',
    imagePath: 'lib/images/thumbnail image.png',
    location: 'Times Square, New York',
    rating: 4.2,
    price: 2300,
  ),
  NearbyPlace(
    name: 'Park',
    imagePath: 'lib/images/thumbnail image.png',
    location: 'Central Park, New York',
    rating: 4.5,
    price: 2300,
  ),
  NearbyPlace(
    name: 'Park',
    imagePath: 'lib/images/thumbnail image.png',
    location: 'Central Park, New York',
    rating: 4.5,
    price: 2300,
  ),
  NearbyPlace(
    name: 'Park',
    imagePath: 'lib/images/thumbnail image.png',
    location: 'Central Park, New York',
    rating: 4.5,
    price: 2300,
  ),
  NearbyPlace(
    name: 'Park',
    imagePath: 'lib/images/thumbnail image.png',
    location: 'Central Park, New York',
    rating: 4.5,
    price: 2300,
  ),
  // Add more sample nearby places as needed
];
