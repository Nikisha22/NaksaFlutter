import 'package:NAKSA/pages/ask_all_permission.dart';
import 'package:NAKSA/pages/connection/main_page.dart';
import 'package:NAKSA/pages/history/upload.dart';
import 'package:NAKSA/pages/login.dart';
import 'package:NAKSA/pages/profile/profile.dart';
import 'package:flutter/material.dart';
//import 'package:NAKSA/pages/connection/authentication_service.dart'; // Import the authentication functions

import 'pages/MapPage.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/repository/hotel_repository.dart';
import 'pages/home/Home_page.dart';
import 'package:firebase_core/firebase_core.dart';

// main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: FirebaseOptions(
      apiKey: 'AIzaSyDFT4-nTImIwE6bKAiIubPh4H0nE1ypyQM',
      appId: '1:236350986913:android:0cdd398dfbbed82b446ee0',
      messagingSenderId: 'your_messaging_sender_id',
      projectId: 'naksa2-2525')
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MainPage(),
        routes: {
          '/home': (context) =>  HomeScreen(),
          '/near': (context) => NearbyPlacesList(),
          '/map': (context) => const MapPage(),
          '/login': (context) =>  LoginPage(showRegisterPage: () {  },),
          '/register': (context) => RegisterPage(showLoginPage: () {  },),
          '/upload': (context) => AddHomeListingPage(),
          '/profile': (context) => Profile(),
        }
        
        );
  }
}
