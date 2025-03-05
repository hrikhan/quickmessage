import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmassage/services/auth/auth_sevice.dart';
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
      Get.snackbar("Login Success", "start conversation with friends");
    } catch (e) {
      Get.snackbar("invalid information ", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Container(
              height: 200,
              width: Get.width,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple,
              ),
              child: Center(
                child: Text(
                  "Q U I C K \n C H A T",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            //icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image(image: AssetImage("assets/images.png")),
                      ),
                    ),
                  ),

                  //welcome back text
                  AnimatedTextKit(
                    pause: Duration(milliseconds: 3000),
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Welcome back",
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      TypewriterAnimatedText(
                        "LOGIN & ENJOY",
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      TypewriterAnimatedText(
                        "secure and trusted",
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

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
                      backgroundColor: Colors.purple,
                      minimumSize: Size(500, 50),
                    ),
                    onPressed: login,

                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "  Don`t haven account? ",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(SignIn());
                          },
                          child: Text(
                            "Create account ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
