import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmassage/screen/sign_in.dart';

import '../widgets/my_text-feild.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailcontrollar = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                onPressed: () {
                  //handle login logic
                },
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
