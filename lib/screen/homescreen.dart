import 'package:flutter/material.dart';
import 'package:quickmassage/auth/auth_sevice.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  void logout() {
    AuthSevice().signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,

        elevation: 0.2,
        title: Text('Quickchat', style: TextStyle(color: Colors.purple)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.logout), onPressed: logout),
        ],
      ),
    );
  }
}
