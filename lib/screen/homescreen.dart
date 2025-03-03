import 'package:flutter/material.dart';
import 'package:quickmassage/widgets/my_drawer.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,

        elevation: 0.2,
        title: Text('Quickchat', style: TextStyle(color: Colors.purple)),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      drawer: MyDrawer(),
    );
  }
}
