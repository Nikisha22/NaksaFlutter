import 'package:NAKSA/pages/login.dart';
import 'package:NAKSA/pages/register_page.dart';
import 'package:flutter/material.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //show login page initially
  bool showLoginPage = true;

  void toogleScreens(){
    setState(() {
      showLoginPage=!showLoginPage;
      
    });

  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(showRegisterPage: toogleScreens,);
    } else{
      return RegisterPage(showLoginPage: toogleScreens,);
    }
  }
}