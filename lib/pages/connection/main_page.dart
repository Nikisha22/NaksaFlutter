import 'package:NAKSA/pages/connection/auth_page.dart';
import 'package:NAKSA/pages/home/Home_page.dart';
import 'package:NAKSA/pages/login.dart';
import 'package:NAKSA/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return HomeScreen();
          } else {
            return AuthPage();
  
        }
        }
        ),
    );
  }
}