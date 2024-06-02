import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'home/Home_page.dart';

class LoginPageor extends StatefulWidget {
  const LoginPageor({super.key});

  @override
  State<LoginPageor> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageor> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? _email;
  String?_password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FFFDD0"),
        body: ProgressHUD(
          child:Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall:  isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey()
          ),
      ),
    );
  }
  Widget _loginUI(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ]
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("lib/images/NAKSA (1).png",
                  width: 250 ,
                  fit: BoxFit.contain,
                   ),
                )
              ],
            ),
          ),
        const Padding(
          padding:  EdgeInsets.only(
            left: 20,
            bottom: 30,
            top: 50,

          

          ),
          child:  Text("Login",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        
        
          ),
        ),
        FormHelper.inputFieldWidget(
          context,
           "email",
            "email",
             (onValidateVal){
              if(onValidateVal.isEmpty){
                return "Email can't be empty.";
              }
              return null;
             },
              (onSavedVal){
                _email=onSavedVal;
                
              },
              borderFocusColor: Colors.black,
              prefixIconColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FormHelper.inputFieldWidget(
            context,
             "Password",
              "Password",
               (onValidateVal){
                if(onValidateVal.isEmpty){
                  return "Password can't be empty.";
                }
                return null;
               },
                (onSavedVal){
                  _password=onSavedVal;
                  
                },
                borderFocusColor: Colors.black,
                prefixIconColor: Colors.black,
                borderColor: Colors.black,
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(0.7),
                borderRadius: 10,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      hidePassword= !hidePassword;
                    });
                  },
                  color: Colors.black.withOpacity(0.7),
                   icon: Icon(
                    hidePassword?Icons.visibility_off:Icons.visibility,
                   )
                   )
                ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const  EdgeInsets.only(right: 25, top: 10),
            child: RichText(
              text: TextSpan(
                style:  const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Forget Password?",
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap=(){
                      print("This should be changed and do further processing but for now this , ok nikisha");

                    }
                  )
                ]
              )
              ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: FormHelper.submitButton(
            "Login",
            (){
            login(context, _email, _password);
            },
            btnColor: HexColor("#FFFDD0"),
            borderColor: Colors.white,
            txtColor: Colors.black,
            borderRadius: 10,
             ),
             
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "OR",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const  EdgeInsets.only(right: 25, top: 10),
            child: RichText(
              text: TextSpan(
                style:  const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                children: <TextSpan>[
                  const TextSpan(text:"Don't have an account?"),
                  TextSpan(
                    text: "Sign up",
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap=(

                    ){
                     Navigator.pushNamed(context, "/register");

                    }
                  )
                ]
              )
              ),
          ),
        ),


        ],
      ),
    );
  }
  
  Future login(BuildContext context, String ?_email,String? _password) async{
    if (_email == null || _password == null) {
      print(_email);
      print(_password);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email or password is null.'),
      ),
    );
    return; // Exit the function if email or password is null
  }
    try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _email.trim(), 
      password: _password.trim()
      );

    } catch(Exception){
      print(Exception);
    }
    //void dispose(){
    //  _email.dispose();
    //  
    //  super.dispose();
    //}
   
  }
}