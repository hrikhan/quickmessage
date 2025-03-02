import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickmassage/screen/homescreen.dart';
import 'package:quickmassage/screen/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:FirebaseAuth.instance.authStateChanges()
      , builder:(context,snapshot){

        //userlogin
          if(snapshot.hasData){
          //userlogin
          return Homescreen();
        }
        else{
          //usenotlogin
          return LoginScreen();
        }
      

      }),
    );
  }
}