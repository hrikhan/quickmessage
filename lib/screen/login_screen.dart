import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmassage/auth/auth_sevice.dart';
import 'package:quickmassage/screen/homescreen.dart';
import 'package:quickmassage/screen/sign_in.dart';

import '../widgets/my_text-feild.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailcontrollar = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});
  void login() async {
    final authSevice = AuthSevice();
    //try login
    try {
      await authSevice.signInWithEmailPassword(
        emailcontrollar.text,
        passwordController.text,
      );
      Get.to(Homescreen());
      Get.snackbar("Login Success", "Login Success");
    } catch (e) {
      Get.snackbar("fuck you", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon
              Center(child: Image(image: AssetImage("assets/images (1).jpeg"))),
              //welcome back text
              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              //email textfield
              MyTextfeild(
                lebeltext: 'Email',
                obsecured: false,
                controller: emailcontrollar,
              ),

              SizedBox(height: 16),
              //password textfield
              MyTextfeild(
                lebeltext: 'Password',
                obsecured: true,
                controller: passwordController,
              ),

              SizedBox(height: 16),
              //login button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: Size(500, 50),
                ),
                onPressed: login,

                child: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "  Dont haven account? ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignIn());
                      },
                      child: Text(
                        "Create account ",
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
