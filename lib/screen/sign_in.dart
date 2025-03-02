import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/my_text-feild.dart';
import 'login_screen.dart';

class SignIn extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirempass = TextEditingController();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Create a new',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            MyTextfeild(
              lebeltext: "email",
              obsecured: false,
              controller: _email,
            ),
            SizedBox(height: 20),
            MyTextfeild(
              lebeltext: "password",
              obsecured: true,
              controller: _password,
            ),
            SizedBox(height: 20),
            MyTextfeild(
              lebeltext: " confirmed password",
              obsecured: true,
              controller: _password,
            ),
            SizedBox(height: 20),
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
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Already have account? ",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
