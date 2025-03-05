import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmassage/services/auth/auth_sevice.dart';

import '../widgets/my_text-feild.dart';
import 'login_screen.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirempass = TextEditingController();

  void register() async {
    final _auth = AuthSevice();

    // Check if the email and password fields are not empty
    if (_email.text.isEmpty ||
        _password.text.isEmpty ||
        _confirempass.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields!");
      return;
    }

    // Check if passwords match
    if (_password.text != _confirempass.text) {
      Get.snackbar("Error", "Passwords do not match!");
      return;
    }

    try {
      await _auth.signUpWithEmailPassword(_email.text, _password.text);
      Get.to(LoginScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 50),
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
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
                  controller: _confirempass,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(500, 50),
                  ),
                  onPressed: register,
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
                          Get.to(SignIn());
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
        ),
      ),
    );
  }
}
